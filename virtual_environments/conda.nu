def conda-env [env-name] {
    let conda-info = (conda info --envs --json | from json)
    let suffix = (if $env-name == "base" {""} {(["envs" $env-name] | path join)})
    let env-dir = ([$conda-info.root_prefix $suffix] | path join)
    let old-path = ($nu.path | str collect (path-sep))
    let env-path = (if (windows?) { (conda-create-path-windows $env-dir) } { (conda-create-path-unix $env-dir) })
    let new-path = ([$env-path $nu.path] | flatten | str collect (path-sep))
    [[name, value];
     [CONDA_DEFAULT_ENV $env-name]
     [CONDA_PREFIX $env-dir]
     [CONDA_PROMPT_MODIFIER $"[($env-name)]"]
     [CONDA_SHLVL "1"]
     [CONDA_OLD_PATH $old-path]
     [PATH $new-path]]
}

def conda-create-path-windows [env-dir] {
    [
        $env-dir
        ([$env-dir "Scripts"] | path join)
        ([$env-dir "Library" "mingw-w64"] | path join)
        ([$env-dir "Library" "bin"] | path join)
        ([$env-dir "Library" "usr" "bin"] | path join)
    ]
}

def conda-create-path-unix [env-dir] {
    [
        ([$env-dir "bin"] | path join)
    ]
}

def windows? [] {
    (sys).host.name == "Windows"
}

def path-sep [] {
    if (windows?) { ";" } { ":" }
}
