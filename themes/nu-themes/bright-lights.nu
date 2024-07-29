# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b975e6'
        block: '#75d3ff'
        cell-path: '#c1c8d6'
        closure: '#6cbeb5'
        custom: '#c1c8d6'
        duration: '#ffc150'
        float: '#ff355b'
        glob: '#c1c8d6'
        int: '#b975e6'
        list: '#6cbeb5'
        nothing: '#ff355b'
        range: '#ffc150'
        record: '#6cbeb5'
        string: '#b6e875'

        bool: {|| if $in { '#6cbeb5' } else { '#ffc150' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff355b' attr: 'b' }
            } else if $in < 6hr {
                '#ff355b'
            } else if $in < 1day {
                '#ffc150'
            } else if $in < 3day {
                '#b6e875'
            } else if $in < 1wk {
                { fg: '#b6e875' attr: 'b' }
            } else if $in < 6wk {
                '#6cbeb5'
            } else if $in < 52wk {
                '#75d3ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c1c8d6'
            } else if $e < 1mb {
                '#6cbeb5'
            } else {{ fg: '#75d3ff' }}
        }

        shape_and: { fg: '#b975e6' attr: 'b' }
        shape_binary: { fg: '#b975e6' attr: 'b' }
        shape_block: { fg: '#75d3ff' attr: 'b' }
        shape_bool: '#6cbeb5'
        shape_closure: { fg: '#6cbeb5' attr: 'b' }
        shape_custom: '#b6e875'
        shape_datetime: { fg: '#6cbeb5' attr: 'b' }
        shape_directory: '#6cbeb5'
        shape_external: '#6cbeb5'
        shape_external_resolved: '#6cbeb5'
        shape_externalarg: { fg: '#b6e875' attr: 'b' }
        shape_filepath: '#6cbeb5'
        shape_flag: { fg: '#75d3ff' attr: 'b' }
        shape_float: { fg: '#ff355b' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#6cbeb5' attr: 'b' }
        shape_globpattern: { fg: '#6cbeb5' attr: 'b' }
        shape_int: { fg: '#b975e6' attr: 'b' }
        shape_internalcall: { fg: '#6cbeb5' attr: 'b' }
        shape_keyword: { fg: '#b975e6' attr: 'b' }
        shape_list: { fg: '#6cbeb5' attr: 'b' }
        shape_literal: '#75d3ff'
        shape_match_pattern: '#b6e875'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff355b'
        shape_operator: '#ffc150'
        shape_or: { fg: '#b975e6' attr: 'b' }
        shape_pipe: { fg: '#b975e6' attr: 'b' }
        shape_range: { fg: '#ffc150' attr: 'b' }
        shape_raw_string: { fg: '#c1c8d6' attr: 'b' }
        shape_record: { fg: '#6cbeb5' attr: 'b' }
        shape_redirection: { fg: '#b975e6' attr: 'b' }
        shape_signature: { fg: '#b6e875' attr: 'b' }
        shape_string: '#b6e875'
        shape_string_interpolation: { fg: '#6cbeb5' attr: 'b' }
        shape_table: { fg: '#75d3ff' attr: 'b' }
        shape_vardecl: { fg: '#75d3ff' attr: 'u' }
        shape_variable: '#b975e6'

        foreground: '#b2c8d6'
        background: '#191919'
        cursor: '#f34a00'

        empty: '#75d3ff'
        header: { fg: '#b6e875' attr: 'b' }
        hints: '#191919'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b6e875' attr: 'b' }
        search_result: { fg: '#ff355b' bg: '#c1c8d6' }
        separator: '#c1c8d6'
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