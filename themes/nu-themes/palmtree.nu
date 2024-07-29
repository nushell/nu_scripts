# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c574dd'
        block: '#8897f4'
        cell-path: '#fdfdfd'
        closure: '#79e6f3'
        custom: '#bebec1'
        duration: '#f2a272'
        float: '#ff4971'
        glob: '#bebec1'
        int: '#c574dd'
        list: '#79e6f3'
        nothing: '#f37f97'
        range: '#f2a272'
        record: '#79e6f3'
        string: '#5adecd'

        bool: {|| if $in { '#3fdcee' } else { '#f2a272' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f37f97' attr: 'b' }
            } else if $in < 6hr {
                '#f37f97'
            } else if $in < 1day {
                '#f2a272'
            } else if $in < 3day {
                '#5adecd'
            } else if $in < 1wk {
                { fg: '#5adecd' attr: 'b' }
            } else if $in < 6wk {
                '#79e6f3'
            } else if $in < 52wk {
                '#8897f4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#fdfdfd'
            } else if $e < 1mb {
                '#79e6f3'
            } else {{ fg: '#8897f4' }}
        }

        shape_and: { fg: '#c574dd' attr: 'b' }
        shape_binary: { fg: '#c574dd' attr: 'b' }
        shape_block: { fg: '#8897f4' attr: 'b' }
        shape_bool: '#3fdcee'
        shape_closure: { fg: '#79e6f3' attr: 'b' }
        shape_custom: '#5adecd'
        shape_datetime: { fg: '#79e6f3' attr: 'b' }
        shape_directory: '#79e6f3'
        shape_external: '#79e6f3'
        shape_external_resolved: '#3fdcee'
        shape_externalarg: { fg: '#5adecd' attr: 'b' }
        shape_filepath: '#79e6f3'
        shape_flag: { fg: '#8897f4' attr: 'b' }
        shape_float: { fg: '#ff4971' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#79e6f3' attr: 'b' }
        shape_globpattern: { fg: '#79e6f3' attr: 'b' }
        shape_int: { fg: '#c574dd' attr: 'b' }
        shape_internalcall: { fg: '#79e6f3' attr: 'b' }
        shape_keyword: { fg: '#c574dd' attr: 'b' }
        shape_list: { fg: '#79e6f3' attr: 'b' }
        shape_literal: '#8897f4'
        shape_match_pattern: '#5adecd'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f37f97'
        shape_operator: '#f2a272'
        shape_or: { fg: '#c574dd' attr: 'b' }
        shape_pipe: { fg: '#c574dd' attr: 'b' }
        shape_range: { fg: '#f2a272' attr: 'b' }
        shape_raw_string: { fg: '#bebec1' attr: 'b' }
        shape_record: { fg: '#79e6f3' attr: 'b' }
        shape_redirection: { fg: '#c574dd' attr: 'b' }
        shape_signature: { fg: '#5adecd' attr: 'b' }
        shape_string: '#5adecd'
        shape_string_interpolation: { fg: '#79e6f3' attr: 'b' }
        shape_table: { fg: '#8897f4' attr: 'b' }
        shape_vardecl: { fg: '#8897f4' attr: 'u' }
        shape_variable: '#c574dd'

        foreground: '#b043d1'
        background: '#282a36'
        cursor: '#3fdcee'

        empty: '#8897f4'
        header: { fg: '#5adecd' attr: 'b' }
        hints: '#666979'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#5adecd' attr: 'b' }
        search_result: { fg: '#f37f97' bg: '#fdfdfd' }
        separator: '#fdfdfd'
    }
}

# Update the Nushell configuration
export def --env "set color_config" [] {
    $env.config.color_config = (main)
}

# Update terminal colors
export def "update terminal" [] {
    let theme = (main)

    # Set terminal colors
    let osc_screen_foreground_color = '10;'
    let osc_screen_background_color = '11;'
    let osc_cursor_color = '12;'
        
    $"
    (ansi -o $osc_screen_foreground_color)($theme.foreground)(char bel)
    (ansi -o $osc_screen_background_color)($theme.background)(char bel)
    (ansi -o $osc_cursor_color)($theme.cursor)(char bel)
    "
    # Line breaks above are just for source readability
    # but create extra whitespace when activating. Collapse
    # to one line and print with no-newline
    | str replace --all "\n" ''
    | print -n $"($in)\r"
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

# Activate the theme when sourced
use activate