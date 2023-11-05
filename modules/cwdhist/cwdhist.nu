def __cwdhist_menu [] {
    {
        name: cwdhist_menu
        only_buffer_difference: false
        marker: "| "
        type: {
            layout: columnar
            page_size: 20
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            let cwd = if ($buffer | is-empty) {
                ""
            } else {
                $buffer
            }
            if 'cwd_history_full' in $env {
                open $nu.history-path | query db $"
                    select cwd as value, count\(*) as description
                    from history
                    where cwd like '%($cwd)%'
                    group by cwd
                    order by description desc
                    limit 20
                    ;"
            } else {
                open $env.cwd_history_file | query db $"
                    select cwd as value, count as description
                    from cwd_history
                    where cwd like '%($cwd)%'
                    order by count desc
                    limit 20
                    ;"
            }
        }
    }
}

def __cwdhist_keybinding [] {
    {
        name: cwdhist_menu
        modifier: control
        keycode: char_o
        mode: [emacs, vi_normal, vi_insert]
        event: [
            { send: menu name: cwdhist_menu }
        ]
    }
}

def __edit_keybinding [] {
    {
        name: edit
        modifier: alt
        keycode: char_e
        mode: [emacs, vi_normal, vi_insert]
        event: [
            { send: OpenEditor }
        ]
    }
}


export-env {
    $env.cwd_history_file = '~/.cache/nu_cwd_history.sqlite'

    if not ($env.cwd_history_file | path exists) {
        "create table if not exists cwd_history (
          cwd text primary key,
          count int default 1,
          recent datetime default (datetime('now', 'localtime'))
        );
        insert into cwd_history(cwd, count) values ('.', 0)
        on conflict (cwd) do update set count = 0;"
        | sqlite3 ~/.cache/nu_cwd_history.sqlite
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
                  | upsert keybindings ($env.config.keybindings | append [(__cwdhist_keybinding) (__edit_keybinding)])
                  )
}
