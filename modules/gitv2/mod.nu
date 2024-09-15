use argx
use utils.nu *
use complete.nu *
export use stat.nu *

def sum_prefix [p] {
    $in | items {|k,v| if ($k | str starts-with $p) { $v } else { 0 } } | math sum
}

# git stash
export def gst [
    --apply (-a)
    --clear (-c)
    --drop (-d)
    --list (-l)
    --pop (-p)
    --show (-s)
    --all (-A)
    --include-untracked (-i)
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
        git stash --all ...(if $include_untracked {[--include-untracked]} else {[]})
    } else {
        let s = (_git_status)
        if ($s | sum_prefix 'wt_') > 0 {
            git stash
        } else {
            git stash pop
        }
    }
}

# git branch
export def gb [
    branch?:                 string@"nu-complete git branches"
    --remote (-r)='origin':  string@"nu-complete git remotes"
    --delete (-d)
    --no-merged (-n)
] {
    let bs = git branch | lines | each {|x| $x | str substring 2..}
    if $delete {
        let remote_branches = (remote_branches)
        if ($branch | is-empty) {
            let dels = if $no_merged { gb } else {
                 gb
                | where { $in.merged | is-not-empty }
            }
            | where { ($in.remote | is-empty) and ($in.current | is-empty) }
            | each {|x|
                let pf = if ($x.current | is-empty) { "  " } else { $"(ansi cyan)* " }
                let nm = if ($x.merged | is-not-empty ) { $"(ansi green)☑ " } else { "  " }
                $x | insert display $"($nm)($pf)(ansi reset)($x.branch)"
            }
            if ($dels | is-empty) {
                tips "no branches to delete"
                return
            }
            let $dels = $dels
            | input list -d display --multi
            | get branch
            for b in $dels {
                tips $"delete (ansi yellow)($b)"
                git branch -D $b
            }
            if ($dels | is-not-empty) and (agree 'delete remote branch?!') {
                for b in ($dels | filter { $"($remote)/($in)" in $remote_branches }) {
                    tips $"delete (ansi yellow)($remote)/($b)"
                    git branch -D -r $'($remote)/($b)'
                    git push $remote -d $b
                }
            }
        } else {
            if $branch in $bs and (agree 'branch will be delete!') {
                    git branch -D $branch
            }
            if $"($remote)/($branch)" in $remote_branches and (agree 'delete remote branch?!') {
                git branch -D -r $'($remote)/($branch)'
                git push $remote -d $branch
            }
        }
    } else if ($branch | is-empty) {
        let merged = git branch --merged
        | lines
        | each { $in | parse -r '\s*\*?\s*(?<b>[^\s]+)' | get 0.b }
        {
            local: (git branch)
            remote: (git branch --remote)
        }
        | transpose k v
        | each {|x|
            $x.v | lines
            | each {|n|
                let n = $n | parse -r '\s*(?<c>\*)?\s*(?<b>[^\s]+)( -> )?(?<r>[^\s]+)?' | get 0
                let c = if ($n.c | is-empty) { null } else { true }
                let r = if ($n.r | is-empty) { null } else { $n.r }
                let m = if $n.b in $merged { true } else { null }
                let rm = if $x.k == 'remote' { true } else { null }
                { current: $c, remote: $rm, branch: $n.b, ref: $r, merged: $m }
            }
        }
        | flatten
    } else if $branch in $bs {
        git checkout $branch
    } else {
        if (agree 'create new branch?') {
            git checkout -b $branch
        }
    }
}

# git clone, init
export def --env gn [
    repo?:            string@"nu-complete git branches"
    local?:           path
    --submodule (-s)  # git submodule
    --init (-i)       # git init
] {
     if $init {
        if ($repo | is-empty) {
            git init --initial-branch main
        } else {
            git init $repo --initial-branch main
            cd $repo
        }
        if $submodule {
            git submodule init
        }
    } else {
        let local = if ($local | is-empty) {
            $repo | path basename | split row '.' | get 0
        } else {
            $local
        }
        git clone ...(if $submodule {[--recurse-submodules]} else {[]}) $repo $local
        cd $local
    }
}

# edit .gitignore
export def gig [--empty-dir] {
    if $empty_dir {
        [
            '# Ignore everything in this directory'
            '*'
            '# Except this file'
            '!.gitignore'
        ] | str join (char newline) | save .gitignore
    } else {
        ^$env.EDITOR $"(git rev-parse --show-toplevel)/.gitignore"
    }
}

# git pull, push and switch
export def gp [
    branch?:                 string@"nu-complete git branches" # branch
    --remote (-r)='origin':  string@"nu-complete git remotes"  # remote
    --rebase
    --force (-f)             # git push -f
    --override
    --submodule (-s)         # git submodule
    --init (-i)              # git init
    --merge (-m)             # git pull (no)--rebase
    --autostash (-a)         # git pull --autostash
    --back-to-prev (-b)      # back to branch
] {
    if $submodule {
        git submodule update
    } else if $rebase {
        git pull --rebase
    } else if $override {
        git pull --rebase
        git add --all
        git commit -v -a --no-edit --amend
        git push --force
    } else {
        let m = if $merge { [] } else { [--rebase] }
        let a = if $autostash {[--autostash]} else {[]}
        let prev = (_git_status).branch
        let branch = if ($branch | is-empty) { $prev } else { $branch }
        let branch_repr = $'(ansi yellow)($branch)(ansi light_gray)'
        let lbs = git branch | lines | each { $in | str substring 2..}
        let rbs = (remote_branches)
        if $"($remote)/($branch)" in $rbs {
            if $branch in $lbs {
                let bmsg = $'both local and remote have ($branch_repr) branch'
                if $force {
                    tips $'($bmsg), with `--force`, push'
                    git branch -u $'($remote)/($branch)' $branch
                    git push --force
                } else {
                    tips $'($bmsg), pull'
                    if $prev != $branch {
                        tips $'switch to ($branch_repr)'
                        git checkout $branch
                    }
                    git pull ...$m ...$a
                }
            } else {
                tips $"local doesn't have ($branch_repr) branch, fetch"
                git checkout -b $branch
                git fetch $remote $branch
                git branch -u $'($remote)/($branch)' $branch
                git pull ...$m ...$a -v
            }
        } else {
            let bmsg = $"remote doesn't have ($branch_repr) branch"
            let force = if $force {[--force]} else {[]}
            if $branch in $lbs {
                tips $'($bmsg), set upstream and push'
                git checkout $branch
            } else {
                tips $'($bmsg), create and push'
                git checkout -b $branch
            }
            git push ...$force --set-upstream $remote $branch
        }

        if $back_to_prev {
            git checkout $prev
        }

        let s = (_git_status)
        if $s.ahead > 0 {
            tips 'remote is behind, push'
            git push
        }
    }
}

# git add, rm and restore
export def ga [
    ...file:          path
    --all (-A)
    --patch (-p)
    --update (-u)
    --verbose (-v)
    --delete (-d)   # git rm
    --cached (-c)
    --force (-f)
    --restore (-r)  # git restore
    --staged (-s)
    --source (-o):  string
] {
    mut args = []
    if $delete {
        if $cached { $args ++= [--cached] }
        if $force { $args ++= [--force] }
        git rm ...$args -r ...$file
    } else if $restore {
        $args ++= ($source | with-flag --source)
        if $staged { $args ++= [--staged]}
        $args ++= if ($file | is-empty) { [.] } else { $file }
        git restore ...$args
    } else {
        if $all { $args ++= [--all] }
        if $patch { $args ++= [--patch] }
        if $update { $args ++= [--update] }
        if $verbose { $args ++= [--verbose] }
        if $force { $args ++= [--force] }
        $args ++= if ($file | is-empty) { [.] } else { $file }
        git add ...$args
    }

}

# git commit
export def gc [
    message?:     string
    --all (-A)
    --amend (-a)
    --keep (-k)
] {
    mut args = []
    $args ++= ($message | with-flag -m)
    if $all { $args ++= [--all] }
    if $amend { $args ++= [--amend] }
    if $keep { $args ++= [--no-edit] }
    git commit -v ...$args
}



# git diff
export def gd [
    ...file:            path
    --cached (-c)     # cached
    --unstashed (-u)  # unstashed
    --word-diff (-w)  # word-diff
    --staged (-s)     # staged
] {
    mut args = []
    if $word_diff { $args ++= [--word-diff] }
    if $cached { $args ++= [--cached] }
    if $staged { $args ++= [--staged] }
    if ($args | is-empty) {
        let s = (_git_status)
        if ($s | sum_prefix 'wt_') > 0 {
            git diff ...$file
        } else if ($s | sum_prefix 'idx_') > 0 {
            git diff ...$file --staged
        }
    } else {
        git diff ...$args ...$file
    }
}

# git merge
export def gm [
    branch?:            string@"nu-complete git branches"
    --abort (-a)
    --continue (-c)
    --quit (-q)
    --squash (-s)
    --fast-farward (-f)
] {
    mut args = []
    if $squash { $args ++= [--squash] }
    if $fast_farward { $args ++= [--ff] } else { $args ++= [--no-ff] }
    if ($branch | is-empty) {
        git merge ...$args $"origin/(git_main_branch)"
    } else {
        git merge ...$args $branch
    }
    if $squash {
        git commit -v
    }
}

# git rebase
# TODO: --onto: (commit_id)
export def gr [
    branch?:            string@"nu-complete git branches"
    --interactive (-i)
    --onto (-o):        string
    --abort (-a)
    --continue (-c)
    --skip (-s)
    --quit (-q)
] {
    if $abort {
        git rebase --abort
    } else if $continue {
        git rebase --continue
    } else if $skip {
        git rebase --skip
    } else if $quit {
        git rebase --quit
    } else if ($onto | is-not-empty) {
        git rebase --onto $branch
    } else {
        let i = if $interactive {[--interactive]} else {[]}
        if ($branch | is-empty) {
            git rebase ...$i (git_main_branch)
        } else {
            git rebase ...$i $branch
        }
    }
}

# git cherry-pick
export def gcp [
    commit?:         string@"nu-complete git log all"
    --abort (-a)
    --continue (-c)
    --skip (-s)
    --quit (-q)
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

# copy file from other branch
export def gcf [
    branch:     string@"nu-complete git branches"
    ...file:       string@"nu-complete git branch files"
] {
    ^git checkout $branch $file
}

# git reset
export def grs [
    commit?:      string@"nu-complete git log"
    --hard (-h)
    --clean (-c)
] {
    mut args = []
    if $hard { $args ++= [--hard] }
    if ($commit | is-not-empty) { $args ++= $commit }
    git reset ...$args
    if $clean {
        git clean -fd
    }
}


# git remote
export def grm [
    remote?:       string@"nu-complete git remotes"
    uri?:          string
    --add (-a)
    --rename (-r)
    --delete (-d)
    --update (-u)
    --set (-s)
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
    --bad (-b)
    --good (-g)
    --reset (-r)
    --start (-s)
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

export def ggc [] {
    git reflog expire --all --expire=now
    git gc --prune=now --aggressive
}

export alias gcl = git config --list
export alias gsw = git switch
export alias gswc = git switch -c
export alias gts = git tag -s


