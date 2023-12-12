# nu_conda_2
This script aims to be a drop-in replacement for `conda activate` and `mamba activate`. It is a combination of the conda.nu and nu_conda scripts and some of my own code.

# Features
- Shell prompts
- Uses def-env to 'cache' results of necessary commands
- Auto-complete for environments
- Works for the latest version of Nushell as of writing (December 2023): the other scripts do not work A.T.M

# Trade-offs
The nu_conda script uses def-env which loads everything when Nushell starts up. This results in longer start-up times for Nushell. The loading is unavoidable, but this script loads the data when the command is called. This means that startup of conda is not affected, but calling the command for the first time takes ~1 sec instead of ~100ms when using bash. Input is welcome on how to avoid this.

# Disabling prompts
To disable the prompt changes (e.g., to let [Starship](https://starship.rs) include its own), set the environment variable `CONDA_NO_PROMPT`.
To set it globally, add the line `$env.CONDA_NO_PROMPT = true` to `$nu.config-path`.

# Setup
Install the script to your script folder and import it in your config file:
```
use ~/.config/nushell/scripts/conda.nu
```

## Mamba
To use with mamba, simply add these lines to your config: 
```nu
alias "mamba activate" = conda activate
alias "mamba deactivate" = conda deactivate
```