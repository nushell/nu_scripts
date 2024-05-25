# calculate required tabs/spaces to get a nicely aligned table
let tablen = 8
let max_len = (help commands | each { $in.name | str length } | math max)
let max_indent = ($max_len / $tablen | into int)

def pad-tabs [input_name] {
    let input_length = ($input_name | str length) 
    let required_tabs = $max_indent - ($input_length / $tablen | into int)
    seq 0 $required_tabs | reduce -f "" {|it, acc| $acc + (char tab)}
}

# fuzzy search a) commands b) subcommands
# on selection, will display `help` for the commands
# and paste command into clipboard for you to paste right away


def fuzzy-command-search [] {
    let command = ((help commands | each {|it|
        let name = ($it.name | str trim | ansi strip)
        $"($name)(pad-tabs $name)($it.usage)"
    }) | str join (char nl) | fzf | split column (char tab) | get column1.0)
    if ($command | is-not-empty) {
        $command | clip
        help $command
    }
}
