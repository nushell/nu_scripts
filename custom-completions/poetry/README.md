# Poetry Custom Completions

This script provides custom completions for [Poetry](https://github.com/python-poetry/poetry). I created this by using the `poetry list` command and then using the `nu_scripts/custom-completions/auto-generate/completions/pyenv.nu` file as a template to format the poetry commands.

It can be used by importing its exported commands by adding the line below to the config.nu file

```nu
source path/to/custom-completions/poetry/poetry-completions.nu
```
