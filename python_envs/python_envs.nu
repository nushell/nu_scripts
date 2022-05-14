# -- pyenv --

let-env PATH = ($env.PATH | append $"($env.HOME)/.pyenv/bin")
let-env PATH = ($env.PATH | append $"($env.HOME)/.pyenv/shims")

# replicate pyenv init - | source
let-env PYENV_VERSION = ""
let-env PYENV_VERSION_OLD = ""
let-env PYENV_SHELL = "nu"

#TODO: replicate source '/home/XXXX/.pyenv/libexec/../completions/pyenv.bash'

def-env pyenv [command, ...args] {
    let new-env = if $command in ["activate", "deactivate", "rehash", "shell"] {
        if $command == "shell" {
            { PYENV_VERSION_OLD: $env.PYENV_VERSION PYENV_VERSION: $args.0 }
        } else {
            error make { msg: $"`($command)` command is not supported yet" }
        }
    } else {
        ^pyenv $command $args
        {}
    }
    load-env $new-env
}

# -- pipenv --

# use pipenv function made for bash to edit the env
# TODO: add poetry support
def pshell [] {
    bash "-c" "pipenv run nu"
}
let-env PIPENV_PYTHON = $"($env.HOME)/.pyenv/shims/python"
let-env PIPENV_VENV_IN_PROJECT = 1 # optional but recommended
