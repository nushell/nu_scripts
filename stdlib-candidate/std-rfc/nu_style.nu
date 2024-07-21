# This is a port of powershells $psstyle
# found here https://github.com/PowerShell/PowerShell/blob/5f3dd938b792e1a395fd011ac1461246db7c0e1f/src/System.Management.Automation/FormatAndOutput/common/PSStyle.cs

# Example Usage
# echo (fg_blue) Darren (relet) ' ' Schroeder | str collect
# More examples in the short_list.nu script

alias fmt_error = ansi -e '31;1m'
alias fmt_warning = ansi -e '33;1m'
alias fmt_verbose = ansi -e '33;1m'
alias fmt_debug = ansi -e '33;1m'
alias fmt_format_accent = ansi -e '32;1m'
alias fmt_error_accent = ansi -e '36;1m'

alias relet = ansi -e '0m' # really reset but there are external commands for reset already
alias blink_off = ansi -e '25m'
alias blink_on = ansi -e '5m'
alias bold_off = ansi -e '22m'
alias bold_on = ansi -e '1m'
alias hidden_on = ansi -e '8m'
alias hidden_off = ansi -e '28m'
alias reverse_on = ansi -e '7m'
alias reverse_off = ansi -e '27m'
alias italic_off = ansi -e '23m'
alias italic_on = ansi -e '3m'
alias underline_off = ansi -e '24m'
alias underline_on = ansi -e '4m'
alias strikethrough_off = ansi -e '29m'
alias strikethrough_on = ansi -e '9m'

# this doesn't work right. i need to have an (ansi escape) defined but i don't think there is one
#def format_hyperlink [link text] {echo [(ansi -o '8;;') $link '\' $text (ansi -o '8;;') '\'] | str collect }

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

# construct a rgb foreground color
def fg_from_rgb [
    red:int # red component 0-255
    green:int # green component 0-255
    blue:int # blue component 0-255
    ] {
        echo [(ansi -e '38;2;') $red ';' $green ';' $blue 'm'] | str join
    }

alias bg_black = ansi -e '40m'
alias bg_red = ansi -e '41m'
alias bg_green = ansi -e '42m'
alias bg_yellow = ansi -e '43m'
alias bg_blue = ansi -e '44m'
alias bg_magenta = ansi -e '45m'
alias bg_purple = ansi -e '45m'
alias bg_cyan = ansi -e '46m'
alias bg_white = ansi -e '47m'

alias bg_dark_gray = ansi -e '100m'
alias bg_light_black = ansi -e '100m'
alias bg_light_red = ansi -e '101m'
alias bg_light_green = ansi -e '102m'
alias bg_light_yellow = ansi -e '103m'
alias bg_light_magenta = ansi -e '105m'
alias bg_light_purple = ansi -e '105m'
alias bg_light_blue = ansi -e '104m'
alias bg_light_cyan = ansi -e '106m'
alias bg_light_gray = ansi -e '107m'
alias bg_light_white = ansi -e '107m'

alias bg_expand = ansi -e 'K'

# construct a rgb background color
def bg_from_rgb [
    red:int # red component 0-255
    green:int # green component 0-255
    blue:int # blue component 0-255
    ] {
        $"(ansi -e '48;2;')($red);($green);($blue)m"
    }

# Get a foreground color from an index value 0-255
def fg_from_index [
    idx:int # index value 0-255
] {
    $"(ansi -e '38;5;')($idx)m"
}

# Get a background color from an index value 0-255
def bg_from_index [
    idx:int # index value 0-255
] {
    $"(ansi -e '48;5;')($idx)m"
}
