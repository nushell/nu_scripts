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

### gl
Git log and show.

### gb
About the branch.

Create branch if it doesn't exist,
switch otherwise (branch are automatically completed),
use -d to delete.

If there is no branch as an argument, the branch is displayed.

### gp
Pull, push and other related to remote repositories

> We assume that the upstream and downstream branches keep the same name and do not operate across branches.

- `--clone` to clone
- `--submodule` submodule update and submodule init (with `--init`)
- `--force` push --force (assume `pull --force` doesn't make sense)
- `--init` git init
- `--override` just used to trigger a github actions event (in fact, webhooks can also be used)
- `--set-upstream` push --set-upstream
- if branch is specified, it is `git fetch` (let's assume you don't like pulling from a different branch)
- finally, if no branch and above parameters are specified
    - `git pull` to update.
    - if `ahead`, `git push` will be executed.

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

### gcp
Git cherry-pick

### gr
Git reset

### grmt
Git remote

### gbs
Git bisect

## changelog

#### 2023-05-18
- `gp -u` can omit branch
- delete `grb`
- improve the premise in the description
