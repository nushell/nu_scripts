let path-name = (if ((sys).host.name == "Windows") { "Path" } { "PATH" })
let-env $path-name = $nu.env.VENV_OLD_PATH
unlet-env VIRTUAL_ENV
unlet-env VENV_OLD_PATH
