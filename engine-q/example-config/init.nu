# ~/.config/nushell/init.nu
#
# Init module that exports commands and environment variables wanted at startup

# commands
export def build-config [] { { footer_mode: "50" } }

export def egd [...rest] {
    with-env [GIT_EXTERNAL_DIFF 'difftastic'] { git diff $rest }
}

# env
export env LS_COLORS {
    [
       "di=01;34;2;102;217;239"
       "or=00;40;31"
       "mi=00;40;31"
       "ln=00;36"
       "ex=00;32"
    ] | str collect ':'
}
export env BROWSER { "firefox" }
export env CARGO_TARGET_DIR { "~/.cargo/target" }
export env EDITOR { "nvim" }
export env VISUAL { "nvim" }
export env PAGER { "less" }
export env SHELL { "~/.cargo/bin/nu" }
export env JULIA_NUM_THREADS { (nproc) }
export env HOSTNAME { (hostname | split row '.' | first | str trim) }
export env SHOW_USR { "true" }

# prompt
export env PROMPT_COMMAND { "build-prompt" }
export def build-prompt [] {
    let usr-str = (if $nu.env.SHOW_USR == "true" {
        [
            $nu.env.USER
            '@'
            $nu.env.HOSTNAME
            ':'
        ] | str collect
    } else {
        ''
    })

    let pwd-str = (if (pwd | str starts-with $nu.env.HOME).0 {
        (pwd | str find-replace $nu.env.HOME '~' | str trim).0
    } else {
        pwd
    })

    [ $usr-str $pwd-str ' ' ] | str collect
}
