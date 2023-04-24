# Nushell "Full Line" Prompt
# Fills the entire line above the prompt with "useful" info, creates an easy-to-read separation between commands outputs.
# Just the thing for portrait format terminal windows.
# This one includes working directory in the middle and has option for timestamp info on right.
# (many) other permutations are possible.
# You can play with this by `source full-line.nu` in an active shell.
# To enable permanently, modify your `env.nu` file; add `create_center_prompt` and modify `let-env PROMPT_COMMAND` line as shown here.
# TODO: revisit the below comment with fill
# Life made complicated by `str lpad` counting all the ansi sequences as visible, so it doesn't pad enough.

def create_center_prompt [] {
    let path_segment = if (is-admin) {
        $" (ansi red_bold)($env.PWD)(ansi reset) "
    } else {
        $" (ansi green_bold)($env.PWD)(ansi reset) "
    }
    let path_segment_visible_length = ($path_segment | ansi strip | str length)
    let path_segment_excess_length = ($path_segment | str length) - $path_segment_visible_length

    # to disable the right hand segment, change line below to be simply `let time_segment = ''`.
    let time_segment = $"(date now | date format ' %F %r')(ansi reset)"
    let time_segment_excess_length = ($time_segment | str length) - ($time_segment | ansi strip | str length)

    let path_segment_pad = ((((term size).columns + $path_segment_visible_length) / 2) | into int)
    let time_segment_pad = (term size).columns - $path_segment_pad

    let pad_char = '-'

    let segment = ([
        ( $path_segment | fill -w ($path_segment_pad + $path_segment_excess_length) -c $pad_char -a r),
        ( $time_segment | fill -w ($time_segment_pad + $time_segment_excess_length) -c $pad_char -a r)
        ] | str join)

    $segment
}

# For full width prompt we simply print the prompt line but throw away the value;
# Nushell displays PROMPT_INDICATOR in left hand column, leaving lots of room for long command lines.
let-env PROMPT_COMMAND = { print (create_center_prompt); }
# let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }
let-env PROMPT_COMMAND_RIGHT = ''

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

