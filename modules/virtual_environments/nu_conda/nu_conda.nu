export-env {
  $env.CONDA_BASE_PATH = (if ((sys).host.name == "Windows") {$env.Path} else {$env.PATH})

  let info = (
      if not (which mamba | is-empty) {
        (mamba info --envs --json | from json)
      } else if not (which conda | is-empty) {
        (conda info --envs --json | from json)
      } else {
        ('{"root_prefix": "", "envs": ""}' | from json)
      })

  $env.CONDA_ROOT = $info.root_prefix

  $env.CONDA_ENVS = ($info.envs | reduce -f {} {|it, acc|
      if $it == $info.root_prefix {
        $acc | upsert "base" $it
      } else {
        $acc | upsert ($it | path basename) $it
      }})

  $env.CONDA_CURR = null
}

export def --env activate [name: string] {
  if ($env.CONDA_ROOT | is-empty) {
    print "Neither Conda nor Mamba is valid."
    return
  }

  if not ($name in $env.CONDA_ENVS) {
    print $"Environment ($name) is invalid. Available:"
    print $env.CONDA_ENVS
    return
  }

  let new_path = (
    if ((sys).host.name == "Windows") {
      update-path-windows ($env.CONDA_ENVS | get $name)
    } else {
      update-path-linux ($env.CONDA_ENVS | get $name)
    })

  load-env ({CONDA_CURR: $name} | merge $new_path)
}

export def --env deactivate [] {
  if ($env.CONDA_ROOT | is-empty) {
    print "Neither Conda nor Mamba is valid."
    return
  }

  $env.CONDA_CURR = null

  load-env {Path: $env.CONDA_BASE_PATH, PATH: $env.CONDA_BASE_PATH}
}

export def --env list [] {
  $env.CONDA_ENVS | 
    flatten | 
    transpose | 
    rename name path | 
    insert active { |it| $it.name == $env.CONDA_CURR } | 
    move path --after active
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
