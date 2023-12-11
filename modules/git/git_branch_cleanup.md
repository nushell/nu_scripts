# Git branch cleanup

Remove any local git branches that have been merged and optionally remove any
remote branches that have been merged.

Load with:
```nushell
source modules/git/git_branch_cleanup.nu
```

To remove merged branches:
```nushell
git branch-cleanup
```

To keep merged branches that start with "releases/":

```nushell
git config --local --add branch-cleanup.keep 'releases/.*'
```

Keep branch patterns are space-separated
