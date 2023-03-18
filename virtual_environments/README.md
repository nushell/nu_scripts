# Virtual environment scripts

The scripts in this directory activate virtual environments for Conda environments.

## Usage

The activation and deactivation commands are exported from the `conda` module.

```
> use conda.nu
> conda activate foo
[foo] > conda deactivate
>
```

The `activate` command also includes custom completions for the environment names.
To disable the prompt changes (e.g., to let [Starship](https://starship.rs) include its own), set the environment variable `CONDA_NO_PROMPT`.
To set it globally, add the line `let-env CONDA_NO_PROMPT = true` to `$nu.config-path`.

## Limitations

_(old text, not tested)_

- The "root_prefix" might not actually correspond to the correct path to the Conda envs. You can fix
  this for your setup by changing how the root prefix is found in the `conda-env` command.
- Nested envs are not well supported. If you activate a Conda env while another one is
  activated, new elements will be appended to the PATH, but the other environment
  variables will be overwritten. There's no way to then restore the PATH to the state
  it was in before activating the *first* env (at least not with this script directly).
