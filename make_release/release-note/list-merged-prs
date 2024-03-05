#!/usr/bin/env nu
use std log

def md-link [
    text: string
    link: string
] {
    $"[($text)]\(($link)\)"
}

# list all merged PRs since last release
export def main [
    repo: string  # the name of the repo, e.g. `nushell/nushell`
    --date: datetime  # the date of the last release (default to 4 weeks ago, excluded, if no milestone is set)
    --milestone: string # search PRs by milestone
    --label: string  # the label to filter the PRs by, e.g. `good-first-issue`
    --pretty # pretty-print for the MarkDown release not
    --no-author # do not group the contributions by author
] {
    mut query_parts = []

    let date = if $date == null and $milestone == null {
        (date now) - 4wk 
    } else {
        $date
    }
    | format date "%Y-%m-%d"

    if $date != null {
        let since = (date now | format date %F | into datetime) - ($date | into datetime)
        log info $"listing PRs in ($repo) since ($date) \(($since) ago\)"
        $query_parts ++= [ $"merged:>($date)" ]
    }

    if $milestone != null {
        log info $"listing PRs in milestone ($milestone)"
        $query_parts ++= [ $'milestone:"($milestone)"' ]
    }

    if $label != null {
        log info $"listing PRs with label ($label)"
        $query_parts ++= [ $'label:($label)' ]
    }

    let query = $query_parts | str join ' '

    let prs = (
        gh --repo $repo pr list
            --state merged
            --limit (inf | into int)
            --json author,title,number,mergedAt,url
            --search $query
        | from json
        | sort-by mergedAt --reverse
        | update author { get login }
    )

    if $pretty {
        if $no_author {
            return (
                $prs | each {|pr|
                    let link = (md-link $"#($pr.number)" $pr.url)
                    $"- ($link) ($pr.title)"
                }
                | str join "\n"
            )
        }

        return (
            $prs
            | group-by author
            | transpose author prs
            | each {|line|
                let author = (md-link $line.author $"https://github.com/($line.author)")

                $"- ($author) created" | append (
                    $line.prs | each {|pr|
                        let link = (md-link $pr.title $pr.url)
                        $"    - ($link)"
                    }
                )
                | str join "\n"
            }
            | to text
        )
    }

    $prs
}
