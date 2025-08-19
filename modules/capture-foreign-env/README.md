# capture-foreign-env

This is a modified version of the [capture-foreign-env command from the nushell wiki](https://www.nushell.sh/cookbook/foreign_shell_scripts.html#detailed-explanation-of-capture-foreign-env).

Unlike the wiki version It relies on `null_byte` instead of `newline` as a delimiter for environment variables dumped by the `env` command which allows it to support multi-line foreign environment variables.
