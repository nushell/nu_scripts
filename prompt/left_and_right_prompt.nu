# This is a work in progress. Not working yet but you can see where I'm going.
def construct_prompt [] {
    # let decorator = $(char prompt)
    let decorator = $(create_second_line)

    # not using machine name
    # let machine_name = $(sys | get host.hostname)

    # the current working directory
    # let current_dir = $(pwd)
    let current_dir = $(home_abbrev)

    # the current bit branch
    # let git_status = $(git -c core.quotepath=false -c color.status=false status -uall --short --branch)
    let git_info = $(do -i { git rev-parse --abbrev-ref HEAD  } | str trim | str collect )

    # what to put in the title
    let title_bar = $(set_title)

    # get the terminal width
    let term_width = $(term size -w)

    # get the curren time
    let current_time = $(date now | date format '%I:%M:%S%.3f %p')

    # let's construct the left and right prompt
    # the left side of the prompt with ansi colors
    let left_colored = $(build-string $(ansi gb) $current_dir $(ansi cb) '(' $git_info ')' $(ansi reset))

    # the left prompt length without the ansi escapes
    let left_len = $(echo $left_colored | ansi strip | str length)

    # the right side of the prompt with ansi colors
    let right_colored = $(build-string $(ansi blue) $(echo $nu.env.CMD_DURATION) '|' $(ansi dark_gray) $current_time $(ansi reset))

    # the right prompt length *with* ansi escapes (need this to determine how many escape chars there are)
    let right_colored_len = $(echo $right_colored | str length)

    # the right prompt length without the ansi escapes
    let right_len = $(echo $right_colored | ansi strip | str length)

    # let's calcuate the length of the right prompt so we know how much to pad the left prompt
    let calculated_right_len = $(= $term_width - $left_len + ($right_colored_len - $right_len))

    # finally, let's make the prompt
    let the_prompt = $(build-string $left_colored $(echo $right_colored | str lpad -c ' ' -l $calculated_right_len) $(char newline) $decorator ' ')

    # let's update the title bar now
    echo $title_bar

    # and last, but not least, let's print the prompt
    echo $the_prompt | str collect

    ## put this in your config.toml
    # prompt = "construct_prompt"

    ## also you need to source the file in your startup like
    # "source C:\\Users\\username\\source\\some\\folder\\nu_scripts\\prompt\\left_and_right_prompt.nu",
}

# Abbreviate home path
def home_abbrev [] {
    let is_home_in_path = $(echo $(pwd) | str starts-with $nu.home-dir)
    if $is_home_in_path {
        let lin-home = $(echo $nu.home-dir | str find-replace -a '\\' '/' | str downcase)
        let lin-pwd = $(echo $(pwd) | str find-replace -a '\\' '/' | str downcase)
        echo $lin-pwd | str find-replace $lin-home '~'
    } {
        echo $(pwd)
    }
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
    echo [$(pwd | split row '\' | first $(pwd | split row '\' | count | each {= $it - 1} ) |  str substring '0,1' | format '{$it}/' | append $(pwd | split row '\' | last ) | str collect)] | str collect
}
def get_abbrev_pwd_lin [] {
    # echo [$(pwd | split row '/' | first $(pwd | split row '/' | count | each {= $it - 1} ) | each { str substring '0,1' | format '{$it}/' } | append $(pwd | split row '/' | last ) | str collect)] | str collect
    echo [$(home_abbrev | split row '/' | first $(home_abbrev | split row '/' | count | each {= $it - 1} ) | each { str substring '0,1' | format '{$it}/' } | append $(home_abbrev | split row '/' | last ) | str collect)] | str collect
}
def set_title [] {
    set_title_str $(build-string $(get_abbrev_pwd_lin) ' ' $(term size -w) 'x' $(term size -t) | str collect)
}
def create_second_line [] {
    build-string $(ansi gb) $(char -u "2514") $(char -u "2500") ' $ ' $(ansi cb) $(char prompt) $(ansi reset)
}