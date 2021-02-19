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
    --columns(-c):int # The number of columns in your output
    ] {
    let is_empty = $(= $columns | empty?)
    let ls_data = $(ls)
    let ansi_size = 9 # \x1b[36m + string + \x1b[0m, ~9 characters are added to each string for coloring
    let max_fname_size = $(= $(echo $ls_data | get name | str from | str length | math max) + $ansi_size)
    let max_fsize_size = $(echo $ls_data | get size | str from | str length | math max)
    # log $(build-string 'max_fname_size=' $max_fname_size ' max_fsize_size=' $max_fsize_size)
    ls | each -n {
        let clr_file = $(colorize $it.item.name)
        # log $(build-string $clr_file ' ' $max_fname_size)
        let clr_size = $(echo $it.item.size | str from)
        # log $(build-string $clr_size ' ' $max_fsize_size)
        build-string $(echo $clr_file | str rpad -c ' ' -l $max_fname_size) ' ' $(echo $clr_size | str lpad -c ' ' -l $max_fsize_size) ' ' | autoview
        if $is_empty {
            if $(= $it.index + 1) mod 3 == 0 {
                echo $(char newline) | autoview
            } {}
        } {
            if $(= $it.index + 1) mod $columns == 0 {
                echo $(char newline) | autoview
            } {}
        }
    } | str collect
}

def colorize [thing:any] {
    let thing_as_string = $(echo $thing | str from)
    let ext = $(echo $thing_as_string | path extension)
    let is_empty = $(= $ext | empty?)

    if $is_empty {
        # build-string $(ansi -e '36m') $thing $(ansi -e '0m')
        build-string $(fg_cyan) $thing $(relet)
        # build-string 'e[36m' $thing 'e[0m'
    } {
        if $ext == "nu" {
            # build-string $(ansi -e '95m') $thing $(ansi -e '0m')
            build-string $(fg_light_magenta) $thing $(relet)
            # build-string 'e[95m' $thing 'e[0m'
        } {
            # build-string $(ansi -e '92m') $thing $(ansi -e '0m')
            build-string $(fg_light_green) $thing $(relet)
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
    build-string $(fg_light_green) "abc" $(relet)
    echo $(fg_cyan) "def" $(relet) | str collect
    #echo '|' $(fg_light_green) ' 0;92m ' $(relet) '| ' Green '  |' $(char newline) | str collect
}

# This is a first attempt and some type of logging
def log [
    message:any # Some log message
    ] {
    let now = $(date now | date format '%Y%m%d_%H%M%S.%f')
    let mess = $(build-string $now '|DBG|' $message $(char newline))
    echo $mess | autoview
}

