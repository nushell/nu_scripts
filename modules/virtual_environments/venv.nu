export def --env activate [venv_dir] {
    let venv_abs_dir = ($venv_dir | path expand)
    let venv_name = ($venv_abs_dir | path basename)
    let old_path = $env.PATH
    let new_path = (venv-path $venv_abs_dir)
    let new_env =  ({VENV_OLD_PATH: $old_path, VIRTUAL_ENV: $venv_name} | merge $new_path)
    load-env $new_env
}

def "venv-path" [venv_dir] {
      let env_path = [
        $venv_dir,
        ([$venv_dir, "bin"] | path join)
      ]
      return {
        PATH: ($env.PATH | prepend $env_path)
      }
}

export def --env deactivate [] {
    $env.PATH = $env.VENV_OLD_PATH
    hide-env VIRTUAL_ENV
    hide-env VENV_OLD_PATH

}
