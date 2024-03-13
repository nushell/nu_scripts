# rename a bulk of files in a directory using a closure
#
# the reason behind this command is quite simple
# - sometimes one receives a bunch of files with integer ids: 1, 2, 3, ...
# - these ids come rarely with padding... i.e. 1 instead of 001 when there are 3-digit ids
# - this means that file with id 9 will be sorted way after file with id 1000
#
# this command allows to do such a task!
#
# # Examples
#     rename files in `/foo` with a name that has an id to have 3 digits with 0-padding
#     > file bulk-rename /foo {
#          parse "some_format_{id}"
#              | get 0
#              | update id { fill --alignment r --character 0 --width 3 }
#              | $"some_format_($in.id)"
#      }
export def "file bulk-rename" [
    directory: path, # the path where files need to be renamed in bulk
    stem_update: closure, # the code to run on the stem of the files: should start with parsing the format and end with reconstructing the same format
    --verbose, # be verbose when moving the files around
]: nothing -> nothing {
    ls --full-paths $directory | insert new {|row|
        $row.name | path parse | update stem $stem_update | path join
    }
    | each {
        if $verbose {
            mv --force --verbose $in.name $in.new
        } else {
            mv --force $in.name $in.new
        }
    }

    null
}
