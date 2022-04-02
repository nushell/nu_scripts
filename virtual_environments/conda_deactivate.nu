let path-name = (if "PATH" in (env).name { "PATH" } else { "Path" })
let-env $path-name = $env.CONDA_OLD_PATH
hide CONDA_PROMPT_MODIFIER
hide CONDA_PREFIX
hide CONDA_SHLVL
hide CONDA_DEFAULT_ENV
hide CONDA_OLD_PATH
