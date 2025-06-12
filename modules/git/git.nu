export def _git_stat [n]  {
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
        _git_stat $num
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

def "nu-complete git branches" [] {
    git branch
    | lines
    | where {|x| not ($x | str starts-with '*')}
    | each {|x| $"($x|str trim)"}
}

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

export def glv [
    commit?: string@"nu-complete git log"
    --num(-n):int=32
] {
    if ($commit|is-empty) {
        _git_log true $num
    } else {
        git log --stat -p -n 1 $commit
    }
}

export def gco [branch: string@"nu-complete git branches"] {
    git checkout $branch
}

export def gbD [branch: string@"nu-complete git branches"] {
    git branch -D $branch
}

export def gpp! [] {
    git pull
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

def "nu-complete git remotes" [] {
  ^git remote | lines | each { |line| $line | str trim }
}

export def gr [remote?: string@"nu-complete git remotes"] {
    let remote = if ($remote|is-empty) { 'origin' } else { $remote }
    git remote show $remote
}

export def grh [commit: string@"nu-complete git log"] {
    git reset $commit
}

export def gf [
    branch: string@"nu-complete git branches"
    remote?: string@"nu-complete git remotes"
] {
    let remote = if ($remote|is-empty) { 'origin' } else { $remote }
    git fetch $remote $branch
}

export def gm [branch:string@"nu-complete git branches"] {
    git merge $branch
}

export def grb [branch:string@"nu-complete git branches"] {
    git rebase (gstat).branch $branch
}
