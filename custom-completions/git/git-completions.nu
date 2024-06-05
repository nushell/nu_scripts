
def "nu-complete git available upstream" [] {
  ^git branch -a | lines | each { |line| $line | str replace '\* ' "" | str trim }
}

def "nu-complete git remotes" [] {
  ^git remote | lines | each { |line| $line | str trim }
}

def "nu-complete git log" [] {
  ^git log --pretty=%h | lines | each { |line| $line | str trim }
}

# Yield all existing commits in descending chronological order.
def "nu-complete git commits all" [] {
  ^git rev-list --all --remotes --pretty=oneline | lines | parse "{value} {description}"
}

# Yield commits of current branch only. This is useful for e.g. cut points in
# `git rebase`.
def "nu-complete git commits current branch" [] {
  ^git log --pretty="%h %s" | lines | parse "{value} {description}"
}

# Yield local branches like `main`, `feature/typo_fix`
def "nu-complete git local branches" [] {
  ^git branch | lines | each { |line| $line | str replace '* ' "" | str trim }
}

# Yield remote branches like `origin/main`, `upstream/feature-a`
def "nu-complete git remote branches with prefix" [] {
  ^git branch -r | lines | parse -r '^\*?(\s*|\s*\S* -> )(?P<branch>\S*$)' | get branch | uniq
}

# Yield remote branches *without* prefix which do not have a local counterpart.
# E.g. `upstream/feature-a` as `feature-a` to checkout and track in one command
# with `git checkout` or `git switch`.
def "nu-complete git remote branches nonlocal without prefix" [] {
  # Get regex to strip remotes prefixes. It will look like `(origin|upstream)`
  # for the two remotes `origin` and `upstream`.
  let remotes_regex = (["(", ((nu-complete git remotes | each {|r| [$r, '/'] | str join}) | str join "|"), ")"] | str join)
  let local_branches = (nu-complete git local branches)
  ^git branch -r | lines | parse -r (['^[\* ]+', $remotes_regex, '?(?P<branch>\S+)'] | flatten | str join) | get branch | uniq | where {|branch| $branch != "HEAD"} | where {|branch| $branch not-in $local_branches }
}

def "nu-complete git switch" [] {
  (nu-complete git local branches)
  | parse "{value}"
  | insert description "local branch"
  | append (nu-complete git remote branches nonlocal without prefix
            | parse "{value}"
            | insert description "remote branch")
}

def "nu-complete git checkout" [] {
  (nu-complete git local branches)
  | parse "{value}"
  | insert description "local branch"
  | append (nu-complete git remote branches nonlocal without prefix
            | parse "{value}"
            | insert description "remote branch")
  | append (nu-complete git remote branches with prefix
            | parse "{value}"
            | insert description "remote branch")
  | append (nu-complete git commits all)
  | append (nu-complete git files | where description != "Untracked" | select value)
}

# Arguments to `git rebase --onto <arg1> <arg2>`
def "nu-complete git rebase" [] {
  (nu-complete git local branches)
  | parse "{value}"
  | insert description "local branch"
  | append (nu-complete git remote branches with prefix
            | parse "{value}"
            | insert description "remote branch")
  | append (nu-complete git commits all)
}

def "nu-complete git stash-list" [] {
  git stash list | lines | parse "{value}: {description}"
}

def "nu-complete git tags" [] {
  ^git tag | lines
}

# See `man git-status` under "Short Format"
# This is incomplete, but should cover the most common cases.
const short_status_descriptions = {
  ".D": "Deleted"
  ".M": "Modified"
  "!" : "Ignored"
  "?" : "Untracked"
  "AU": "Staged, not merged"
  "MD": "Some modifications staged, file deleted in work tree"
  "MM": "Some modifications staged, some modifications untracked"
  "R.": "Renamed"
  "UU": "Both modified (in merge conflict)"
}

def "nu-complete git files" [] {
  let relevant_statuses = ["?",".M", "MM", "MD", ".D", "UU"]
  ^git status -uall --porcelain=2
  | lines
  | each { |$it|
    if $it starts-with "1 " {
      $it | parse --regex "1 (?P<short_status>\\S+) (?:\\S+\\s?){6} (?P<value>\\S+)"
    } else if $it starts-with "2 " {
      $it | parse --regex "2 (?P<short_status>\\S+) (?:\\S+\\s?){6} (?P<value>\\S+)"
    } else if $it starts-with "u " {
      $it | parse --regex "u (?P<short_status>\\S+) (?:\\S+\\s?){8} (?P<value>\\S+)"
    } else if $it starts-with "? " {
      $it | parse --regex "(?P<short_status>.{1}) (?P<value>.+)"
    } else {
      { short_status: 'unknown', value: $it }
    }
  }
  | flatten
  | where $it.short_status in $relevant_statuses
  | insert "description" { |e| $short_status_descriptions | get $e.short_status}
}

def "nu-complete git built-in-refs" [] {
  [HEAD FETCH_HEAD ORIG_HEAD]
}

def "nu-complete git refs" [] {
  nu-complete git switchable branches
  | parse "{value}"
  | insert description Branch
  | append (nu-complete git tags | parse "{value}" | insert description Tag)
  | append (nu-complete git built-in-refs)
}

def "nu-complete git files-or-refs" [] {
  nu-complete git switchable branches
  | parse "{value}"
  | insert description Branch
  | append (nu-complete git files | where description == "Modified" | select value)
  | append (nu-complete git tags | parse "{value}" | insert description Tag)
  | append (nu-complete git built-in-refs)
}

def "nu-complete git subcommands" [] {
  ^git help -a | lines | where $it starts-with "   " | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
}

def "nu-complete git add" [] {
  nu-complete git files
}

def "nu-complete git pull rebase" [] {
  ["false","true","merges","interactive"]
}


# Check out git branches and files
export extern "git checkout" [
  ...targets: string@"nu-complete git checkout"   # name of the branch or files to checkout
  --conflict: string                              # conflict style (merge or diff3)
  --detach(-d)                                    # detach HEAD at named commit
  --force(-f)                                     # force checkout (throw away local modifications)
  --guess                                         # second guess 'git checkout <no-such-branch>' (default)
  --ignore-other-worktrees                        # do not check if another worktree is holding the given ref
  --ignore-skip-worktree-bits                     # do not limit pathspecs to sparse entries only
  --merge(-m)                                     # perform a 3-way merge with the new branch
  --orphan: string                                # new unparented branch
  --ours(-2)                                      # checkout our version for unmerged files
  --overlay                                       # use overlay mode (default)
  --overwrite-ignore                              # update ignored files (default)
  --patch(-p)                                     # select hunks interactively
  --pathspec-from-file: string                    # read pathspec from file
  --progress                                      # force progress reporting
  --quiet(-q)                                     # suppress progress reporting
  --recurse-submodules                            # control recursive updating of submodules
  --theirs(-3)                                    # checkout their version for unmerged files
  --track(-t)                                     # set upstream info for new branch
  -b                                              # create and checkout a new branch
  -B: string                                      # create/reset and checkout a branch
  -l                                              # create reflog for new branch
]

# Download objects and refs from another repository
export extern "git fetch" [
  repository?: string@"nu-complete git remotes" # name of the branch to fetch
  --all                                         # Fetch all remotes
  --append(-a)                                  # Append ref names and object names to .git/FETCH_HEAD
  --atomic                                      # Use an atomic transaction to update local refs.
  --depth: int                                  # Limit fetching to n commits from the tip
  --deepen: int                                 # Limit fetching to n commits from the current shallow boundary
  --shallow-since: string                       # Deepen or shorten the history by date
  --shallow-exclude: string                     # Deepen or shorten the history by branch/tag
  --unshallow                                   # Fetch all available history
  --update-shallow                              # Update .git/shallow to accept new refs
  --negotiation-tip: string                     # Specify which commit/glob to report while fetching
  --negotiate-only                              # Do not fetch, only print common ancestors
  --dry-run                                     # Show what would be done
  --write-fetch-head                            # Write fetched refs in FETCH_HEAD (default)
  --no-write-fetch-head                         # Do not write FETCH_HEAD
  --force(-f)                                   # Always update the local branch
  --keep(-k)                                    # Keep downloaded pack
  --multiple                                    # Allow several arguments to be specified
  --auto-maintenance                            # Run 'git maintenance run --auto' at the end (default)
  --no-auto-maintenance                         # Don't run 'git maintenance' at the end
  --auto-gc                                     # Run 'git maintenance run --auto' at the end (default)
  --no-auto-gc                                  # Don't run 'git maintenance' at the end
  --write-commit-graph                          # Write a commit-graph after fetching
  --no-write-commit-graph                       # Don't write a commit-graph after fetching
  --prefetch                                    # Place all refs into the refs/prefetch/ namespace
  --prune(-p)                                   # Remove obsolete remote-tracking references
  --prune-tags(-P)                              # Remove any local tags that do not exist on the remote
  --no-tags(-n)                                 # Disable automatic tag following
  --refmap: string                              # Use this refspec to map the refs to remote-tracking branches
  --tags(-t)                                    # Fetch all tags
  --recurse-submodules: string                  # Fetch new commits of populated submodules (yes/on-demand/no)
  --jobs(-j): int                               # Number of parallel children
  --no-recurse-submodules                       # Disable recursive fetching of submodules
  --set-upstream                                # Add upstream (tracking) reference
  --submodule-prefix: string                    # Prepend to paths printed in informative messages
  --upload-pack: string                         # Non-default path for remote command
  --quiet(-q)                                   # Silence internally used git commands
  --verbose(-v)                                 # Be verbose
  --progress                                    # Report progress on stderr
  --server-option(-o): string                   # Pass options for the server to handle
  --show-forced-updates                         # Check if a branch is force-updated
  --no-show-forced-updates                      # Don't check if a branch is force-updated
  -4                                            # Use IPv4 addresses, ignore IPv6 addresses
  -6                                            # Use IPv6 addresses, ignore IPv4 addresses
]

# Push changes
export extern "git push" [
  remote?: string@"nu-complete git remotes",         # the name of the remote
  ...refs: string@"nu-complete git local branches"   # the branch / refspec
  --all                                              # push all refs
  --atomic                                           # request atomic transaction on remote side
  --delete(-d)                                       # delete refs
  --dry-run(-n)                                      # dry run
  --exec: string                                     # receive pack program
  --follow-tags                                      # push missing but relevant tags
  --force-with-lease                                 # require old value of ref to be at this value
  --force(-f)                                        # force updates
  --ipv4(-4)                                         # use IPv4 addresses only
  --ipv6(-6)                                         # use IPv6 addresses only
  --mirror                                           # mirror all refs
  --no-verify                                        # bypass pre-push hook
  --porcelain                                        # machine-readable output
  --progress                                         # force progress reporting
  --prune                                            # prune locally removed refs
  --push-option(-o): string                          # option to transmit
  --quiet(-q)                                        # be more quiet
  --receive-pack: string                             # receive pack program
  --recurse-submodules: string                       # control recursive pushing of submodules
  --repo: string                                     # repository
  --set-upstream(-u)                                 # set upstream for git pull/status
  --signed: string                                   # GPG sign the push
  --tags                                             # push tags (can't be used with --all or --mirror)
  --thin                                             # use thin pack
  --verbose(-v)                                      # be more verbose
]

# Pull changes
export extern "git pull" [
  remote?: string@"nu-complete git remotes",         # the name of the remote
  ...refs: string@"nu-complete git local branches",  # the branch / refspec
  --rebase(-r): string@"nu-complete git pull rebase",    # rebase current branch on top of upstream after fetching
  --quiet(-q)                                        # suppress output during transfer and merge
  --verbose(-v)                                      # be more verbose
  --commit                                           # perform the merge and commit the result
  --no-commit                                        # perform the merge but do not commit the result
  --edit(-e)                                         # edit the merge commit message
  --no-edit                                          # use the auto-generated merge commit message
  --cleanup: string                                  # specify how to clean up the merge commit message
  --ff                                               # fast-forward if possible
  --no-ff                                            # create a merge commit in all cases
  --gpg-sign(-S)                                     # GPG-sign the resulting merge commit
  --no-gpg-sign                                      # do not GPG-sign the resulting merge commit
  --log: int                                         # include log messages from merged commits
  --no-log                                           # do not include log messages from merged commits
  --signoff                                          # add Signed-off-by trailer
  --no-signoff                                       # do not add Signed-off-by trailer
  --stat(-n)                                         # show a diffstat at the end of the merge
  --no-stat                                          # do not show a diffstat at the end of the merge
  --squash                                           # produce working tree and index state as if a merge happened
  --no-squash                                        # perform the merge and commit the result
  --verify                                           # run pre-merge and commit-msg hooks
  --no-verify                                        # do not run pre-merge and commit-msg hooks
  --strategy(-s): string                             # use the given merge strategy
  --strategy-option(-X): string                      # pass merge strategy-specific option
  --verify-signatures                                # verify the tip commit of the side branch being merged
  --no-verify-signatures                             # do not verify the tip commit of the side branch being merged
  --summary                                          # show a summary of the merge
  --no-summary                                       # do not show a summary of the merge
  --autostash                                        # create a temporary stash entry before the operation
  --no-autostash                                     # do not create a temporary stash entry before the operation
  --allow-unrelated-histories                        # allow merging histories without a common ancestor
  --no-rebase                                        # do not rebase the current branch on top of the upstream branch
  --all                                              # fetch all remotes
  --append(-a)                                       # append fetched refs to existing contents of FETCH_HEAD
  --atomic                                           # use an atomic transaction to update local refs
  --depth: int                                       # limit fetching to the specified number of commits
  --deepen: int                                      # deepen the history by the specified number of commits
  --shallow-since: string                            # deepen or shorten the history since a specified date
  --shallow-exclude: string                          # exclude commits reachable from a specified branch or tag
  --unshallow                                        # convert a shallow repository to a complete one
  --update-shallow                                   # update .git/shallow with new refs
  --tags(-t)                                         # fetch all tags from the remote
  --jobs(-j): int                                    # number of parallel children for fetching
  --set-upstream                                     # add upstream (tracking) reference
  --upload-pack: string                              # specify non-default path for upload-pack on the remote
  --progress                                         # force progress status even if stderr is not a terminal
  --server-option(-o): string                        # transmit the given string to the server
]

# Switch between branches and commits
export extern "git switch" [
  switch?: string@"nu-complete git switch"        # name of branch to switch to
  --create(-c)                                    # create a new branch
  --detach(-d): string@"nu-complete git log"      # switch to a commit in a detached state
  --force-create(-C): string                      # forces creation of new branch, if it exists then the existing branch will be reset to starting point
  --force(-f)                                     # alias for --discard-changes
  --guess                                         # if there is no local branch which matches then name but there is a remote one then this is checked out
  --ignore-other-worktrees                        # switch even if the ref is held by another worktree
  --merge(-m)                                     # attempts to merge changes when switching branches if there are local changes
  --no-guess                                      # do not attempt to match remote branch names
  --no-progress                                   # do not report progress
  --no-recurse-submodules                         # do not update the contents of sub-modules
  --no-track                                      # do not set "upstream" configuration
  --orphan: string                                # create a new orphaned branch
  --progress                                      # report progress status
  --quiet(-q)                                     # suppress feedback messages
  --recurse-submodules                            # update the contents of sub-modules
  --track(-t)                                     # set "upstream" configuration
]

# Apply the change introduced by an existing commit
export extern "git cherry-pick" [
  commit?: string@"nu-complete git commits all" # The commit ID to be cherry-picked
  --edit(-e)                                    # Edit the commit message prior to committing
  --no-commit(-n)                               # Apply changes without making any commit
  --signoff(-s)                                 # Add Signed-off-by line to the commit message
  --ff                                          # Fast-forward if possible
  --continue                                    # Continue the operation in progress
  --abort                                       # Cancel the operation
  --skip                                        # Skip the current commit and continue with the rest of the sequence
]

# Rebase the current branch
export extern "git rebase" [
  branch?: string@"nu-complete git rebase"    # name of the branch to rebase onto
  upstream?: string@"nu-complete git rebase"  # upstream branch to compare against
  --continue                                  # restart rebasing process after editing/resolving a conflict
  --abort                                     # abort rebase and reset HEAD to original branch
  --quit                                      # abort rebase but do not reset HEAD
  --interactive(-i)                           # rebase interactively with list of commits in editor
  --onto?: string@"nu-complete git rebase"    # starting point at which to create the new commits
  --root                                      # start rebase from root commit
]

# List or change branches
export extern "git branch" [
  branch?: string@"nu-complete git local branches"               # name of branch to operate on
  --abbrev                                                       # use short commit hash prefixes
  --edit-description                                             # open editor to edit branch description
  --merged                                                       # list reachable branches
  --no-merged                                                    # list unreachable branches
  --set-upstream-to: string@"nu-complete git available upstream" # set upstream for branch
  --unset-upstream                                               # remote upstream for branch
  --all                                                          # list both remote and local branches
  --copy                                                         # copy branch together with config and reflog
  --format                                                       # specify format for listing branches
  --move                                                         # rename branch
  --points-at                                                    # list branches that point at an object
  --show-current                                                 # print the name of the current branch
  --verbose                                                      # show commit and upstream for each branch
  --color                                                        # use color in output
  --quiet                                                        # suppress messages except errors
  --delete(-d)                                                   # delete branch
  --list                                                         # list branches
  --contains: string@"nu-complete git commits all"               # show only branches that contain the specified commit
  --no-contains                                                  # show only branches that don't contain specified commit
  --track(-t)                                                    # when creating a branch, set upstream
]

# List or change tracked repositories
export extern "git remote" [
  --verbose(-v)                            # Show URL for remotes
]

# Add a new tracked repository
export extern "git remote add" [
]

# Rename a tracked repository
export extern "git remote rename" [
  remote: string@"nu-complete git remotes"             # remote to rename
  new_name: string                                     # new name for remote
]

# Remove a tracked repository
export extern "git remote remove" [
  remote: string@"nu-complete git remotes"             # remote to remove
]

# Get the URL for a tracked repository
export extern "git remote get-url" [
  remote: string@"nu-complete git remotes"             # remote to get URL for
]

# Set the URL for a tracked repository
export extern "git remote set-url" [
  remote: string@"nu-complete git remotes"             # remote to set URL for
  url: string                                          # new URL for remote
]

# Show changes between commits, working tree etc
export extern "git diff" [
  rev1_or_file?: string@"nu-complete git files-or-refs"
  rev2?: string@"nu-complete git refs"
  --cached                                             # show staged changes
  --name-only                                          # only show names of changed files
  --name-status                                        # show changed files and kind of change
  --no-color                                           # disable color output
]

# Commit changes
export extern "git commit" [
  --all(-a)                                           # automatically stage all modified and deleted files
  --amend                                             # amend the previous commit rather than adding a new one
  --message(-m): string                               # specify the commit message rather than opening an editor
  --no-edit                                           # don't edit the commit message (useful with --amend)
  --reuse-message(-C): string                         # reuse the message from a previous commit
  --reedit-message(-c): string                        # reuse and edit message from a commit
  --fixup: string                                     # create a fixup/amend commit
  --squash: string                                    # squash commit for autosquash rebase
  --reset-author                                      # reset author information
  --short                                             # short-format output for dry-run
  --branch                                            # show branch info in short-format
  --porcelain                                         # porcelain-ready format for dry-run
  --long                                              # long-format output for dry-run
  --null(-z)                                          # use NUL instead of LF in output
  --file(-F): string                                  # read commit message from file
  --author: string                                    # override commit author
  --date: string                                      # override author date
  --template(-t): string                              # use commit message template file
  --signoff(-s)                                       # add Signed-off-by trailer
  --no-signoff                                        # do not add Signed-off-by trailer
  --trailer: string                                   # add trailer to commit message
  --no-verify(-n)                                     # bypass pre-commit and commit-msg hooks
  --verify                                            # do not bypass pre-commit and commit-msg hooks
  --allow-empty                                       # allow commit with no changes
  --allow-empty-message                               # allow commit with empty message
  --cleanup: string                                   # cleanup commit message
  --edit(-e)                                          # edit commit message
  --no-edit                                           # do not edit commit message
  --amend                                             # amend previous commit
  --include(-i)                                       # include given paths in commit
  --only(-o)                                          # commit only specified paths
  --pathspec-from-file: string                        # read pathspec from file
  --pathspec-file-nul                                 # use NUL character for pathspec file
  --untracked-files(-u): string                       # show untracked files
  --verbose(-v)                                       # show diff in commit message template
  --quiet(-q)                                         # suppress commit summary
  --dry-run                                           # show paths to be committed without committing
  --status                                            # include git-status output in commit message
  --no-status                                         # do not include git-status output
  --gpg-sign(-S):string                               # GPG-sign commit
  --no-gpg-sign                                       # do not GPG-sign commit
  ...pathspec: string                                 # commit files matching pathspec
]

# List commits
export extern "git log" [
  # Ideally we'd allow completion of revisions here, but that would make completion of filenames not work.
  -U                                                  # show diffs
  --follow                                            # show history beyond renames (single file only)
  --grep: string                                      # show log entries matching supplied regular expression
]

# Show or change the reflog
export extern "git reflog" [
]

# Stage files
export extern "git add" [
  ...file: string@"nu-complete git add"               # file to add
  --all(-A)                                           # add all files
  --dry-run(-n)                                       # don't actually add the file(s), just show if they exist and/or will be ignored
  --edit(-e)                                          # open the diff vs. the index in an editor and let the user edit it
  --force(-f)                                         # allow adding otherwise ignored files
  --interactive(-i)                                   # add modified contents in the working tree interactively to the index
  --patch(-p)                                         # interactively choose hunks to stage
  --verbose(-v)                                       # be verbose
]

# Delete file from the working tree and the index
export extern "git rm" [
  -r                                                   # recursive
  --force(-f)                                          # override the up-to-date check
  --dry-run(-n)                                        # Don't actually remove any file(s)
  --cached                                             # unstage and remove paths only from the index
]

# Show the working tree status
export extern "git status" [
  --verbose(-v)                                       # be verbose
  --short(-s)                                         # show status concisely
  --branch(-b)                                        # show branch information
  --show-stash                                        # show stash information
]

# Stash changes for later
export extern "git stash push" [
  --patch(-p)                                         # interactively choose hunks to stash
]

# Unstash previously stashed changes
export extern "git stash pop" [
  stash?: string@"nu-complete git stash-list"          # stash to pop
  --index(-i)                                          # try to reinstate not only the working tree's changes, but also the index's ones
]

# List stashed changes
export extern "git stash list" [
]

# Show a stashed change
export extern "git stash show" [
  stash?: string@"nu-complete git stash-list"
  -U                                                  # show diff
]

# Drop a stashed change
export extern "git stash drop" [
  stash?: string@"nu-complete git stash-list"
]

# Create a new git repository
export extern "git init" [
  --initial-branch(-b)                                # initial branch name
]

# List or manipulate tags
export extern "git tag" [
  --delete(-d): string@"nu-complete git tags"         # delete a tag
]

# Prune all unreachable objects
export extern "git prune" [
  --dry-run(-n)                                       # dry run
  --expire: string                                    # expire objects older than
  --progress                                          # show progress
  --verbose(-v)                                       # report all removed objects
]

# Start a binary search to find the commit that introduced a bug
export extern "git bisect start" [
  bad?: string                 # a commit that has the bug
  good?: string                # a commit that doesn't have the bug
]

# Mark the current (or specified) revision as bad
export extern "git bisect bad" [
]

# Mark the current (or specified) revision as good
export extern "git bisect good" [
]

# Skip the current (or specified) revision
export extern "git bisect skip" [
]

# End bisection
export extern "git bisect reset" [
]

# Show help for a git subcommand
export extern "git help" [
  command: string@"nu-complete git subcommands"       # subcommand to show help for
]

# git worktree
export extern "git worktree" [
  --help(-h)            # display the help message for this command
  ...args
]

# create a new working tree
export extern "git worktree add" [
  --help(-h)            # display the help message for this command
  --force(-f)           # checkout <branch> even if already checked out in other worktree
  -b                    # create a new branch
  -B                    # create or reset a branch
  --detach(-d)          # detach HEAD at named commit
  --checkout            # populate the new working tree
  --lock                # keep the new working tree locked
  --reason              # reason for locking
  --quiet(-q)           # suppress progress reporting
  --track               # set up tracking mode (see git-branch(1))
  --guess-remote        # try to match the new branch name with a remote-tracking branch
  ...args
]

# list details of each worktree
export extern "git worktree list" [
  --help(-h)            # display the help message for this command
  --porcelain           # machine-readable output
  --verbose(-v)         # show extended annotations and reasons, if available
  --expire              # add 'prunable' annotation to worktrees older than <time>
  -z                    # terminate records with a NUL character
  ...args
]

# prevent a working tree from being pruned
export extern "git worktree lock" [
  --help(-h)            # display the help message for this command
  --reason              # reason for locking
  ...args
]

# move a working tree to a new location
export extern "git worktree move" [
  --help(-h)            # display the help message for this command
  --force(-f)           # force move even if worktree is dirty or locked
  ...args
]

# prune working tree information
export extern "git worktree prune" [
  --help(-h)            # display the help message for this command
  --dry-run(-n)         # do not remove, show only
  --verbose(-v)         # report pruned working trees
  --expire              # expire working trees older than <time>
  ...args
]

# remove a working tree
export extern "git worktree remove" [
  --help(-h)            # display the help message for this command
  --force(-f)           # force removal even if worktree is dirty or locked
  ...args
]

# allow working tree to be pruned, moved or deleted
export extern "git worktree unlock" [
  ...args
]

# clones a repo
export extern "git clone" [
  --help(-h)                    # display the help message for this command
  --local(-l)                   # cloning from the local machine
  --no-local                    # use the git transport mechanism even if cloning from a local path
  --no-hardlinks                # force git to copy files when cloning from the local machine
  --shared(-s)                  # setup .git/objects/info/alternates to share objects with the source local repo
  --reference: string           # setup .git/objects/info/alternates to share objects with the =<reference> local repo
  --reference-if-able: string   # same as --reference, but skips empty folders
  --dissociate                  # borrow objects from the referenced repo (--reference)
  --quiet(-q)                   # suppress progress reporting
  --verbose(-v)                 # be verbose
  --progress                    # report progress unless --quiet
  --server-option: string       # transmit the =<option> to the server
  --no-checkout(-n)             # no checkout of HEAD
  --reject-shallow              # reject shallow repository as source
  --no-reject-shallow           # do not reject shallow repository as source
  --bare                        # make a bare git repo
  --sparse                      # initialize the sparse-checkout file
  --filter: string              # partial clone using the given =<filter-spec>
  --mirror                      # mirror the source repo
  --origin(-o): string          # use <name> as the name for the remote origin
  --branch(-b): string          # point HEAD to <name> branch
  --upload-pack(-u): string     # use <upload-pack> as the path in the other end when using ssh
  --template: string            # use <template-dir> as the templates directory
  --config(-c): string          # set a <key>=<value> config variable
  --depth: int                  # shallow clone <depth> commits 
  --shallow-since: string       # shallow clone commits newer than =<date>
  --shallow-exclude: string     # do not clone commits reachable from <revision> (branch or tag)
  --single-branch               # clone commit history from a single branch
  --no-single-Branch            # do not clone only one branch
  --no-tags                     # do not clone any tags
  --recurse-submodules: string  # clone the submodules
  --shallow-submodules          # shallow clone submodules with depth 1
  --no-shallow-submodules       # do not shallow clone submodules
  --remote-submodules           # submodules are updating using their remote tracking branch
  --no-remote-submodules        # do not track submodules remote
  --separate-git-dir: string    # place the clone at =<git dir> and link it here
  --jobs(-j): int               # number of simultaneous submodules fetch
  ...args
]