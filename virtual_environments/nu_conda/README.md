# Conda Module for Nushell
A simple module for activating and deactivating Conda environments.


## Prerequisites
- [nushell](https://github.com/nushell/nushell) >= 0.73.0


## Installation
Put `nu_conda.nu` into the module folder of your nushell configuration workspace.


## Usage
```nu
use nu_conda.nu         # activate module
nu_conda activate py36  # activate a Conda environment, e.g. py36
nu_conda deactivate     # deactivate the activated Conda environment
```

## Philosophy
This module re-implements the activation and deactivation functionalities of
the [conda.nu](https://github.com/Neur1n/nu_scripts/blob/main/virtual_environments/conda.nu)
module while providing a better performance, but not fully replacing it.


## FAQ
**Q**: How better is the performance?\
**A**: Activating a Conda environment costs ~20ms while conda.nu costs ~1500ms on
a PC with Windows 10 Enterprise OS and Intel i7-8700 3.20GHz CPU.

**Q**: How to show the current Conda environment in the prompt?\
**A**: This module does not automatically change the prompt when a Conda
environment is activated, but an environment variable `$env.CONDA_CURR` is set
to the name of the current Conda environment which can be used to customize the
prompt.


**Q**: Does it support Mamba/Micromamba?\
**A**: As [Mamba's documentation](https://mamba.readthedocs.io/en/latest/) said,
`mamba` is drop-in replacement for `conda`, and `micromamba` seems to be
another thing. This module only uses results of `conda/mamba info --envs --json`.
Therefore, I would say Mamba is (partially?) supported but I'm not sure about
Micromamba.


**Q**: How does it choose between Conda and Mamba?\
**A**: This module prefers calling `mamba` than `conda`, but it should be very
easy to change the preference by modifying the source code.


**Q**: Auto-completions?\
**A**: PRs are welcomed.
