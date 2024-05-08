# ~/.config/nushell/init.nu
#
# Init module that exports commands and environment variables wanted at startup

# commands
export def egd [...rest] {
    with-env [GIT_EXTERNAL_DIFF 'difft'] { git diff $rest }
}

# we need to export the env we create with load-env
# because we are `use`-ing here and not `source`-ing this file
export-env {
    load-env {
        BROWSER: "firefox"
        CARGO_TARGET_DIR: "~/.cargo/target"
        EDITOR: "nvim"
        VISUAL: "nvim"
        PAGER: "less"
        SHELL: "~/.cargo/bin/nu"
        JULIA_NUM_THREADS:  nproc
        HOSTNAME:  (hostname | split row '.' | first | str trim)
        SHOW_USER: true
        LS_COLORS: ([
             "di=01;34;2;102;217;239"
             "or=00;40;31"
             "mi=00;40;31"
             "ln=00;36"
             "ex=00;32"
        ] | str join (char env_sep))
    }
}

# prompt
PROMPT_COMMAND: { build-prompt }

export def build-prompt [] {
    let usr_str = (if $env.SHOW_USER {
        [
            $env.USER
            '@'
            $env.HOSTNAME
            ':'
        ] | str join
    } else {
        ''
    })

    let pwd_str = (if (pwd | str starts-with $env.HOME) {
        (pwd | str replace $env.HOME '~' | str trim)
    } else {
        pwd
    })

    [ $usr_str $pwd_str ' ' ] | str join
}
