# This is a work in progress. Not working yet but you can see where I'm going.
let decorator = '#'
let machine_name = $(sys | get host.hostname)
let current_dir = $(pwd)
let git_info = $(do -i { git rev-parse --abbrev-ref HEAD  } | str trim | str collect )
let title_bar = $(set_title)
let git_status = $(git -c core.quotepath=false -c color.status=false status -uall --short --branch)


# Get Git Info custom commands

def git_br [] {
    echo [ $(ansi gb) $(pwd) $(ansi reset) '(' $(ansi cb) $(do -i { git rev-parse --abbrev-ref HEAD  } | str trim | str collect ) $(ansi reset) ')' $(char newline) $(ansi yb) $(date now | date format '%m/%d/%Y %I:%M:%S%.3f %p') $(ansi reset) ' ¯\\_(ツ)_/¯ ' $(char prompt) ' '] | str collect
}

# Set Title String custom commands

def set_title_str [str-arg] {
    echo [$(ansi title) ' ' $str-arg ' ' $(ansi bel)] | str collect
}
def get_abbrev_pwd_win [] {
    echo [$(pwd | split row '\\' | first $(pwd | split row '\\' | count | each {= $it - 1} ) |  str substring '0,1' | format '{$it}/' | append $(pwd | split row '\\' | last ) | str collect)] | str collect
}
def get_abbrev_pwd_lin [] {
    echo [$(pwd | split row '/' | first $(pwd | split row '/' | count | each {= $it - 1} ) | each { str substring '0,1' | format '{$it}/' } | append $(pwd | split row '/' | last ) | str collect)] | str collect
}
def set_title [] {
    set_title_str $(echo $(get_abbrev_pwd_win))
}
