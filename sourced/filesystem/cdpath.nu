# You must set $env.CDPATH, try:
#
#     $env.CDPATH = [
#       ".",
#       "~",
#       "~/path/to/repositories",
#     ]
#
# The above $env.CDPATH will complete:
# * Entries under the current directory ($env.PWD)
# * Entries in your home directory ($env.HOME)
# * Entries where you check out repositories
# * Children of those entries
#
# This CDPATH implementation also completes absolute paths to help you use `c`
# instead of `cd`
#
# Bugs:
# * `c` does not complete paths that start with "~".  This should support both
#   directories ("~/.config/nu"), users ("~notme"), and both combined
#   ("~notme/.config/nu")
module cdpath {
  # $env.CDPATH with unique, expanded, existing paths
  def cdpath [] {
    $env.CDPATH
    | path expand
    | uniq
    | where {|| $in | path exists }
  }

  # Children of a path
  def children [path: string] {
    ls -a $path
    | where type == "dir"
    | get name
  }

  # Completion for `c`
  #
  # `contains` is used instead of `starts-with` to behave similar to fuzzy
  # completion behavior.
  #
  # During completion of a CDPATH entry the description contains the parent
  # directory you will complete under.  This allows you to tell which entry in
  # your CDPATH your are completing to if you have the same directory under
  # multiple entries.
  def complete [context: string] {
    let context_dir = $context | parse "c {context_dir}" | get context_dir | first
    let path = $context_dir | path split
    let no_trailing_slash = not ($context_dir | str ends-with "/")

    # completion with no context
    if ( $path | is-empty ) {
      complete_from_cdpath
    # Complete an entry in CDPATH
    #
    # This appends a / to allow continuation to the last step
    } else if $no_trailing_slash and (1 == ( $path | length )) {
      let first = $path | first

      complete_from_cdpath
      | where {|| $in.value | str contains $first }
      | upsert value {|| $"($in.value)/" }
    # Complete a child of a CDPATH entry
    } else {
      let prefix = if 1 == ($path | length) {
        $path | first
      } else {
        $path | first (($path | length) - 1) | path join
      }

      let last = if 1 == ($path | length) {
        ""
      } else {
        $path | last
      }

      let chosen_path = if ( $path | first) == "/" {
        if $no_trailing_slash {
          $prefix
        } else {
          $context_dir
        }
      } else {
        cdpath
        | each {||
          $in | path join $prefix
        }
        | where {||
          $in | path exists
        }
        | first
      }

      children $chosen_path
      | where {||
        $in | str contains $last
      }
      | each {|child|
        $"($chosen_path | path join $child)/"
      }
    }
  }

  def complete_from_cdpath [] {
    cdpath
    | each { |path|
      children $path
      | path basename
      | sort
      | each { |child| { value: $child, description: $path } }
    }
    | flatten
    | uniq-by value
  }

  # Change directory with $env.CDPATH
  export def --env c [dir = "": string@complete] {
    let span = (metadata $dir).span
      let default = if $nu.os-info.name == "windows" {
        $env.USERPROFILE
      } else {
        $env.HOME
      }

    let target_dir = if $dir == "" {
      $default
    } else if $dir == "-" {
      if "OLDPWD" in $env {
        $env.OLDPWD
      } else {
        $default
      }
    } else {
      cdpath
      | reduce -f "" { |$it, $acc|
        if $acc == "" {
          let new_path = ([$it $dir] | path join)
            if ($new_path | path exists) {
              $new_path
            } else {
              ""
            }
        } else {
          $acc
        }
      }
    }

    let target_dir = if $target_dir == "" {
      let cdpath = $env.CDPATH | str join ", "

      error make {
        msg: $"No such child under: ($cdpath)",
        label: {
          text: "Child directory",
          start: $span.start,
          end: $span.end,
        }
      }
    } else {
      $target_dir
    }

    cd $target_dir
  }
}

use cdpath c
