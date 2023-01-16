export def _git_stat [n]  {
    do -i {
        git log -n $n --pretty=»¦«%h --stat
        | lines
        | reduce -f { c: '', r: [] } {|it, acc|
            if ($it | str starts-with '»¦«') {
                $acc | upsert c ($it | str substring '6,')
            } else if ($it | find -r '[0-9]+ file.+change' | is-empty) {
                $acc
            } else {
                let x = (
                    $it
                    | split row ','
                    | each {|x| $x
                        | str trim
                        | parse -r "(?P<num>[0-9]+) (?P<col>.+)"
                        | get 0
                        }
                    | reduce -f {sha: $acc.c file:0 ins:0 del:0} {|i,a|
                        let col = if ($i.col | str starts-with 'file') {
                                'file'
                            } else {
                                $i.col | str substring ',3'
                            }
                        let num = ($i.num | into int)
                        $a | upsert $col $num
                    }
                )
                $acc | upsert r ($acc.r | append $x)
            }
        }
        | get r
    }
}

export def _git_log [v num] {
    let stat = if $v {
        _git_stat $num
    } else { {} }
    let r = do -i {
        git log -n $num --pretty=%h»¦«%s»¦«%aN»¦«%aE»¦«%aD
        | lines
        | split column "»¦«" sha message author email date
        | each {|x| ($x| upsert date ($x.date | into datetime))}
    }
    if $v {
        $r | merge { $stat } | reverse
    } else {
        $r | reverse
    }
}

def "nu-complete git log" [] {
    git log -n 32 --pretty=%h»¦«%s
    | lines
    | split column "»¦«" value description
}

export def glg [
    commit?: string@"nu-complete git log"
    --verbose(-v):bool
    --num(-n):int=32
] {
    if ($commit|is-empty) {
        _git_log $verbose $num
    } else {
        git log --stat -p -n 1 $commit
    }
}

export def glgv [
    commit?: string@"nu-complete git log"
    --num(-n):int=32
] {
    if ($commit|is-empty) {
        _git_log true $num
    } else {
        git log --stat -p -n 1 $commit
    }
}

export def gpp! [] {
    git add --all
    git commit -v -a --no-edit --amend
    git push --force
}

export def gha [] {
    git log --pretty=%h»¦«%aN»¦«%s»¦«%aD
    | lines
    | split column "»¦«" sha1 committer desc merged_at
    | histogram committer merger
    | sort-by merger
    | reverse
}

export def gsq [] {
    git reflog expire --all --expire=now
    git gc --prune=now --aggressive
}

def "nu-complete git branches" [] {
  ^git branch | lines | each { |line| $line | str replace '[\*\+] ' '' | str trim }
}

def "nu-complete git remotes" [] {
  ^git remote | lines | each { |line| $line | str trim }
}

export def gm [branch:string@"nu-complete git branches"] {
    git merge $branch
}

extern "git reset" [
    sha?:string@"nu-complete git log"
    --hard:bool
]

export alias gp = git push
export alias gpf! = git push --force
export alias gl = git pull
export alias ga = git add
export alias gaa = git add --all
export alias gapa = git add --patch
export alias gau = git add --update
export alias gav = git add --verbose
export alias gap = git apply
export alias gapt = git apply --3way

export alias gb = git branch
export alias gba = git branch -a
export alias gbd = git branch -d
export alias gbda = 'git branch --no-color --merged | command grep -vE "^(\+|\*|\s*($(git_main_branch)|development|develop|devel|dev)\s*$)" | command xargs -n 1 git branch -d'
export alias gbD = git branch -D
export alias gbl = git blame -b -w
export alias gbnm = git branch --no-merged
export alias gbr = git branch --remote
export alias gbs = git bisect
export alias gbsb = git bisect bad
export alias gbsg = git bisect good
export alias gbsr = git bisect reset
export alias gbss = git bisect start

export alias gc = git commit -v
export alias gc! = git commit -v --amend
export alias gcn! = git commit -v --no-edit --amend
export alias gca = git commit -v -a
export alias gca! = git commit -v -a --amend
export alias gcan! = git commit -v -a --no-edit --amend
export alias gcans! = git commit -v -a -s --no-edit --amend
export alias gcam = git commit -a -m
export alias gcsm = git commit -s -m
export alias gcb = ^git checkout -b
export alias gcf = git config --list
export alias gcl = git clone --recurse-submodules
export alias gclean = git clean -id
# export alias gpristine = git reset --hard and git clean -dffx
export alias gcm = git checkout (git_main_branch)
export alias gcd = git checkout develop
export alias gcmsg = git commit -m
export alias gco = git checkout
export alias gcount = git shortlog -sn
export alias gcp = git cherry-pick
export alias gcpa = git cherry-pick --abort
export alias gcpc = git cherry-pick --continue
export alias gcs = git commit -S

export alias gd = git diff
export alias gdca = git diff --cached
export alias gdcw = git diff --cached --word-diff
export alias gdct = git describe --tags (git rev-list --tags --max-count=1)
export alias gds = git diff --staged
export alias gdt = git diff-tree --no-commit-id --name-only -r
export alias gdw = git diff --word-diff

export alias gr = git remote
export alias gra = git remote add
export alias grb = git rebase
export alias grba = git rebase --abort
export alias grbc = git rebase --continue
export alias grbd = git rebase develop
export alias grbi = git rebase -i
export alias grbm = git rebase (git_main_branch)
export alias grbo = git rebase --onto
export alias grbs = git rebase --skip
export alias grev = git revert
export alias grh = git reset
export alias grhh = git reset --hard
export alias groh = git reset origin/$(git_current_branch) --hard
export alias grm = git rm
export alias grmc = git rm --cached
export alias grmv = git remote rename
export alias grrm = git remote remove
export alias grs = git restore
export alias grset = git remote set-url
export alias grss = git restore --source
export alias grst = git restore --staged
export alias grt = cd "$(git rev-parse --show-toplevel or echo .)"
# export alias gru = git reset --
export alias grup = git remote update
export alias grv = git remote -v

export alias gsb = git status -sb
export alias gsd = git svn dcommit
export alias gsh = git show
export alias gsi = git submodule init
export alias gsps = git show --pretty=short --show-signature
export alias gsr = git svn rebase
export alias gss = git status -s
export alias gs = git status


export alias gstaa = git stash apply
export alias gstc = git stash clear
export alias gstd = git stash drop
export alias gstl = git stash list
export alias gstp = git stash pop
export alias gsts = git stash show --text
export alias gstu = gsta --include-untracked
export alias gstall = git stash --all
export alias gsu = git submodule update
export alias gsw = git switch
export alias gswc = git switch -c

export alias gts = git tag -s

export alias gunignore = git update-index --no-assume-unchanged
export alias gup = git pull --rebase
export alias gupv = git pull --rebase -v
export alias gupa = git pull --rebase --autostash
export alias gupav = git pull --rebase --autostash -v
export alias glum = git pull upstream (git_main_branch)

# cat ($nu.config-path | path dirname | path join 'scripts' | path join 'a.nu' )
