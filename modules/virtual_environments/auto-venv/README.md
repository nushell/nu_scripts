# Auto virtual environment scripts

The scripts in this directory activate virtual environments whenever you cd into a directory with a "trigger" file 

## Usage

1. set `$env.AUTO_VENV_TRIGGER` as the preferred name of a trigger file
1. import `auto-venv` into your environment
1. Create a symlink via `ln -s` of the script file `./auto-venv/venvs/python-venv.nu` to a trigger file in project at `/path/to/project/$AUTO_VENV_TRIGGER`
1. `cd` into `/path/to/project/`

For example:
```nu
# config.nu

export-env {
    let-env AUTO_VENV_TRIGGER = '__auto-venv.nu'

    source-env ~/path/to/nu_scripts/modules/virtual_environments/auto-venv/auto-venv.nu
}

use ~/path/to/nu_scripts/modules/virtual_environments/auto-venv/auto-venv.nu *
```

When `auto-venv` detects that a file of that name exists in the folder you cd'ed into (or one of it's parents), it will automatically enable an overlay (as defined by the trigger file).

An example overlay for python venv is in `./venvs`

NOTE: the trigger file *must* export a custom command called `auto-venv-on-enter` that takes in the `$env` (this is the environment *before* the overlay was enabled).  


## Limitations

- Due to limitations with overlay naming, you cannot nest auto-venv triggers, even for separate languages / toolchains
