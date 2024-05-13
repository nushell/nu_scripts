# Separate Startup Script

This config sources a separate startup script so that you can edit a `nu` script
instead of fiddling around with the `toml` config.

Additionally it provides some new commands:

- `config edit`: Opens the `config.toml` in a new editor (depending on the `EDITOR` env variable)
- `startup edit`: Opens the `startup.nu` in a new editor (depending on the `EDITOR` env variable)
- `startup path`: Like `config path`, provides the path to the `startup.nu` file


## The `config edit` and `startup edit` command

Both `config edit` and `startup edit` accept the flag `--editor` (or `-e`) that
lets you define a different editor. To open the config in
[VSCode](https://github.com/microsoft/vscode) VScode for example do:

```
config edit -e code
startup edit -e code
```


## The `startup path` and `config path` command

Like `config path` the command `startup path` provides the path to the
`startup.nu` file. This can be used e.g. to open both, the `config.toml` and the
`startup.nu` in an editor of your choice:

```
vim (config path) (startup path)
```
