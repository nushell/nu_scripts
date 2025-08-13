use std-rfc/kv *

export-env {
  job spawn {find}
}

export def --env activate [name: string] {
  if ($env.CONDA_ENVS? | is-empty) {
    find
    kv get "conda envars" | load-env
  }

  if ($env.CONDA_ROOT | is-empty) {
    print "Neither Conda nor Mamba is available."
    return
  }

  if not ($name in $env.CONDA_ENVS) {
    print $"Environment ($name) is invalid. Available:"
    print $env.CONDA_ENVS
    return
  }

  let new_path = (
    if ($nu.os-info.name == "windows") {
      update-path-windows ($env.CONDA_ENVS | get $name)
    } else {
      update-path-linux ($env.CONDA_ENVS | get $name)
    })

  load-env ({CONDA_CURR: $name} | merge $new_path)
}

export def --env deactivate [] {
  if ($env.CONDA_ENVS? | is-empty) {
    find
    kv get "conda envars" | load-env
  }

  if ($env.CONDA_ROOT | is-empty) {
    print "Neither Conda nor Mamba is available."
    return
  }

  $env.CONDA_CURR = ""

  load-env {Path: $env.CONDA_BASE_PATH, PATH: $env.CONDA_BASE_PATH}
}

export def find [] {
  let $base_path = (if ($nu.os-info.name == "windows") {$env.Path} else {$env.PATH})

  let info = (
      if not (which mamba | is-empty) {
        (mamba info --envs --json | from json)
      } else if not (which conda | is-empty) {
        (conda info --envs --json | from json)
      } else {
        ('{"root": "", "envs": []}' | from json)
      })

  let info = (
      if not ("root" in $info) {
        $info | insert root $info.envs.0
      } else {
        $info
      })

  let $root = $info.root

  let $envs = ($info.envs | reduce -f {} {|it, acc|
      if $it == $info.root {
        $acc | upsert "base" $it
      } else {
        $acc | upsert ($it | path basename) $it
      }})

  let $vars = {
    CONDA_BASE_PATH: $base_path,
    CONDA_CURR: "",
    CONDA_ROOT: $root,
    CONDA_ENVS: $envs
  }

  kv set "conda envars" $vars
}

export def list [] {
  if ($env.CONDA_ENVS? | is-empty) {
    find
    kv get "conda envars" | load-env
  }

  $env.CONDA_ENVS
    | flatten
    | transpose
    | rename name path
    | insert active {|it| $it.name == $env.CONDA_CURR}
    | move path --after active
}

def update-path-linux [env_path: path] {
  let env_path = [
    $env_path,
    ([$env_path, "bin"] | path join)
  ]

  return {
    Path: ($env.PATH | prepend $env_path),
    PATH: ($env.PATH | prepend $env_path)
  }
}

def update-path-windows [env_path: path] {
  let env_path = [
    $env_path,
    ([$env_path, "Scripts"] | path join),
  ]

  return {
    Path: ($env.Path | prepend $env_path),
    PATH: ($env.Path | prepend $env_path)
  }
}
