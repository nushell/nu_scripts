# Written by JT

def "nu-complete git branches" [] {
  ^git branch | lines | each { |line| $line | str find-replace "\* " "" | str trim }
}

def "nu-complete git remotes" [] {
  ^git remote | lines | each { |line| $line | str trim }
}

# Top leve git command
# extern "git" [

# ]

# Check out git branches and files
extern "git checkout" [
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
extern "git push" [
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
