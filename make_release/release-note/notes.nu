def md-link [text: string, link: string] {
    $"[($text)]\(($link)\)"
}

# List all merged PRs since the last release
export def list-prs [
    repo: string = 'nushell/nushell' # the name of the repo, e.g. 'nushell/nushell'
    --since: datetime # list PRs on or after this date (defaults to 4 weeks ago if `--milestone` is not provided)
    --milestone: string # only list PRs in a certain milestone
    --label: string # the PR label to filter by, e.g. 'good-first-issue'
] {
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
        --json author,title,number,mergedAt,url
        --search $query)
    | from json
    | sort-by mergedAt --reverse
    | update author { get login }
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
