# pretty much copied straight from https://github.com/pypa/virtualenv/blob/46f68d67c79f2280554f47f3c21265b3a1e899a4/src/virtualenv/activation/nushell/activate.nu

# This command prepares the required environment variables
export def-env activate-virtualenv [
    virtual_env:    string,
    bin:            string,
    path_sep:       string,
    virtual_prompt: string,

] {
    def is-string [x] {
        ($x | describe) == 'string'
    }

    def has-env [name: string] {
        $name in (env).name
    }

    let is_windows = ((sys).host.name | str downcase) == 'windows'
    let path_name = if $is_windows {
        if (has-env 'Path') {
            'Path'
        } else {
            'PATH'
        }
    } else {
        'PATH'
    }

    let old_path = (
        if $is_windows {
            if (has-env 'Path') {
                $env.Path
            } else {
                $env.PATH
            }
        } else {
            $env.PATH
        } | if (is-string $in) {
            # if Path/PATH is a string, make it a list
            $in | split row $path_sep | path expand
        } else {
            $in
        }
    )

    let venv_path = ([$virtual_env $bin] | path join)
    let new_path = ($old_path | prepend $venv_path | str collect $path_sep)

    # Creating the new prompt for the session
    let virtual_prompt = if ($virtual_prompt == '') {
        $'(char lparen)($virtual_env | path basename)(char rparen) '
    } else {
        '(' + $virtual_prompt + ') '
    }

    # Back up the old prompt builder
    let old_prompt_command = if (has-env 'VIRTUAL_ENV') && (has-env '_OLD_PROMPT_COMMAND') {
        $env._OLD_PROMPT_COMMAND
    } else {
        if (has-env 'PROMPT_COMMAND') {
            $env.PROMPT_COMMAND
        } else {
            ''
        }
    }

    # If there is no default prompt, then only the env is printed in the prompt
    let new_prompt = if (has-env 'PROMPT_COMMAND') {
        if ($old_prompt_command | describe) == 'block' {
            { $'($virtual_prompt)(do $old_prompt_command)' }
        } else {
            { $'($virtual_prompt)($old_prompt_command)' }
        }
    } else {
        { $'($virtual_prompt)' }
    }

    # Environment variables that will be batched loaded to the virtual env
    let new_env = {
        $path_name          : $new_path
        VIRTUAL_ENV         : $virtual_env
        _OLD_VIRTUAL_PATH   : ($old_path | str collect $path_sep)
        _OLD_PROMPT_COMMAND : $old_prompt_command
        PROMPT_COMMAND      : $new_prompt
        VIRTUAL_PROMPT      : $virtual_prompt
    }

    # Activate the environment variables
    load-env $new_env
}

export alias pydoc = python -m pydoc
