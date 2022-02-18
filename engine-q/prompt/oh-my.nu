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
    let is_home_in_path = ($nu.cwd | str starts-with $nu.home-path)
    if ($is_home_in_path == $true) {
        if ($os == "Windows") {
            let home = ($nu.home-path | str find-replace -a '\\' '/')
            let pwd = ($nu.cwd | str find-replace -a '\\' '/')
            $pwd | str find-replace $home '~'
        } else {
            $nu.cwd | str find-replace $nu.home-path '~'
        }
    } else {
        $nu.cwd | str find-replace -a '\\' '/'
    }
}

def path_abbrev_if_needed [apath term_width] {
    # probably shouldn't do coloring here but since we're coloring
    # only certain parts, it's kind of tricky to do it in another place
    let T = (ansi { fg: "#BCBCBC" bg: "#3465A4"}) # truncated
    let P = (ansi { fg: "#E4E4E4" bg: "#3465A4"}) # path
    let PB = (ansi { fg: "#E4E4E4" bg: "#3465A4" attr: b}) # path bold
    let R = (ansi reset)

    if (($apath | str length) > ($term_width / 2)) {
        # split out by path separator into tokens
        # don't use psep here because in home_abbrev we're making them all '/'
        let splits = ($apath | split row '/')

        let splits_len = ($splits | length)
        let subtractor = (if ($splits_len <= 2) { 1 } else { 2 })
        # get all the tokens except the last
        let tokens = (for x in 1..($splits_len - $subtractor) {
            $"($T)((($splits) | get $x | split chars) | get 0)($R)"
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

def get_index_change_count [gs] {
    let index_new = ($gs | get idx_added_staged)
    let index_modified = ($gs | get idx_modified_staged)
    let index_deleted = ($gs | get idx_deleted_staged)
    let index_renamed = ($gs | get idx_renamed)
    let index_typechanged = ($gs | get idx_type_changed)

    $index_new + $index_modified + $index_deleted + $index_renamed + $index_typechanged
}

def get_working_tree_count [gs] {
    let wt_modified = ($gs | get wt_modified)
    let wt_deleted = ($gs | get wt_deleted)
    let wt_typechanged = ($gs | get wt_type_changed)
    let wt_renamed = ($gs | get wt_renamed)

    $wt_modified + $wt_deleted + $wt_typechanged + $wt_renamed
}

def get_conflicted_count [gs] {
    ($gs | get conflicts)
}

def get_untracked_count [gs] {
    ($gs | get wt_untracked)
}

def get_branch_name [gs] {
    let br = ($gs | get branch)
    if $br == "no_branch" {
        ""
    } else {
        $br
    }
}

def get_ahead_count [gs] {
    ($gs | get ahead)
}

def get_behind_count [gs] {
    ($gs | get behind)
}

def get_icons_list [] {
    {
        AHEAD_ICON: (char branch_ahead), # "↑" 2191
        BEHIND_ICON: (char branch_behind), # "↓" 2193
        NO_CHANGE_ICON: (char branch_identical) # ≣ 2263
        HAS_CHANGE_ICON: "*",
        INDEX_CHANGE_ICON: "♦",
        WT_CHANGE_ICON: "✚",
        CONFLICTED_CHANGE_ICON: "✖",
        UNTRACKED_CHANGE_ICON: (char branch_untracked) # ≢ 2262
        INSERT_SYMBOL_ICON: "❯",
        HAMBURGER_ICON: (char hamburger) # "≡" 2261
        GITHUB_ICON: "", # f408
        BRANCH_ICON: (char nf_branch) # "" e0a0
        REBASE_ICON: "", # e728
        TAG_ICON: "" # f412
    }
}

def get_icon_by_name [name] {
    do -i { get_icons_list | get $name }
}

def get_os_icon [os] {
    # f17c = tux, f179 = apple, f17a = windows
    if ($os =~ Darwin) {
        (char -u f179)
    } else if ($os =~ Linux) {
        (char -u f17c)
    } else if ($os =~ Windows) {
        (char -u f17a)
    } else {
        ''
    }
}

# ╭─────────────────────┬───────────────╮
# │ idx_added_staged    │ 0             │ #INDEX_NEW
# │ idx_modified_staged │ 0             │ #INDEX_MODIFIED
# │ idx_deleted_staged  │ 0             │ #INDEX_DELETED
# │ idx_renamed         │ 0             │ #INDEX_RENAMED
# │ idx_type_changed    │ 0             │ #INDEX_TYPECHANGE
# │ wt_untracked        │ 0             │ #WT_NEW
# │ wt_modified         │ 0             │ #WT_MODIFIED
# │ wt_deleted          │ 0             │ #WT_DELETED
# │ wt_type_changed     │ 0             │ #WT_TYPECHANGE
# │ wt_renamed          │ 0             │ #WT_RENAMED
# │ ignored             │ 0             │
# │ conflicts           │ 0             │ #CONFLICTED
# │ ahead               │ 0             │
# │ behind              │ 0             │
# │ stashes             │ 0             │
# │ repo_name           │ engine-q      │
# │ tag                 │ no_tag        │
# │ branch              │ main          │
# │ remote              │ upstream/main │
# ╰─────────────────────┴───────────────╯

def get_repo_status [gs os] {
    # replace this 30 with whatever the width of the terminal is
    let display_path = (path_abbrev_if_needed (home_abbrev $os) 30)
    let branch_name = (get_branch_name $gs)
    let ahead_cnt = (get_ahead_count $gs)
    let behind_cnt = (get_behind_count $gs)
    let index_change_cnt = (get_index_change_count $gs)
    let wt_change_cnt = (get_working_tree_count $gs)
    let conflicted_cnt = (get_conflicted_count $gs)
    let untracked_cnt = (get_untracked_count $gs)
    let has_no_changes = (
        if ($index_change_cnt <= 0) &&
            ($wt_change_cnt <= 0) &&
            ($conflicted_cnt <= 0) &&
            ($untracked_cnt <= 0) {
                $true
        } else {
            $false
        }
    )

    let GIT_BG = "#C4A000"
    let GIT_FG = "#000000"
    # let TERM_BG = "#0C0C0C"

    # The multi-color fg colors are good if you just have a black background

    let AHEAD_ICON = (get_icon_by_name AHEAD_ICON)
    # let A_COLOR = (ansi { fg:"#00ffff" bg: ($GIT_BG) })
    let A_COLOR = (ansi { fg: ($GIT_FG) bg: ($GIT_BG) })

    let BEHIND_ICON = (get_icon_by_name BEHIND_ICON)
    # let B_COLOR = (ansi { fg:"#00ffff" bg: ($GIT_BG) })
    let B_COLOR = (ansi { fg: ($GIT_FG) bg: ($GIT_BG) })

    let INDEX_CHANGE_ICON = (get_icon_by_name INDEX_CHANGE_ICON)
    # let I_COLOR = (ansi { fg:"#00ff00" bg: ($GIT_BG) })
    let I_COLOR = (ansi { fg: ($GIT_FG) bg: ($GIT_BG) })

    let CONFLICTED_CHANGE_ICON = (get_icon_by_name CONFLICTED_CHANGE_ICON)
    # let C_COLOR = (ansi { fg:"#ff0000" bg: ($GIT_BG) })
    let C_COLOR = (ansi { fg: ($GIT_FG) bg: ($GIT_BG) })

    let WT_CHANGE_ICON = (get_icon_by_name WT_CHANGE_ICON)
    # let W_COLOR = (ansi { fg:"#ff00ff" bg: ($GIT_BG) })
    let W_COLOR = (ansi { fg: ($GIT_FG) bg: ($GIT_BG) })

    let UNTRACKED_CHANGE_ICON = (get_icon_by_name UNTRACKED_CHANGE_ICON)
    # let U_COLOR = (ansi { fg:"#ffff00" bg: ($GIT_BG) })
    let U_COLOR = (ansi { fg: ($GIT_FG) bg: ($GIT_BG) })

    let NO_CHANGE_ICON = (get_icon_by_name NO_CHANGE_ICON)
    # let N_COLOR = (ansi { fg:"#00ff00" bg: ($GIT_BG) })
    let N_COLOR = (ansi { fg: ($GIT_FG) bg: ($GIT_BG) })

    let HAS_CHANGE_ICON = (get_icon_by_name HAS_CHANGE_ICON)
    # let H_COLOR = (ansi { fg:"#ff0000" bg: ($GIT_BG) attr: b })
    let H_COLOR = (ansi { fg: ($GIT_FG) bg: ($GIT_BG) attr: b })

    let INSERT_SYMBOL_ICON = (get_icon_by_name INSERT_SYMBOL_ICON)
    # let S_COLOR = (ansi { fg:"#00ffff" bg: ($GIT_BG) })
    let S_COLOR = (ansi { fg: ($GIT_FG) bg: ($GIT_BG) })

    let R = (ansi reset)

    let repo_status = (
        $"(
            if ($ahead_cnt > 0) { $'($A_COLOR)($AHEAD_ICON)($ahead_cnt)($R)' }
        )(
            if ($behind_cnt > 0) { $'($B_COLOR)($BEHIND_ICON)($behind_cnt)($R)' }
        )(
            if ($index_change_cnt > 0) { $'($I_COLOR)($INDEX_CHANGE_ICON)($index_change_cnt)($R)' }
        )(
            if ($conflicted_cnt > 0) { $'($C_COLOR)($CONFLICTED_CHANGE_ICON)($conflicted_cnt)($R)' }
        )(
            if ($wt_change_cnt > 0) { $'($W_COLOR)($WT_CHANGE_ICON)($wt_change_cnt)($R)' }
        )(
            if ($untracked_cnt > 0) { $'($U_COLOR)($UNTRACKED_CHANGE_ICON)($untracked_cnt)($R)' }
        )(
            if ($has_no_changes == $true) { $'($N_COLOR)($NO_CHANGE_ICON)($R)' } else { $'($H_COLOR)($HAS_CHANGE_ICON)($R)' }
        )"
    )

    $repo_status
}

def git_left_prompt [gs os] {
    # replace this 30 with whatever the width of the terminal is
    let display_path = (path_abbrev_if_needed (home_abbrev $os) 30)
    let branch_name = (get_branch_name $gs)
    let R = (ansi reset)

    # when reduce is available
    # echo "one" "two" "three" | reduce { if ($acc | str starts-with 't') { $acc + $it } { $it }}

    # some icons and the unicode char
    # e0b0
    # e0b1
    # e0b2
    # e0b3
    # f1d3
    # f07c or  f115
    # f015 or  f7db

    let GIT_BG = "#C4A000"
    let GIT_FG = "#000000"
    let TERM_BG = "#0C0C0C"

    let repo_status = (get_repo_status $gs $os)

    # build segments and then put together the segments for the prompt
    let os_segment = ([
        (ansi { fg: "#080808" bg: "#CED7CF"})  # os bg color
        (char space)                           # space
        (get_os_icon $os)                      # os icon
        (char space)                           # space
        (ansi { fg: "#CED7CF" bg: "#3465A4"})  # color transition
        (char -u e0b0)                         # 
        (char space)                           # space
    ] | str collect)

    let is_home_in_path = ($nu.cwd | str starts-with $nu.home-path)
    let path_segment = (if (($is_home_in_path) && ($branch_name == "")) {
        [
        (char -u f015)                         #  home icon
        (char space)                           # space
        $display_path                        # ~/src/forks/nushell
        (ansi { fg: "#CED7CF" bg: "#3465A4"})  # color just to color the next space
        (char space)                           # space
        ] | str collect
    } else {
        [
        (char -u f07c)                         #  folder icon
        (char space)                           # space
        $display_path                        # ~/src/forks/nushell
        (ansi { fg: "#CED7CF" bg: "#3465A4"})  # color just to color the next space
        (char space)                           # space
        ] | str collect
    })

    let git_segment = (if ($branch_name != "") {
        [
        (ansi { fg: "#3465A4" bg: "#4E9A06"})  # color
        (char -u e0b0)                         # 
        (char space)                           # space
        (ansi { fg: $TERM_BG bg: "#4E9A06"}) # color
        # (char -u f1d3)                         # 
        (char -u e0a0)                         # 
        (char space)                           # space
        ($branch_name)                         # main
        (char space)                           # space
        (ansi { fg: "#4E9A06" bg: $GIT_BG})  # color
        (char -u e0b0)                         # 
        (char space)                           # space
        ($R)                                   # reset color
        $repo_status                         # repo status
        ] | str collect
    })

    let git_right = $false
    let indicator_segment = (if ($branch_name == "" || $git_right == $true) {
        [
        (ansi { fg: "#3465A4" bg: $TERM_BG}) # color
        (char -u e0b0)                         # 
        ($R)                                   # reset color
        ] | str collect
    } else {
        [
        (ansi { fg: $GIT_BG bg: $TERM_BG}) # color
        (char -u e0b0)                         # 
        ($R)                                   # reset color
        ] | str collect
    })

    # assemble all segments for final prompt printing
    [
        $os_segment
        $path_segment
        (if ($git_right == $false) {
            $git_segment
        })
        $indicator_segment
    ] | str collect
}

def git_right_prompt [gs os] {
    # right prompt ideas
    # 1. just the time on the right
    # 2. date and time on the right
    # 3. git information on the right
    # 4. maybe git and time
    # 5. would like to get CMD_DURATION_MS going there too when it's implemented
    # 6. all of the above, chosen by def parameters

    let branch_name = (get_branch_name $gs)
    let repo_status = (get_repo_status $gs $os)
    let R = (ansi reset)
    let TIME_BG = "#D3D7CF"
    let TERM_FG = "#0C0C0C"
    let GIT_BG = "#C4A000"
    let GIT_FG = "#000000"
    let TERM_BG = "#0C0C0C"

    let datetime_segment = ([
        (ansi { fg: $TIME_BG bg: $TERM_FG})
        (char -u e0b2)     # 
        (ansi { fg: $TERM_FG bg: $TIME_BG})
        (char space)
        (date now | date format '%m/%d/%Y %I:%M:%S%.3f')
        (char space)
        ($R)
    ] | str collect)

    let time_segment = ([
        (ansi { fg: $TIME_BG bg: $TERM_FG})
        (char -u e0b2)     # 
        (ansi { fg: $TERM_FG bg: $TIME_BG})
        (char space)
        (date now | date format '%I:%M:%S %p')
        (char space)
        ($R)
    ] | str collect)

    let git_segment = (if ($branch_name != "") {
        [
        (ansi { fg: $GIT_BG bg: $TERM_BG})   # color
        (char -u e0b2)                       # 
        (ansi { fg: $TERM_FG bg: $GIT_BG})   # color
        (char space)                         # space
        $repo_status                         # repo status
        (ansi { fg: $TERM_FG bg: $GIT_BG})   # color
        (char space)
        (ansi { fg: "#4E9A06" bg: $GIT_BG }) # color
        (char -u e0b2)                       # 
        (ansi { fg: $TERM_BG bg: "#4E9A06"}) # color
        (char space)                         # space
        # (char -u f1d3)                       # 
        # (char -u e0a0)                       # 
        (char nf_git_branch)                 # 
        (char space)                         # space
        $branch_name                         # main
        (char space)                         # space
        ($R)                                 # reset color
        ] | str collect
    })

    let execution_time_segment = (
        [
            (ansi { fg: "#606060" bg: "#191323"})
            (char -u e0b3)
            (char space)
            $env.CMD_DURATION_MS
            (char space)
            ($R)
        ] | str collect
    )

    # 1. datetime - working
    # $datetime_segment

    # 2. time only - working
    [
        $execution_time_segment
        $time_segment
    ] | str collect

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

export def git_prompt [] {
    let gs = (gstat)
    let os = ((sys).host.name)
    let left_prompt = (git_left_prompt $gs $os)
    let right_prompt = (git_right_prompt $gs $os)

    # return in record literal syntax to be used kind of like a tuple
    # so we don't have to run this script more than once per prompt
    {
        left_prompt: $left_prompt
        right_prompt: $right_prompt
    }
    #
    # in the config.nu you would do something like
    # use "c:\some\path\to\nu_scripts\engine-q\prompt\oh-my.nu" git_prompt
    # let-env PROMPT_COMMAND = { (git_prompt).left_prompt }
    # let-env PROMPT_COMMAND_RIGHT = { (git_prompt).right_prompt }
    # let-env PROMPT_INDICATOR = " "
}