# Completions based on Jujutsu 0.36.0

def operations [] {
  {
    options: {
      sort: false,
    },
    completions: (^jj op log --ignore-working-copy --no-graph -T 'self.id().short() ++ " " ++ self.description().first_line() ++ "\n"' | parse --regex '(?<value>\w+) (?<description>.*)'),
  }
}

def revisions [] {
  ^jj log --ignore-working-copy --no-graph -r 'all()' -T 'self.change_id().short() ++ " " ++ self.description().first_line() ++ "\n"' | parse --regex '(?<value>\w+) (?<description>.*)'
}

def all-bookmarks [] {
  ^jj bookmark list --ignore-working-copy --all-remotes -T 'if(self.remote() != "git", self.name() ++ if(self.remote(), "@" ++ self.remote()) ++ "\n")' | lines
}

def local-bookmarks [] {
  ^jj bookmark list --ignore-working-copy -T 'if(!self.remote(), self.name() ++ "\n")' | lines
}

def tracked-bookmarks [] {
  ^jj bookmark list --ignore-working-copy --all-remotes -T 'if(self.tracked() && self.remote() != "git", self.name() ++ "@" ++ self.remote() ++ "\n")' | lines
}

def untracked-bookmarks [] {
  let remotes = ^jj git remote list --ignore-working-copy | lines | each {|| split row " " | first }
  let local = ^jj bookmark list --ignore-working-copy -T 'if(!self.remote(), self.name() ++ "\n")' | lines | each {|b| $remotes | each {|r| $"($b)@($r)"  } } | flatten
  let tracked = tracked-bookmarks
  let local_untracked = $local | where $it not-in $tracked
  let remote_untracked = ^jj bookmark list --ignore-working-copy --all-remotes -T 'if(!self.tracked() && self.remote() && self.remote() != "git", self.name() ++ "@" ++ self.remote() ++ "\n")' | lines
  $local_untracked ++ $remote_untracked
}

def revsets [] {
  {
    options: { sort: false },
    completions: [
      ...(all-bookmarks | each {|b| { value: $b, style: purple } }),
      ...(^jj log --ignore-working-copy --no-graph -r 'all()' -T 'self.change_id().short() ++ " " ++ self.description().first_line() ++ "\n"' | parse --regex '(?<value>\w+) (?<description>.*)' | each {|o| { ...$o, style: cyan } }),
    ]
  }
}

def remotes [] {
  ^jj git remote list --ignore-working-copy | parse --regex '(?<value>\S+)\s+(?<description>\S+)'
}

def workspaces [] {
  ^jj --ignore-working-copy workspace list -T 'self.name() ++ "\n"' | lines
}

def tags [] {
  ^jj --ignore-working-copy tag list -T 'self.name() ++ "\n"' | lines
}

def modes [] {
  [
    { value: 'normal', description: 'make a path non-executable' }
    { value: 'executable', description: 'male a path executable' }
  ]
}

def fetch-tags [] {
  [
    { value: 'all', description: 'always fetch all tags' }
    { value: 'included', description: 'only fetch tags that point to transmitted objects' }
    { value: 'none', description: 'do not fetch tags' }
  ]
}

def commands [] {
  [
    'abandon'
    'absorb'
    'bisect'
    'bisect run'
    'bookmark'
    'bookmark create'
    'bookmark delete'
    'bookmark forget'
    'bookmark list'
    'bookmark move'
    'bookmark rename'
    'bookmark set'
    'bookmark track'
    'bookmark untrack'
    'commit'
    'config'
    'config edit'
    'config get'
    'config list'
    'config path'
    'config set'
    'config unset'
    'describe'
    'diff'
    'diffedit'
    'duplicate'
    'edit'
    'evolog'
    'file'
    'file annotate'
    'file chmod'
    'file list'
    'file show'
    'file track'
    'file untrack'
    'fix'
    'gerrit'
    'gerrit upload'
    'git'
    'git clone'
    'git colocation'
    'git colocation disable'
    'git colocation enable'
    'git colocation status'
    'git export'
    'git fetch'
    'git import'
    'git init'
    'git push'
    'git remote'
    'git remote add'
    'git remote list'
    'git remote remove'
    'git remote rename'
    'git remote set-url'
    'git root'
    'help'
    'interdiff'
    'log'
    'metaedit'
    'new'
    'next'
    'operation'
    'operation abandon'
    'operation diff'
    'operation log'
    'operation restore'
    'operation revert'
    'operation show'
    'parallelize'
    'prev'
    'rebase'
    'redo'
    'resolve'
    'restore'
    'revert'
    'root'
    'show'
    'sign'
    'simplify-parents'
    'sparse'
    'sparse edit'
    'sparse list'
    'sparse reset'
    'sparse set'
    'split'
    'squash'
    'status'
    'tag'
    'tag delete'
    'tag list'
    'tag set'
    'undo'
    'unsign'
    'util'
    'util completion'
    'util config-schema'
    'util exec'
    'util gc'
    'util install-man-pages'
    'util markdown-help'
    'version'
    'workspace'
    'workspace add'
    'workspace forget'
    'workspace list'
    'workspace rename'
    'workspace root'
    'workspace update-stale'
  ]
}

def keywords [] {
  ['bookmarks', 'config', 'filesets', 'glossary', 'revsets', 'templates', 'tutorial']
}

def bookmarks-sort [] {
  [
    'name'
    'name-'
    'author-name'
    'author-name-'
    'author-email'
    'author-email-'
    'author-date'
    'author-date-'
    'committer-name'
    'committer-name-'
    'committer-email'
    'committer-email-'
    'committer-date'
    'committer-date-'
  ]
}

def restore-options [] {
  [
    { value: 'repo', description: 'the jj repo state and local bookmarks' }
    { value: 'remote-tracking', description: 'the remote-tracking bookmarks' }
  ]
}

def shells [] {
  ['bash', 'elvish', 'fish', 'nushell', 'power-shell', 'zsh']
}

def sparse-patterns [] {
  [
    { value: 'copy', description: 'copy all sparse patterns from the current workspace' }
    { value: 'full', description: 'include all files in the new workspace' }
    { value: 'empty', description: 'clear all files from the workspace' }
  ]
}

def color-when [] {
  ['always', 'never', 'debug', 'auto']
}

# Abandon a revision
export extern "jj abandon" [
  ...revsets: string@revsets                # the revision(s) to abandon (default: @)
  --retain-bookmarks                        # move bookmakrs to parent revisions
  --restore-descendents                     # do not modify the content of the children of the abandoned commits
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move changes from a revision into the stack of mutable revisions
export extern "jj absorb" [
  ...filesets: path                         # move only changes to these paths
  --from(-f): string@revsets                # source revision to absorb from
  --into(-t): string@revsets                # destination revisions to absorb into
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Run a given command to find the first bad revision.
export extern "jj bisect run" [
  command: string                           # command to run to determine whether the bug is present
  ...args: string                           # arguments to pass to the command
  --range(-r): string@revsets               # range of revisions to bisect
  --find-good                               # whether to find the first good revision instead
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new bookmark
export extern "jj bookmark create" [
  ...bookmarks: string                      # the bookmarks to create
  --revision(-r): string@revsets            # the bookmark's target revision
  --to: string@revsets                      # the bookmark's target revision
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Delete an existing bookmark
export extern "jj bookmark delete" [
  ...bookmarks: string@local-bookmarks      # the bookmarks to delete
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Forget a bookmark without making it as a deletion to be pushed
export extern "jj bookmark forget" [
  ...bookmarks: string@local-bookmarks      # the bookmarks to forget
  --include-remotes                         # also forget any corresponding remote bookmarks
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List bookmarks and their target
export extern "jj bookmark list" [
  ...names: string@local-bookmarks          # show bookmarks whose local name matches the pattern
  --all-remotes(-a)                         # show all tracking and non-tracking remote bookmarks
  --remote: string@remotes                  # show all tracking and non-tracking bookmarks belonging to this remote
  --tracked(-t)                             # only show tracked bookmarks
  --conflicted(-c)                          # only show conflicted bookmarks
  --revisions(-r): string@revsets           # show bookmarks whose local targets are in the given revisions
  --template(-T): string                    # use a template to render bookmarks
  --sort: string@bookmarks-sort             # sort bookmarks based on the given key
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move existing bookmarks to target revision
export extern "jj bookmark move" [
  ...names: string@local-bookmarks          # move bookmarks matching the pattern
  --from(-f): string@revsets                # the revisions to move the bookmarks from
  --to(-t): string@revsets                  # the revision to move the bookmarks to
  --allow-backwards(-B)                     # allow moving bookmarks backwards or sideways
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Rename a bookmark
export extern "jj bookmark rename" [
  old: string@local-bookmarks               # the bookmark to rename
  new: string                               # the new name of the bookmark
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create or update a bookmark to point to a certain commit
export extern "jj bookmark set" [
  ...names: string@local-bookmarks          # the bookmarks to update
  --revision(-r): string@revsets            # the bookmark's target revision
  --to: string@revsets                      # the bookmark's target revision
  --allow-backwards(-B)                     # allow moving the bookmark backwards or sideways
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Start tracking given remote bookmarks
export extern "jj bookmark track" [
  ...bookmarks: string@untracked-bookmarks  # remote bookmarks to track
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Start tracking given remote bookmarks
export extern "jj bookmark untrack" [
  ...bookmarks: string@tracked-bookmarks    # remote bookmarks to untrack
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update the description and create a new change on top [default alias: ci]
export extern "jj commit" [
  ...filesets: path                         # put theses changes in the first commit
  --interactive(-i)                         # interactively choose which changes to include in the first commit
  --tool: path                              # specify diff editor to be used (implies --interactive)
  --message(-m): string                     # the change description to use
  --editor                                  # open an editor to edit the change description
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Start an editor on a jj config file.
export extern "jj config edit" [
  --user                                    # targer the user-level config
  --repo                                    # target the repo-level config
  --workspace                               # target the workspace-level config
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Get the value of a given config option
export extern "jj config get" [
  name: string                              # the config option to get
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List variables set in config files, along with their values
export extern "jj config list" [
  name?: string                             # name of a config option to look upi
  --include-defaults                        # whether to include default values
  --include-overriden                       # whether to include overriden values
  --user                                    # target the user-level config
  --repo                                    # target the repo-level config
  --workspace                               # target the workspace-level config
  --template(-T): string                    # render each variable using the template
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print the paths to the config files
export extern "jj config path" [
  --user                                    # targer the user-level config
  --repo                                    # target the repo-level config
  --workspace                               # target the workspace-level config
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update a config file to set the given option to a given value
export extern "jj config set" [
  name: string                              # the config option to set
  value: string                             # the value to set
  --user                                    # targer the user-level config
  --repo                                    # target the repo-level config
  --workspace                               # target the workspace-level config
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update a config file to unset the given option
export extern "jj config unset" [
  name: string                              # the config option to unset
  --user                                    # targer the user-level config
  --repo                                    # target the repo-level config
  --workspace                               # target the workspace-level config
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update the change description or other metadata
export extern "jj describe" [
  ...revisions: string@revsets              # the revision(s) whose description to edit (default: @)
  --message(-m): string                     # the change description to use
  --stdin                                   # read the change description from stdin
  --editor                                  # open an editor to edit the change description
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Compare file contents between two revisions
export extern "jj diff" [
  ...filesets: path                         # restrict the diff to these paths
  --revisions(-r): string@revsets           # show changes in these revisions
  --from(-f): string@revsets                # show changes from this revision
  --to(-t): string@revsets                  # show changes to this revision
  --template(-T): string                    # render each file diff entry using the given template
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore-all-space(-w)                    # ignore whitespace when comparing lines
  --ignore-space-change(-b)                 # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Display the content changes in a revision with a diff editor
export extern "jj diffedit" [
  ...filesets: path                         # only display these paths
  --revisions(-r): string@revsets           # show changes in these revisions
  --from(-f): string@revsets                # show changes from this revision
  --to(-t): string@revsets                  # show changes to this revision
  --tool: path                              # specify diff editor to use
  --restore-descendants                     # preserve the content when rebasing descendants
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create new changes with the same content as existing ones
export extern "jj duplicate" [
  ...revsets: string@revsets                # the revisions to duplicate
  --onto(-o): string@revsets                # the revisions to duplicate onto
  --insert-after(-A): string@revsets        # the revisions to insert after
  --after: string@revsets                   # the revisions to insert after
  --insert-before(-B): string@revsets       # the revisions to isnert before
  --before: string@revsets                  # the revisions to isnert before
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Sets the specified revision as the working-copy revision
export extern "jj edit" [
  revset: string@revsets                    # the commit to edit
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show how a change has evolved over time
export extern "jj evolog" [
  --revisions(-r): string@revsets           # follow changes from these revisions
  --limit(-n): int                          # limit the number of revisions to show
  --reversed                                # show revisions in the opposite order
  --no-graph                                # do not show the graph
  --template(-T): string                    # render each revision using the given template
  --patch(-p)                               # show patch compated to the previous version
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore-all-space                        # ignore whitespace when comparing lines
  --ignore-space-change                     # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the source change for each line of the target file.
export extern "jj file annotate" [
  path: path                                # the file to annotate
  --revision(-r): string@revsets            # an optional revision to start at
  --template(-T): string                    # render each line using the given template
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Sets or removes the executable bit for paths in the repo
export extern "jj file chmod" [
  mode: string@modes                        # the mode to set
  ...files: path                            # paths to change the executable bit for
  --revision(-r): string@revsets            # an optional revision to start at
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List files in a revision
export extern "jj file list" [
  ...files: path                            # only list files matching these prefixes
  --revision(-r): string@revsets            # the revision to list files in
  --template(-T): string                    # render each line using the given template
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print contents of files in a revision
export extern "jj file show" [
  ...files: path                            # paths to print
  --revision(-r): string@revsets            # the revision to get the file contents from
  --template(-T): string                    # render each file metadata using the given template
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Start tracking specified paths in the working copy
export extern "jj file track" [
  ...files: path                            # paths to track
  --include-ignored                         # track paths even if they're ignored or too large
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Stop tracking specified paths in the working copy
export extern "jj file untrack" [
  ...files: path                            # paths to untrack
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update files with formatting fixes or other changes
export extern "jj fix" [
  ...filesets: path                         # fix only these paths
  --source(-s): string@revsets              # fix files in these revisions and their descendants
  --include-unchanged-files                 # also fix unchanged files
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Upload changes to Gerrit for code review, or update existing changes.
export extern "jj gerrit upload" [
  --revisions(-r): string@revsets           # the revisions to send to gerrit
  --remote-branch(-b)                       # the location where your changes are intended to land
  --remote: string                          # the gerrit remote to push top
  --dry-run(-n)                             # do not actually push the changes to gerrit
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new repo backed by a clone of a Git repo
export extern "jj git clone" [
  source: string                            # url or path of the git repo to clone
  destination?: path                        # target directory for the repository clone
  --remote: string                          # name of the newly created remote
  --colocate                                # colocate the jj repo with the git repo
  --no-colocate                             # disable colocation of the jj repo with the git repo
  --depth: int                              # creates a shallow clone of the given depth
  --fetch-tags: string@fetch-tags           # configure when to fetch tags
  --branch(-b): string                      # name of the branch to fetch
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Convert into a non-colocated Jujutsu/Git repository
export extern "jj git colocation disable" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Convert into a colocated Jujutsu/Git repository
export extern "jj git colocation enable" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the current colocation status
export extern "jj git colocation status" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update the underlying Git repo with changes made in the repo
export extern "jj git export" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Fetch from a Git remote
export extern "jj git fetch" [
  --branch(-b): string                      # only fetch some of the branches
  --tracked                                 # only fetch tracked bookmarks
  --remote: string@remotes                  # the remote to fetch from
  --all-remotes                             # fetch from all remotes
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update repo with changes made in the underlying Git repo
export extern "jj git import" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new Git backed repo
export extern "jj git init" [
  destination?: path                        # the directory where the repo will be created (default '.')
  --colocate                                # creates a valid git repo
  --no-colocate                             # disable colocation of the jj repo with the git repo
  --git-repo: path                          # the git repo to use as the backing repo
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Push to a Git remote
export extern "jj git push" [
  --remote: string@remotes                  # the remote to push to
  --bookmark(-b): string@local-bookmarks    # push only this bookmark
  --all                                     # push all bookmarks
  --tracked                                 # push all tracked bookmarks
  --deleted                                 # push all deleted bookmarks
  --allow-empty-description                 # allow pushing commits with empty descriptions
  --allow-private                           # allow pushing commits that are private
  --revisions(-r): string@revsets           # push bookmarks pointing to these commits
  --change(-c): string@revsets              # push this commit by creating a bookmark
  --named: string                           # specify a new bookmark and the revision it points to
  --dry-run                                 # only display what will change on the remote
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Add a Git remote
export extern "jj git remote add" [
  remote: string                            # the remote name
  url: string                               # the remote's URL or path
  --fetch-tags: string@fetch-tags           # configure when to fetch tags
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List Git remotes
export extern "jj git remote list" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Remove a Git remote and forget its bookmarks
export extern "jj git remote remove" [
  remote: string@remotes                    # the remote's name
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Rename a git remote
export extern "jj git remote rename" [
  old: string@remotes                       # the name of the existing remote
  new: string                               # the new name of the remote
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Set the URL of a Git remote
export extern "jj git remote set-url" [
  remote: string@remotes                    # the name of the existing remote
  url: string                               # the new url or path for the remote
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the underlying Git directory of a repository using the Git backend
export extern "jj git root" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print a help message
export extern "jj help" [
  ...commands: string@commands              # print help for the subcommands
  --keyword(-k): string@keywords            # show help for a keyword instead of a command
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Compare the changes of two commits
export extern "jj interdiff" [
  ...filesets: path                         # restrict the diff to these paths
  --from(-f): string@revsets                # show changes from this revision
  --to(-t): string@revsets                  # show changes to this revision
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore-all-space(-w)                    # ignore whitespace when comparing lines
  --ignore-space-change(-b)                 # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show revision history
export extern "jj log" [
  ...filesets: path                         # show revisions modifying the given paths
  --revisions(-r): string@revsets           # which revisions to show
  --limit(-n): int                          # number of revisions to show
  --reversed                                # show revisions in the opposite order
  --no-graph(-G)                            # do not show the graph, use a flat list
  --template(-T): string                    # use a template to render revisions
  --patch(-p)                               # show patch
  --summary(-s)                             # for each path, show only whether it was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a git format diff
  --color-words                             # show a word-level diff with changes indicated by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore--all-space                       # ignore whitespace when comparing lines
  --ignore-space-change                     # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Modify the metadata of a revision without changing its content
export extern "jj metaedit" [
  ...revsets: string@revsets                # the revision(s) to modify
  --message(-m): string                     # update the change description
  --update-author-timestamp                 # update the author timestamp
  --update-author                           # update the author to the configured user
  --author: string                          # set author to the provided string
  --author-timestamp: string                # set the author timestamp to the given date
  --force-rewrite                           # rewrite the commit, even if no other metadata changed
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new, empty change
export extern "jj new" [
  ...revsets: string@revsets                # parent(s) of the new change
  --message(-m): string                     # the change description to use
  --no-edit                                 # do not edit the newly created change
  --insert-after(-A): string@revsets        # insert the new change after the given commits
  --after: string@revsets                   # insert the new change after the given commits
  --insert-before(-B): string@revsets       # insert the new change before the given commits
  --before: string@revsets                  # insert the new change before the given commits
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move the working-copy commit to the child revision
export extern "jj next" [
  offset?: int                              # how many revisions to move forward
  --edit(-e)                                # edit the target instead of creating a new working copy commit
  --no-edit(-e)                             # create a new working copy commit
  --conflict                                # jump to the next conflicted descendant
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Abandon operation history
export extern "jj operation abandon" [
  operation: string@operations              # the operation to abandon
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Compare changes to the repository between two operations
export extern "jj operation diff" [
  --operation: string@operations            # show repository changes in this operation
  --from(-f): string@operations             # show repository changes from this operation
  --to(-t): string@operations               # show repository changes to this operation
  --no-graph(-G)                            # do not show the graph
  --patch(-p)                               # show patch of modifications to changes
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore-all-space                        # ignore whitespace when comparing lines
  --ignore-space-change                     # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the operation log
export extern "jj operation log" [
  --limit(-n): int                          # limit the number of operations to show
  --reversed                                # show operations in the opposite order
  --no-graph(-G)                            # do not show the graph
  --template(-T): string                    # render each operation using the given template
  --op-diff(-d)                             # show changes to the repository at each operation
  --patch(-p)                               # show patch of modifications to changes
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --ignore-all-space                        # ignore whitespace when comparing lines
  --ignore-space-change                     # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new operation that restores the repo to an earlier state
export extern "jj operation restore" [
  operation: string@operations              # the operation to restore to
  --what: string@restore-options            # what portions of the local state to restore
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create a new operation that reverts an earlier operation
export extern "jj operation revert" [
  operation?: string@operations             # the operation to revert
  --what: string@restore-options            # what portions of the local state to revert
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show changes to the repository in an operation
export extern "jj operation show" [
  operation: string@operations              # show repository changes in this operation
  --no-graph(-G)                            # do not show the graph
  --template(-T): string                    # render the operation using the given template
  --patch(-p)                               # show patch of modifications to changes
  --no-op-diff                              # do not show operation diff
  --summary(-s)                             # show only whether each path was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated only by color
  --tool: path                              # generate diff by external command
  --context: path                           # number of lines of context to show
  --ignore-all-space                        # ignore whitespace when comparing lines
  --ignore-space-change                     # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Parallelize revisions by making them siblings
export extern "jj parallelize" [
  ...revesets: string@revsets               # revisions to parallelize
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move the working-copy commit to the parent revision
export extern "jj prev" [
  offset?: int                              # how many revisions to move backward
  --edit(-e)                                # edit the target instead of creating a new working copy commit
  --no-edit(-e)                             # create a new working copy commit
  --conflict                                # jump to the next conflicted ancestor
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move revisions to different parent(s)
export extern "jj rebase" [
  --branch(-b): string@revsets              # rebase the whole branch relative to destination
  --source(-s): string@revsets              # rebase specified revisions with their descendants
  --revisions(-r): string@revsets           # rebase only the given revisions
  --onto(-o): string@revsets                # the revisions to rebase onto
  --insert-after(-A): string@revsets        # the revision(s) to insert after
  --after: string@revsets                   # the revision(s) to insert after
  --insert-before(-B): string@revsets       # the revision(s) to insert before
  --before: string@revsets                  # the revision(s) to insert before
  --skip-emptied                            # abandon empty commits
  --keep-divergent                          # keep divergent commits
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Redo the most recently undone operation
export extern "jj redo" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Resolve conflicted files with an external merge tool
export extern "jj resolve" [
  ...filesets: path                         # only resolve conflicts in these paths
  --revision(-r): string@revsets            # revision the conflicts of to resolve
  --list(-l)                                # instead of resolving conflicts, list all the conflicts
  --tool: path                              # the 3-way merge tool to be used
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Restore paths from another revision
export extern "jj restore" [
  ...filesets: path                         # restore only these paths
  --from(-f): string@revsets                # revision to restore from
  --into(-t): string@revsets                # revision to restore into
  --to: string@revsets                      # revision to restore into
  --changes-in(-c): string@revsets          # undo the changes in a revision
  --interactive(-i)                         # interactively choose which parts to restore
  --tool: path                              # specify diff editor to be used
  --restore-descendants                     # preserve the content when rebasing descendants
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Apply the reverse of the given revision(s)
export extern "jj revert" [
  --revisions(-r): string@revsets           # the revision(s) to apply the reverse of
  --onto(-o): string@revsets                # the revision(s) to apply the reverse on top of
  --insert-after(-A): string@revsets        # the revision(s) to insert the reverse changes after
  --after: string@revsets                   # the revision(s) to insert the reverse changes after
  --insert-before(-B): string@revsets       # the revision(s) to insert the reverse changes before
  --before: string@revsets                  # the revision(s) to insert the reverse changes before
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the current workspace root directory (shortcut for `jj workspace root`)
export extern "jj root" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show commit description and changes in a revision
export extern "jj show" [
  revset: string@revsets                    # show changes in this revision
  --template(-T): string                    # render a revision using the given template
  --summary(-s)                             # for each path, show only whether it was modified, added, or deleted
  --stat                                    # show a histogram of the changes
  --types                                   # for each path, show only its type before and after
  --name-only                               # for each path, show only its path
  --git                                     # show a Git-format diff
  --color-words                             # show a word-level diff with changes indicated by color
  --tool: path                              # generate diff by external command
  --context: int                            # number of lines of context to show
  --no-patch                                # do not show the patch
  --ignore-all-space(-w)                    # ignore whitespace when comparing lines
  --ignore-space-change(-b)                 # ignore changes in amount of whitespace when comparing lines
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Cryptographically sign a revision
export extern "jj sign" [
  --revisions(-r): string@revsets           # the revision(s) to sign
  --key: string                             # the key to use for signing
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Simplify parent edges for the specified revision(s)
export extern "jj simplify-parents" [
  --source(-s): string@revsets              # revisions to be simplified together with their descendants
  --revisions(-r): string@revsets           # revisions to be simplified
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Start an editor to update the patterns that are present in the working copy
export extern "jj sparse edit" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List the patterns that are currently present in the working copy
export extern "jj sparse list" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Reset the patterns to include all files in the working copy
export extern "jj sparse reset" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update the patterns that are present in the working cop
export extern "jj sparse set" [
  --add: path                               # patterns to add to the working copy
  --remove: path                            # patterns to remove from the working copy
  --clear                                   # include no files in the working copy
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Split a revision in two
export extern "jj split" [
  ...filesets: path                         # files to put in the selected changes
  --interactive(-i)                         # interactively choose which parts to split
  --tool: path                              # the edito to be used
  --revision(-r): string@revsets            # the revision to spli
  --onto(-o): string@revsets                # the revision(s) to base the new revision onto
  --insert-after(-A): string@revsets        # the revision(s) to insert after
  --after: string@revsets                   # the revision(s) to insert after
  --insert-before(-B): string@revsets       # the revision(s) to insert before
  --before: string@revsets                  # the revision(s) to insert before
  --message(-m): string                     # the change description to use
  --editor                                  # open an editor to edit the change description
  --parallel(-p)                            # split the revision into two parallel revisions
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Move changes from a revision into another revision
export extern "jj squash" [
  ...filesets: path                         # move only changes to these paths
  --revision(-r): string@revsets            # revision to squash into its parent
  --from(-f): string@revsets                # revision(s) to squash from
  --into(-t): string@revsets                # revision to squash into
  --to: string@revsets                      # revision to squash into
  --onto(-o): string@revsets                # the revision(s) to use as parent for the new commit
  --insert-after(-A): string@revsets        # the revision(s) to insert the new commit after
  --after: string@revsets                   # the revision(s) to insert the new commit after
  --insert-before(-B): string@revsets       # the revision(s) to insert the new commit before
  --before: string@revsets                  # the revision(s) to insert the new commit before
  --message(-m): string                     # the description to use for squashed revision
  --use-destination-message(-u)             # use the description of the destination revision
  --editor                                  # open an editor to edit the change description
  --interactive(-i)                         # interactively choose which parts to squash
  --tool: path                              # specify diff editor to be used
  --keep-emptied(-k)                        # the source revision will not be andandoned
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show high-level repo status
export extern "jj status" [
  ...filesets: path                         # restrict the status display to these paths
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Delete existing tags
export extern "jj tag delete" [
  ...names: string@tags                     # tag names to delete
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List tags
export extern "jj tag list" [
  ...names: string                          # show tags whose local name matches
  --template(-T): string                    # render each tag using the given template
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Create or update tags
export extern "jj tag set" [
  ...names: string                         # tag names to create or update
  --revision(-r): string@revsets            # target revision to point to
  --allow-move                              # allow moving existing tags
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Undo the last operation
export extern "jj undo" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Drop a cryptographic signature
export extern "jj unsign" [
  --revisions(-r): string@revsets           # the revision(s) to unsign
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print a command-line-completion script
export extern "jj util completion" [
  shell: string@shells                      # shell to print completion for
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print the JSON schema for the jj TOML config format
export extern "jj util config-schema" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Execute an external command via jj
export extern "jj util exec" [
  command: path                             # external command to execute
  ...args                                   # arguments to pass to the external command
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Run backend-dependent garbage collection
export extern "jj util gc" [
  --expire: string                          # time threshold
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Install Jujutsu's manpages to the provided path
export extern "jj util install-man-pages" [
  path: path                                # the path where manpages will installed
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Print the CLI help for all subcommands in Markdown
export extern "jj util markdown-help" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Display version information
export extern "jj version" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Add a workspace
export extern "jj workspace add" [
  destination: path                         # where to create the new workspace
  --name: string                            # a name for the workspace
  --revision(-r): string@revsets            # a list of parent revisions for the created workspace
  --sparse-patterns: string@sparse-patterns # how to handle sparse patterns when creating a new workspace
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Stop tracking a workspace's working-copy commit in the repo
export extern "jj workspace forget" [
  ...workspaces: string@workspaces          # names of the workspaces to forget
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# List workspaces
export extern "jj workspace list" [
  --template(-T): string                    # render each workspace using the given template
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Renames the current workspace
export extern "jj workspace rename" [
  new_name: string                          # the new name of the workspace
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Show the current workspace root directory
export extern "jj workspace root" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]

# Update a workspace that has become stale
export extern "jj workspace update-stale" [
  --help                                    # print help
  -h                                        # print help summary
  --repository(-R): path                    # repository to operate on
  --ignore-working-copy                     # do not snapshot the working copy
  --ignore-immutable                        # allow rewriting immutable commits
  --at-operation: string@operations         # operation to load the repo at
  --debug                                   # enable debug logging
  --color: string@color-when                # when to colorize output
  --quiet                                   # silence non-primary command output
  --no-pager                                # disable the pager
  --config: string                          # additional configuration options
  --config-file: path                       # additional configuration file
]
