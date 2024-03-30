use argx

def agree [
    prompt
    --default-not (-n)
] {
    let prompt = if ($prompt | str ends-with '!') {
        $'(ansi red)($prompt)(ansi reset)'
    } else {
        $'($prompt)'
    }
    (if $default_not { [no yes] } else { [yes no] } | input list $prompt) == 'yes'
}

def tips [ msg ] {
    print -e $"(ansi light_gray)($msg)(ansi reset)"
}

def --wrapped with-flag [...flag] {
    if ($in | is-empty) { [] } else { [...$flag $in] }
}

# git status
export def gs [] {
    git status
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
        git stash
    }
}

# git log
export def gl [
    commit?: string@"nu-complete git log"
    --verbose(-v)
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
    branch?:                 string@"nu-complete git branches"
    --remote (-r)='origin':  string@"nu-complete git remotes"
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
    file?:          path
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
    if $delete {
        let c = if $cached {[--cached]} else {[]}
        let f = if $force {[--force]} else {[]}
        git rm ...$c ...$f -r $file
    } else if $restore {
        let o = $source | with-flag --source
        let s = if $staged {[--staged]} else {[]}
        let file = if ($file | is-empty) { [.] } else { [$file] }
        git restore ...$o ...$s ...$file
    } else {
        let a = if $all {[--all]} else {[]}
        let p = if $patch {[--patch]} else {[]}
        let u = if $update {[--update]} else {[]}
        let v = if $verbose {[--verbose]} else {[]}
        let f = if $force {[--force]} else {[]}
        let file = if ($file | is-empty) { [.] } else { [$file] }
        git add ...([$a $p $u $v $f $file] | flatten)
    }

}

# git commit
export def gc [
    message?:     string
    --all (-A)
    --amend (-a)
    --keep (-k)
] {
    let m = $message | with-flag -m
    let a = if $all {[--all]} else {[]}
    let n = if $amend {[--amend]} else {[]}
    let k = if $keep {[--no-edit]} else {[]}
    git commit -v ...$m ...$a ...$n ...$k
}

# git diff
export def gd [
    file?:            path
    --cached (-c)     # cached
    --word-diff (-w)  # word-diff
    --staged (-s)     # staged
] {
    let w = if $word_diff {[--word-diff]} else {[]}
    let c = if $cached {[--cached]} else {[]}
    let s = if $staged {[--staged]} else {[]}
    git diff ...$c ...$s ...$w ...($file | with-flag)
}

# git merge
export def gm [
    branch?:            string@"nu-complete git branches"
    --abort (-a)
    --continue (-c)
    --quit (-q)
    --no-squash (-n) # git merge (no)--squash
] {
    let x = if $no_squash { [] } else { [--squash] }
    if ($branch | is-empty) {
        git merge ...$x $"origin/(git_main_branch)"
    } else {
        git merge ...$x $branch
    }
    if not $no_squash {
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
    let h = if $hard {[--hard]} else {[]}
    let cm = $commit | with-flag
    git reset ...$h ...$cm
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

export def _git_status [] {
    # TODO: show-stash
    let raw_status = do -i { git --no-optional-locks status --porcelain=2 --branch | lines }

    let stashes = do -i { git stash list | lines | length }

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
        stashes             : $stashes
        repo_name           : no_repository
        tag                 : no_tag
        branch              : no_branch
        remote              : ''
    }

    if ($raw_status | is-empty) { return $status }

    for s in $raw_status {
        let r = $s | split row ' '
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
        git log --reverse -n $n --pretty=»¦«%h --stat
        | lines
        | reduce -f { c: '', r: [] } {|it, acc|
            if ($it | str starts-with '»¦«') {
                $acc | upsert c ($it | str substring 6.. )
            } else if ($it | find -r '[0-9]+ file.+change' | is-empty) {
                $acc
            } else {
                let x = $it
                    | split row ','
                    | each {|x| $x
                        | str trim
                        | parse -r "(?<num>[0-9]+) (?<col>.+)"
                        | get 0
                        }
                    | reduce -f {sha: $acc.c file:0 ins:0 del:0} {|i,a|
                        let col = if ($i.col | str starts-with 'file') {
                                'file'
                            } else {
                                $i.col | str substring ..3
                            }
                        let num = $i.num | into int
                        $a | upsert $col $num
                    }
                $acc | upsert r ($acc.r | append $x)
            }
        }
        | get r
    }
}

export def _git_log [verbose num] {
    let r = do -i {
        git log --reverse -n $num --pretty=%h»¦«%s»¦«%aN»¦«%aE»¦«%aD»¦«%D
        | lines
        | split column "»¦«" sha message author email date refs
        | each {|x|
            let refs = if ($x.refs | is-empty) {
                $x.refs
            } else {
                $x.refs | split row ", "
            }
            $x
            | update date { $x.date | into datetime }
            | update refs $refs
        }
    }
    if $verbose {
        $r | merge ( _git_log_stat $num )
    } else {
        $r
    }
}

def "nu-complete git log" [] {
    git log -n 32 --pretty=%h»¦«%s
    | lines
    | split column "»¦«" value description
    | each {|x| $x | update value $"($x.value)"}
}

def "nu-complete git log all" [] {
    git log --all -n 32 --pretty=%h»¦«%d»¦«%s
    | lines
    | split column "»¦«" value branch description
    | each {|x| $x | update description $"($x.branch) ($x.description)" }
}

def "nu-complete git branch files" [context: string, offset:int] {
    let token = $context | split row ' '
    let branch = $token | get 1
    let files = $token | skip 2
    git ls-tree -r --name-only $branch
    | lines
    | filter {|x| not ($x in $files)}
}

def "nu-complete git branches" [] {
    git branch
    | lines
    | filter {|x| not ($x | str starts-with '*')}
    | each {|x| $"($x|str trim)"}
}

export def remote_branches [] {
    git branch -r
    | lines
    | str trim
    | filter {|x| not ($x | str starts-with 'origin/HEAD') }
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
    | str replace --regex 'HEAD .*?[：: ](.+)' '$1'
}

