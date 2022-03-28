def "nu-complete git branches" [] {
  ^git branch | lines | each { |line| $line | str find-replace '\* ' "" | str trim }
}

def "nu-complete git remotes" [] {
  ^git remote | lines | each { |line| $line | str trim }
}

def "nu-complete git log" [] {
  ^git log --pretty=%h | lines | each { |line| $line | str trim }
}

# Check out git branches and files
export extern "git checkout" [
  branch?: string@"nu-complete git branches" # name of the branch to checkout
  -b: string                                 # create and checkout a new branch
  -B: string                                 # create/reset and checkout a branch
  -l                                         # create reflog for new branch
  --guess                                    # second guess 'git checkout <no-such-branch>' (default)
  --overlay                                  # use overlay mode (default)
  --quiet(-q)                                # suppress progress reporting
  --recurse-submodules: string               # control recursive updating of submodules
  --progress                                 # force progress reporting
  --merge(-m)                                # perform a 3-way merge with the new branch
  --conflict: string                         # conflict style (merge or diff3)
  --detach(-d)                               # detach HEAD at named commit
  --track(-t)                                # set upstream info for new branch
  --force(-f)                                # force checkout (throw away local modifications)
  --orphan: string                           # new unparented branch
  --overwrite-ignore                         # update ignored files (default)
  --ignore-other-worktrees                   # do not check if another worktree is holding the given ref
  --ours(-2)                                 # checkout our version for unmerged files
  --theirs(-3)                               # checkout their version for unmerged files
  --patch(-p)                                # select hunks interactively
  --ignore-skip-worktree-bits                # do not limit pathspecs to sparse entries only
  --pathspec-from-file: string               # read pathspec from file
]

# Push changes
export extern "git push" [
  remote?: string@"nu-complete git remotes", # the name of the remote
  refspec?: string@"nu-complete git branches"# the branch / refspec
  --verbose(-v)                              # be more verbose
  --quiet(-q)                                # be more quiet
  --repo: string                             # repository
  --all                                      # push all refs
  --mirror                                   # mirror all refs
  --delete(-d)                               # delete refs
  --tags                                     # push tags (can't be used with --all or --mirror)
  --dry-run(-n)                              # dry run
  --porcelain                                # machine-readable output
  --force(-f)                                # force updates
  --force-with-lease: string                 # require old value of ref to be at this value
  --recurse-submodules: string               # control recursive pushing of submodules
  --thin                                     # use thin pack
  --receive-pack: string                     # receive pack program
  --exec: string                             # receive pack program
  --set-upstream(-u)                         # set upstream for git pull/status
  --progress                                 # force progress reporting
  --prune                                    # prune locally removed refs
  --no-verify                                # bypass pre-push hook
  --follow-tags                              # push missing but relevant tags
  --signed: string                           # GPG sign the push
  --atomic                                   # request atomic transaction on remote side
  --push-option(-o): string                  # option to transmit
  --ipv4(-4)                                 # use IPv4 addresses only
  --ipv6(-6)                                 # use IPv6 addresses only
]

# Switch between branches and commits
export extern "git switch" [
  switch?: string@"nu-complete git branches" # name of branch to switch to
  --create(-c): string                       # create a new branch
  --force-create(-C): string                 # forces creation of new branch, if it exists then the existing branch will be reset to starting point
  --detach(-d): string@"nu-complete git log" # switch to a commit in a detatched state
  --guess                                    # if there is no local branch which matches then name but there is a remote one then this is checked out
  --no-guess                                 # do not attempt to match remote branch names
  --force(-f)                                # alias for --discard-changes
  --merge(-m)                                # attempts to merge changes when switching branches if there are local changes
  --quiet(-q)                                # suppress feedback messages
  --progress                                 # report progress status
  --no-progress                              # do not report progress
  --track(-t)                                # set "upstream" configuration
  --no-track                                 # do not set "upstream" configuration
  --orphan: string                           # create a new orphaned branch
  --ignore-other-worktrees                   # switch even if the ref is held by another worktree
  --recurse-submodules                       # update the contents of sub-modules
  --no-recurse-submodules                    # do not update the contents of sub-modules
]
