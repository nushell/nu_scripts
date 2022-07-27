# Activate conda environment
export def-env activate [
    env_name: string@'nu-complete conda envs' # name of the environment
    --no-prompt                               # do not update the prompt
] {
    let conda_info = (conda info --envs --json | from json)

    let suffix = if $env_name == "base" {
        ""
    } else {
        ["envs" $env_name] | path join
    }

    let env_dir = ([$conda_info.root_prefix $suffix] | path join)
    let old_path = (system-path | str collect (char esep))

    let new_path = if windows? {
        conda-create-path-windows $env_dir
    } else {
        conda-create-path-unix $env_dir
    }

    let virtual_prompt = $'[($env_name)] '

    let new_env = ({
        CONDA_DEFAULT_ENV: $env_name
        CONDA_PREFIX: $env_dir
        CONDA_PROMPT_MODIFIER: $virtual_prompt
        CONDA_SHLVL: "1"
        CONDA_OLD_PATH: $old_path
    } | merge { $new_path })

    let new_env = if not $no_prompt {
        let old_prompt_command = if (has-env CONDA_OLD_PROMPT_COMMAND) {
            $env.CONDA_OLD_PROMPT_COMMAND
        } else {
            if (has-env 'PROMPT_COMMAND') {
                $env.PROMPT_COMMAND
            } else {
                ''
            }
        }


        let new_prompt = if (has-env 'PROMPT_COMMAND') {
            if ($old_prompt_command | describe) == 'block' {
                { $'($virtual_prompt)(do $old_prompt_command)' }
            } else {
                { $'($virtual_prompt)($old_prompt_command)' }
            }
        } else {
            { $'($virtual_prompt)' }
        }

        $new_env
        | insert CONDA_OLD_PROMPT_COMMAND $old_prompt_command
        | insert PROMPT_COMMAND $new_prompt
    } else {
        $new_env
    }

    load-env $new_env
}

# Deactivate currently active conda environment
export def-env deactivate [] {
    let path_name = if "PATH" in (env).name { "PATH" } else { "Path" }
    let-env $path_name = $env.CONDA_OLD_PATH
    let-env PROMPT_COMMAND = $env.CONDA_OLD_PROMPT_COMMAND

    hide CONDA_PROMPT_MODIFIER
    hide CONDA_PREFIX
    hide CONDA_SHLVL
    hide CONDA_DEFAULT_ENV
    hide CONDA_OLD_PATH

    let-env PROMPT_COMMAND = if 'CONDA_OLD_PROMPT_COMMAND' in (env).name {
        $env.CONDA_OLD_PROMPT_COMMAND
    } else {
        $env.PROMPT_COMMAND
    }

    hide CONDA_OLD_PROMPT_COMMAND
}

def 'nu-complete conda envs' [] {
    conda info --envs
    | lines
    | where not ($it | str starts-with '#')
    | where not ($it | empty?)
    | each {|entry| $entry | split row ' ' | get 0 }
}

def conda-create-path-windows [env_dir: path] {
    # Conda on Windows needs a few additional Path elements
    let env_path = [
        $env_dir
        ([$env_dir "Scripts"] | path join)
        ([$env_dir "Library" "mingw-w64"] | path join)
        ([$env_dir "Library" "bin"] | path join)
        ([$env_dir "Library" "usr" "bin"] | path join)
    ]

    let new_path = ([$env_path (system-path)]
        | flatten
        | str collect (char esep))

    { PATH: $new_path }
}

def conda-create-path-unix [env_dir: path] {
    let env_path = [
        ([$env_dir "bin"] | path join)
    ]

    let new_path = ([$env_path $env.PATH]
        | flatten
        | str collect (char esep))

    { PATH: $new_path }
}

def windows? [] {
    ((sys).host.name | str downcase) == "windows"
}

def system-path [] {
    if "PATH" in (env).name { $env.PATH } else { $env.Path }
}

def has-env [name: string] {
    $name in (env).name
}
