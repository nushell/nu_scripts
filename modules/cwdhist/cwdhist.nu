def __cwdhist_menu [] {
    {
        name: cwdhist_menu
        only_buffer_difference: true
        marker: "| "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            #$"[($position)]($buffer);(char newline)" | save -a ~/.cache/cwdhist.log
            let t = ($buffer | split row ' ' | last)
            if $env.cwd_history_full {
                open $nu.history-path | query db $"
                    select cwd as value, count\(*) as cnt
                    from history
                    where cwd like '%($t)%'
                    group by cwd
                    order by cnt desc
                    limit 50
                    ;"
            } else {
                open $env.cwd_history_file | query db $"
                    select cwd as value, count
                    from cwd_history
                    where cwd like '%($t)%'
                    order by count desc
                    limit 50
                    ;"
            }
        }
    }
}

def __cwdhist_keybinding [] {
    {
        name: cwdhist_menu
        modifier: alt
        keycode: char_o
        mode: [emacs, vi_normal, vi_insert]
        event: [
            { send: menu name: cwdhist_menu }
        ]
    }
}

def __cwdhist_switching [] {
    {
        name: cwdhist_switching
        modifier: shift_alt
        keycode: char_o
        mode: [emacs, vi_normal, vi_insert]
        event: [
            { send: ExecuteHostCommand, cmd: '$env.cwd_history_full = (not $env.cwd_history_full)' }
        ]
    }
}

export def empty-sqlite [] {
    # sqlite3 empty.db "VACUUM;"; cat empty.db | gzip | encode base64
    'H4sIAAAAAAAAAwsO9MksSVVIyy/KTSxRMGYQYGBkZHBQUGBgYGCEYhhAZhMLGBn0ihbwglgCZOgeBaNgFIyCUTAKRsEoGAWjYBSMglEwCkYBVQAANHgbMAAQAAA='
    | decode base64 --binary | gzip -d
}

export def 'cwd history delete' [cwd] {
    open $env.cwd_history_file
    | query db $"delete from cwd_history where cwd = '($cwd)';"
}

export-env {
    $env.cwd_history_full = false
    $env.cwd_history_file = '~/.cache/nu_cwd_history.sqlite'

    if not ($env.cwd_history_file | path exists) {
        empty-sqlite | save -f $env.cwd_history_file
        open $env.cwd_history_file | query db "create table if not exists cwd_history (
            cwd text primary key,
            count int default 1,
            recent datetime default (datetime('now', 'localtime'))
        );"
    }

    let __cwdhist_hook = {|_, dir|
        if $dir == $nu.home-path { return }
        let suffix = (do --ignore-errors { $dir | path relative-to  $nu.home-path })
        let path = if ($suffix | is-empty) {
            $dir
        } else {
            ['~', $suffix] | path join
        }
        open $env.cwd_history_file
        | query db $"
            insert into cwd_history\(cwd)
                values \('($path)')
            on conflict\(cwd)
            do update set
                count = count + 1,
                recent = datetime\('now', 'localtime');"
    }

    $env.config = ($env.config
                  | update hooks.env_change.PWD ($env.config.hooks.env_change.PWD | append $__cwdhist_hook ))

    $env.config = ($env.config
                  | upsert menus ($env.config.menus | append (__cwdhist_menu))
                  | upsert keybindings ($env.config.keybindings | append [(__cwdhist_keybinding) (__cwdhist_switching)])
                  )
}
