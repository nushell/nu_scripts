
def "nu-complete gh" [] {
    ^gh --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh" [
    command?: string@"nu-complete gh"
    --help          # Show help for command
]

def "nu-complete gh auth" [] {
    ^gh auth --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh auth" [
    command?: string@"nu-complete gh auth"
    --help          # Show help for command
]

export extern "gh browse" [
    command?: string   # TODO: completion with [<PR number> | <file path> | <commit-SHA>]
    --branch(-b)       # Select another branch by passing in the branch name
    --commit(-c)       # Select another commit by passing in the commit SHA, default is the last commit
    --no-browser(-n)   # Print destination URL instead of opening the browser
    --projects(-p)     # Open repository projects
    --releases(-r)     # Open repository releases
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --settings(-s)     # Open repository settings
    --wiki(-w)         # Open repository wiki
    --help             # Show help for command
]

def "nu-complete gh codespace" [] {
    ^gh codespace --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh codespace" [
    command?: string@"nu-complete gh codespace"
    --help             # Show help for command
]

def "nu-complete gh gist" [] {
    ^gh gist --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh gist" [
    command?: string@"nu-complete gh gist"
    --help             # Show help for command
]

export extern "gh gist clone" [
    gist: string        # gist to clone
    directory?:path     # directory to clone
    --help             # Show help for command
]

export extern "gh gist create" [
    filename_or_stdin: string        # gist to create
    --desc(-d): string               # A description for this gist
    --filename(-f): string           # Provide a filename to be used when reading from standard input
    --public(-p)                     # List the gist publicly (default: secret)
    --web(-w)                        # Open the web browser with created gist
    --public                         # Make the new gist public
    --help                           # Show help for command
]

export extern "gh gist delete" [
    gist: string@"nu-complete gist list"        # gist to delete
    --help                           # Show help for command
]

export extern "gh gist edit" [
    gist: string@"nu-complete gist list"        # gist to edit
    --add(-a): string                # Add a new file to the gist
    --desc(-d): string               # New description for the gist
    --filename(-f): string           # Select a file to edit
    --remove(-r): string             # Remove a file from the gist
    --help                           # Show help for command
]

def "nu-complete gist list" [] {
    # TODO add the name of the gist to autocompletion
    ^gh gist list --limit 100 | lines | str replace --regex --multiline '\S+\K.*' ''
}

export extern "gh gist list" [
    --limit(-L): number     # Maximum number of repositories to list (default 30)
    --public                         # Show only the public gists
    --secret                         # Show only the secret gists
    --help                           # Show help for command
]

export extern "gh gist rename" [
    gist: string                   # gist to rename
    oldFilename: string            # gist to rename
    newFilename: string            # gist to rename
    --help                           # Show help for command
]

export extern "gh gist view" [
    gist?: string             # gist to view
    --filename(-f): string    # Display a single file from the gist
    --files                   # List file names from the gist
    --raw(-r)                 # Print raw instead of rendered gist contents
    --web(-w)                 # Open gist in the browser
    --help                           # Show help for command
]

def "nu-complete gh issue" [] {
    ^gh issue --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh issue" [
    command?: string@"nu-complete gh issue"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh org" [] {
    ^gh org --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh org" [
    command?: string@"nu-complete gh org"
    --help             # Show help for command
]

def "nu-complete gh pr" [] {
    ^gh pr --help | lines | filter { str starts-with "  " } | skip 1 | parse "{value}: {description}" | str trim
}

export extern "gh pr" [
    command?: string@"nu-complete gh pr"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh list prs" [] {
    gh pr list --json title,number,author,updatedAt | from json | update author {|row| $row.author.login } | rename --column { number: value } | insert description { |row| ( $row.updatedAt | date humanize) + " - " + $row.title + " by " + $row.author } | select value description 
}

export extern "gh pr checkout" [
   branch_url_or_PRnumber: string@"nu-complete gh list prs" # {<number> | <url> | <branch>}
   --branch(-b): string           # Local branch name to use (default: the name of the head branch)
   --detach                       # Checkout PR with a detached HEAD
   --force(-f)                    # Reset the existing local branch to the latest state of the pull request
   --recurse-submodules           # Update all submodules after checkout   
   --repo(-R)                     # Select another repository using the [HOST/]OWNER/REPO format
   --help                         # Show help for command
]

def "nu-complete gh project" [] {
    ^gh project --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh project" [
    command?: string@"nu-complete gh project"
    --help             # Show help for command
]

def "nu-complete gh release" [] {
    ^gh release --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh release" [
    command?: string@"nu-complete gh release"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh repo" [] {
    ^gh repo --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh repo" [
    command?: string@"nu-complete gh repo"
    --help             # Show help for command
]

def "nu-complete gh repo clone" [] {
    # regex that actually works
    # ^(?P<value>\S+) +(?P<description>\S+( \S+)*)? {2,}(?P<Visibility>public|private),?.*(?P<updated>about.*)
    ^gh repo list --limit 100 | lines | str replace --regex --multiline '\S+\K.*' ''
}

export extern "gh repo clone" [
    command: string@"nu-complete gh repo clone"
    --help             # Show help for command
]

def "nu-complete visibility" [] {
    ['public', 'private', 'internal']
}

export extern "gh repo list" [
    owner?: string          # List repos of this owner
    --archived              # Show only archived repositories
    --fork                  # Show only forks
    --jq(-q):string         # Filter JSON output using a jq expression
    --json: string          # Output JSON with the specified fields
    --language(-l): string  # Filter by primary coding language
    --limit(-L): number     # Maximum number of repositories to list (default 30)
    --no-archived           # Omit archived repositories
    --source                # Show only non-forks
    --template(-t): string  # Format JSON output using a Go template; see "gh help formatting"
    --topic: string         # Filter by topic
    --visibility: string@"nu-complete visibility"   # Filter by repository visibility: {public|private|internal}
    --help                  # Show help for command
]

export extern "gh repo view" [
    org_repo: string       # <ORG/REPO> to view
    --branch(-b):string    # View a specific branch of the repository
    --jq(-q):string        # Filter JSON output using a jq expression
    --json: string         # Output JSON with the specified fields
    --template(-t):string  # Format JSON output using a Go template; see "gh help formatting"
    --web                  # Open a repository in the browser
    --help                  # Show help for command
]

def "nu-complete gitignore list" [] {
    ^gh api  -H "Accept: application/vnd.github+json"  /gitignore/templates
    | from json
}

def "nu-complete licenses list" [] {
    let value = ^gh api  -H "Accept: application/vnd.github+json" /licenses | from json | get key | enumerate | reject index | rename value
    let description = ^gh api  -H "Accept: application/vnd.github+json" /licenses | from json | get name | enumerate | reject index | rename description
    $value | merge $description
}

export extern "gh repo create" [
    repo_name?: string
    --help                     # Show help for command
    --add-readme               # Add a README file to the new repository
    --clone(-c)                # Clone the new repository to the current directory
    --description(-d): string  # Description of the repository
    --disable-issues           # Disable issues in the new repository
    --disable-wiki             # Disable wiki in the new repository
    --gitignore(-g): string@"nu-complete gitignore list"    # Specify a gitignore template for the repository
    --homepage(-g): string     # Repository home page URL
    --include-all-branches     # Include all branches from template repository
    --internal                 # Make the new repository internal
    --license(-l): string@"nu-complete licenses list"      # Specify an Open Source License for the repository
    --private                  # Make the new repository private
    --public                   # Make the new repository public
    --push                     # Push local commits to the new repository
    --remote(-r): string       # Specify remote name for the new repository
    --source(-s): string       # Specify path to local repository to use as source
    --team(-t): string         # The name of the organization team to be granted access
    --template(-p): string     # Make the new repository based on a template repository
]

export extern "gh repo fork" [
    repo?: string
    --clone                # Clone the fork
    --default-branch-only  # Only include the default branch in the fork
    --fork-name: string    # Rename the forked repository
    --org: string          # Create the fork in an organization
    --remote               # Add a git remote for the fork
    --remote-name: string  # Specify the name for the new remote (default "origin")
    --help                 # Show help for command
]

def "nu-complete gh cache" [] {
    ^gh cache --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh cache" [
    command?: string@"nu-complete gh cache"
    --repo(-R)         # Select another repository using the [HOST/]OWNER/REPO format
    --help             # Show help for command
]

def "nu-complete gh run" [] {
    ^gh run --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh run" [
    command?: string@"nu-complete gh run"
    --help          # Show help for command
]

def "nu-complete gh workflow" [] {
    ^gh workflow --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh workflow" [
    command?: string@"nu-complete gh workflow"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh alias" [] {
    ^gh alias --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh alias" [
    command?: string@"nu-complete gh alias"
    --help          # Show help for command
]

def "nu-complete gh api" [] {
    # TODO
    # endpoints
    # ["graphql", "gists"]
}

export extern "gh api" [
    --cache                      # Cache the response, e.g. "3600s", "60m", "1h"
    --field(-F)                  # `key=value` Add a typed parameter in key=value format
    --header(-H)                 # `key:value` Add a HTTP request header in key:value format
    --hostname                   # The GitHub hostname for the request (default "github.com")
    --include(-i)                # Include HTTP response status line and headers in the output
    --input file                 # The file to use as body for the HTTP request (use "-" to read from standard input)
    --jq(-q)                     # Query to select values from the response using jq syntax
    --method(-X)                 # The HTTP method for the request (default "GET")
    --paginate                   # Make additional HTTP requests to fetch all pages of results
    --preview(-p)                # GitHub API preview names to request (without the "-preview" suffix)
    --raw-field(-f)              # `key:value` Add a string parameter in key=value format
    --silent                     # Do not print the response body
    --template(-t)               # Format JSON output using a Go template; see "gh help formatting"
    --verbose                    # Include full HTTP request and response in the output
    --help                   # Show help for command
    command?: string@"nu-complete gh api"
]

def "nu-complete gh completion" [] {
  ['bash', 'fish', 'powershell', 'zsh']
}

export extern "gh completion" [
    command?: string@"nu-complete gh completion"
    --shell(-s)     # Shell type: {bash|zsh|fish|powershell}
    --help          # Show help for command
]

def "nu-complete gh config" [] {
    ^gh config --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh config" [
    command?: string@"nu-complete gh config"
    --help          # Show help for command
]

def "nu-complete gh extension" [] {
    ^gh extension --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh extension" [
    command?: string@"nu-complete gh extension"
    --help          # Show help for command
]

def "nu-complete gh gpg-key" [] {
    ^gh gpg-key --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh gpg-key" [
    command?: string@"nu-complete gh gpg-key"
    --help          # Show help for command
]

def "nu-complete gh label" [] {
    ^gh label --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh label" [
    command?: string@"nu-complete gh label"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh ruleset" [] {
    ^gh ruleset --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh ruleset" [
    command?: string@"nu-complete gh ruleset"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh search" [] {
    ^gh search --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh search" [
    --extension      # Filter on file extension
    --filename       # Filter on filename
    --jq(-q)         # Filter JSON output using a jq expression
    --json           # Output JSON with the specified fields
    --language       # Filter results by language
    --limit(-L)      # Maximum number of code results to fetch (default 30)
    --match          # Restrict search to file contents or file path: {file|path}
    --owner          # Filter on owner
    --repo(-R)       # Filter on repository
    --size           # Filter on size range, in kilobytes
    --template(-t)   # Format JSON output using a Go template; see "gh help formatting"
    --web(-w) a      # Open the search query in the web browser   
    --help           # Show help for command
    command?: string@"nu-complete gh search"
]

def "nu-complete gh secret" [] {
    ^gh secret --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh secret" [
    command?: string@"nu-complete gh secret"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]

def "nu-complete gh ssh-key" [] {
    ^gh ssh-key --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh ssh-key" [
    command?: string@"nu-complete gh ssh-key"
    --help          # Show help for command
]

export extern "gh status" [
    --exclude(-e)   # Comma separated list of repos to exclude in owner/name format
    --org(-o)       # Report status within an organization
    --help          # Show help for command
]

def "nu-complete gh variable" [] {
    ^gh variable --help 
    | lines 
    | filter { str starts-with "  " } 
    | skip 1 
    | parse "{value}: {description}" 
    | str trim
}

export extern "gh variable" [
    command?: string@"nu-complete gh variable"
    --repo(-R)      # Select another repository using the [HOST/]OWNER/REPO format
    --help          # Show help for command
]
