use ./release-note/list-merged-prs

const LAST_RELEASE = 0.89.0

let matching_releases = ^gh api /repos/nushell/nushell/releases
    | from json
    | where tag_name == $LAST_RELEASE

match ($matching_releases | length) {
    0 => {
        error make --unspanned { msg: "no matching releases... did you set the last release?" }
    },
    1 => {},
    _ => {
        error make --unspanned { msg: $"too many matching releases... is ($LAST_RELEASE) correct?" }
    },
}

let last_release_date = $matching_releases | into record | get published_at | into datetime
print $last_release_date

let prs = list-merged-prs nushell/nushell $last_release_date
    | where author != "app/dependabot"
    | sort-by mergedAt
    | update url {|it| $"[#($it.number)]\(($it.url)\)" }
    | update author { $"[@($in)]\(https://github.com/($in)\)" }
    | select author title url
    | rename --column {url: pr}

print "ALL PRS:"
print ($prs | to md --pretty)

print "BREAKING CHANGES:"
mut breaking_prs = list-merged-prs nushell/nushell $last_release_date --label breaking-change --pretty --no-author
$breaking_prs ++= (list-merged-prs nushell/nushell $last_release_date --label 'pr:breaking-change' --pretty --no-author)
print ($breaking_prs | to md --pretty)
