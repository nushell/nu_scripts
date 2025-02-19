# Zig version manager
# - list available Zig versions
# - install tagged and/or nightly versions
# - point symlink to current active version
# - remove versions

# List all available versions of Zig
export def "zvm list" [
  --system (-s) # List locally installed versions
] {
  if $system == true {
    let path_prefix = get_or_create_path_prefix
    let current_version = get_current_version $path_prefix

    ls --short-names $path_prefix
    | where type == dir
    | get name
    | sort --reverse
    | each { |it| { version: $it active: ($it == $current_version) }}
  } else {
    http get https://ziglang.org/download/index.json | columns
  }
}

# Fetch info about specified version
export def "zvm info" [version: string] {
  http get https://ziglang.org/download/index.json
  | get $version
  | select version? date docs stdDocs notes?
}

# Install Zig for the specified version
export def "zvm install" [version: string] {
  let version_data = http get https://ziglang.org/download/index.json | get $version
  let version_to_install = if $version_data.version? != null { $version_data.version } else { $version }

  let local_versions = zvm list --system | get version
  if $version_to_install in $local_versions {
    error make {
      msg: $"Version ($version_to_install) is already installed."
      label: {
        text: $"Version ($version) is already installed locally"
        span: (metadata $version).span
      }
    }
  }

  let tarball = $version_data | get $"($nu.os-info.arch)-($nu.os-info.name)" | get tarball
  let temp_dir = mktemp --directory --suffix "-zvm"
  http get $tarball | save --progress $"($temp_dir)/archive.tar.xz"
  verify_signature $temp_dir $tarball
  ouch decompress --dir $temp_dir --quiet $"($temp_dir)/archive.tar.xz"

  let path_prefix = get_or_create_path_prefix
  cp --recursive $"($temp_dir)/zig-($nu.os-info.name)-($nu.os-info.arch)-($version)" $"($path_prefix)/($version)"
  rm --recursive --permanent $temp_dir

  echo $"Successfully installed Zig ($version)"
}

# Make the zig symlink point to the specified version
export def "zvm use" [
  version: string # Version to use. Nightly version is expressed using one of these terms: master, dev or nightly.
] {
  let zig_to_use = find_installed_version_or_err $version
  if $zig_to_use.active {
    error make {
      msg: $"Version ($zig_to_use.version) is already in use."
      label: {
        text: $"Version ($version) is already targeted by symlink"
        span: (metadata $version).span
      }
    }
  }

  let path_prefix = get_or_create_path_prefix
  ln -sf $"($path_prefix)/($zig_to_use.version)/zig" $"($path_prefix)/zig"
  echo $"Successfully switched to Zig ($version)"
}

# Remove the specified version
export def "zvm remove" [
  version: string # Version to remove. Nightly version is expressed using one of these terms: master, dev or nightly.
] {
  let zig_to_remove = find_installed_version_or_err $version
  let path_prefix = get_or_create_path_prefix
  rm --recursive --permanent $"($path_prefix)/($zig_to_remove.version)"

  if $zig_to_remove.active {
    rm --permanent $"($path_prefix)/zig"
  }

  echo $"Successfully removed Zig ($zig_to_remove.version)"
}

def verify_signature [temp_dir: string, tarball: string] {
  http get $"($tarball).minisig" | save $"($temp_dir)/archive.tar.xz.minisig"

  let minisign_result = minisign -Vm $"($temp_dir)/archive.tar.xz" -P "RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U" | complete
  if $minisign_result.exit_code != 0 {
    error make {
      msg: $"Failed to verify archive signature. Temporary data left as is in ($temp_dir)."
      label: {
        text: "Received error from minisign verification"
        span: (metadata $minisign_result).span
      }
    }
  }
}

def get_or_create_path_prefix [] {
  let path_prefix = $"($nu.home-path)/.local/share/zvm"
  if not ($path_prefix | path exists) { mkdir $path_prefix }
  $path_prefix
}

def get_current_version [path_prefix: string] {
  let zig_path = $"($path_prefix)/zig"
  if ($zig_path | path exists) {
    ls -l $zig_path
    | where type == symlink
    | get 0.target
    | parse $"($path_prefix)/{current_version}/zig"
    | get 0.current_version
  } else {
    null
  }
}

def find_installed_version_or_err [version: string] {
  let actual_version = match $version {
    "master" | "dev" | "nightly" => (zvm info master | get version)
    _ => $version
  }

  let version_search_result = zvm list --system | where version == $actual_version
  if $version_search_result == [] {
    error make {
      msg: $"Version ($actual_version) is not installed."
      label: {
        text: $"Version ($version) not found on system"
        span: (metadata $version).span
      }
    }
  }

  $version_search_result | first
}
