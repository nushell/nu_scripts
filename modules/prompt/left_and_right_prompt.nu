# This is a work in progress. Not working yet but you can see where I'm going.
export def construct_prompt [] {
    # let decorator = (char prompt)
    let decorator = (create_second_line)

    # not using machine name
    # let machine_name = (sys host | get hostname)

    # the current working directory
    # let current_dir = (pwd)
    let current_dir = (home_abbrev)

    # the current bit branch
    # let git_status = (git -c core.quotepath=false -c color.status=false status -uall --short --branch)
    let git_info = (do -i { git rev-parse --abbrev-ref HEAD  } | str trim -c (char nl) | str join )

    # what to put in the title
    let title_bar = (set_title)

    # get the terminal width
    let term_width = (term size).columns

    # get the curren time
    let current_time = (date now | format date '%I:%M:%S%.3f %p')

    # let's construct the left and right prompt
    # the left side of the prompt with ansi colors
    let left_colored = $"(ansi gb)($current_dir)(ansi cb)(char lparen)($git_info)(char rparen)(ansi reset)"

    # the left prompt length without the ansi escapes
    let left_len = ($left_colored | ansi strip | str length)

    # the right side of the prompt with ansi colors
    let right_colored = $"(ansi blue)($env.CMD_DURATION_MS)|(ansi dark_gray)($current_time)(ansi reset)"

    # let's calcuate the length of the right prompt so we know how much to pad the left prompt
    let calculated_right_len = ($term_width - $left_len)
    # finally, let's make the prompt
    let the_prompt = $"($left_colored)($right_colored | fill -a r -c ' ' -w $calculated_right_len)(char newline)($decorator) "

    # let's update the title bar now
    print -n $title_bar

    # and last, but not least, let's print the prompt
    echo $the_prompt

    ## put this in your config.toml
    # prompt = "construct_prompt"

    ## also you need to source the file in your startup like
    # "source C:\\Users\\username\\source\\some\\folder\\nu_scripts\\prompt\\left_and_right_prompt.nu",
}

# Abbreviate home path
def home_abbrev [] {
    let is_home_in_path = (pwd | into string | str starts-with $nu.home-path)
    if $is_home_in_path {
        let lin_home = ($nu.home-path | into string | str replace -a '\\' '/' | str downcase)
        let lin_pwd = (pwd | into string | str replace -a '\\' '/' | str downcase)
        $lin_pwd | str replace $lin_home '~'
    } else {
        pwd
    }
}

# Get Git Info custom commands

def git_br [] {
    $"(ansi gb)(pwd)(ansi reset)(char lparen)(ansi cb)(do -i { git rev-parse --abbrev-ref HEAD  } | str trim -c (char nl) | str join)(ansi reset)(char rparen)(char newline)(ansi yb)(date now | format date '%m/%d/%Y %I:%M:%S%.3f %p')(ansi reset)¯\\_(char lparen)ツ)_/¯(char prompt) "
}

# Set Title String custom commands

def set_title_str [str_arg] {
    $"(ansi title) ($str_arg) (char bel)"
}

def get_abbrev_pwd_lin [] {
    home_abbrev | split row '/' | first (home_abbrev | split row '/' | length | each { $in - 1} ) | each { str substring 0..1 | $'($in)/' } | append (home_abbrev | split row '/' | last ) | str join
}
def set_title [] {
    set_title_str ([(get_abbrev_pwd_lin) ' ' (term size).columns 'x' (term size).rows ] | str join)
}
def create_second_line [] {
    [(ansi gb) (char -u "2514") (char -u "2500") ' $ ' (ansi cb) (char prompt) (ansi reset)] | str join
}
