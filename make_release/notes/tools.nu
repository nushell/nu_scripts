# Tools for creating the release notes.
use std/assert
use std-rfc/iter only

use util.nu *
use completions.nu *
use notice.nu *
use generate.nu *

# List all merged PRs since the last release
@example $"List all merged for ($example_version)" $"list-prs --milestone ($example_version)"
export def list-prs [
    repo: string = 'nushell/nushell' # the name of the repo, e.g. 'nushell/nushell'
    --since: datetime@"nu-complete date current" # list PRs on or after this date (defaults to 4 weeks ago if `--milestone` is not provided)
    --milestone: string@"nu-complete version" # only list PRs in a certain milestone
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
    --since: datetime@"nu-complete date current" # list PRs on or after this date (defaults to 4 weeks ago if `--milestone` is not provided)
    --milestone: string@"nu-complete version" # only list PRs in a certain milestone
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
export def release-notes [
    version: string@"nu-complete version" # the version to generate release notes for
]: nothing -> string {
    query-prs --milestone=$version
    | where not author.is_bot
    | sort-by mergedAt
    | each { get-release-notes }
    | tee { display-notices }
    | where {|pr| "error" not-in ($pr.notices?.type? | default []) }
    | generate-notes $version
}

# Check the release note summaries for the specified version.
export def check-prs [
    version: string@"nu-complete version" # the version to generate release notes for
    --as-table (-t) # output PR checks as a table
]: [
    nothing -> nothing,
    nothing -> table
] {
    query-prs --milestone=$version
    | where not author.is_bot
    | sort-by mergedAt
    | each { get-release-notes }
    | if $as_table { group-notices } else { display-notices }
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
