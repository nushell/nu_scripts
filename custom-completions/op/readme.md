# 1Password CLI completions

A Nushell extern definition and completers for [1Password CLI app `op`](https://developer.1password.com/docs/cli).

This module provides extern definitions for all of the `op` commands and their flags. It does not provide completions for the `assignments` argument (`[<section>.]<field>[[<fieldType>]]=<value>`) within the `op item create` and `op item edit` commands.

*When prompting for some option values such as `--vault` or `--group` the extern completer will attempt to execute additional background `op` commands to retrieve possible values which may cause unexpected additional 1Password authentication prompts.*

## Usage

simply import the extern definitions with

```nu
use path/to/op-completions.nu * # don't forget the star `*`
```

or

```nu
source path/to/op-completions.nu
```

Once imported completions will be available for commands, flags, options, and some values as well.
Display the commands by entering the `→ tab` key in the command line after `op` or any of it's command options.

