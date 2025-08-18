use std/assert
use std-rfc/iter only

const SECTIONS = [
    [label, h2, h3];
    ["notes:breaking-changes", "Breaking changes", "Other breaking changes"]
    ["notes:additions", "Additions", "Other additions"]
    ["notes:deprecations", "Deprecations", "Other deprecations"]
    ["notes:removals", "Removals", "Other removals"]
    ["notes:other", "Other changes", "Additional changes"]
    ["notes:fixes", "Bug fixes", "Other fixes"]
    ["notes:mention", null, null]
]

# List all merged PRs since the last release
export def list-prs [
    repo: string = 'nushell/nushell' # the name of the repo, e.g. 'nushell/nushell'
    --since: datetime # list PRs on or after this date (defaults to 4 weeks ago if `--milestone` is not provided)
    --milestone: string # only list PRs in a certain milestone
    --label: string # the PR label to filter by, e.g. 'good-first-issue'
]: nothing -> table {
    query-prs $repo --since=$since --milestone=$milestone --label=$label
    | select author title number mergedAt url
    | sort-by mergedAt --reverse
    | update author { get login }
}

# Construct a GitHub query for merged PRs on a repo.
def query-prs [
    repo: string = 'nushell/nushell' # the name of the repo, e.g. 'nushell/nushell'
    --since: datetime # list PRs on or after this date (defaults to 4 weeks ago if `--milestone` is not provided)
    --milestone: string # only list PRs in a certain milestone
    --label: string # the PR label to filter by, e.g. 'good-first-issue'
]: nothing -> table {
    mut query_parts = []

    if $since != null or $milestone == null {
        let date = $since | default ((date now) - 4wk) | format date '%Y-%m-%d'
        $query_parts ++= [ $'merged:>($date)' ]
    }

    if $milestone != null {
        $query_parts ++= [ $'milestone:"($milestone)"' ]
    }

    if $label != null {
        $query_parts ++= [ $'label:($label)' ]
    }

    let query = $query_parts | str join ' '

    (gh --repo $repo pr list --state merged
        --limit (inf | into int)
        --json author,title,number,mergedAt,url,body,labels
        --search $query)
    | from json
}

# Generate the release notes for the specified version.
export def pr-notes [
    version: string # the version to generate release notes for
]: nothing -> string {
    query-prs --milestone=$version
    | sort-by mergedAt
    | each { get-release-notes }
    | collect
    | tee { display-notices }
    | where {|pr| "error" not-in ($pr.notices?.type? | default []) }
    | generate-notes $version
}

# Generate the release notes from the list of PRs.
def generate-notes [version: string]: table -> string {
    let prs = $in

    const template_path = path self | path dirname | path join "template.md"
    let template = open $template_path
    let arguments = {
        version: $version,
        changes: ($prs | generate-changes-section),
        hall_of_fame: ($prs | generate-hall-of-fame)
        changelog: (generate-full-changelog $version)
    }

    $arguments | format pattern $template
}


# Generate the "Changes" section of the release notes.
def generate-changes-section []: table -> string {
    group-by --to-table section.label
    | rename section prs
    # sort sections in order of appearance in table
    | sort-by {|i| $SECTIONS | enumerate | where item.label == $i.section | only }
    # Hall of Fame is handled separately
    | where section != "notes:mention"
    | each { generate-section }
    | str join (char nl)
}

# Generate a subsection of the "Changes" section of the release notes.
def generate-section []: record<section: string, prs: table> -> string {
    let prs = $in.prs
    let section = $prs.0.section

    mut body = []
    let multiline = $prs | where ($it.notes | lines | length) > 1
    let bullet = $prs | where ($it.notes | lines | length) == 1

    # Add header
    $body ++= [$"## ($section.h2)"]

    # Add multi-line summaries
    $body ++= $multiline.notes

    # Add single-line summaries
    if ($multiline | is-not-empty) {
        $body ++= [$"### ($section.h3)"]
    }
    $body ++= $bullet | each {|pr| "* " ++ $pr.notes ++ $" \(($pr | pr-link)\)" }

    $body | str join (char nl)
}

# Generate the "Hall of Fame" section of the release notes.
def generate-hall-of-fame []: table -> string {
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
def generate-full-changelog [version: string]: nothing -> string {
    list-prs --milestone=$version
    | pr-table
}

# Attempt to extract the "Release notes summary" section from a PR.
#
# Multiple checks are done to ensure that each PR has a valid release notes summary.
# If any issues are detected, a "notices" column with additional information is added.
def get-release-notes []: record -> record {
    mut pr = $in

    if "## Release notes summary" not-in $pr.body {
        return ($pr | add-notice error "no release notes section")
    }

    mut notes = $pr.body | extract-notes

    let has_ready_label = "notes:ready" in $pr.labels.name
    let sections = $SECTIONS | where label in $pr.labels.name
    let hall_of_fame = $SECTIONS | where label == "notes:mention" | only

    # Check for empty notes section
    if ($notes | is-empty-keyword) {
        if ($sections | where label != "notes:mention" | is-not-empty) {
            return ($pr | add-notice error "empty summary has a category other than Hall of Fame")
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
        $notes = "### " + ($pr.title | clean-title) ++ (char nl) ++ $notes
    }

    # Check for suspiciously short release notes section
    if ($notes | split words | length) < 10 {
        $pr = $pr | add-notice warning "release notes section that is less than 10 words"
    }

    $pr | insert notes $notes
}

# Extracts the "Release notes summary" section of the PR description
def extract-notes []: string -> string {
    lines
    # skip until release notes heading
    | skip until { $in starts-with "## Release notes summary" }
    # this should already have been checked
    | if ($in | is-empty) { assert false } else {}
    | skip 1 # remove header
    # extract until next heading
    | take until { $in starts-with "## " or $in starts-with "---" }
    | str join (char nl)
    # remove HTML comments
    | str replace -amr '<!--\O*?-->' ''
    | str trim
}

# Clean up a PR title
def clean-title []: string -> string {
    # remove any prefixes and capitalize
    str replace -r '^[^\s]+: ' ""
    | str trim
    | str capitalize
}

# Check if the release notes section was left empty
def is-empty-keyword []: string -> bool {
    str downcase | $in in ["", "n/a", "nothing", "none", "nan"]
}

# Add an entry to the "notices" field of a PR
def add-notice [type: string, message: string]: record -> record {
    upsert notices {
        append {type: $type, message: $message}
    }
}

# Print all of the notices associated with a PR
def display-notices []: table -> nothing {
    let prs = $in
    let types = [
        [type, color, rank];
        [info, (ansi default), 0]
        [warning, (ansi yellow), 1]
        [error, (ansi red), 2]
    ]

    $prs
    | flatten -a notices
    | group-by --to-table type? message?
    | sort-by {|i| $types | where type == $i.type | only rank } message
    | each {|e|
        let color = $types | where type == $e.type | only color 
        print $"($color)PRs with ($e.message):"
        $e.items | each { format-pr | print $"- ($in)" }
        print ""
    }
    print -n (ansi reset)
}

# Format a PR nicely, including a link
def format-pr []: record -> string {
    let pr = $in
    let text = $"#($pr.number): ($pr.title)"
    $pr.url | ansi link -t $text
}

# Escape > and <
def escape-tag [] {
    str replace -a ">" "&gt;"
    | str replace -a "<" "&lt;"
}

# Create a markdown link
def md-link [text: string, link: string] {
    $"[($text)]\(($link)\)"
}

# Get a link to a PR
def pr-link []: record -> string {
    md-link $"#($in.number)" $in.url
}

# Format the output of `list-prs` as a markdown table
export def pr-table [] {
    sort-by author number
    | update author { md-link $'@($in)' $'https://github.com/($in)' }
    | insert link { pr-link }
    | select author title link
    | to md
    | escape-tag
}

const toc = '[[toc](#table-of-contents)]'

# Generate and write the table of contents to a release notes file
export def write-toc [file: path] {
    let known_h1s = [
        "# Highlights and themes of this release",
        "# Changes",
        "# Notes for plugin developers",
        "# Hall of fame",
        "# Full changelog",
    ]

    let lines = open $file | lines | each { str trim -r }

    let content_start = 2 + (
        $lines
        | enumerate
        | where item == '# Table of contents'
        | first
        | get index
    )

    let data = (
        $lines
        | slice $content_start..
        | wrap line
        | insert level {
            get line | split chars | take while { $in == '#' } | length
        }
        | insert nocomment {
            # We assume that comments only have one `#`
            if ($in.level != 1) {
                return true
            }
            let line = $in.line

            # Try to use the whitelist first
            if ($known_h1s | any {|| $line =~ $in}) {
                return true
            }

            # We don't know so let's ask
            let user = ([Ignore Accept] |
                input list $"Is this a code comment or a markdown h1 heading:(char nl)(ansi blue)($line)(ansi reset)(char nl)Choose if we include it in the TOC!")
            match $user {
                "Accept" => {true}
                "Ignore" => {false}
            }

        }
    )

    let table_of_contents = (
        $data
        | where level in 1..=3 and nocomment == true
        | each {|header|
            let indent = '- ' | fill -w ($header.level * 2) -a right

            let text = $header.line | str trim -l -c '#' | str trim -l
            let text = if $text ends-with $toc {
                $text | str substring ..<(-1 * ($toc | str length)) | str trim -r
            } else {
                $text
            }

            let link = (
                $text
                | str downcase
                | str kebab-case
            )

            $"($indent)[_($text)_]\(#($link)-toc\)"
        }
    )

    let content = $data | each {
        if $in.level in 1..=3 and not ($in.line ends-with $toc) and $in.nocomment {
            $'($in.line) ($toc)'
        } else {
            $in.line
        }
    }

    [
        ...($lines | slice ..<$content_start)
        ...$table_of_contents
        ...$content
    ]
    | save -r -f $file
}
