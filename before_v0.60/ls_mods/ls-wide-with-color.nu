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
def ls-wide2 [
    --dir(-d):any # The directory you want to list
    --columns(-c):int # The number of columns in your output
    ] {
    let is_dir_empty = ($dir | empty?)
    let is_columns_empty = ($columns | empty?)
    let ls_data = (if $is_dir_empty { ls } { ls $dir })
    let ansi_size = 9 # \x1b[36m + string + \x1b[0m, ~9 characters are added to each string for coloring
    let max_fname_size = ((echo $ls_data | get name | into string | str length | math max) + $ansi_size)
    let max_fsize_size = (echo $ls_data | get size | into string | str length | math max)
    # log (build-string 'max_fname_size=' $max_fname_size ' max_fsize_size=' $max_fsize_size)
    ($ls_data) | each -n { |file|
        let clr_file = (colorize $file.item.name)
        # log (build-string $clr_file ' ' $max_fname_size)
        let clr_size = (echo $file.item.size | into string)
        # log (build-string $clr_size ' ' $max_fsize_size)
        $"($clr_file | str rpad -c ' ' -l $max_fname_size) ($clr_size | str lpad -c ' ' -l $max_fsize_size) " | autoview
        if $is_columns_empty {
            if ($file.index + 1) mod 3 == 0 {
                echo (char newline) | autoview
            } {}
        } {
            if ($file.index + 1) mod $columns == 0 {
                echo (char newline) | autoview
            } {}
        }
    } | str collect
}

def colorize [thing:any] {
    let thing_as_string = (echo $thing | into string)
    let ext = (echo $thing_as_string | path parse | get extension)
    let is_empty = ($ext | empty?)

    if $is_empty {
        # build-string (ansi -e '36m') $thing (ansi -e '0m')
        $"(fg_cyan)($thing)(relet)"
        # build-string 'e[36m' $thing 'e[0m'
    } {
        if $ext == "nu" {
            # build-string (ansi -e '95m') $thing (ansi -e '0m')
            $"(fg_light_magenta)($thing)(relet)"
            # build-string 'e[95m' $thing 'e[0m'
        } {
            # build-string (ansi -e '92m') $thing (ansi -e '0m')
            $"(fg_light_green)($thing)(relet)"
            # build-string 'e[92m' $thing 'e[0m'
        }
    }
}

def colorit [] {
    # log "123"
    colorize 123
    # log "123.456"
    colorize " 123.456"
    # log "file.nu"
    colorize " file.nu"

    # These all work
    $"(fg_light_green)abc(relet)"
    $"(fg_cyan)def(relet)"
}

# This is a first attempt and some type of logging
def log [message:any] {
    let now = (date now | date format '%Y%m%d_%H%M%S.%f')
    let mess = $"($now)|DBG|($message)(char nl)"
    echo $mess | autoview
}