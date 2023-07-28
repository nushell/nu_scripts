#!/usr/bin/env nu
use std log

# bump the minor or patch version of the Nushell project
def main [
    --patch: bool  # update the minor version instead of the minor
]: nothing -> nothing {
    let version = open Cargo.toml
        | get package.version
        | parse "{major}.{minor}.{patch}"
        | into int major minor patch
        | into record

    let new_version = if $patch {
        $version | update patch { $in + 1 }
    } else {
        $version | update minor { $in + 1 } | update patch { 0 }
    }

    let version = $version | transpose | get column1 | str join "."
    let new_version = $new_version | transpose | get column1 | str join "."

    log info $"bumping all packages and Nushell files in (open Cargo.toml | get package.name) from ($version) to ($new_version)"

    ls **/Cargo.toml | each {|file|
        log debug $"bumping ($file.name) from ($version) to ($new_version)"
        open --raw $file.name
            | str replace --all --string $'version = "($version)"' $'version = "($new_version)"'
            | save --force $file.name
    }

    let config_files = "crates"
        | path join "nu-utils" "src" "sample_config" "default_{config,env}.nu"
        | str expand

    $config_files | each {|file|
        log debug $"bumping ($file) from ($version) to ($new_version)"
        open --raw $file
            | str replace --all --string $'version = ($version)' $'version = ($new_version)'
            | save --force $file
    }

    null
}
