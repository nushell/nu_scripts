### git
def _git_status [] {
    # TODO: show-stash
    let raw_status = (do -i { git --no-optional-locks status --porcelain=2 --branch | lines })

    let stashes = (do -i { git stash list | lines | length })

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

export def git_stat [] {
    {|bg|
        let status = (_git_status)

        if $status.branch == 'no_branch' { return [$bg ''] }

        let theme = $env.NU_POWER_THEME.git
        let branch = if ($status.remote | is-empty) {
            $'($theme.no_upstream)($status.branch)'
        } else {
            $'($theme.default)($status.branch)'
        }

        let summary = (
            $env.NU_PROMPT_GIT_FORMATTER
            | reduce -f "" {|x, acc|
                let y = ($status | get $x.0)
                if $y > 0 {
                    $acc + $"(ansi $'light_($x.2)_dimmed')($x.1)($y)"
                } else {
                    $acc
                }
            })

        [$bg $'($branch)($summary)']
    }
}

export-env {
    $env.NU_PROMPT_GIT_FORMATTER = (power default_env
        NU_PROMPT_GIT_FORMATTER
        [
            [behind              (char branch_behind) yellow]
            [ahead               (char branch_ahead) yellow]
            [conflicts           ! red]
            [ignored             _ purple]
            [idx_added_staged    + green]
            [idx_modified_staged ~ green]
            [idx_deleted_staged  - green]
            [idx_renamed         % green]
            [idx_type_changed    * green]
            [wt_untracked        + red]
            [wt_modified         ~ red]
            [wt_deleted          - red]
            [wt_renamed          % red]
            [wt_type_changed     * red]
            [stashes             = blue]
        ]
    )

    power register git (git_stat) {
        default : blue
        no_upstream: red
    }
}
