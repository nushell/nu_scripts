export const example_version = $"v0.((version).minor + 1).0"
export const current_build_date = ((version).build_time | parse '{date} {_}').0.date

export def last-release-date []: nothing -> datetime {
    if $env.cached-var?.relase-date? == null {
        $env.cached-var.relase-date = (
            ^gh release list
            --repo "nushell/nushell"
            --exclude-drafts --exclude-pre-releases
            --limit 1
            --json "createdAt"
        )
        | from json
        | $in.0.createdAt
        | into datetime
        | $in
    }
    $env.cached-var.relase-date
}

export def "nu-complete version" [] { [$example_version] }
export def "nu-complete date" [add?: duration = 0wk] {
    let date = last-release-date | $in + $add
    [{value: ($date | format date '%F') description: ($date | to text -n)}]
}
export def "nu-complete date current" [] { nu-complete date 0wk }
export def "nu-complete date next" [] { nu-complete date 6wk }
