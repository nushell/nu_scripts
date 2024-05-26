alias relet = ansi -e '0m' # really reset but there are external commands for reset already

alias fg_black = ansi -e '30m'
alias fg_red = ansi -e '31m'
alias fg_green = ansi -e '32m'
alias fg_yellow = ansi -e '33m'
alias fg_blue = ansi -e '34m'
alias fg_magenta = ansi -e '35m'
alias fg_purple = ansi -e '35m'
alias fg_cyan = ansi -e '36m'
alias fg_white = ansi -e '37m'

alias fg_dark_gray = ansi -e '90m'
alias fg_light_black = ansi -e '90m'
alias fg_light_red = ansi -e '91m'
alias fg_light_green = ansi -e '92m'
alias fg_light_yellow = ansi -e '93m'
alias fg_light_blue = ansi -e '94m'
alias fg_light_magenta = ansi -e '95m'
alias fg_light_purple = ansi -e '95m'
alias fg_light_cyan = ansi -e '96m'
alias fg_light_gray = ansi -e '97m'
alias fg_light_white = ansi -e '97m'

# A ls command that approximates the ls -sh command in bash
export def ls-wide2 [
    --dir(-d):any # The directory you want to list
    --columns(-c):int # The number of columns in your output
    ] {
    let is_dir_empty = ($dir | is-empty)
    let is_columns_empty = ($columns | is-empty)
    let ls_data = (if $is_dir_empty { ls } else { ls $dir })
    let max_fname_size = ($ls_data | get name | into string | str length | math max)
    let max_fsize_size = ($ls_data | get size | into string | str length | math max)
    ($ls_data) | enumerate | each { |file|
        let clr_file = (colorize $file.item.name)
        let clr_size = (echo $file.item.size | into string)
        let new_line = (if $is_columns_empty {
            if (($file.index + 1) mod 3) == 0 {
                char newline
            }
        } else {
            if (($file.index + 1) mod $columns) == 0 {
                char newline
            }
        })
        $"($clr_file | fill -a l -c ' ' -w $max_fname_size) ($clr_size | fill -a r -c ' ' -w $max_fsize_size) ($new_line)"
    } | str join
}

def colorize [thing:any] {
    let thing_as_string = (echo $thing | into string)
    let ext = (echo $thing_as_string | path parse | get extension)
    let is_empty = ($ext | is-empty)

    if $is_empty {
        $"(fg_cyan)($thing)(relet)"
    } else {
        if $ext == "nu" {
            $"(fg_light_magenta)($thing)(relet)"
        } else {
            $"(fg_light_green)($thing)(relet)"
        }
    }
}

def colorit [] {
    print (colorize 123)
    print (colorize " 123.456")
    print (colorize " file.nu")

    # These all work
    print $"(fg_light_green)abc(relet)"
    print $"(fg_cyan)def(relet)"
}
