# NOTE: This is meant to run with engine-q and not nushell yet
# It's still being tested. There will be bugs. :)

# REQUIREMENTS #
# you definitely need nerd fonts https://www.nerdfonts.com
# nerd fonts repo https://github.com/ryanoasis/nerd-fonts
# i use "FiraCode Nerd Font Mono" on mac
#
# you also must have the engine-q gstat plugin installed and registered

# ATTRIBUTION #
# A little fancier prompt with git information
# inspired by https://github.com/xcambar/purs
# inspired by https://github.com/IlanCosman/tide
# inspired by https://github.com/JanDeDobbeleer/oh-my-posh


# Abbreviate home path
def home_abbrev [os] {
    let is_home_in_path = ($env.PWD | str starts-with $nu.home-path)
    if ($is_home_in_path == $true) {
        if ($os == "Windows") {
            let home = ($nu.home-path | str find-replace -a '\\' '/')
            let pwd = ($env.PWD | str find-replace -a '\\' '/')
            $pwd | str find-replace $home '~'
        } else {
            $env.PWD | str find-replace $nu.home-path '~'
        }
    } else {
        $env.PWD | str find-replace -a '\\' '/'
    }
}

def path_abbrev_if_needed [apath term_width] {
    # probably shouldn't do coloring here but since we're coloring
    # only certain parts, it's kind of tricky to do it in another place
    let T = (ansi { fg: "#BCBCBC" bg: "#3465A4"}) # truncated
    let P = (ansi { fg: "#E4E4E4" bg: "#3465A4"}) # path
    let PB = (ansi { fg: "#E4E4E4" bg: "#3465A4" attr: b}) # path bold
    let R = (ansi reset)
    let red = (ansi red)

    if (($apath | str length) > ($term_width / 2)) {
        # split out by path separator into tokens
        # don't use psep here because in home_abbrev we're making them all '/'
        let splits = ($apath | split row '/')

        let splits_len = ($splits | length)
        let subtractor = (if ($splits_len <= 2) { 1 } else { 2 })
        # get all the tokens except the last
        let tokens = (for x in 1..($splits_len - $subtractor) {
            $"($T)(($splits | get $x | split chars) | get 0)($R)"
        })

        # need an insert command
        let tokens = ($tokens | prepend $"($T)~")

        # append the last part of the path
        let tokens = ($tokens | append $"($PB)($splits | last | get 0)($R)")

        # collect
        $tokens | str collect $"($T)/"
    } else {
        # $"($P)($apath)($R)"

        # FIXME: This is close but it fails with folder with space. I'm not sure why.
        # let splits = ($apath | split row '/')
        # let splits_len = ($splits | length)
        # let tokens = (for x in 0..($splits_len - 1) {
        #     if ($x < ($splits_len - 1)) {
        #         $"/($T)(($splits | get $x | split chars).0)($R)"
        #     }
        # })
        # let tokens = ($tokens | append $"/($PB)(($splits | last).0)($R)")
        # $tokens | str collect $"($T)"

        # FIXME: This is close but it fails with folder with space. I'm not sure why.
        # cd "/Applications/Hex Fiend.app/"
        #    ~/H/A/Hex Fiend.app 
        # should be
        #    ~/A/Hex Fiend.app 
        let splits = ($apath | split row '/')
        let splits_len = ($splits | length)
        if ($splits_len == 0) {
            # We're at / on the file system
            $"/($T)"
        } else if ($splits_len == 1) {
            let top_part = ($splits | first)
            let tokens = $"($PB)($top_part)($R)"
            $tokens | str collect $"($T)"
        } else {
            let top_part = ($splits | first ($splits_len - 1))
            let end_part = ($splits | last)
            let tokens = (for x in $top_part {
                $"/($T)(($x | split chars).0)($R)"
            })
            let tokens = ($tokens | append $"/($PB)($end_part.0)($R)")
            $tokens | str collect $"($T)"
        }
    }
}

def get_os_icon [os use_nerd_fonts] {
    # f17c = tux, f179 = apple, f17a = windows
    if ($use_nerd_fonts == $true) {
        if ($os =~ Darwin) {
            (char -u f179)
        } else if ($os =~ Linux) {
            (char -u f17c)
        } else if ($os =~ Windows) {
            (char -u f17a)
        } else {
            ''
        }
    } else {
        if ($os =~ Darwin) {
            "M"
        } else if ($os =~ Linux) {
            "L"
        } else if ($os =~ Windows) {
            "W"
        } else {
            ''
        }
    }
}

def get_left_prompt [os use_nerd_fonts] {
    # replace this 30 with whatever the width of the terminal is
    let display_path = (path_abbrev_if_needed (home_abbrev $os) 30)
    let R = (ansi reset)

    # some icons and the unicode char
    # e0b0   ▷ 25b7 ⏵ 23f5 ▶ 25b6 ⯈ 2bc8 🞂 1f782
    # e0b1
    # e0b2   ◁ 25c1 ⏴ 23f4 ◀ 25c0 ⯇ 2bc7 🞀 1f780
    # e0b3
    # f1d3
    # f07c or  f115 📁 1f4c1 🗀 1f5c0
    # f015 or  f7db 🏠 1f3e0 ⌂ 2302

    let TERM_BG = "#0C0C0C"
    let right_transition_nf = (char -u e0b0)
    # let right_transition = (char -u 1f782)
    let right_transition = ""
    let home_nf = (char -u f015)
    # let home = (char -u 1f3e0)
    let home = ""
    let folder_nf = (char -u f07c)
    # let folder = (char -u 1f5c0)
    let folder = ""

    # build segments and then put together the segments for the prompt
    let os_segment = ([
        (ansi { fg: "#080808" bg: "#CED7CF"})  # os bg color
        (char space)                           # space
        (get_os_icon $os $use_nerd_fonts)      # os icon
        (char space)                           # space
        (ansi { fg: "#CED7CF" bg: "#3465A4"})  # color transition
        (if ($use_nerd_fonts == $true) {
            $right_transition_nf               # 
        } else {
            $right_transition
        })
        (char space)                           # space
    ] | str collect)

    let is_home_in_path = ($env.PWD | str starts-with $nu.home-path)
    let path_segment = (if $is_home_in_path {
        [
        (if ($use_nerd_fonts == $true) {
            $home_nf                         #  home icon
        } else {
            $home
        })
        (char space)                           # space
        $display_path                        # ~/src/forks/nushell
        (ansi { fg: "#CED7CF" bg: "#3465A4"})  # color just to color the next space
        (char space)                           # space
        ] | str collect
    } else {
        [
        (if ($use_nerd_fonts == $true) {
            $folder_nf                        #  folder icon
        } else {
            $folder
        })
        (char space)                           # space
        $display_path                        # ~/src/forks/nushell
        (ansi { fg: "#CED7CF" bg: "#3465A4"})  # color just to color the next space
        (char space)                           # space
        ] | str collect
    })

    let indicator_segment = (
        [
        (ansi { fg: "#3465A4" bg: $TERM_BG}) # color
        (if ($use_nerd_fonts == $true) {
            $right_transition_nf             # 
        } else {
            # $right_transition
            " >"
        })
        ($R)                                   # reset color
        ] | str collect
    )

    # assemble all segments for final prompt printing
    [
        $os_segment
        $path_segment
        $indicator_segment
    ] | str collect
}

def get_right_prompt [os use_nerd_fonts] {
    # right prompt ideas
    # 1. just the time on the right
    # 2. date and time on the right
    # 3. git information on the right
    # 4. maybe git and time
    # 5. would like to get CMD_DURATION_MS going there too when it's implemented
    # 6. all of the above, chosen by def parameters

    let R = (ansi reset)
    let TIME_BG = "#D3D7CF"
    let TERM_FG = "#0C0C0C"
    let left_transition_nf = (char -u e0b2)
    # let left_transition = (char -u 1f780)
    let left_transition = ""

    let datetime_segment = ([
        (ansi { fg: $TIME_BG bg: $TERM_FG})
        (if ($use_nerd_fonts == $true) {
            $left_transition_nf     # 
        } else {
            $left_transition
        })
        (ansi { fg: $TERM_FG bg: $TIME_BG})
        (char space)
        (date now | date format '%m/%d/%Y %I:%M:%S%.3f')
        (char space)
        ($R)
    ] | str collect)

    let time_segment = ([
        (ansi { fg: $TIME_BG bg: $TERM_FG})
        (if ($use_nerd_fonts == $true) {
            $left_transition_nf # 
        } else {
            $left_transition
        })
        (ansi { fg: $TERM_FG bg: $TIME_BG})
        (char space)
        (date now | date format '%I:%M:%S %p')
        (char space)
        ($R)
    ] | str collect)

    # 1. datetime - working
    # $datetime_segment

    # 2. time only - working
    $time_segment

    # 3. git only - working
    # $git_segment

    # 4. git + time -> need to fix the transition
    # [
    #     $git_segment
    #     $time_segment
    # ] | str collect

    # 5. fernando wants this on the left prompt
    # [
    #     $os_segment
    #     $time_segment
    #     $path_segment
    # ]
}

export def get_prompt [nerd?] {
    let use_nerd_fonts = ($nerd != $nothing)
    let os = ((sys).host.name)
    let left_prompt = (get_left_prompt $os $use_nerd_fonts)
    let right_prompt = (get_right_prompt $os $use_nerd_fonts)

    # return in record literal syntax to be used kind of like a tuple
    # so we don't have to run this script more than once per prompt
    {
        left_prompt: $left_prompt
        right_prompt: $right_prompt
    }
    #
    # in the config.nu you would do something like
    # use "c:\some\path\to\nu_scripts\engine-q\prompt\oh-my-minimal.nu" get_prompt
    # let-env PROMPT_COMMAND = { (get_prompt).left_prompt }
    # let-env PROMPT_COMMAND_RIGHT = { (get_prompt).right_prompt }
    # let-env PROMPT_INDICATOR = " "
    # or with nerdfonts
    # let-env PROMPT_COMMAND = { (get_prompt 1).left_prompt }
    # let-env PROMPT_COMMAND_RIGHT = { (get_prompt 1).right_prompt }

}