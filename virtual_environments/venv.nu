def venv [venv-dir] {
    let venv-abs-dir = ($venv-dir | path expand)
    let venv-name = ($venv-abs-dir | path basename)
    let old-path = ($nu.path | str collect (path-sep))
    let new-path = (if (windows?) { (venv-path-windows $venv-abs-dir) } { (venv-path-unix $venv-abs-dir) })
    let new-env = [[name, value];
                   [VENV_OLD_PATH $old-path]
                   [VIRTUAL_ENV $venv-name]]

    $new-env | append $new-path
}

def venv-path-unix [venv-dir] {
    let venv-path = ([$venv-dir "bin"] | path join)
    let new-path = ($nu.path | prepend $venv-path | str collect (path-sep))
    [[name, value]; [PATH $new-path]]
}

def venv-path-windows [venv-dir] {
    # 1. Conda on Windows needs a few additional Path elements
    # 2. The path env var on Windows is called Path (not PATH)
    let venv-path = ([$venv-dir "Scripts"] | path join)
    let new-path = ($nu.path | prepend $venv-path | str collect (path-sep))
    [[name, value]; [Path $new-path]]
}

def windows? [] {
    (sys).host.name == "Windows"
}

def path-sep [] {
    if (windows?) { ";" } { ":" }
}
