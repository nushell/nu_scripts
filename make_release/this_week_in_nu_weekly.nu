# http get https://api.github.com/repos/nushell/nushell/pulls?q=is%3Apr+merged%3A%3E%3D2021-04-20+ | select html_url user.login title body
# http get https://api.github.com/search/issues?q=repo:nushell/nushell+is:pr+is:merged+merged:%3E2021-05-08 | get items | select html_url user.login title body
# Repos to monitor

def query-week-span [] {
    # Update the '7' below to however many days it has been since the last TWiN
    let query_date = (seq date --days 21 -r | get 7)

    # The heading mappings for each repository. This is only
    # used to display the Heading for each reposting in TWiN.
    # Repos without a mapping (that have activity) will simply
    # default to the repo name.
    let repo_headings = {
        nushell: Nushell
        nushell.github.io: Documentation
        reedline: reedline
        nu_scripts: Nu_Scripts
        nupm: NUPM
        demo: Wasm
        nufmt: nufmt
        awesome-nu: "Awesome Nu"
        tree-sitter-nu: Tree-sitter
        new-nu-parser: "New nu-parser"
        rfcs: RFCs
        nana: Nana
        integrations: Integrations
        vscode-nushell-lang: "VSCode Extension"
        nu_plugin_template: "Plugin Template"
        grammar: Grammar
        nu_jupyter: Jupyter
    }

    # If environment variables exists for GH username/pw, use
    # them. If a token is available, it will take precedence,
    # so passing an empty username/password isn't a problem.
    let gh_username = ($env.GITHUB_USERNAME? | default "")
    let gh_password = ($env.GITHUB_PASSWORD? | default "")
    let gh_token = $env.GH_AUTH_TOKEN? | default (try { gh auth token })
    let headers = match $gh_token {
        null => {}
        _ => { Authorization: $'Bearer ($gh_token)' }
    }

    let repos = (
        http get -H $headers -u $gh_username -p $gh_password https://api.github.com/users/nushell/repos?sort=pushed
        | get name
        | where $it != 'nightly'
        | where $it != 'this_week_in_nu'
        | first 30
    )

    for repo in $repos {
        let query_string = (
            $"https://api.github.com/search/issues"
            | url parse
            | merge {
                params: {
                    q: $'repo:nushell/($repo) is:pr is:merged merged:>=($query_date)'
                    page: 1
                    per_page: 100
                }
            }
            | url join
        )
        let site_json = (
            http get -H $headers -u $gh_username -p $gh_password $query_string
            | get items
            | select html_url user.login title
        )

        if not ($site_json | all { |it| $it | is-empty }) {
            let heading_name = ($repo_headings | get -o $repo | default $repo)
            print $"(char nl)## ($heading_name)(char nl)"

            for user in ($site_json | group-by "user.login" | transpose user prs) {
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

let has_token = (try { gh auth token }) != null
let has_username_pw = ($env | get -o GITHUB_USERNAME | is-not-empty) and ($env | get -o GITHUB_PASSWORD | is-not-empty) 

if not ($has_token or $has_username_pw) {
    print "This script requires either a working GitHub client that returns `gh auth token` or"
    print "$env.GITHUB_USERNAME and $env.GITHUB_PASSWORD.  Neither were found."
} else {
    # 2019-08-23 was the release of 0.2.0, the first public release

    let week_num = ((seq date -b '2019-08-23' -n 7 | length) - 1)
    print $"# This week in Nushell #($week_num)(char nl)"

    query-week-span
}

