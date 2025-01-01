# rbenv
export-env { 
    use std/util "path add"

    $env.RBENV_SHELL = 'nu'
    $env.RBENV_VERSION = ''
    path add $"($env.HOME)/.rbenv/bin"
    path add $"($env.HOME)/.rbenv/shims"
}

export def --env "shell" [version: string] {
    let run = (^rbenv sh-shell $version | complete)
    if ($run.exit_code == 0) {
        $env.RBENV_VERSION_OLD = ($env.RBENV_VERSION | default "")
        $env.RBENV_VERSION = $version
    } else {
        print -e $run.stderr
    }
}
