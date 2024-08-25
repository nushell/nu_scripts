def "nu-complete pre-commit help" [] {
  [
    "autoupdate",
    "clean",
    "init-templatedir",
    "gc",
    "install",
    "install-hooks",
    "migrate-config",
    "run",
    "try-repo",
    "uninstall",
    "validate-config",
    "validate-manifest",
    "sample-config",
    "help",
    ]
}

def "nu-complete --colors" [] { 
  [ "auto", "always", "never" ]
}


def "nu-complete --hook-stage" [] {
  [
    "commit-msg",
    "post-checkout",
    "post-commit",
    "post-merge",
    "post-rewrite",
    "pre-commit",
    "pre-merge-commit",
    "pre-push",
    "pre-rebase",
    "prepare-commit-msg",
    "manual",
    ]
}


def "nu-complete --hook-type" [] {
  [
    "pre-commit",
    "pre-merge-commit",
    "pre-push",
    "prepare-commit-msg",
    "commit-msg",
    "post-commit",
    "post-checkout",
    "post-merge",
    "post-rewrite",
    ]
}


# A framework for managing and maintaining multi-language pre-commit hooks.
export extern "pre-commit" [
  --help(-h)            # Show this help message and exit.
  --version(-V)         # Show program's version number and exit.
]

# Auto-update pre-commit config to the latest repos' versions.
export extern "pre-commit autoupdate" [
  --config(-c): path                      # Path to alternate config file.
  --jobs(-j): number                      # Number of threads to use. (default 1).
  --repo: string                          # Only update this repository -- may be specified multiple times.
  --bleeding-edge                         # Update to the bleeding edge of `HEAD` instead of the latest tagged version (the default behavior).
  --freeze                                # Store "frozen" hashes in `rev` instead of tag names.
  --help(-h)                              # Show this help message and exit.
  --color: string@"nu-complete --colors"  # Whether to use color in output. Defaults to `auto`.
]

# Clean out pre-commit files.
export extern "pre-commit clean" [
  --help(-h)                              # Show this help message and exit.
  --color: string@"nu-complete --colors"  # Whether to use color in output.
]

# Clean unused cached repos.
export extern "pre-commit gc" [
  --help(-h)                              # Show this help message and exit.
  --color: string@"nu-complete --colors"  # Whether to use color in output.
]

# Show help for a specific command.
export extern "pre-commit help" [
  help_cmd?: string@"nu-complete pre-commit help" # Command to show help for.
  --help(-h)                                      # Show this help message and exit.
]

# Install hook script in a directory intended for use with `git config init.templateDir`.
export extern "pre-commit init-templatedir" [
  directory: string                              # The directory in which to write the hook script.
  --config(-c): path                              # Path to alternate config file.
  --no-allow-missing-config                       # Assume cloned repos should have a `pre-commit` config.
  --hook-type: string@"nu-complete --hook-type"   # Hook type to use.
  --help(-h)                                      # Show this help message and exit.
  --color: string@"nu-complete --colors"          # Whether to use color in output.
]

# Install the pre-commit script.
export extern "pre-commit install" [
  --config(-c): path                              # Path to alternate config file.
  --no-allow-missing-config                       # Assume cloned repos should have a `pre-commit` config.
  --overwrite(-f)                                 # Overwrite existing hooks / remove migration mode.
  --install-hooks                                 # Whether to install hook environments for all environments in the config file.
  --hook-type: string@"nu-complete --hook-type"   # Hook type to use.
  --help(-h)                                      # Show this help message and exit.
  --color: string@"nu-complete --colors"          # Whether to use color in output.
]


# Install hook environments for all environments in the config file. You may find `pre-commit install --install-hooks` more useful.
export extern "pre-commit install-hooks" [
  --help(-h)                              # Show this help message and exit.
  --color: string@"nu-complete --colors"  # Whether to use color in output.
]

# Migrate list configuration to new map configuration.
export extern "pre-commit migrate-config" [
  --config(-c): path                              # Path to alternate config file.
  --help(-h)                                      # Show this help message and exit.
  --color: string@"nu-complete --colors"          # Whether to use color in output.
]

# Run hooks.
export extern "pre-commit run" [
  hook?: string                             # A single hook-id to run
  --config(-c): path                        # Path to alternate config file.
  --verbose(-v)
  --all-files(-a)                           # Run on all the files in the repo.
  --files: path                             # Specific filenames to run hooks on.
  --show-diff-on-failure                    # When hooks fail, run `git diff` directly afterward
  --hook-stage@"nu-complete --hook-stage"   # The stage during which the hook is fired.
  --remote-branch: string                   # Remote branch ref used by `git push`.
  --local-branch: string                    # Local branch ref used by `git push`.
  --from-ref: string                        # (for usage with `--to-ref`) -- this option represents the original ref in a `from_ref...to_ref` diff expression. For `pre-push` hooks, this represents the branch you are pushing to. For `post-checkout` hooks, this represents the branch that was previously checked out.
  --source(-s): string                      # (for usage with `--to-ref`) -- this option represents the original ref in a `from_ref...to_ref` diff expression. For `pre-push` hooks, this represents the branch you are pushing to. For `post-checkout` hooks, this represents the branch that was previously checked out.
  --to-ref: string                          # for usage with `--from-ref`) -- this option represents the destination ref in a `from_ref...to_ref` diff expression. For `pre-push` hooks, this represents the branch being pushed. For `post-checkout` hooks, this represents the branch that is now checked out.
  --origin(-o): string                      # for usage with `--from-ref`) -- this option represents the destination ref in a `from_ref...to_ref` diff expression. For `pre-push` hooks, this represents the branch being pushed. For `post-checkout` hooks, this represents the branch that is now checked out.
  --pre-rebase-upstream: string             # The upstream from which the series was forked.
  --pre-rebase-branch: string               # The branch being rebased, and is not set when rebasing the current branch.
  --commit-msg-filename: string             # Filename to check when running during `commit-msg`
  --prepare-commit-message-source: string   # Source of the commit message (typically the second argument to .git/hooks/prepare-commit-msg)
  --commit-object-name: string              # Commit object name (typically the third argument to .git/hooks/prepare-commit-msg)
  --remote-name: string                     # Remote name used by `git push`.
  --remote-url: string                      # Remote url used by `git push`.
  --checkout-type: string                   # Indicates whether the checkout was a branch checkout (changing branches, flag=1) or a file checkout (retrieving a file from the index, flag=0).
  --is-squash-merge: string                 # During a post-merge hook, indicates whether the merge was a squash merge
  --rewrite-command: string                 # During a post-rewrite hook, specifies the command that invoked the rewrite
  --help(-h)                                # Show this help message and exit.
  --color: string@"nu-complete --colors"    # Whether to use color in output.
]

# Produce a sample .pre-commit-config.yaml file.
export extern "pre-commit sample-config" [
  --help(-h)                              # Show this help message and exit.
  --color: string@"nu-complete --colors"  # Whether to use color in output.
]

# Try the hooks in a repository, useful for developing new hooks.
export extern "pre-commit try-repo" [
  repo: path                                # Repository to source hooks from.
  hook?: string                             # A single hook-id to run
  --config(-c): path                        # Path to alternate config file.
  --verbose(-v)
  --ref: string                             # Manually select a rev to run against, otherwise the `HEAD` revision will be used.
  --all-files(-a)                           # Run on all the files in the repo.
  --files: path                             # Specific filenames to run hooks on.
  --show-diff-on-failure                    # When hooks fail, run `git diff` directly afterward
  --hook-stage@"nu-complete --hook-stage"   # The stage during which the hook is fired.
  --remote-branch: string                   # Remote branch ref used by `git push`.
  --local-branch: string                    # Local branch ref used by `git push`.
  --from-ref: string                        # (for usage with `--to-ref`) -- this option represents the original ref in a `from_ref...to_ref` diff expression. For `pre-push` hooks, this represents the branch you are pushing to. For `post-checkout` hooks, this represents the branch that was previously checked out.
  --source(-s): string                      # (for usage with `--to-ref`) -- this option represents the original ref in a `from_ref...to_ref` diff expression. For `pre-push` hooks, this represents the branch you are pushing to. For `post-checkout` hooks, this represents the branch that was previously checked out.
  --to-ref: string                          # for usage with `--from-ref`) -- this option represents the destination ref in a `from_ref...to_ref` diff expression. For `pre-push` hooks, this represents the branch being pushed. For `post-checkout` hooks, this represents the branch that is now checked out.
  --origin(-o): string                      # for usage with `--from-ref`) -- this option represents the destination ref in a `from_ref...to_ref` diff expression. For `pre-push` hooks, this represents the branch being pushed. For `post-checkout` hooks, this represents the branch that is now checked out.
  --pre-rebase-upstream: string             # The upstream from which the series was forked.
  --pre-rebase-branch: string               # The branch being rebased, and is not set when rebasing the current branch.
  --commit-msg-filename: string             # Filename to check when running during `commit-msg`
  --prepare-commit-message-source: string   # Source of the commit message (typically the second argument to .git/hooks/prepare-commit-msg)
  --commit-object-name: string              # Commit object name (typically the third argument to .git/hooks/prepare-commit-msg)
  --remote-name: string                     # Remote name used by `git push`.
  --remote-url: string                      # Remote url used by `git push`.
  --checkout-type: string                   # Indicates whether the checkout was a branch checkout (changing branches, flag=1) or a file checkout (retrieving a file from the index, flag=0).
  --is-squash-merge: string                 # During a post-merge hook, indicates whether the merge was a squash merge
  --rewrite-command: string                 # During a post-rewrite hook, specifies the command that invoked the rewrite
  --help(-h)                                # Show this help message and exit.
  --color: string@"nu-complete --colors"    # Whether to use color in output.
]

# Uninstall the pre-commit script.
export extern "pre-commit uninstall" [
  --config(-c): path                              # Path to alternate config file.
  --hook-type: string@"nu-complete --hook-type"   # Hook type to use.
  --help(-h)                                      # Show this help message and exit.
  --color: string@"nu-complete --colors"          # Whether to use color in output.
]

# Validate .pre-commit-config.yaml files.
export extern "pre-commit validate-config" [
  ...filenames: path                      # Paths to config files.
  --help(-h)                              # Show this help message and exit.
  --color: string@"nu-complete --colors"  # Whether to use color in output.
]

# Validate .pre-commit-hooks.yaml files.
export extern "pre-commit validate-manifest" [
  ...filenames: path                      # Paths to manifest files.
  --help(-h)                              # Show this help message and exit.
  --color: string@"nu-complete --colors"  # Whether to use color in output.
]
