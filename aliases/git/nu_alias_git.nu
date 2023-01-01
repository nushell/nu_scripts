#
# Aliases
# (sorted alphabetically)
#

export alias g                     = git

export alias ga                    = git add
export alias gaa                   = git add --all
export alias gapa                  = git add --patch
export alias gau                   = git add --update
export alias gav                   = git add --verbose
export alias gap                   = git apply
export alias gapt                  = git apply --3way

export alias gb                    = git branch
export alias gba                   = git branch -a
export alias gbd                   = git branch -d
export alias gbda                  = (git branch --no-color --merged | grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | do -i {xargs git branch -d})
export alias gbD                   = git branch -D
export alias gbl                   = git blame -b -w
export alias gbnm                  = git branch --no-merged
export alias gbr                   = git branch --remote
export alias gbs                   = git bisect
export alias gbsb                  = git bisect bad
export alias gbsg                  = git bisect good
export alias gbsr                  = git bisect reset
export alias gbss                  = git bisect start

export alias gc                    = git commit -v
export alias gc!                   = git commit -v --amend
export alias gcn                   = git commit -v --no-edit
export alias gcn!                  = git commit -v --no-edit --amend
export alias gca                   = git commit -v -a
export alias gca!                  = git commit -v -a --amend
export alias gcan!                 = git commit -v -a --no-edit --amend
export alias gcans!                = git commit -v -a -s --no-edit --amend
export alias gcam                  = git commit -a -m
export alias gcsm                  = git commit -s -m
export alias gcas                  = git commit -a -s
export alias gcasm                 = git commit -a -s -m
export alias gcb                   = git checkout -b
export alias gcf                   = git config --list

export alias gcl                   = git clone --recurse-submodules
export alias gclean                = git clean -id
export alias gpristine             = ((git reset --hard); (git clean -dffx))
export alias gcm                   = git checkout $(git_main_branch)
export alias gcd                   = git checkout $(git_develop_branch)
export alias gcmsg                 = git commit -m
export alias gco                   = git checkout
export alias gcor                  = git checkout --recurse-submodules
export alias gcount                = git shortlog -sn
export alias gcp                   = git cherry-pick
export alias gcpa                  = git cherry-pick --abort
export alias gcpc                  = git cherry-pick --continue
export alias gcs                   = git commit -S
export alias gcss                  = git commit -S -s
export alias gcssm                 = git commit -S -s -m

export alias gd                    = git diff
export alias gdca                  = git diff --cached
export alias gdcw                  = git diff --cached --word-diff
export alias gdct                  = git describe --tags $(git rev-list --tags --max-count=1)
export alias gds                   = git diff --staged
export alias gdt                   = git diff-tree --no-commit-id --name-only -r
export alias gdup                  = git diff @{upstream}
export alias gdw                   = git diff --word-diff

export alias gf                    = git fetch
export alias gfo                   = git fetch origin

export alias gfg                   = (git ls-files | grep)

export alias gg                    = git gui citool
export alias gga                   = git gui citool --amend

export alias ggpur                 = ggu
export alias ggpull                = git pull origin "$(git_current_branch)"
export alias ggpush                = git push origin "$(git_current_branch)"

export alias ggsup                 = git branch --set-upstream-to=origin/$(git_current_branch)
export alias gpsup                 = git push --set-upstream origin $(git_current_branch)

export alias ghh                   = git help

export alias gignore               = git update-index --assume-unchanged
export alias gignored              = (git ls-files -v | grep "^[[:lower:]]")
export alias git-svn-dcommit-push  = ((git svn dcommit); (git push github $(git_main_branch):svntrunke))

export alias gk                    = gitk --all --branches &!
export alias gke                   = gitk --all $(git log -g --pretty=%h) &!

export alias gl                    = git pull
export alias glg                   = git log --stat
export alias glgp                  = git log --stat -p
export alias glgg                  = git log --graph
export alias glgga                 = git log --graph --decorate --all
export alias glgm                  = git log --graph --max-count=10
export alias glo                   = git log --oneline --decorate
export alias glol                  = git log --graph --pretty=%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset
export alias glols                 = git log --graph --pretty=%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset --stat
export alias glod                  = git log --graph --pretty=%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset
export alias glods                 = git log --graph --pretty=%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset --date=short
export alias glola                 = git log --graph --pretty=%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset --all
export alias glog                  = git log --oneline --decorate --graph
export alias gloga                 = git log --oneline --decorate --graph --all

export alias gm                    = git merge
export alias gmom                  = git merge origin/$(git_main_branch)
export alias gmtl                  = git mergetool --no-prompt
export alias gmtlvim               = git mergetool --no-prompt --tool=vimdiff
export alias gmum                  = git merge upstream/$(git_main_branch)
export alias gma                   = git merge --abort

export alias gp                    = git push
export alias gpd                   = git push --dry-run
export alias gpf                   = git push --force-with-lease
export alias gpf!                  = git push --force
export alias gpoat                 = ((git push origin --all); (git push origin --tags))
export alias gpr                   = git pull --rebase
export alias gpu                   = git push upstream
export alias gpv                   = git push -v

export alias gr                    = git remote
export alias gra                   = git remote add
export alias grb                   = git rebase
export alias grba                  = git rebase --abort
export alias grbc                  = git rebase --continue
export alias grbd                  = git rebase $(git_develop_branch)
export alias grbi                  = git rebase -i
export alias grbm                  = git rebase $(git_main_branch)
export alias grbom                 = git rebase origin/$(git_main_branch)
export alias grbo                  = git rebase --onto
export alias grbs                  = git rebase --skip
export alias grev                  = git revert
export alias grh                   = git reset
export alias grhh                  = git reset --hard
export alias groh                  = git reset origin/$(git_current_branch) --hard
export alias grm                   = git rm
export alias grmc                  = git rm --cached
export alias grmv                  = git remote rename
export alias grrm                  = git remote remove
export alias grs                   = git restore
export alias grset                 = git remote set-url
export alias grss                  = git restore --source
export alias grst                  = git restore --staged
export alias grt                   = cd (git rev-parse --show-toplevel || echo .)
export alias gru                   = git reset --
export alias grup                  = git remote update
export alias grv                   = git remote -v

export alias gsb                   = git status -sb
export alias gsd                   = git svn dcommit
export alias gsh                   = git show
export alias gsi                   = git submodule init
export alias gsps                  = git show --pretty=short --show-signature
export alias gsr                   = git svn rebase
export alias gss                   = git status -s
export alias gst                   = git status

export alias gstaa                 = git stash apply
export alias gstc                  = git stash clear
export alias gstd                  = git stash drop
export alias gstl                  = git stash list
export alias gstp                  = git stash pop
export alias gsts                  = git stash show --text
export alias gstu                  = gsta --include-untracked
export alias gstall                = git stash --all
export alias gsu                   = git submodule update
export alias gsw                   = git switch
export alias gswc                  = git switch -c
export alias gswm                  = git switch $(git_main_branch)
export alias gswd                  = git switch $(git_develop_branch)

export alias gts                   = git tag -s
export alias gtv                   = (git tag | sort -V)

export alias gunignore             = git update-index --no-assume-unchanged
export alias gunwip                = ((git log -n 1 | grep -q -c "\--wip--"); (git reset HEAD~1))
export alias gup                   = git pull --rebase
export alias gupv                  = git pull --rebase -v
export alias gupa                  = git pull --rebase --autostash
export alias gupav                 = git pull --rebase --autostash -v
export alias gupom                 = git pull --rebase origin $(git_main_branch)
export alias gupomi                = git pull --rebase=interactive origin $(git_main_branch)
export alias glum                  = git pull upstream $(git_main_branch)
export alias gluc                  = git pull upstream $(git_current_branch)

export alias gwch                  = git whatchanged -p --abbrev-commit --pretty=medium

export alias gwt                   = git worktree
export alias gwta                  = git worktree add
export alias gwtls                 = git worktree list
export alias gwtmv                 = git worktree move
export alias gwtrm                 = git worktree remove

export alias gam                   = git am
export alias gamc                  = git am --continue
export alias gams                  = git am --skip
export alias gama                  = git am --abort
export alias gamscp                = git am --show-current-patch
