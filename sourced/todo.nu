# (See TODO.md for more details)

# This first command looks for the file with the todo list and
# prints it to the screen.
def --env printer [] {
    let contents = (
        # if you haven't setup this environment var,
        # replace `$env.TODO` with the path to your 
        # `todo.txt`
        open $env.TODO
          | split row "\n"
          | take (($in | length) - 1)
          | each {|$it, n| $"($n + 1) (ansi red)->(ansi reset) ($it)"}
          | str join "\n"
    )

   # change the message to print what you want
   if $contents == "" {
     echo $"\n(ansi lgb)Everything's been done!!! Yay!!!(ansi reset)\n"
   } else {
     echo $"\n(ansi lgb)You promised to do these(ansi reset)\n($contents)"
   }
}

printer  # don't forget to call it here, so that it gets run automatically

# This command is used to update you todo-list, and should ideally be
# sourced in your `config.nu`
def todo [
    --edit(-e)           # edit todo manually
    --add(-a): string    # add item
    --remove(-r): int    # remove an item using its number
    --clear(-c)          # clear the list
] {
    def get_todo [] {
        # if you haven't setup this environment var,
        # replace `$env.TODO` with the path to your 
        # `todo.txt`
        open $env.TODO  
            | split row "\n"
            | take (($in | length) - 1)
    }

    def todo_add [todo: string] {
        get_todo 
            | reverse
            | $in ++ [$todo]
            | reverse
            | save $env.TODO -f
    }

    def todo_rm [num: int] {
        get_todo
            | reverse
            # change ($num - 1) to $num to have zero-based indexing
            | where {|it, n| $n != ($num - 1) }
            | reverse
            | save $env.TODO -f
    }

    if $edit {
        clear
        vim $env.TODO         # replace `vim` with your favorite editor
    } else if ($add != null) {
        clear
        todo_add $add | todo
    } else if ($remove != null) {
        clear
        todo_rm $remove | todo
    } else if $clear { 
        clear
        # change the message to print what you want
        "" | save $env.TODO -f | echo $"(ansi lgb)todo cleared!!!"
    } else {
        clear
        printer
    }
}
