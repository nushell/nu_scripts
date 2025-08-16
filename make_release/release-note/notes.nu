use std/assert

def md-link [text: string, link: string] {
    $"[($text)]\(($link)\)"
}

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

# Get the release notes for all merged PRs on a repo.
export def pr-notes [
    repo: string = 'nushell/nushell' # the name of the repo, e.g. 'nushell/nushell'
    --since: datetime # list PRs on or after this date (defaults to 4 weeks ago if `--milestone` is not provided)
    --milestone: string # only list PRs in a certain milestone
    --label: string # the PR label to filter by, e.g. 'good-first-issue'
]: nothing -> table {
    let processed = (
        query-prs $repo --since=$since --milestone=$milestone --label=$label
        | sort-by mergedAt
        | each { get-release-notes }
    )

    $processed | display-notices

    $processed
    | where {|pr| "error" not-in ($pr.notices?.type? | default []) }
    | select author title number mergedAt url notes?
}


# Attempt to extract the "Release notes summary" section from a PR.
#
# If a valid release notes section is found, a "notes" column is added.
# If any issues are detected, a "notices" column with additional information is added.
def get-release-notes []: record -> record {
    mut pr = $in
    const READY = "pr:release-notes-mention"

    if "## Release notes summary" not-in $pr.body {
        return ($pr | add-notice error "no release notes section")
    }

    let notes = $pr.body | extract-notes
    let has_ready_label = $READY in $pr.labels.name

    # Check for empty notes section
    if ($notes | is-empty) {
        if not $has_ready_label {
            $pr = $pr | add-notice warning "empty release notes section and no explicit label"
        }
        return $pr
    }

    # Check for N/A notes section
    if $notes == "N/A" {
        return $pr
    }

    # If the notes section isn't empty, make sure we have the ready label
    if $READY not-in $pr.labels.name {
        return ($pr | add-notice error $"no ($READY) label")
    }

    # Check that a category is selected
    if ($pr.labels.name | where $it starts-with "pr:" | reject $READY | is-empty) {
        $pr = $pr | add-notice warning "no explicit release notes category selected (defaults to mention)"
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
    | take until { $in starts-with "##" }
    | str join (char nl)
    # remove HTML comments
    | str replace -amr '<!--\O*?-->' ''
    | str trim
}

# Check if the release notes section was left empty
def notes-are-empty []: string -> bool {
    $in in ["", "N/A"]
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
    let colors = {error: (ansi red), warning: (ansi yellow)}

    $prs
    | flatten -a notices
    | group-by --to-table type? message?
    | sort-by -r type
    | each {|e|
        let color = $colors | get $e.type
        print $"($color)PRs with ($e.message):"
        $e.items | each { format-pr | print $"- ($in)" }
        print ""
    }
    | ignore
}

# Format a PR nicely, including a link
def format-pr []: record -> string {
    let pr = $in
    let text = $"#($pr.number): ($pr.title)"
    $pr.url | ansi link -t $text
}

# Format the output of `list-prs` as a markdown table
export def pr-table [] {
    sort-by author number
    | update author { md-link $'@($in)' $'https://github.com/($in)' }
    | insert link {|pr| md-link $'#($pr.number)' $pr.url }
    | select author title link
    | to md
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
