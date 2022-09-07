# must be in 'global' scope when `condition` is called
use venv_helpers.nu
use path_extensions.nu

def venv-module [] {
    'D:/Personal/Projects/nushell/nu_scripts/virtual_environments/auto-venv/venvs/python-venv.nu'
}

# 0.68 doesn't allow `let` at module level
def on_enter [] {'
    let _env = $env

    let virtual_env    = (path_extensions path find-sub $_env.PWD ".venv")
    let bin            = ([$virtual_env, "bin"] | path join)
    let virtual_prompt = ""

    overlay use D:\Personal\Projects\nushell\nu_scripts\virtual_environments\auto-venv\venvs\python-venv.nu

    # hooks dont self-trigger
    cd ($_env.PWD)

    activate-virtualenv $_env $virtual_env $bin $virtual_prompt

    hide _env
    hide virtual_env
    hide bin
    hide virtual_prompt
'}

def on_exit [] {'
    overlay hide python-venv --keep-env [PWD]
'}

export-env {
    let-env config = ($env.config | upsert hooks.env_change.PWD {
        [
            # activate on entry
            {
                condition: {|before, after| venv_helpers has-entered-venv $after}
                code: $'(on_enter)'
            }
    
            # re-activate on swap
            {
                condition: {|before, after| venv_helpers has-swapped-venv $after}
                code: $'
                    (on_exit)
                    (on_enter)
                '
    
            }
    
            # deactivate on exit
            {
                condition: { |before, after| venv_helpers has-exited-venv $after }
                code: $'
                    (on_exit)
                '
            }
        ]
    })
}

