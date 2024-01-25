# $env.PROMPT_INDICATOR = {|| "" }
#
# $env.PROMPT_COMMAND = {|| full-left-prompt }
# or
# $env.PROMPT_COMMAND = {|| left-prompt [
#     'user',
#     'dir',
#     'fast-git'
#     'duration',
# ]}
#
# Optional:
# $env.PROMPT_COMMAND_RIGHT = {|| "" }

export def full-left-prompt [] {
    (par-left-prompt [
        'user-host',
        'dir',
        'full-git'
        'duration',
        'wsl',
    ])
}

# Filter ----------------------------------------------------------------------

export def left-prompt [modules: list] {
    let ret = ($modules | each { |name| (exec-module $name)} | append $'(prompt-indicator)' | str join)
    $'(ansi reset)($ret)'
}

# Parallel run
export def par-left-prompt [modules: list] {
    let str_table = ($modules | par-each { |name|
        { name: $name, content: (exec-module $name) }
    })
    let ret = ($modules | each { |name| ($str_table | where name == $'($name)' | get content.0)} | append $'(prompt-indicator)' | str join)
    $'(ansi reset)($ret)'
}

def exec-module [name: string] {
    if $name == 'user-host' {
        (username-style true)
    } else if $name == 'user' {
        (username-style false)
    } else if $name == 'dir' {
        $'(current-dir-style) (read-only-style)'
    } else if $name == 'fast-git' {
        (fast-git-style)
    } else if $name == 'full-git' {
        (full-git-style)
    } else if $name == 'duration' {
        (duration-style)
    } else if $name == 'wsl' {
        (wsl-style)
    } else {
        ''
    }
}

# Styles ----------------------------------------------------------------------

def get-styles [] {
    {
        USER_STYLE: (ansi green),
        PATH_STYLE: (ansi light_blue),
        BRANCH_STYLE: (ansi dark_gray_bold),
        AHEAD_STYLE: $'(ansi green)(char branch_ahead)',
        BEHIND_STYLE: $'(ansi yellow_bold)(char branch_behind)',
        STAGE_STYLE: $'(ansi blue)S(ansi reset)',
        UNSTAGE_STYLE: $'(ansi dark_gray)U(ansi reset)',
        NEW_FILE_STYLE: $'(ansi green)N',
        ADD_FILE_STYLE: $'(ansi green)A',
        MODIFY_FILE_STYLE: $'(ansi yellow)M',
        DELETE_FILE_STYLE: $'(ansi red)D',
        CONFLICT_FILE_STYLE: $'(ansi light_purple_bold)C',
        DURATION_STYLE: (ansi yellow),
    }
}

def prompt-indicator [] {
    if ($env.LAST_EXIT_CODE | into int) == 0 {
        $"\r\n(ansi cyan)> "
    } else {
        $"\r\n(ansi red)x "
    }
}

def username-style [show_host: bool] {
    let s = get-styles
    let name = (get-username)
    if $show_host and (is-ssh-session) {
        $'($s.USER_STYLE)($name)(ansi dark_gray)@($s.USER_STYLE)(get-hostname)(ansi dark_gray):(ansi reset)'
    } else if (is-self-user $name) == false {
        $'($s.USER_STYLE)($name)(ansi dark_gray):(ansi reset)'
    } else {
        ''
    }
}

def wsl-style [] {
    if 'WSLENV' in $env {
        $'(ansi dark_gray)  WSL(ansi reset)'
    } else {
        ''
    }
}

# Get the current directory with home abbreviated
def current-dir-style [] {
    let s = get-styles
    let current_dir = ($env.PWD)

    let current_dir_abbreviated = if $current_dir == $nu.home-path {
        '~'
    } else {
        let current_dir_relative_to_home = (
            do --ignore-errors { $current_dir | path relative-to $nu.home-path } | str join
        )

        if ($current_dir_relative_to_home | is-empty) == false {
            $'~(char separator)($current_dir_relative_to_home)'
        } else {
            $current_dir
        }
    }

    if (is-admin) {
        $'(ansi red_bold)($current_dir_abbreviated)(ansi reset)'
    } else {
        $'($s.PATH_STYLE)($current_dir_abbreviated)(ansi reset)'
    }
}

def read-only-style [] {
    if (ls -Dl $env.PWD | get readonly.0) {
        $'[(ansi red_bold)ro(ansi reset)]'
    } else {
        ''
    }
}

def duration-style [] {
    let s = get-styles
    mut secs = ($env.CMD_DURATION_MS | into int) / 1000
    if $secs > 1 {
        mut ret = [$'[took ($s.DURATION_STYLE)']

        if $secs >= 3600 {
            $ret = ($ret | append $'($secs // 3600)h ($secs mod 3600 // 60)m ')
            $secs = $secs mod 60
        } else if $secs >= 60 {
            $ret = ($ret | append $'($secs // 60)m ')
            $secs = $secs mod 60
        }

        ($ret | append $'($secs | math round -p 1)s(ansi reset)]' | str join)
    } else {
        ''
    }
}

def fast-git-style [] {
    let s = get-styles
    let b_info = (do -p { git --no-optional-locks branch -v } | str trim)
    if ($b_info | is-empty) {
        ''
    } else {
        let info = ($b_info | parse -r '\* (?<name>(\([\S ]+\))|([\w\/\-\.]+)) +\w+ (\[((?<state>[^\]]+))+\])?')
        let state_list = ($info.state.0 | split row ', ' | each { |it|
            let p = ($it | parse "{s} {n}")
            if ($p | is-empty) {
                if ($it | str starts-with "gone") {
                    $' (ansi light_red)(char failed)'
                } else {
                    ''
                }
            } else if $p.s.0 == 'ahead' {
                $' ($s.AHEAD_STYLE)($p.n.0)(ansi reset)'
            } else if $p.s.0 == 'behind' {
                $' ($s.BEHIND_STYLE)($p.n.0)'
            } else {
                $' (ansi red)($p.s.0) ($p.n.0)'
            }
        })
        let state_str = ($state_list | str join)
        $'[($s.BRANCH_STYLE)($info.name.0)(ansi reset)($state_str)(ansi reset)]'
    }
}

def full-git-style [] {
    let s = get-styles
    let info_lines = (do -p { git --no-optional-locks status --porcelain=2 --branch } | str trim | lines)
    if ($info_lines | is-empty) {
        ''
    } else {
        # Scan lines
        let info = ($info_lines | reduce -f {
            out: [],
            staged: {a: 0, m: 0, d: 0},
            unstaged: {n: 0, m: 0, d: 0, c: 0},
            track: false,
            remote: false,
        } { |str, ctx|
            mut track = $ctx.track
            mut remote = $ctx.remote
            mut out = $ctx.out
            mut staged = $ctx.staged
            mut unstaged = $ctx.unstaged
            let l = ($str | split row -n 3 ' ')

            if $track == false {
                if $l.0 == '#' and $l.1 == 'branch.upstream' {
                    $track = true
                }
            }

            # Branch
            if $l.0 == '#' {
                if $l.1 == 'branch.oid' {
                    let id = ($l.2 | str substring 0..7)
                    $out = [$"($s.BRANCH_STYLE)\(HEAD detached at ($id)\)(ansi reset)"]
                } else if $l.1 == 'branch.head' {
                    if $l.2 != "\(detached\)" {
                        $out = ($out | update 0 $'($s.BRANCH_STYLE)($l.2)(ansi reset)')
                    }
                } else if $track {
                    if $l.1 == 'branch.ab' {
                        $remote = true
                        let state = ($l.2 | parse "+{an} -{bn}")
                        if $state.an.0 != '0' {
                            $out = ($out | append $' ($s.AHEAD_STYLE)($state.an.0)(ansi reset)')
                        }

                        if $state.bn.0 != '0' {
                            $out = ($out | append $' ($s.BEHIND_STYLE)($state.bn.0)')
                        }
                    }
                }
            }

            # Status
            if $l.0 == '?' {
                $unstaged = ($unstaged | update n ($unstaged.n + 1))
            } else if $l.0 == 'u' {
                $unstaged = ($unstaged | update c ($unstaged.c + 1))
            } else if $l.0 == '1' or $l.0 == '2' {
                let state_l = ($l.1 | split chars)
                $staged = (update-git-status $staged $state_l.0)
                $unstaged = (update-git-status $unstaged $state_l.1)
            }

            {
                out: $out,
                staged: $staged,
                unstaged: $unstaged,
                track: $track,
                remote: $remote,
            }
        })

        # Branch string
        mut out_list = if $info.track {
            if $info.remote == false {
                ($info.out | append $' (ansi light_red)(char failed)')
            } else if ($info.out | length) < 2 {
                ($info.out | append $' (ansi cyan)(char identical_to)')
            } else {
                $info.out
            }
        } else {
            $info.out
        }

        $out_list = ($out_list | append $'(ansi reset)')

        # Stage string
        mut stage_list = []
        if $info.staged.a > 0 {
            $stage_list = ($stage_list | append $' ($s.ADD_FILE_STYLE)($info.staged.a)(ansi reset)')
        }

        if $info.staged.m > 0 {
            $stage_list = ($stage_list | append $' ($s.MODIFY_FILE_STYLE)($info.staged.m)(ansi reset)')
        }

        if $info.staged.d > 0 {
            $stage_list = ($stage_list | append $' ($s.DELETE_FILE_STYLE)($info.staged.d)(ansi reset)')
        }

        # Unstage string
        mut unstage_list = []
        if $info.unstaged.c > 0 {
            $unstage_list = ($unstage_list | append $' ($s.CONFLICT_FILE_STYLE)($info.unstaged.c)(ansi reset)')
        }

        if $info.unstaged.n > 0 {
            $unstage_list = ($unstage_list | append $' ($s.NEW_FILE_STYLE)($info.unstaged.n)(ansi reset)')
        }

        if $info.unstaged.m > 0 {
            $unstage_list = ($unstage_list | append $' ($s.MODIFY_FILE_STYLE)($info.unstaged.m)(ansi reset)')
        }

        if $info.unstaged.d > 0 {
            $unstage_list = ($unstage_list | append $' ($s.DELETE_FILE_STYLE)($info.unstaged.d)(ansi reset)')
        }

        # Append list
        if ($stage_list | length) > 0 {
            $out_list = ($out_list | append $' | ($s.STAGE_STYLE):' | append $stage_list)
        }

        if ($unstage_list | length) > 0 {
            $out_list = ($out_list | append $' | ($s.UNSTAGE_STYLE):' | append $unstage_list)
        }

        $'[($out_list | str join)(ansi reset)]'
    }
}

def update-git-status [
    status: record
    m: string
] {
    if $m == 'A' {
        ($status | update a (($status.a | into int) + 1))
    } else if $m == 'M' {
        ($status | update m (($status.m | into int) + 1))
    } else if $m == 'D' {
        ($status | update d (($status.d | into int) + 1))
    } else {
        $status
    }
}

# Helper ----------------------------------------------------------------------

def get-username [] {
    if 'USERNAME' in $env {
        $env.USERNAME
    } else if 'USER' in $env {
        $env.USER
    } else {
        ''
    }
}

def is-self-user [name: string] {
    if 'LOGNAME' in $env {
        ($env.LOGNAME == $name)
    } else {
        true
    }
}

def get-hostname [] {
    if 'COMPUTERNAME' in $env {
        $env.COMPUTERNAME
    } else if 'HOSTNAME' in $env {
        $env.HOSTNAME
    } else {
        ''
    }
}

def is-ssh-session [] {
    if 'SSH_CONNECTION' in $env {
        true
    } else if 'SSH_CLIENT' in $env {
        true
    } else if 'SSH_TTY' in $env {
        true
    } else {
        false
    }
}
