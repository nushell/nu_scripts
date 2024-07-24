
###
# An example auto-venv module.
# Copy this into `~/your/project/__auto-venv.nu` (or whatever you named your trigger file)

# adapted from https://github.com/pypa/virtualenv/blob/46f68d67c79f2280554f47f3c21265b3a1e899a4/src/virtualenv/activation/nushell/activate.nu

export def --env auto-venv-on-enter [
    _env: record,
] {

    def is-string [x] {
        ($x | describe) == 'string'
    }

    def has-env [name: string] {
        $name in ($_env)
    }

    let virtual_env    = (path_extensions path find-sub ($_env.PWD | into string) '.venv')
    let bin            = ([$virtual_env, "bin"] | path join)
    let virtual_prompt = ""

    let is_windows = $nu.os-info.name == 'windows'
    let path_name = if $is_windows {
        if (has-env 'Path') {
            'Path'
        } else {
            'PATH'
        }
    } else {
        'PATH'
    }

    let path_sep = (if $nu.os-info.name == "windows" {
        '\'
    }
    else {
        '/'
    })

    let old_path = (
        if $is_windows {
            if (has-env 'Path') {
                $_env.Path
            } else {
                $_env.PATH
            }
        } else {
            $_env.PATH
        } | if (is-string $in) {
            # if Path/PATH is a string, make it a list
            $in | split row $path_sep | path expand
        } else {
            $in
        }
    )

    let venv_path = ([$virtual_env $bin] | path join)
    # let new_path = ($old_path | prepend $venv_path | str join $path_sep)
    let new_path = ($old_path | prepend $venv_path)

    # Creating the new prompt for the session
    let virtual_prompt = if ($virtual_prompt == '') {
        $'(char lparen)($virtual_env | path split | drop 1 | path join | path basename)(char rparen) '
    } else {
        '(' + $virtual_prompt + ') '
    }

    let old_prompt_command = if (has-env 'PROMPT_COMMAND') {
        $_env.PROMPT_COMMAND
    } else {
        ''
    }

    # If there is no default prompt, then only the env is printed in the prompt
    let new_prompt = if (has-env 'PROMPT_COMMAND') {
        if (($old_prompt_command | describe) in ['block', 'closure']) {
            $'($virtual_prompt)(do $old_prompt_command)'
        } else {
            $'($virtual_prompt)($old_prompt_command)'
        }
    } else {
        $'($virtual_prompt)'
    }

    # Add current PWD to NU_LIB_DIRS so we can enter sub-directory without an error
    let new_lib_dirs = if not $env.PWD in $env.NU_LIB_DIRS {
        $env.NU_LIB_DIRS | prepend $env.PWD
    } else {
        $env.NU_LIB_DIRS
    }
    # Environment variables that will be batched loaded to the virtual env
    let new_env = {
        $path_name     : $new_path
        VIRTUAL_ENV    : $virtual_env
        PROMPT_COMMAND : $new_prompt
        VIRTUAL_PROMPT : $virtual_prompt
        NU_LIB_DIRS    : $new_lib_dirs
    }

    # Activate the environment variables
    load-env $new_env
}

export alias pydoc = python -m pydoc
export alias pip   = python -m pip
