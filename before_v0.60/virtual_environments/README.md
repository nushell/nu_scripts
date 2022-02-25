# Virtual environment scripts

The scripts in this directory activate virtual environments like Python venvs
and Conda environments.  They follow the pattern described in the [Nushell 0.32
changelog](https://www.nushell.sh/blog/2021-06-01-nushell_0_32.html#environment-loading-lily-mara):

```
$ load-env (activate some-env)
```

A custom command (`activate`) creates a table with environment variables and
`load-env` is used to load it into the shell's scope.

In most cases, deactivation is a matter of restoring the PATH variable to the
state before activating the env and removing any additional variables. There are
no environment-specific elements to this, which is why the same deactivation
script can be used for deactivating any environment of a specific type.  For
example, `source conda_deactivate.nu` will deactivate any Conda env, there are
no input parameters.

## Expected Usage

1. Source an activation script in your `config.toml`. For example, `conda.nu`.
   You'll then have the `conda-env` command available.
2. Create an alias for sourcing the appropriate deactivation script:
   `alias conda-deactivate = source /path/to/conda_deactivate.nu`
3. Activate with `load-env (conda-env env-name)`. You might want to define some
   shorter aliases for both commands, if typing that every time seems like a
   hassle.
4. If you're using [Starship](https://starship.rs/), your prompt should reflect the activated env.
5. When done, deactivate with your alias: `conda-deactivate`.

Look at the script files to find the exact command name for creating an environment table.

## `conda.nu`

Limitations:

- The "root_prefix" might not actually correspond to the correct path to the Conda envs. You can fix
  this for your setup by changing how the root prefix is found in the `conda-env` command.
- Nested envs are not well supported. If you activate a Conda env while another one is
  activated, new elements will be appended to the PATH, but the other environment
  variables will be overwritten. There's no way to then restore the PATH to the state
  it was in before activating the *first* env (at least not with this script directly).
- The prompt is not updated by the script. Consider using [Starship](https://starship.rs/)
  with the Python prompt element.

## `venv.nu`

Limitations:

- The prompt is not updated by the script. Consider using [Starship](https://starship.rs/)
  with the Python prompt element.