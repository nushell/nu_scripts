# must source-env and 'use *' this file

# must be in 'global' scope when `condition` is called
export use venv_helpers.nu
export use path_extensions.nu


export-env {

    # this needs to be set somewhere
    # let-env AUTO_VENV_TRIGGER = '__auto-venv.nu'

    let hooks = (default-hooks)

    let hooks = ($hooks | append (build-hooks))

    let-env config = ($env.config | upsert hooks.env_change.PWD $hooks )
}


def default-hooks [] {
    (if ($env.config.hooks.env_change.PWD != $nothing) {
        [$env.config.hooks.env_change.PWD]
    }
    else {
        []
    })
}

def build-hooks [] {

    let trigger = $env.AUTO_VENV_TRIGGER

    let on_enter = '
        let _env = $env
        let pwd  = $_env.PWD

        let trigger = (path_extensions path find-sub . __trigger__ --type ["symlink", "file"])

        cd ($trigger | path dirname)
        overlay use __trigger__ as __auto_venv

        cd ($pwd)

        auto-venv-on-enter $_env

        hide _env
        hide pwd
        hide trigger
    '

    let on_exit = '
        overlay hide __auto_venv --keep-env [PWD]
    '

    let on_enter = ($on_enter | str replace -a '__trigger__' $trigger)

    let hook = [
        # activate on entry
        {
            condition: {|before, after| venv_helpers has-entered-venv $after }
            code: $'
                ($on_enter)
                '
        }

        # re-activate on swap
        {
            condition: {|before, after| venv_helpers has-swapped-venv $after }
            code: $'
                ($on_exit)
                ($on_enter)
            '
        }

        # deactivate on exit
        {
            condition: { |before, after| venv_helpers has-exited-venv $after }
            code: $'
                ($on_exit)
            '
        }
    ]

    $hook
}
