use complete.nu *
# git status
export def gs [] {
    git status
}

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
                        $status.commit_hash = ($r.2 | str substring 0..<8)
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
                match ($r.1 | str substring 0..<1) {
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
                match ($r.1 | str substring 1..<2) {
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
                                $i.col | str substring ..<3
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


export def remote_branches [] {
    git branch -r
    | lines
    | str trim
    | filter {|x| not ($x | str starts-with 'origin/HEAD') }
}

export def git_main_branch [] {
    git remote show origin
    | lines
    | str trim
    | find --regex 'HEAD .*?[：: ].+'
    | first
    | str replace --regex 'HEAD .*?[：: ](.+)' '$1'
}

