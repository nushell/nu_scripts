def agree [prompt] {
    let prompt = if ($prompt | str ends-with '!') {
        $'(ansi red)($prompt)(ansi reset) '
    } else {
        $'($prompt) '
    }
    (input $prompt | str downcase) in ['y', 'yes', 'ok', 't', 'true', '1']
}

# git status and stash
export def gs [
    --apply (-a):             bool
    --clear (-c):             bool
    --drop (-d):              bool
    --list (-l):              bool
    --pop (-p):               bool
    --show (-s):              bool
    --all (-A):               bool
    --include-untracked (-i): bool
] {
    if $apply {
        git stash apply
    } else if $clear {
        git stash clear
    } else if $drop {
        git stash drop
    } else if $list {
        git stash list
    } else if $pop {
        git stash pop
    } else if $show {
        git stash show --text
    } else if $all {
        let iu = if $include_untracked { [--include-untracked] } else { [] }
        git stash --all $iu
    } else {
        git status
    }
}

# git log
export def gl [
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

# git branch
export def gb [
    branch?:          string@"nu-complete git branches"
    --delete (-d):    bool
    --remote (-r):    bool
    --no-merged (-n): bool
] {
    let bs = (git branch | lines | each {|x| $x | str substring 2..})
    if ($branch | is-empty) {
        if $remote {
            git branch --remote
        } else if $no_merged {
            git branch --no-merged
        } else {
            git branch
        }
    } else if $branch in $bs {
        if $delete {
            if (agree 'branch will be delete!') {
                git branch -D $branch
            }
        } else {
            git checkout $branch
        }
    } else {
        if (agree 'create new branch?') {
            git checkout -b $branch
        }
    }
}

# git pull, push and switch
export def gp [
    branch?:             string@"nu-complete git branches"
    remote?:             string@"nu-complete git remotes"
    --force (-f):        bool     # git push -f
    --set-upstream (-u): bool     # git push -u
    --override:          bool
    --clone (-c):        string   # git clone
    --submodule (-s):    bool     # git submodule
    --init (-i):         bool     # git init
    --rebase (-r):       bool     # git pull --rebase
    --autostash (-a):    bool     # git pull --autostash
] {
    if not ($clone | is-empty) {
        let s = if $submodule { [--recurse-submodules] } else { [] }
        git clone $s $clone
    } else if $submodule {
        if $init {
            git submodule init
        } else {
            git submodule update
        }
    } else if $init {
        let repo = $branch
        git init $repo
    } else if $force {
        git push --force
    } else if $override {
        git pull
        git add --all
        git commit -v -a --no-edit --amend
        git push --force
    } else if not ($branch | is-empty) {
        let remote = if ($remote|is-empty) { 'origin' } else { $remote }
        if $set_upstream {
            git push -u $remote $branch
        } else {
            git fetch $remote $branch
        }
    } else {
        git fetch
        let s = (_git_status)
        if $s.behind > 0 {
            let r = if $rebase { [--rebase] } else { [] }
            let a = if $autostash { [--autostash] } else { [] }
            git pull $r $a -v
        } else if $s.ahead > 0 {
            git push
        }
    }
}

# git add, rm and restore
export def ga [
    file?:          path
    --all (-A):     bool
    --patch (-p):   bool
    --update (-u):  bool
    --verbose (-v): bool
    --delete (-d):  bool    # git rm
    --cached (-c):  bool
    --force (-f):   bool
    --restore (-r): bool    # git restore
    --staged (-s):  bool
    --source (-o):  string
] {
    if $delete {
        let c = if $cached { [--cached] } else { [] }
        let f = if $force { [--force] } else { [] }
        git rm $c $file
    } else if $restore {
        let o = if ($source | is-empty) { [] } else { [--source $source] }
        let s = if $staged { [--staged] } else { [] }
        git restore $o $s $file
    } else {
        let a = if $all { [--all] } else { [] }
        let p = if $patch { [--patch] } else { [] }
        let u = if $update { [--update] } else { [] }
        let v = if $verbose { [--verbose] } else { [] }
        let file = if ($file | is-empty) { [.] } else { [$file] }
        git add $a $p $u $v $file
    }

}

# git commit
export def gc [
    --message (-m): string
    --all (-A):     bool
    --amend (-a):   bool
    --keep (-k):    bool
] {
    let m = if ($message | is-empty) { [] } else { [-m $message] }
    let a = if $all { [--all] } else { [] }
    let n = if $amend { [--amend] } else { [] }
    let k = if $keep { [--no-edit] } else { [] }
    git commit -v $m $a $n $k
}

# git diff
export def gd [
    --cached (-c):    bool # cached
    --word-diff (-w): bool # word-diff
    --staged (-s):    bool # staged
] {
    let w = if $word_diff { [--word-diff] } else { [] }
    let c = if $cached { [--cached] } else { [] }
    let s = if $staged { [--staged] } else { [] }
    git diff $c $s $w
}

# git merge and rebase
export def gm [
    branch?:         string@"nu-complete git branches"
    --rebase (-r):   bool      # git rebase
    --onto (-o):     string
    --abort (-a):    bool
    --continue (-c): bool
    --skip (-s):     bool
    --quit (-q):     bool
] {
    if $rebase {
        if $abort {
            git rebase --abort
        } else if $continue {
            git rebase --continue
        } else if $skip {
            git rebase --skip
        } else if $quit {
            git rebase --quit
        } else if $onto {
            git rebase --onto $branch
        } else {
            if ($branch | is-empty) {
                git rebase (git_main_branch)
            } else {
                git rebase $branch
            }
        }
    } else if ($branch | is-empty) {
        git merge $"origin/(git_main_branch)"
    } else {
        git merge $branch
    }
}

# git cherry-pick
export def gcp [
    commit?:         string@"nu-complete git log"
    --abort (-a):    bool
    --continue (-c): bool
    --skip (-s):     bool
    --quit (-q):     bool
] {
    if $abort {
        git cherry-pick --abort
    } else if $continue {
        git cherry-pick --continue
    } else if $skip {
        git cherry-pick --skip
    } else if $quit {
        git cherry-pick --quit
    } else {
        git cherry-pick $commit
    }
}

# git reset
export def gr [
    commit?:         string@"nu-complete git log"
    --hard (-h):     bool
] {
    let h = if $hard { [--hard] } else { [] }
    let c = if ($commit | is-empty) { [] } else { [$commit] }
    git reset $h $c
}


# git remote
export def grmt [
    remote?:       string@"nu-complete git remotes"
    uri?:          string
    --add (-a):    bool
    --rename (-r): bool
    --delete (-d): bool
    --update (-u): bool
    --set (-s):    bool
] {
    if ($remote | is-empty) {
        git remote -v
    } else if $add {
        git remote add $remote $uri
    } else if $set {
        git remote set-url $remote $uri
    } else if $rename {
        let old = $remote
        let new = $uri
        git remote rename $old $new
    } else if $delete {
        git remote remove $remote
    } else if $update {
        git remote update $remote
    } else {
        git remote show $remote
    }
}

# git bisect
export def gbs [
    --bad (-b):   bool
    --good (-g):  bool
    --reset (-r): bool
    --start (-s): bool
] {
    if $good {
        git bisect good
    } else if $bad {
        git bisect bad
    } else if $reset {
        git bisect reset
    } else if $start {
        git bisect start
    } else {
        git bisect
    }
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

export def grb [branch:string@"nu-complete git branches"] {
    git rebase (gstat).branch $branch
}


export alias gcf = git config --list
export alias gsw = git switch
export alias gswc = git switch -c
export alias gts = git tag -s

export def _git_status [] {
    let raw_status = (do -i { git --no-optional-locks status --porcelain=2 --branch | lines })

    mut status = {
        idx_added_staged    : 0
        idx_modified_staged : 0
        idx_deleted_staged  : 0
        idx_renamed         : 0
        idx_type_changed    : 0
        wt_untracked        : 0
        wt_modified         : 0
        wt_deleted          : 0
        wt_type_changed     : 0
        wt_renamed          : 0
        ignored             : 0
        conflicts           : 0
        ahead               : 0
        behind              : 0
        stashes             : 0
        repo_name           : no_repository
        tag                 : no_tag
        branch              : no_branch
        remote              : ''
    }

    if ($raw_status | is-empty) { return $status }

    for s in $raw_status {
        let r = ($s | split row ' ')
        match $r.0 {
            '#' => {
                match ($r.1 | str substring 7..) {
                    'oid' => {
                        $status.commit_hash = ($r.2 | str substring 0..8)
                    }
                    'head' => {
                        $status.branch = $r.2
                    }
                    'upstream' => {
                        $status.remote = $r.2
                    }
                    'ab' => {
                        $status.ahead = ($r.2 | into int)
                        $status.behind = ($r.3 | into int | math abs)
                    }
                }
            }
            '1'|'2' => {
                match ($r.1 | str substring 0..1) {
                    'A' => {
                        $status.idx_added_staged += 1
                    }
                    'M' => {
                        $status.idx_modified_staged += 1
                    }
                    'R' => {
                        $status.idx_renamed += 1
                    }
                    'D' => {
                        $status.idx_deleted_staged += 1
                    }
                    'T' => {
                        $status.idx_type_changed += 1
                    }
                }
                match ($r.1 | str substring 1..2) {
                    'M' => {
                        $status.wt_modified += 1
                    }
                    'R' => {
                        $status.wt_renamed += 1
                    }
                    'D' => {
                        $status.wt_deleted += 1
                    }
                    'T' => {
                        $status.wt_type_changed += 1
                    }
                }
            }
            '?' => {
                $status.wt_untracked += 1
            }
            'u' => {
                $status.conflicts += 1
            }
        }
    }

    $status
}

export def _git_log_stat [n]  {
    do -i {
        git log -n $n --pretty=»¦«%h --stat
        | lines
        | reduce -f { c: '', r: [] } {|it, acc|
            if ($it | str starts-with '»¦«') {
                $acc | upsert c ($it | str substring 6.. )
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
                                $i.col | str substring ..3
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
        _git_log_stat $num
    } else { {} }
    let r = (do -i {
        git log -n $num --pretty=%h»¦«%s»¦«%aN»¦«%aE»¦«%aD
        | lines
        | split column "»¦«" sha message author email date
        | each {|x| ($x| upsert date ($x.date | into datetime))}
    })
    if $v {
        $r | merge $stat | reverse
    } else {
        $r | reverse
    }
}

def "nu-complete git log" [] {
    git log -n 32 --pretty=%h»¦«%s
    | lines
    | split column "»¦«" value description
    | each {|x| $x | update value $"($x.value)"}
}

export def "nu-complete git branches" [] {
    git branch
    | lines
    | filter {|x| not ($x | str starts-with '*')}
    | each {|x| $"($x|str trim)"}
}

def "nu-complete git remotes" [] {
  ^git remote | lines | each { |line| $line | str trim }
}

def git_main_branch [] {
    git remote show origin
    | lines
    | str trim
    | find --regex 'HEAD .*?[：: ].+'
    | first
    | str replace 'HEAD .*?[：: ](.+)' '$1'
}

def git_current_branch [] {
    (gstat).branch
}
