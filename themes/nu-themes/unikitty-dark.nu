# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bb60ea'
        block: '#796af5'
        cell-path: '#bcbabe'
        closure: '#149bda'
        custom: '#f5f4f7'
        duration: '#dc8a0e'
        float: '#d8137f'
        glob: '#f5f4f7'
        int: '#bb60ea'
        list: '#149bda'
        nothing: '#d8137f'
        range: '#dc8a0e'
        record: '#149bda'
        string: '#17ad98'

        bool: {|| if $in { '#149bda' } else { '#dc8a0e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d8137f' attr: 'b' }
            } else if $in < 6hr {
                '#d8137f'
            } else if $in < 1day {
                '#dc8a0e'
            } else if $in < 3day {
                '#17ad98'
            } else if $in < 1wk {
                { fg: '#17ad98' attr: 'b' }
            } else if $in < 6wk {
                '#149bda'
            } else if $in < 52wk {
                '#796af5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bcbabe'
            } else if $e < 1mb {
                '#149bda'
            } else {{ fg: '#796af5' }}
        }

        shape_and: { fg: '#bb60ea' attr: 'b' }
        shape_binary: { fg: '#bb60ea' attr: 'b' }
        shape_block: { fg: '#796af5' attr: 'b' }
        shape_bool: '#149bda'
        shape_closure: { fg: '#149bda' attr: 'b' }
        shape_custom: '#17ad98'
        shape_datetime: { fg: '#149bda' attr: 'b' }
        shape_directory: '#149bda'
        shape_external: '#149bda'
        shape_external_resolved: '#149bda'
        shape_externalarg: { fg: '#17ad98' attr: 'b' }
        shape_filepath: '#149bda'
        shape_flag: { fg: '#796af5' attr: 'b' }
        shape_float: { fg: '#d8137f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#149bda' attr: 'b' }
        shape_globpattern: { fg: '#149bda' attr: 'b' }
        shape_int: { fg: '#bb60ea' attr: 'b' }
        shape_internalcall: { fg: '#149bda' attr: 'b' }
        shape_keyword: { fg: '#bb60ea' attr: 'b' }
        shape_list: { fg: '#149bda' attr: 'b' }
        shape_literal: '#796af5'
        shape_match_pattern: '#17ad98'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d8137f'
        shape_operator: '#dc8a0e'
        shape_or: { fg: '#bb60ea' attr: 'b' }
        shape_pipe: { fg: '#bb60ea' attr: 'b' }
        shape_range: { fg: '#dc8a0e' attr: 'b' }
        shape_raw_string: { fg: '#f5f4f7' attr: 'b' }
        shape_record: { fg: '#149bda' attr: 'b' }
        shape_redirection: { fg: '#bb60ea' attr: 'b' }
        shape_signature: { fg: '#17ad98' attr: 'b' }
        shape_string: '#17ad98'
        shape_string_interpolation: { fg: '#149bda' attr: 'b' }
        shape_table: { fg: '#796af5' attr: 'b' }
        shape_vardecl: { fg: '#796af5' attr: 'u' }
        shape_variable: '#bb60ea'

        foreground: '#bcbabe'
        background: '#2e2a31'
        cursor: '#bcbabe'

        empty: '#796af5'
        header: { fg: '#17ad98' attr: 'b' }
        hints: '#838085'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#17ad98' attr: 'b' }
        search_result: { fg: '#d8137f' bg: '#bcbabe' }
        separator: '#bcbabe'
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