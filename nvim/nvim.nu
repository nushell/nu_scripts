## neovim configurations
# local vcs_root = require'taberm.vcs'.root
# function HookPwdChanged(after, before)
#     vim.b.pwd = after                         
#     local git_dir = vcs_root(after, nil)
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
            if 'NVIM' in (env).name {
                nvim --headless --noplugin --server $env.NVIM --remote-send $"<cmd>lua HookPwdChanged\('($after)', '($before)')<cr>"
            }
        }
    ]
}

export-env {
    let-env config = ( $env.config | upsert hooks.env_change.PWD { |config|
        let o = ($config | get -i hooks.env_change.PWD)
        let val = (nvim_tcd)
        if $o == $nothing {
            $val
        } else {
            $o | append $val
        }
    })
}

def edit [action file] {
    if 'NVIM' in (env).name {
        let af = ($file | each {|f|
            if ($f|str substring ',1') in ['/', '~'] {
                $f
            } else {
                $"($env.PWD)/($f)"
            }
        })
        let cmd = $"<cmd>($action) ($af|str join ' ')<cr>"
        nvim --headless --noplugin --server $env.NVIM --remote-send $cmd
    } else {
        nvim $file
    }
}

export def tcd [path?: string] {
    let after = if ($path|is-empty) {
        $env.PWD
    } else {
        $path
    }
    nvim --headless --noplugin --server $env.NVIM --remote-send $"<cmd>lua HookPwdChanged\('($after)', '($env.PWD)')<cr>"
}

export def e [...file: string] {
    if ($file|is-empty) {
        nvim
    } else {
        edit vsplit $file
    }
}

export def c [...file: string] {
    if ($file|is-empty) {
        nvim
    } else {
        edit split $file
    }
}

export def v [...file: string] {
    if ($file|is-empty) {
        nvim
    } else {
        edit vsplit $file
    }
}

export def x [...file: string] {
    if ($file|is-empty) {
        nvim
    } else {
        edit tabnew $file
    }
}

export def drop [] {
    if 'NVIM' in (env).name {
        let c = $in
        let temp = (mktemp -t nuvim.XXXXXXXX|str trim)
        $c | save -f $temp
        nvim --headless --noplugin --server $env.NVIM --remote-send $"<cmd>lua ReadTempDrop\('($temp)')<cr>"
    } else {
        echo $in
    }
}

export def nvim_lua [...expr: string] {
    if 'NVIM' in (env).name {
        nvim --headless --noplugin --server $env.NVIM --remote-send $'<cmd>lua vim.g.remote_expr_lua = ($expr|str join " ")<cr>'
        do -i { nvim --headless --noplugin --server $env.NVIM --remote-expr 'g:remote_expr_lua' } | complete | get stderr
    } else {
        echo "not found nvim instance"
    }
}

export def opwd [] {
    nvim_lua 'OppositePwd()'
}
