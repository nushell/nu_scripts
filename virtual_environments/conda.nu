# Activate conda environment
export def-env activate [
    env-name: string@'nu-complete conda envs' # name of the environment
    --no-prompt                               # do not update the prompt
] {
    let conda-info = (conda info --envs --json | from json)

    let suffix = if $env-name == "base" {
        ""
    } else {
        ["envs" $env-name] | path join
    }

    let env-dir = ([$conda-info.root_prefix $suffix] | path join)
    let old-path = (system-path | str collect (char esep))

    let new-path = if windows? {
        conda-create-path-windows $env-dir
    } else {
        conda-create-path-unix $env-dir
    }

    let virtual-prompt = $'[($env-name)] '

    let new-env = ({
        CONDA_DEFAULT_ENV: $env-name
        CONDA_PREFIX: $env-dir
        CONDA_PROMPT_MODIFIER: $virtual-prompt
        CONDA_SHLVL: "1"
        CONDA_OLD_PATH: $old-path
    } | merge { $new-path })

    let new-env = if not $no-prompt {
        let old_prompt_command = if (has-env CONDA_OLD_PROMPT_COMMAND) {
            $env.CONDA_OLD_PROMPT_COMMAND
        } else {
            if (has-env 'PROMPT_COMMAND') {
                $env.PROMPT_COMMAND
            } else {
                ''
            }
        }


        let new-prompt = if (has-env 'PROMPT_COMMAND') {
            if ($old_prompt_command | describe) == 'block' {
                { $'($virtual-prompt)(do $old_prompt_command)' }
            } else {
                { $'($virtual-prompt)($old_prompt_command)' }
            }
        } else {
            { $'($virtual-prompt)' }
        }

        $new-env
        | insert CONDA_OLD_PROMPT_COMMAND $old_prompt_command
        | insert PROMPT_COMMAND $new-prompt
    } else {
        $new-env
    }

    load-env $new-env
}

# Deactivate currently active conda environment
export def-env deactivate [] {
    let path-name = if "PATH" in (env).name { "PATH" } else { "Path" }
    let-env $path-name = $env.CONDA_OLD_PATH
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

def conda-create-path-windows [env-dir: path] {
    # Conda on Windows needs a few additional Path elements
    let env-path = [
        $env-dir
        ([$env-dir "Scripts"] | path join)
        ([$env-dir "Library" "mingw-w64"] | path join)
        ([$env-dir "Library" "bin"] | path join)
        ([$env-dir "Library" "usr" "bin"] | path join)
    ]

    let new-path = ([$env-path (system-path)]
        | flatten)

    { PATH: $new-path }
}

def conda-create-path-unix [env-dir: path] {
    let env-path = [
        ([$env-dir "bin"] | path join)
    ]

    let new-path = ([$env-path $env.PATH]
        | flatten)

    { PATH: $new-path }
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
