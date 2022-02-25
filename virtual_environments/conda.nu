def conda-env [env-name] {
    let conda-info = (conda info --envs --json | from json)
    let suffix = (if $env-name == "base" {""} else {(["envs" $env-name] | path join)})
    let env-dir = ([$conda-info.root_prefix $suffix] | path join)
    let old-path = ($env.PATH | str collect (path-sep))
    let new-path = (if (windows?) { (conda-create-path-windows $env-dir) } else { (conda-create-path-unix $env-dir) })
    let new-env = {
        CONDA_DEFAULT_ENV: $env-name
        CONDA_PREFIX: $env-dir
        CONDA_PROMPT_MODIFIER: $"[($env-name)]"
        CONDA_SHLVL: "1"
        CONDA_OLD_PATH: $old-path
    }
    $new-env | merge { $new-path }
}

def conda-create-path-windows [env-dir] {
    # 1. Conda on Windows needs a few additional Path elements
    # 2. The path env var on Windows is called Path (not PATH)
    let env-path = [
        $env-dir
        ([$env-dir "Scripts"] | path join)
        ([$env-dir "Library" "mingw-w64"] | path join)
        ([$env-dir "Library" "bin"] | path join)
        ([$env-dir "Library" "usr" "bin"] | path join)
    ]
    let new-path = ([$env-path $env.PATH] | flatten | str collect (path-sep))
    {
        PATH: $new-path
    }
}

def conda-create-path-unix [env-dir] {
    let env-path = [
        ([$env-dir "bin"] | path join)
    ]
    let new-path = ([$env-path $env.PATH] | flatten | str collect (path-sep))
    {
        PATH: $new-path
    }
}

def windows? [] {
    (sys).host.name == "Windows"
}

def path-sep [] {
    if (windows?) { ";" } else { ":" }
}
