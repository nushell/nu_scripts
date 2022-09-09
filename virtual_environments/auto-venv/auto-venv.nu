# source-env this file

# must be in 'global' scope when `condition` is called
use venv_helpers.nu
use path_extensions.nu

use ./venvs/python-venv.nu [pre-enter, activate]

# this needs to be set somewhere
# let-env AUTO_VENV_MODULES_DIR = 'D:\Personal\Projects\nushell\nu_scripts\virtual_environments\auto-venv\venvs'

def build-python-venv [] {

    let trigger_folder = '.venv'

    let result = (venv_helpers build-hooks
        $trigger_folder
        'python-venv'
        (pre-enter $trigger_folder)
        (activate)
    )

    print ($result | describe)

    $result
}

# def build-some-other-venv [] {

#     let trigger_folder = '.some-other-venv'

#     (venv_helpers build-hooks
#         $trigger_folder
#         'some-other-venv-module'
#         (some-other-venv-module pre_enter)
#         (some-other-venv-module activate)
#     )
# }

def default-hooks [] {
    (if ($env.config.hooks.env_change.PWD != $nothing) {
        $env.config.hooks.env_change.PWD
    }
    else {
        []
    })
}

export-env {

    let hooks = default-hooks

    let hooks = ($hooks | append (build-python-venv))
    # let hooks = ($hooks | append (build-some-other-venv))

    let-env config = ($env.config | upsert hooks.env_change.PWD $hooks )
}

