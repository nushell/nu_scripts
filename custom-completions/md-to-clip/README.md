# `md-to-clip` completions

Custom completions for the [`md-to-clip` command line tool](https://github.com/command-line-interface-pages/v2-tooling/tree/main/md-to-clip).

## Usage

Import the custom completions with:

```nushell
source path/to/md-to-clip-completions.nu
```

Afterwards, when you enter `md-to-clip -` and then press tab, the available flags will be displayed:

```nushell
nu ❯ | md-to-clip -
--author                      Display author
--email                       Display author email
--help                        Display help
--no-file-save                Whether to display conversion result in stdout instead of writing it to a file
--output-directory            Directory where conversion result will be written
--special-placeholder-config  Config with special placeholders
--version                     Display version
-a                            Display author
-e                            Display author email
-h                            Display help
-v                            Display version
```
