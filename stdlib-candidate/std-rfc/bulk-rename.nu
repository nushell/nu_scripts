# Rename bulk input files in parallel using a closure.
#
# The reason behind this command is quite simple:
# - Sometimes one receives a bunch of files with integer ids: 1, 2, 3, ...
# - These ids come rarely with padding... i.e. 1 instead of 001 when there are 3-digit ids
# - This means that file with id 9 will be sorted way after file with id 1000
#
# This command allows to do such a task!
#
# Examples:
#   Rename `.mise.toml` files to `.mise.local.toml` recursively
#   > glob **/.mise.toml | bulk-rename { str append .local }
#
#   Rename files in `/foo` with a name that has an id to have 3 digits with 0-padding
#   > ls /foo | bulk-rename { |path|
#      if $path.input.type == file {
#        $path.stem | parse "some_format_{id}"
#          | get 0
#          | update id { fill --alignment r --character 0 --width 3 }
#          | $"some_format_($in.id)"
#      }
#      # else skip dirs
#    }
export def main [
    update_stem: closure, # The code to rename the file stem: receives the old stem as input and a record param with both `stem` and `input` keys
    --verbose (-v), # Show which files were renamed, if any
    --no-execute (-n) # Do not make any changes; add --verbose to see what would be made
]: [list<any> -> nothing, list<any> -> table<old: path new: path>] {
    let renamed = par-each --keep-order { |input|
        let update_or_keep_stem = { |parts|
            do $update_stem { stem: $in input: $input } | default $parts.stem
        }
        let old = if ($input | describe) == string {
            $input
        } else {
            $input.name # convenience for ls
        }
        let new = $old | path parse | update stem $update_or_keep_stem | path join
        if $new != $old {
            if not $no_execute {
                mv --force --verbose=$verbose $old $new
            }
            { old: $old new: $new }
        }
    }
    if $verbose {
        $renamed
    }
}
