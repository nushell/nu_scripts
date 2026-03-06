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

    let results = (
        gh --repo $repo pr list --state merged
            --limit (inf | into int)
            --json author,title,number,mergedAt,url,body,labels
            --search $query
        | from json
    )

    assert ($results | is-not-empty) "Query returned no results"
    $results
}

# Generate the release notes for the specified version.
export def release-notes [
    version: string@"nu-complete version" # the version to generate release notes for
]: nothing -> string {
    query-prs --milestone=$version
    | where not author.is_bot
    | sort-by mergedAt
    | each { get-release-notes }
    | tee { format-notices }
    | where {|pr| "error" not-in ($pr.notices?.type? | default []) }
    | generate-notes $version
}

# Check the release note summaries for the specified version.
export def check-prs [
    version: string@"nu-complete version" # the version to generate release notes for
    --as-table (-t) # output PR checks as a table
]: [
    nothing -> string,
    nothing -> table
] {
    query-prs --milestone=$version
    | where not author.is_bot
    | sort-by mergedAt
    | each { get-release-notes }
    | if $as_table { group-notices } else { format-notices }
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
