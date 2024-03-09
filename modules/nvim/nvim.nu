## neovim configurations
# local vcs_root = require('lspconfig.util').root_pattern('.git/')
# function HookPwdChanged(after, before)
#     vim.b.pwd = after
#     local git_dir = vcs_root(after)
#     vim.api.nvim_command('silent tcd! '..(git_dir or after))
# end

# function OppositePwd()
#     local tab = vim.api.nvim_get_current_tabpage()
#     local wins = vim.api.nvim_tabpage_list_wins(tab)
#     local cwin = vim.api.nvim_tabpage_get_win(tab)
#     for _, w in ipairs(wins) do
#         if cwin ~= w then
#             local b = vim.api.nvim_win_get_buf(w)
#             local pwd = vim.b[b].pwd
#             if pwd then return pwd end
#         end
#     end
# end

# function ReadTempDrop(path, action)
#     vim.api.nvim_command(action or 'botright vnew')
#     local win = vim.api.nvim_get_current_win()
#     local buf = vim.api.nvim_create_buf(true, true)
#     vim.api.nvim_win_set_buf(win, buf)
#     vim.api.nvim_command('read '..path)
#     vim.fn.delete(path)
# end


def nvim_tcd [] {
    [
        {|before, after|
            if ($env.NVIM? | is-not-empty) {
                nvim --headless --noplugin --server $env.NVIM --remote-send $"<cmd>lua HookPwdChanged\('($after)', '($before)')<cr>"
            }
        }
    ]
}

# nvim tcd
export def tcd [path?: string] {
    let after = if ($path | is-empty) {
        $env.PWD
    } else {
        $path
    }
    nvim --headless --noplugin --server $env.NVIM --remote-send $"<cmd>lua HookPwdChanged\('($after)', '($env.PWD)')<cr>"
}

export-env {
    $env.config = ( $env.config | upsert hooks.env_change.PWD { |config|
        let o = ($config | get -i hooks.env_change.PWD)
        let val = (nvim_tcd)
        if $o == null {
            $val
        } else {
            $o | append $val
        }
    })
}

# drop stdout to nvim buf
export def drop [] {
    if ($env.NVIM? | is-empty) {
        echo $in
    } else {
        let c = $in
        let temp = (mktemp -t nuvim.XXXXXXXX|str trim)
        $c | save -f $temp
        nvim --headless --noplugin --server $env.NVIM --remote-send $"<cmd>lua ReadTempDrop\('($temp)')<cr>"
    }
}

export def nvim-lua [...expr: string] {
    if ($env.NVIM? | is-empty) {
        echo "not found nvim instance"
    } else {
        nvim --headless --noplugin --server $env.NVIM --remote-send $'<cmd>lua vim.g.remote_expr_lua = ($expr|str join " ")<cr>'
        do -i { nvim --headless --noplugin --server $env.NVIM --remote-expr 'g:remote_expr_lua' } | complete | get stderr
    }
}

export def opwd [] {
    nvim-lua 'OppositePwd()'
}

export def nve [action ...file] {
    if ($env.NVIM? | is-empty) {
        nvim ...$file
    } else {
        let af = $file
        | each {|f|
            if ($f|str substring ..1) in ['/', '~'] {
                $f
            } else {
                $"($env.PWD)/($f)"
            }
        }
        let action = if ($file | is-empty) { $action | str replace -r 'sp.*$' 'new' } else { $action }
        let cmd = $"<cmd>($action) ($af|str join ' ')<cr>"
        nvim --headless --noplugin --server $env.NVIM --remote-send $cmd
    }
}

export alias e = nve vsplit
export alias v = nve vsplit
export alias c = nve split
export alias x = nve tabnew

export def nvs [port: int=9999] {
    nvim --headless --listen $"0.0.0.0:($port)"
}

export def nvc [
    addr: string
    --gui(-g)
] {
    if $gui {
        let gs = {
            neovide: [--maximized --server $addr]
        }
        for g in ($gs | transpose prog args) {
            if (which $g.prog | is-not-empty) {
                ^$g.prog ...$g.args
                break
            }
        }
    } else {
        nvim --remote-ui --server $addr
    }
}
