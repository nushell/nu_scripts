# See the readme for how to use this script
# modes
# * 8bit
# * 24bit
const color_mode = "8bit"

# setup separate characters
const left_prompt_separator_diff_color = (char -u 'e0b0')
const left_prompt_separator_same_color = (char -u 'e0b1')
const right_prompt_separator_diff_color = (char -u 'e0b2')
const right_prompt_separator_same_color = (char -u 'e0b3')

# setup color variables for 24bit and 8bit
# prompt
const prompt_color_frame_and_connection_24 = (ansi -e { fg: "#6C6C6C" })
const prompt_color_separator_same_color_24 = (ansi -e { fg: "#949494" })
const prompt_color_frame_and_connection_8 = $"(ansi idx_fg)242m"
const prompt_color_separator_same_color_8 = $"(ansi idx_fg)246m"
const prompt_add_new_line_before = false
const prompt_color_frame_and_connection = ""
const prompt_color_separator_same_color = ""

const left_separator_diff_color = ""
const left_separator_same_color = ""
const left_items = []
const left_prefix = ""
const left_suffix = ""

const right_separator_diff_color = ""
const right_separator_same_color = ""
const right_items = []
const right_prefix = ""
const right_suffix = ""

# cmd
const cmd_duration_bg_color_24 = (ansi -e { bg: "#C4A000" })
const cmd_duration_color_24 = (ansi -e { fg: "#000000" })
const cmd_duration_bg_color_8 = $"(ansi idx_bg)178m"
const cmd_duration_color_8 = $"(ansi idx_fg)16m"
const cmd_bg_color = ""
const cmd_color = ""
const cmd_decimals = 2
const cmd_icon = ""

# git
const git_bg_color_24 = (ansi -e { bg: "#4E9A06" })
const git_bg_color_unstable_24 = (ansi -e { bg: "#C4A000" })
const git_bg_color_urgent_24 = (ansi -e { bg: "#CC0000" })
const git_color_branch_24 = (ansi -e { fg: "#000000" })
const git_color_conflicted_24 = (ansi -e { fg: "#000000" })
const git_color_dirty_24 = (ansi -e { fg: "#000000" })
const git_color_operation_24 = (ansi -e { fg: "#000000" })
const git_color_staged_24 = (ansi -e { fg: "#000000" })
const git_color_stash_24 = (ansi -e { fg: "#000000" })
const git_color_untracked_24 = (ansi -e { fg: "#000000" })
const git_color_upstream_24 = (ansi -e { fg: "#000000" })

const git_bg_color_8 = $"(ansi idx_bg)70m"
const git_bg_color_unstable_8 = $"(ansi idx_bg)178m"
const git_bg_color_urgent_8 = $"(ansi idx_bg)160m"
const git_color_branch_8 = $"(ansi idx_fg)16m"
const git_color_conflicted_8 = $"(ansi idx_fg)16m"
const git_color_dirty_8 = $"(ansi idx_fg)16m"
const git_color_operation_8 = $"(ansi idx_fg)16m"
const git_color_staged_8 = $"(ansi idx_fg)16m"
const git_color_stash_8 = $"(ansi idx_fg)16m"
const git_color_untracked_8 = $"(ansi idx_fg)16m"
const git_color_upstream_8 = $"(ansi idx_fg)16m"

const git_bg_color = ""
const git_bg_color_unstable = ""
const git_bg_color_urgent = ""
const git_color_branch = ""
const git_color_conflicted = ""
const git_color_dirty = ""
const git_color_operation = ""
const git_color_staged = ""
const git_color_stash = ""
const git_color_untracked = ""
const git_color_upstream = ""

# os
const os_bg_color_24 = (ansi -e { bg: "#CED7CF" })
const os_color_24 = (ansi -e { fg: "#080808" })
const os_bg_color_8 = $"(ansi idx_bg)188m"
const os_color_8 = $"(ansi idx_fg)232m"
const os_bg_color = ""
const os_color = ""

# pwd
const pwd_bg_color_24 = (ansi -e { bg: "#3465A4" })
const pwd_color_anchors_24 = (ansi -e { fg: "#E4E4E4" })
const pwd_color_dirs_24 = (ansi -e { fg: "#E4E4E4" })
const pwd_color_truncated_dirs_24 = (ansi -e { fg: "#BCBCBC" })

const pwd_bg_color_8 = $"(ansi idx_bg)61m"
const pwd_color_anchors_8 = $"(ansi idx_fg)254m"
const pwd_color_dirs_8 = $"(ansi idx_fg)254m"
const pwd_color_truncated_dirs_8 = $"(ansi idx_fg)250m"

const pwd_bg_color = ""
const pwd_color_anchors = ""
const pwd_color_dirs = ""
const pwd_color_truncated_dirs = ""
const pwd_icon = ""
const pwd_icon_home = ""
const pwd_icon_unwritable = ""
const pwd_markers = []

# rustc
const rustc_bg_color_24 = (ansi -e { bg: "#F74C00" })
const rustc_color_24 = (ansi -e { fg: "#000000" })
const rustc_bg_color_8 = $"(ansi idx_bg)202m"
const rustc_color_8 = $"(ansi idx_fg)16m"

const rustc_bg_color = ""
const rustc_color = ""
const rustc_icon = ""

# status
const status_bg_color_24 = (ansi -e { bg: "#2E3436" })
const status_bg_color_failure_24 = (ansi -e { bg: "#CC0000" })
const status_color_24 = (ansi -e { fg: "#4E9A06" })
const status_color_failure_24 = (ansi -e { fg: "#FFFF00" })

const status_bg_color_8 = $"(ansi idx_bg)236m"
const status_bg_color_failure_8 = $"(ansi idx_bg)160m"
const status_color_8 = $"(ansi idx_fg)70m"
const status_color_failure_8 = $"(ansi idx_fg)226m"

const status_bg_color = ""
const status_bg_color_failure = ""
const status_color = ""
const status_color_failure = ""
const status_icon = ""
const status_icon_failure = ""

# time
const time_bg_color_24 = (ansi -e { bg: "#D3D7CF" })
const time_color_24 = (ansi -e { fg: "#000000" })
const time_bg_color_8 = $"(ansi idx_bg)188m"
const time_color_8 = $"(ansi idx_fg)16m"

const time_bg_color = ""
const time_color = ""
const time_format = ""

# indicator
const indicator_color_24 = (ansi -e { fg: "#3465a4" })
const indicator_bg_color_24 = (ansi -e { bg: "#000000" })
const indicator_color_8 = $"(ansi idx_fg)61m"
const indicator_bg_color_8 = $"(ansi idx_bg)16m"

# terminal background color
const terminal_color_24 = (ansi -e { fg: "#c7c7c7" })
const terminal_color_8 = (ansi white)
const terminal_bg_color_24 = (ansi -e { bg: "#000000" })
const terminal_bg_color_8 = (ansi black)

# cmd_duration_ms
const cmd_duration_ms_color_24 = (ansi -e { fg: "#606060" })
const cmd_duration_ms_color_8 = $"(ansi idx_fg)244m"
const cmd_duration_ms_bg_color_24 = (ansi -e { fg: "#000000" })
const cmd_duration_ms_bg_color_8 = (ansi black)

const runtime_colors = [
    { name: prompt_color_frame_and_connection, '8bit': $prompt_color_frame_and_connection_8, '24bit': $prompt_color_frame_and_connection_24 },
    { name: prompt_color_separator_same_color, '8bit': $prompt_color_separator_same_color_8, '24bit': $prompt_color_separator_same_color_24 },
    { name: left_separator_diff_color, '8bit': $left_prompt_separator_diff_color, '24bit': $left_prompt_separator_diff_color },
    { name: left_separator_same_color, '8bit': $left_prompt_separator_same_color, '24bit': $left_prompt_separator_same_color },
    { name: left_prefix, value: null },
    { name: left_suffix, value: null },
    { name: right_separator_diff_color, '8bit': $right_prompt_separator_diff_color, '24bit': $right_prompt_separator_diff_color },
    { name: right_separator_same_color, '8bit': $right_prompt_separator_same_color, '24bit': $right_prompt_separator_same_color },
    { name: right_prefix, value: null },
    { name: right_suffix, value: null },

    { name: cmd_bg_color, '8bit': $cmd_duration_bg_color_8, '24bit': $cmd_duration_bg_color_24 },
    { name: cmd_color, '8bit': $cmd_duration_color_8, '24bit': $cmd_duration_color_24 },
    { name: cmd_decimals, value: 2 },
    { name: cmd_icon, value:  },

    { name: git_bg_color, '8bit': $git_bg_color_8, '24bit': $git_bg_color_24 },
    { name: git_bg_color_unstable, '8bit': $git_bg_color_unstable_8, '24bit': $git_bg_color_unstable_24 },
    { name: git_bg_color_urgent, '8bit': $git_bg_color_urgent_8 , '24bit': $git_bg_color_urgent_24 },
    { name: git_color_branch, '8bit': $git_color_branch_8, '24bit': $git_color_branch_24 },
    { name: git_color_conflicted, '8bit': $git_color_conflicted_8, '24bit': $git_color_conflicted_24 },
    { name: git_color_dirty, '8bit': $git_color_dirty_8, '24bit': $git_color_dirty_24 },
    { name: git_color_operation, '8bit': $git_color_operation_8, '24bit': $git_color_operation_24 },
    { name: git_color_staged, '8bit': $git_color_staged_8, '24bit': $git_color_staged_24 },
    { name: git_color_stash, '8bit': $git_color_stash_8, '24bit': $git_color_stash_24 },
    { name: git_color_untracked, '8bit': $git_color_untracked_8, '24bit': $git_color_untracked_24 },
    { name: git_color_upstream, '8bit': $git_color_upstream_8, '24bit': $git_color_upstream_24 },

    { name: os_bg_color, '8bit': $os_bg_color_8, '24bit': $os_bg_color_24 },
    { name: os_color, '8bit': $os_color_8, '24bit': $os_color_24 },

    { name: pwd_bg_color, '8bit': $pwd_bg_color_8, '24bit': $pwd_bg_color_24 },
    { name: pwd_color_anchors, '8bit': $pwd_color_anchors_8, '24bit': $pwd_color_anchors_24 },
    { name: pwd_color_dirs, '8bit': $pwd_color_dirs_8, '24bit': $pwd_color_dirs_24 },
    { name: pwd_color_truncated_dirs, '8bit': $pwd_color_truncated_dirs_8, '24bit': $pwd_color_truncated_dirs_24 },
    { name: pwd_icon, value: null },
    { name: pwd_icon_home, value: null },
    { name: pwd_icon_unwritable, value: null },

    { name: rustc_bg_color, '8bit': $rustc_bg_color_8, '24bit': $rustc_bg_color_24 },
    { name: rustc_color, '8bit': $rustc_color_8, '24bit': $rustc_color_24 },
    { name: rustc_icon, value:  },

    { name: status_bg_color, '8bit': $status_bg_color_8, '24bit': $status_bg_color_24 },
    { name: status_bg_color_failure, '8bit': $status_bg_color_failure_8, '24bit': $status_bg_color_failure_24 },
    { name: status_color, '8bit': $status_color_8, '24bit': $status_color_24 },
    { name: status_color_failure, '8bit': $status_color_failure_8 , '24bit': $status_color_failure_24 },
    { name: status_icon, value: null },
    { name: status_icon_failure, value: null },

    { name: time_bg_color, '8bit': $time_bg_color_8, '24bit': $time_bg_color_24 },
    { name: time_color, '8bit': $time_color_8, '24bit': $time_color_24 },
    { name: time_format, value: null },

    { name: indicator_bg_color, '8bit': $indicator_bg_color_8, '24bit': $indicator_bg_color_24 },
    { name: indicator_color, '8bit': $indicator_color_8, '24bit': $indicator_color_24 },

    { name: terminal_color, '8bit': $terminal_color_8, '24bit': $terminal_color_24 },
    { name: terminal_bg_color, '8bit': $terminal_bg_color_8, '24bit': $terminal_bg_color_24 },

    {name: cmd_duration_ms_color, '8bit': $cmd_duration_ms_color_8, '24bit': $cmd_duration_ms_color_24 },
    {name: cmd_duration_ms_bg_color, '8bit': $cmd_duration_ms_bg_color_8, '24bit': $cmd_duration_ms_bg_color_24 },
]

# get the color from the $runtime_colors array
def get_color [name, mode] {
    $runtime_colors | where name == $name | get $mode | get 0
}

######################################################

# Abbreviate home path for the prompt
def home_abbrev [os_name] {
    let is_home_in_path = ($env.PWD | str starts-with $nu.home-path)
    if $is_home_in_path {
        if ($os_name == "windows") {
            let home = ($nu.home-path | str replace -ar '\\' '/')
            let pwd = ($env.PWD | str replace -ar '\\' '/')
            $pwd | str replace $home '~'
        } else {
            $env.PWD | str replace $nu.home-path '~'
        }
    } else {
        $env.PWD | str replace -ar '\\' '/'
    }
}

# get the operating system icon for the prompt
def get_os_icon [os] {
    # f17c = tux, f179 = apple, f17a = windows
    if ($os.name =~ macos) {
        (char -u f179)
    } else if ($os.name =~ windows) {
        (char -u f17a)
    } else if ($os.kernel_version =~ WSL) {
        $'(char -u f17a)(char -u f17c)'
    } else if ($os.family =~ unix) {
        (char -u f17c)
    } else {
        ''
    }
}

# get the os segment for the prompt
def get_os_segment [os color_mode] {
    let os_bg_color = (get_color os_bg_color $color_mode)
    let os_color = (get_color os_color $color_mode)
    let os_icon = (get_os_icon $os)
    let transition_icon = $left_prompt_separator_diff_color
    let transition_bg_color = (get_color pwd_bg_color $color_mode)
    let transition_color = (get_color pwd_color_anchors $color_mode)

    let os_segment = (
    [
        ($os_color)
        ($os_bg_color)
        (char space)
        ($os_icon)
        (char space)
        ($transition_color)
        ($transition_bg_color)
        ($transition_icon)
        (char space)
    ] | str join
    )

    $os_segment
}

# get the path segment for the prompt
def get_path_segment [os color_mode] {
    let display_path = (home_abbrev $os.name)
    let is_home_in_path = ($env.PWD | str starts-with $nu.home-path)
    let pwd_bg_color = (get_color pwd_bg_color $color_mode)
    let pwd_color = (get_color pwd_color_dirs $color_mode)
    let home_or_folder = (if $is_home_in_path { (char nf_house1) } else { (char nf_folder1) })
    let path_segment = (
        [
            $home_or_folder
            (char space)                           # space
            $display_path                          # ~/src/forks/nushell
            ($pwd_color)
            ($pwd_bg_color)
            (char space)                           # space
        ] | str join
    )

    $path_segment
}

# get the indicator segment for the prompt
def get_indicator_segment [os color_mode] {
    let R = (ansi reset)
    let indicator_color = (get_color indicator_color $color_mode)
    let indicator_bg_color = (get_color indicator_bg_color $color_mode)
    let indicator_segment = (
        [
        ($indicator_color)
        ($indicator_bg_color)
        (char nf_segment)                         # 
        ($R)                                   # reset color
        ] | str join
    )

    $indicator_segment
}

# construct the left prompt
def get_left_prompt [os color_mode] {
    let os_segment = (get_os_segment $os $color_mode)
    let path_segment = (get_path_segment $os $color_mode)
    let indicator_segment = (get_indicator_segment $os $color_mode)
    $os_segment + $path_segment + $indicator_segment
}

# get the time segment for the prompt
def get_time_segment [os color_mode] {
    let R = (ansi reset)
    let time_bg_color = (get_color time_bg_color $color_mode)
    let time_color = (get_color time_color $color_mode)

    let time_segment = ([
        (ansi { fg: $time_bg_color bg: $time_color})
        (char nf_right_segment) #(char -u e0b2)     # 
        ($time_color)
        ($time_bg_color)
        (char space)
        (date now | format date '%I:%M:%S %p')
        (char space)
        ($R)
    ] | str join)

    $time_segment
}

# get the status segment for the prompt
def get_status_segment [os color_mode] {
    let R = (ansi reset)

    # set status bg color to foreground since bg is dark
    let fg_failure = (get_color status_bg_color_failure $color_mode)
    let term_bg_color = (get_color terminal_bg_color $color_mode)
    let cmd_dur_fg = (get_color cmd_duration_ms_color $color_mode)
    let cmd_dur_bg = (get_color cmd_duration_ms_bg_color $color_mode)

    let status_segment = (
        [
            (if $env.LAST_EXIT_CODE != 0 {
                (ansi { fg: $fg_failure bg: $term_bg_color })
            } else {
                (ansi { fg: $cmd_dur_fg bg: $cmd_dur_bg })
            })
            (char nf_right_segment_thin)
            (char space)
            $env.LAST_EXIT_CODE
            (char space)
            ($R)
        ] | str join
    )

    $status_segment
}

# get the execution segment for the prompt
def get_execution_time_segment [os color_mode] {
    let R = (ansi reset)
    let cmd_dur_fg = (get_color cmd_duration_ms_color $color_mode)
    let cmd_dur_bg = (get_color cmd_duration_ms_bg_color $color_mode)

    let execution_time_segment = (
        [
            ($cmd_dur_fg)
            ($cmd_dur_bg)
            # (ansi { fg: $cmd_dur_fg bg: $cmd_dur_bg })
            (char nf_right_segment_thin)
            (char space)
            $env.CMD_DURATION_MS
            (char space)
            ($R)
        ] | str join
    )

    $execution_time_segment
}

# construct the right prompt
def get_right_prompt [os color_mode] {
    let status_segment = (get_status_segment $os $color_mode)
    let execution_time_segment = (get_execution_time_segment $os $color_mode)
    let time_segment = (get_time_segment $os $color_mode)
    let exit_if = (if $env.LAST_EXIT_CODE != 0 { $status_segment })
    [$exit_if $execution_time_segment $time_segment] | str join
}

# constructe the left and right prompt by color_mode (8bit or 24bit)
def get_prompt [color_mode] {
    # modes = 8bit or 24bit
    # let os = ((sys).host)
    let os = $nu.os-info
    let left_prompt = (get_left_prompt $os $color_mode)
    let right_prompt = (get_right_prompt $os $color_mode)

    # return in record literal syntax to be used kind of like a tuple
    # so we don't have to run this script more than once per prompt
    {
        left_prompt: $left_prompt
        right_prompt: $right_prompt
    }
}
