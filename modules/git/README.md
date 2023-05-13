Consider putting related commands together, such as `push` and `pull`,
to decide how to execute based on the current environment or specified parameters.

This mode is more convenient,
but more difficult to implement in traditional shells such as zsh.

In nushell it's very easy.

In this way, the commands that need to be memorized will be greatly reduced,
and the parameters can be automatically completed.
In the most common scenarios, it is even possible to omit the parameter.

In contrast, the behavior of commands requires fine-tuning to be intuitive.
(there may still be some unreasonable places that need to be adjusted)

I tried to tidy part of it, and it is basically usable.
(The goal is to organize all aliases to where they should go)

### gs
Git status and stash.

### gb
About the branch.

Create branch if it doesn't exist,
switch otherwise (branch are automatically completed),
use -d to delete.

If there is no branch as an argument, the branch is displayed.

### gp
Pull, push and other related to remote repositories

- `--clone` to clone
- `--submodule` submodule update and submodule init (with `--init`)
- `--force` push --force (assume `pull --force` doesn't make sense)
- `--init` git init
- `--override`
- if branch is specified, we assume it is `git fetch`
    - unless -u is specified: `git push -u`
- finally, if no branch and above parameters are specified, `git pull` or `git push` will be executed according to the current state.

### ga
Git add, rm and restore. about files.

Use `ga` because git add has the highest execution frequency,
and `ga` is the most convenient input.

- `--delete` git rm
- `--restore` git restore
- git add

### gc
Git commit

### gd
Git diff

### gm
Git merge and rebase

- `--rebase` git rebase
- git merge

### gpc
Git cherry-pick

### gr
Git reset

### grmt
Git remote

### gbs
Git bisect
