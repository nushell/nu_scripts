use std-rfc/str

def generate-twin [
    --issue-number (-i): int
] {
    let issue_number = $issue_number | default ((date now) - 2019-08-23 | $in / 7day | math floor)
    let end_date = 2019-08-23 + ($issue_number * 7day) - 1day
    let begin_date = ($end_date - 6day)
    let search_string = $"is:pr is:merged merged:($begin_date | format date '%Y-%m-%d')..($end_date | format date '%Y-%m-%d')"

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

    let repos = (
        gh repo list nushell --json name
        | from json
        | get name
        | where $it != 'nightly'
        | where $it != 'this_week_in_nu'
        | first 30
    )

    mut twin_text = $"
    ---
    title: 'This week in Nushell #($issue_number)'
    author: The Nu Authors
    author_site: https://nushell.sh
    author_image: https://www.nushell.sh/blog/images/nu_logo.png
    excerpt: \"PRs and activity for Nushell the week ending ($end_date | format date '%A, %Y-%m-%d')\"
    ---

    # This Week in Nushell #($issue_number)

    Published (date now | format date '%A, %Y-%m-%d'), including PRs merged ($begin_date | format date '%A, %Y-%m-%d') through ($end_date | format date '%A, %Y-%m-%d').

    " | str dedent


    for repo in $repos {
        let prs = (
            gh pr list --search $search_string --repo $"nushell/($repo)" --json title,author,url,number
            | from json
            | select author.login title url number
            | rename author title url number
            | group-by author
            | transpose user prs
        )

        if ($prs | is-not-empty) {
            $twin_text += $"


            ## ($repo_headings | get -o $repo | default $repo)

            " | str dedent

            for user in $prs {
                $twin_text += $"

                * @($user.user):

                " | str dedent

                for pr in $user.prs {
                    $twin_text += $"
                      - [($pr.title) \(#($pr.number)]\)\(($pr.url)\)

                    " | str dedent
                }
            }

        }
    }

    $twin_text
}
