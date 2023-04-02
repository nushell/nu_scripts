# http get https://api.github.com/repos/nushell/nushell/pulls?q=is%3Apr+merged%3A%3E%3D2021-04-20+ | select html_url user.login title body
# http get https://api.github.com/search/issues?q=repo:nushell/nushell+is:pr+is:merged+merged:%3E2021-05-08 | get items | select html_url user.login title body
# Repos to monitor

def query-release-span [] {
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
    let query_suffix = $"+is($colon)pr+is($colon)merged+merged($colon)($gt)($eq)($query_date)&per_page=($per_page)&page=($page_num)"

    for repo in $site_table {
        let query_string = $"($query_prefix)($repo.repo)($query_suffix)"
        let site_json = (http get -u $env.GITHUB_USERNAME -p $env.GITHUB_PASSWORD $query_string | get items | select html_url user.login title)

        if not ($site_json | all { |it| $it | is-empty }) {
            print $"(char nl)## ($repo.site)(char nl)"

            for user in ($site_json | group-by user_login | transpose user prs) {
                let user_name = $user.user
                let pr_count = ($user.prs | length)

                print -n $"- ($user_name) created "
                for pr in ($user.prs | enumerate) {
                    if $pr_count == ($pr.index + 1) {
                        print -n $"[($pr.item.title)](char lparen)($pr.item.html_url)(char rparen)"
                    } else {
                        print -n $"[($pr.item.title)](char lparen)($pr.item.html_url)(char rparen), and "
                    }
                }

                print ""
            }
        }
    }
}

if ($env | select GITHUB_USERNAME | is-empty) or ($env | select GITHUB_PASSWORD | is-empty) {
    print 'Please set GITHUB_USERNAME and GITHUB_PASSWORD in $env to use this script'
} else {
    query-release-span
}
