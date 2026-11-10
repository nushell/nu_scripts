# Readme
# a .mailmap file needs to be in the root of each repo to aggregate users with multiple email addresses
# we could add users if we need to map multiple email addresses to a single user
# and commit the mailmap file to the repo if we wanted to. Format of the mailmap file is at the
# end of the script.
#
# 1. git clone every repo in the list
# 2. setup repos_root_folder to match your system
# 3. setup the proper slash by system (TODO make the slash system agnostic)
# 4. setup the output folder to the path you want it in
# 5. install `gh` and authenticate with `gh auth login`, merged PRs are read from GitHub

# One row per merged PR in a GitHub repo: commit, name, email, date and the PR author's GitHub
# login, newest merge first.
# A PR is represented by the commit it landed as. For a true merge commit ("Merge pull request #N")
# the PR branch head (second parent) is used instead, so the PR is credited to its author rather
# than to whoever merged it. Names and emails go through the local clone's .mailmap the same way
# git log %aN/%aE does.
def merged_pr_commits [slug: string, folder: string] {
    let query = '
        query($owner: String!, $name: String!, $endCursor: String) {
          repository(owner: $owner, name: $name) {
            pullRequests(states: MERGED, first: 100, after: $endCursor) {
              pageInfo { hasNextPage endCursor }
              nodes {
                mergedAt
                author { login }
                mergeCommit {
                  oid
                  author { name email date }
                  parents(first: 2) { nodes { oid author { name email date } } }
                }
              }
            }
          }
        }'
    let owner_repo = $slug | split row '/'
    let commits = (
        gh api graphql --paginate --slurp -f $'query=($query)'
            -f $'owner=($owner_repo.0)' -f $'name=($owner_repo.1)' |
        from json |
        get data.repository.pullRequests.nodes |
        flatten |
        sort-by mergedAt --reverse |
        each {|pr|
            let parents = $pr.mergeCommit.parents.nodes
            let commit = if ($parents | length) > 1 { $parents.1 } else { $pr.mergeCommit }
            # author is null when the PR author's GitHub account was deleted
            $commit | insert login $pr.author.login?
        }
    )

    # check-mailmap answers one "Name <email>" line per input line, in the same order
    let mailmapped = $commits |
        each {|c| $'($c.author.name) <($c.author.email)>' } |
        str join "\n" |
        git -C $folder check-mailmap --stdin |
        lines |
        parse --regex '^(?<name>.*) <(?<email>.*)>$'
    if ($mailmapped | length) != ($commits | length) {
        let counts = $'($mailmapped | length) of ($commits | length)'
        error make {msg: $'($slug): check-mailmap returned contacts for ($counts) PRs'}
    }

    # match the abbreviated hash length git log %h uses for this repo
    let abbrev = git -C $folder rev-parse --short HEAD | str length
    $commits | zip $mailmapped | each {|pair| {
        commit: ($pair.0.oid | str substring 0..<$abbrev)
        name: $pair.1.name
        email: $pair.1.email
        date: $pair.0.author.date
        login: $pair.0.login
    }}
}

# Generate PR Counts for the XX Clubs.
# example usage: get_pr_counts true
# If true is provided as an argument, the script will also generate CSV files for each
# repo with one line per merged PR (commit, username, email, date) in order for you to figure out
# if you need to update the mailmap file so you can merge multiple users into one.
# If false is provided as an argument, the script will summarize the PR counts and
# display a table with the top 75 rows: index, name, github, all_commits.
# Whether you run in debug_csv mode or not, the output is written to csv files in the
# $repos_root_folder/20k folder
def get_pr_counts [debug_csv: bool, repos_root_folder = '/Users/fdncred/src'] {
    # let repos_root_folder = 'c:\users\dschroeder\source\repos\forks'
    # let repos_root_folder = '/Users/fdncred/src/forks'
    let repos = [[name, slug, folder];
        [nushell, nushell/nushell, $'($repos_root_folder)(char psep)nushell'],
        [reedline, nushell/reedline, $'($repos_root_folder)(char psep)reedline'],
        [scripts, nushell/nu_scripts, $'($repos_root_folder)(char psep)nu_scripts'],
        [vscode, nushell/vscode-nushell-lang, $'($repos_root_folder)(char psep)vscode-nushell-lang'],
        [nana, nushell/nana, $'($repos_root_folder)(char psep)nana'],
        [docs, nushell/nushell.github.io, $'($repos_root_folder)(char psep)nushell.github.io']
    ]

    let output_folder = $'($repos_root_folder)(char psep)20k'
    if not ($output_folder | path exists) {
        mkdir $output_folder
    }

    let pr_authors = $repos | par-each --keep-order {|repo|
        let repo_name = $repo.name
        let repo_folder = $repo.folder

        let output_file = $'($output_folder)(char psep)($repo_name).csv'
        print $"Working on ($repo_name). Saving to ($output_file)."

        let prs = merged_pr_commits $repo.slug $repo_folder

        if $debug_csv {
            # This outputs commit, name, email, date for use for adding info to mailmap file
            $prs |
                reject login |
                upsert date {|d| $d.date | into datetime} |
                to csv |
                save -f ($output_file)
        } else {
            $prs |
                upsert date {|d| $d.date | into datetime} |
                group-by name |
                transpose |
                upsert column1 {|c| $c.column1 | length} |
                sort-by column1 |
                rename name commits |
                reverse |
                to csv |
                save -f ($output_file)
        }

        $prs | select name login
    } | flatten

    cd $output_folder

    if not $debug_csv {
        let data = (open docs.csv |
            append (open nana.csv) |
            append (open nushell.csv) |
            append (open reedline.csv) |
            append (open scripts.csv) |
            append (open vscode.csv)
        )

        # the GitHub login that opened the most PRs credited to each name
        let github_logins = $pr_authors |
            where login != null |
            group-by name --to-table |
            each {|g| {
                name: $g.name
                github: ($g.items.login | uniq --count | sort-by count --reverse | first | get value)
            }}

        # let data_polars = ($data | polars into-df)
        # $data_polars |
        #     polars group-by name |
        #     polars agg [(polars col commits | polars sum | polars as "all_commits")] |
        #     polars collect |
        #     polars sort-by all_commits |
        #     polars reverse |
        #     polars into-nu |
        #     first 75
        $data | 
            group-by name --to-table | 
            upsert all_commits {|r| $r.items.commits | math sum } | 
            reject items | 
            sort-by all_commits --reverse | 
            first 75 |
            enumerate |
            each {|r| {
                index: ($r.index + 1)
                name: $r.item.name
                # GitHub shows PRs whose author account is gone as authored by "ghost"
                github: ($github_logins | where name == $r.item.name | get github.0? | default 'ghost')
                all_commits: $r.item.all_commits
            }} |
            to csv
    }
}

# .mailmap file
# format
# new_name <new_email> old_name <old_email>
# name <email_we_now_want_to_use> some old name <old email address1>
# name <email_we_now_want_to_use> some old name <old email address2>
# name <email_we_now_want_to_use> some old name <old email address3>
# name <email_we_now_want_to_use> some old name <old email address4>
