def --env load-conda-info-env [] {
    if (not (has-env CONDA_INFO)) {
        export-env {
            $env.CONDA_INFO = (
                if not (which micromamba | is-empty) {
                    mut info = micromamba env list --json | from json
                    let extra_info = micromamba info --json | from json
                    $info.envs_dirs = $extra_info."envs directories"
                    $info.root_prefix = $extra_info."base environment"
                    $info
                } else if not (which mamba | is-empty) {
                    (mamba info --envs --json --no-banner | from json)
                } else if not (which conda | is-empty) {
                    (conda info --envs --json | from json)
                } else {
                    null
                }
            )
        }
    }
}

# Activate conda environment
export def --env activate [
    env_name: string@'nu-complete conda envs' = "base" # name of the environment
] {
    load-conda-info-env
    let conda_info = $env.CONDA_INFO
    if ($conda_info == null) {
        print "Error: No Conda, Mamba or Micromamba install could be found in the environment. Please install either and add them to the environment. See: https://www.nushell.sh/book/environment.html for more info"
        return
    }

    let env_dir = if $env_name != "base" {
        if ($env_name | path exists) and (($env_name | path expand) in $conda_info.envs ) {
            ($env_name | path expand)
        } else {
            ((check-if-env-exists $env_name $conda_info) | into string)
        }
    } else {
        $conda_info.root_prefix
    }

    let old_path = (system-path | str join (char esep))

    let new_path = if (windows?) {
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
    } | merge $new_path)

    let new_env = if not (has-env CONDA_NO_PROMPT) {
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
            if 'closure' in ($old_prompt_command | describe) {
                {|| $'($virtual_prompt)(do $old_prompt_command)' }
            } else {
                {|| $'($virtual_prompt)($old_prompt_command)' }
            }
        } else {
            {|| $'($virtual_prompt)' }
        }

        $new_env | merge {
            CONDA_OLD_PROMPT_COMMAND: $old_prompt_command
            PROMPT_COMMAND: $new_prompt
        }
    } else {
        $new_env | merge { CONDA_OLD_PROMPT_COMMAND: null }
    }


    load-env $new_env
}

# Deactivate currently active conda environment
export def --env deactivate [] {
    let path_name = if "PATH" in $env { "PATH" } else { "Path" }
    $env.$path_name = $env.CONDA_OLD_PATH

    hide-env CONDA_PROMPT_MODIFIER
    hide-env CONDA_PREFIX
    hide-env CONDA_SHLVL
    hide-env CONDA_DEFAULT_ENV
    hide-env CONDA_OLD_PATH

    $env.PROMPT_COMMAND = (
        if $env.CONDA_OLD_PROMPT_COMMAND == null {
            $env.PROMPT_COMMAND
        } else {
            $env.CONDA_OLD_PROMPT_COMMAND
        }
    )
    hide-env CONDA_OLD_PROMPT_COMMAND
}

def check-if-env-exists [ env_name: string, conda_info: record ] {
    let env_dirs = (
        $conda_info.envs_dirs |
        each { || path join $env_name }
    )

    let en = ($env_dirs | each {|en| $conda_info.envs | where $it == $en } | where ($it | length) == 1 | flatten)
    if ($en | length) > 1 {
        error make --unspanned {msg: $"You have enviroments in multiple locations: ($en)"}
    }
    if ($en | length) == 0 {
        error make --unspanned {msg: $"Could not find given environment: ($env_name)"}
    }
    $en.0
}

def 'nu-complete conda envs' [] {
    load-conda-info-env
    $env.CONDA_INFO
    | get env_vars.CONDA_ENVS
    | lines
    | where not ($it | str starts-with '#')
    | where not ($it | is-empty)
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
        | str join (char esep))

    { Path: $new_path }
}

def conda-create-path-unix [env_dir: path] {
    let env_path = [
        ([$env_dir "bin"] | path join)
    ]

    let new_path = ([$env_path $env.PATH]
        | flatten
        | str join (char esep))

    { PATH: $new_path }
}

def windows? [] {
    ((sys).host.name | str downcase) == "windows"
}

def system-path [] {
    if "PATH" in $env { $env.PATH } else { $env.Path }
}

def has-env [name: string] {
    $name in $env
}
