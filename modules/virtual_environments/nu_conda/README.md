# Conda Module for Nushell
A simple module for finding, listing, activating, and deactivating Conda environments.


## Prerequisites
The following commands must be available in your version of Nushell:
- [job](https://www.nushell.sh/commands/docs/job.html)
- [std-rfc/kv](https://github.com/nushell/nushell/blob/main/crates/nu-std/std-rfc/kv/mod.nu)


## Installation
Put `nu_conda.nu` into the module folder of your nushell configuration workspace.


## Usage
```nu
use nu_conda.nu          # import module, Conda environments will be searched
nu_conda activate py310  # activate a Conda environment, e.g. py310
nu_conda deactivate      # deactivate the activated Conda environment
nu_conda find            # find/update available environments
nu_conda list            # list available environments, same as `$env.CONDA_ENVS`
```

## How It Works
> [!NOTE]
> Originally, this module cached Conda environment information during import,
> which increased startup time. It now performs the caching in a background
> job, significantly reducing startup latency.

This module adds paths of a target Conda environment to `PATH`/`Path` while
activating the environment, and recover the original `PATH`/`Path` while
deactivating an environment. Several environment variables are exported:

- `CONDA_BASE_PATH`: The original `PATH`/`Path` before any activation/deactivation.
- `CONDA_ROOT`: Root directory of Conda installation.
- `CONDA_ENVS`: Available Conda environments for activation.
- `CONDA_CURR`: Current activated Conda environment.


## FAQ
**Q**: How better is the performance?\
**A**: Activating a Conda environment costs ~20ms while conda.nu costs ~1500ms
on a PC with Windows 10 Enterprise OS and Intel i7-8700 3.20GHz CPU.

**Q**: How to show the current Conda environment in the prompt?\
**A**: This module does not automatically change the prompt when a Conda
environment is activated, but an environment variable `$env.CONDA_CURR` is set
to the name of the current Conda environment which can be used to customize the
prompt.


**Q**: Does it support Mamba/Micromamba?\
**A**: As [Mamba's documentation](https://mamba.readthedocs.io/en/latest/)
said, `mamba` is drop-in replacement for `conda`, and `micromamba` seems to be
another thing. This module only uses results of `conda/mamba info --envs --json`.
Therefore, I would say Mamba is supported, but I'm not sure about Micromamba.


**Q**: How does it choose between Conda and Mamba?\
**A**: This module prefers calling `mamba` over `conda`, but it should be very
easy to change the preference by modifying the source code.


**Q**: Completions?\
**A**: PRs are welcomed.
