# The sections to be included in the release notes
const SECTIONS = [
    [label, h2, h3];
    ["notes:breaking-changes", "Breaking changes", "Other breaking changes"]
    ["notes:additions", "Additions", "Other additions"]
    ["notes:deprecations", "Deprecations", "Other deprecations"]
    ["notes:removals", "Removals", "Other removals"]
    ["notes:other", "Other changes", "Additional changes"]
    ["notes:fixes", "Bug fixes", "Other fixes"]
    ["notes:mention", null, null]
    ["notes:hide", null, null]
]

use notice.nu *
use util.nu *

# Attempt to extract the "Release notes summary" section from a PR.
#
# Multiple checks are done to ensure that each PR has a valid release notes summary.
# If any issues are detected, a "notices" column with additional information is added.
export def get-release-notes []: record -> record {
    mut pr = $in

    # Do not throw any warnings for hidden PRs
    let has_hide_label = "notes:hide" in $pr.labels.name
    let hidden = $SECTIONS | where label == "notes:hide" | only
    if $has_hide_label {
        $pr = ($pr | add-notice info "appearance only in full changelog")
        return ($pr | insert section $hidden)
    }

    let has_ready_label = "notes:ready" in $pr.labels.name
    let has_hall_of_fame_label = "notes:mention" in $pr.labels.name
    let sections = $SECTIONS | where label in $pr.labels.name
    let hall_of_fame = $SECTIONS | where label == "notes:mention" | only

    # Extract the notes section
    mut notes = if "## Release notes summary" in $pr.body {
      $pr.body | extract-notes
    } else if $has_ready_label {
      # If no release notes summary exists but ready label is set, treat as empty
      if not $has_hall_of_fame_label {
        # Hall of fame does not need release notes section necessarily
        $pr = $pr | add-notice warning "no release notes section but notes:ready label"
      }
      ""
    } else {
      return ($pr | add-notice error "no release notes section")
    }

    # Check for empty notes section
    if ($notes | is-empty-keyword) {
        if ($sections | where label not-in (labels-without-heading) | is-not-empty) {
            return ($pr | add-notice error "empty summary but a category other than Hall of Fame or hidden")
        }

        if ($notes | is-empty) and not $has_ready_label {
            $pr = $pr | add-notice warning "empty release notes section and no explicit label"
        }

        $pr = $pr | insert section $hall_of_fame
        $pr = $pr | insert notes ($pr.title | clean-title)
        return $pr
    }

    # If the notes section isn't empty, make sure we have the ready label
    if not $has_ready_label {
        return ($pr | add-notice error $"no notes:ready label")
    }

    # Check that exactly one category is selected
    let section = if ($sections | is-empty) {
        $pr = $pr | add-notice info "no explicit release notes category selected (defaults to Hall of Fame)"
        $hall_of_fame
    } else if ($sections | length) > 1 {
        return ($pr | add-notice error "multiple release notes categories selected")
    } else {
        $sections | only
    }

    # Add section to PR
    $pr = $pr | insert section $section

    let lines = $notes | lines | length
    if $section.label == "notes:mention" and ($lines > 1) {
        return ($pr | add-notice error "multi-line summaries in Hall of Fame section")
    }

    # Add PR title as default heading for multi-line summaries
    if $lines > 1 and not ($notes starts-with "###") {
        $pr = $pr | add-notice info "multi-line summaries with no explicit title (using PR title as heading title)"
        $notes = "### " + ($pr.title | clean-title) ++ (char nl) ++ (char nl) ++ $notes
    }

    # Check for suspiciously short release notes section
    if ($notes | split words | length) < 10 {
        $pr = $pr | add-notice warning "release notes section that is less than 10 words"
    }

    $pr | insert notes $notes
}

# Extracts the "Release notes summary" section of the PR description
export def extract-notes []: string -> string {
    lines
    # skip until release notes heading
    | skip until { $in starts-with "## Release notes summary" }
    # this should already have been checked
    | if ($in | is-empty) { assert false } else {}
    | skip 1 # remove header
    # extract until end of summary
    | reduce -f {code: false, done: false, out: []} (extract_until_end)
    | get out
    | str join (char nl)
    # remove HTML comments
    | str replace -amr '<!--\O*?-->' ''
    | str trim
}

# Generate the release notes from the list of PRs.
export def generate-notes [version: string]: table -> string {
    let prs = $in

    const template_path = path self "template.md"
    let template = open $template_path
    let arguments = {
        # chop off the `v` in the version
        version: ($version | str substring 1..),
        changes: ($prs | generate-changes-section),
        hall_of_fame: ($prs | generate-hall-of-fame)
        changelog: (generate-full-changelog $version)
    }

    $arguments | format pattern $template
}

# Generate the "Changes" section of the release notes.
export def generate-changes-section []: table -> string {
    group-by --to-table section.label
    | rename section prs
    # sort sections in order of appearance in table
    | sort-by {|i| $SECTIONS | enumerate | where item.label == $i.section | only }
    # Hall of Fame is handled separately
    | where section not-in (labels-without-heading)
    | each { generate-section }
    | str join (char nl)
}

# Generate a subsection of the "Changes" section of the release notes.
export def generate-section []: record<section: string, prs: table> -> string {
    let prs = $in.prs
    let section = $prs.0.section

    mut body = []
    let multiline = $prs | where ($it.notes | lines | length) > 1
    let bullet = $prs | where ($it.notes | lines | length) == 1

    # Add header
    $body ++= [$"## ($section.h2) <JumpToc/>\n"]

    # Add multi-line summaries
    $body ++= $multiline | generate-multiline-notes

    # Add single-line summaries
    if ($multiline | is-not-empty) and ($bullet | is-not-empty) {
        $body ++= [$"### ($section.h3) <JumpToc/>\n"]
    }
    $body ++= $bullet | each {|pr| "* " ++ $pr.notes ++ $" \(($pr | pr-link)\)" }

    ($body | str join (char nl)) ++ (char nl)
}

def generate-multiline-notes []: table -> list {
    $in | each {|pr|
        let number = $pr.number
        let author = $pr.author.login

        let pr_by_tag = $'<PrBy :pr="($number)" user="($author)" />'
        let replacer = $"### $1 <JumpToc/> ($pr_by_tag)\n"
        let matcher = "^### ([^\n]*)\n"
        let updated = ($pr.notes | str replace --all --regex $matcher $replacer)

        if ($updated | str ends-with "\n") { 
            $updated 
        } else { 
            $updated ++ (char nl) 
        }
    }
}

# Generate the "Hall of Fame" section of the release notes.
export def generate-hall-of-fame []: table -> string {
    where section.label == "notes:mention"
    # If the PR has no notes, use the title
    | update notes {|pr| default -e $pr.title }
    | update author { md-link $'@($in.login)' $'https://github.com/($in.login)' }
    | insert link { pr-link }
    | select author notes link
    | rename -c {notes: change}
    | to md
    | escape-tag
}

# Generate the "Full changelog" section of the release notes.
export def generate-full-changelog [version: string]: nothing -> string {
    list-prs --milestone=$version
    | pr-table
}

# Create closure for `reduce` to extract the whole release notes summary.
def extract_until_end []: nothing -> closure {
    let terminators = ["# " "## " "---"]
    {|line: string, state: record|
        mut state = $state

        if $state.done { return $state }

        # check if we're entering/exiting a code block
        # this might be kind of brittle
        if $line has "```" {
            $state.code = not $state.code
        }

        let found_terminator = $terminators | any { $line starts-with $in }
        if $found_terminator and not $state.code {
            $state.done = true
            return $state
        }

        $state.out ++= [$line]
        $state
    }
}

# Get section labels which don't have a corresponding heading (i.e., don't appear in Changes section)
def labels-without-heading [] {
    $SECTIONS | where h2 == null | get label
}
