# http get https://api.github.com/repos/nushell/nushell/pulls?q=is%3Apr+merged%3A%3E%3D2021-04-20+ | select html_url user.login title body
# http get https://api.github.com/search/issues?q=repo:nushell/nushell+is:pr+is:merged+merged:%3E2021-05-08 | get items | select html_url user.login title body
# Repos to monitor

def do-work [] {
    let site_table = [
        [site repo];
        [Nushell nushell]
        [Extension vscode-nushell-lang]
        [Documentation nushell.github.io]
        [Wasm demo]
        [Nu_Scripts nu_scripts]
        [RFCs rfcs]
        [reedline reedline]
        # ] [Jupyter jupyter]
    ]

    let query_prefix = "https://api.github.com/search/issues?q=repo:nushell/"
    let query_date = (seq date --days 21 -r | get 20)
    let per_page = "100"
    let page_num = "1" # need to implement iterating pages
    let colon = "%3A"
    let gt = "%3E"
    let eq = "%3D"
    let amp = "%26"
    let query_suffix = $"+is($colon)pr+is($colon)merged+merged($colon)($gt)($eq)($query_date)&per_page=100&page=1"

    let entries = ($site_table | each { |row|
        let query_string = $"($query_prefix)($row.repo)($query_suffix)"
        # this is for debugging the rate limit. comment it out if things are working well
        # http get -u $env.GITHUB_USERNAME -p $env.GITHUB_PASSWORD https://api.github.com/rate_limit | get resources | select core.limit core.remaining graphql.limit graphql.remaining integration_manifest.limit integration_manifest.remaining search.limit search.remaining
        let site_json = (http get -u $env.GITHUB_USERNAME -p $env.GITHUB_PASSWORD $query_string | get items | select html_url user.login title)

        $"## ($row.site)(char nl)(char nl)"
        if ($site_json | all {|it| $it | is-empty }) {
            $"none found this week(char nl)(char nl)"
        } else {
            $site_json | group-by user_login | transpose user prs | each { |row|
                let user_name = $row.user
                let pr_count = ($row.prs | length)

                # only print the comma if there's another item
                let user_prs = ($row.prs | enumerate | each { |pr|
                    if $pr_count == ($pr.index + 1) {
                        $"[($pr.item.title)](char lparen)($pr.item.html_url)(char rparen)"
                    } else {
                        $"[($pr.item.title)](char lparen)($pr.item.html_url)(char rparen), and "
                    }
                } | str collect)

                $"- ($user_name) created ($user_prs) (char nl)"
            } | str collect
            char nl
        }
    })

    if ($entries | all {|it| $it | is-empty}) {
        # do nothing
    } else {
        $entries | str collect
    }
}

if ($env | select GITHUB_USERNAME | is-empty) or ($env | select GITHUB_PASSWORD | is-empty) {
    echo 'Please set GITHUB_USERNAME and GITHUB_PASSWORD in $env to use this script'
} else {
    do-work | str collect
}
