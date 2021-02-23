# This is a work in progress. Not working yet but you can see where I'm going.
def construct_prompt [] {
    let decorator = $(char prompt)
    let machine_name = $(sys | get host.hostname)
    let current_dir = $(pwd)
    let git_info = $(do -i { git rev-parse --abbrev-ref HEAD  } | str trim | str collect )
    let title_bar = $(set_title)
    let git_status = $(git -c core.quotepath=false -c color.status=false status -uall --short --branch)
    let term_width = $(term size -w)
    let current_time = $(date now | date format '%I:%M:%S%.3f %p')

    let left_colored = $(build-string $(ansi gb) $current_dir $(ansi cb) '(' $git_info ')' $(ansi reset))
    let left_len = $(echo $left_colored | ansi strip | str length)
    let right_colored = $(build-string $(ansi blue) $(echo $nu.env.CMD_DURATION) '|' $(ansi yb) $current_time $(ansi reset))
    let right_colored_len = $(echo $right_colored | str length)
    let right_len = $(echo $right_colored | ansi strip | str length)
    let calculated_right_len = $(= $term_width - $left_len + ($right_colored_len - $right_len))
    let the_prompt = $(build-string $left_colored $(echo $right_colored | str lpad -c ' ' -l $calculated_right_len) $(char newline) $decorator ' ')

    # let left = $(build-string $current_dir '(' $git_info ')')
    # let right = $(build-string $current_time)
    # let the_prompt = $(build-string $left $(echo $right | str lpad -c ' ' -l $(= $term_width - $(echo $left | str length))) $(char newline) $decorator ' ')

    echo $the_prompt | str collect

    ## put this in your config.toml
    # prompt = "construct_prompt"
}

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
