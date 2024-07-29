# Retrieve the theme settings
export def main [] {
    return {
        binary: '#aa17e6'
        block: '#775dff'
        cell-path: '#6c696e'
        closure: '#149bda'
        custom: '#322d34'
        duration: '#dc8a0e'
        float: '#d8137f'
        glob: '#322d34'
        int: '#aa17e6'
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
                '#775dff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#6c696e'
            } else if $e < 1mb {
                '#149bda'
            } else {{ fg: '#775dff' }}
        }

        shape_and: { fg: '#aa17e6' attr: 'b' }
        shape_binary: { fg: '#aa17e6' attr: 'b' }
        shape_block: { fg: '#775dff' attr: 'b' }
        shape_bool: '#149bda'
        shape_closure: { fg: '#149bda' attr: 'b' }
        shape_custom: '#17ad98'
        shape_datetime: { fg: '#149bda' attr: 'b' }
        shape_directory: '#149bda'
        shape_external: '#149bda'
        shape_external_resolved: '#149bda'
        shape_externalarg: { fg: '#17ad98' attr: 'b' }
        shape_filepath: '#149bda'
        shape_flag: { fg: '#775dff' attr: 'b' }
        shape_float: { fg: '#d8137f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#149bda' attr: 'b' }
        shape_globpattern: { fg: '#149bda' attr: 'b' }
        shape_int: { fg: '#aa17e6' attr: 'b' }
        shape_internalcall: { fg: '#149bda' attr: 'b' }
        shape_keyword: { fg: '#aa17e6' attr: 'b' }
        shape_list: { fg: '#149bda' attr: 'b' }
        shape_literal: '#775dff'
        shape_match_pattern: '#17ad98'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d8137f'
        shape_operator: '#dc8a0e'
        shape_or: { fg: '#aa17e6' attr: 'b' }
        shape_pipe: { fg: '#aa17e6' attr: 'b' }
        shape_range: { fg: '#dc8a0e' attr: 'b' }
        shape_raw_string: { fg: '#322d34' attr: 'b' }
        shape_record: { fg: '#149bda' attr: 'b' }
        shape_redirection: { fg: '#aa17e6' attr: 'b' }
        shape_signature: { fg: '#17ad98' attr: 'b' }
        shape_string: '#17ad98'
        shape_string_interpolation: { fg: '#149bda' attr: 'b' }
        shape_table: { fg: '#775dff' attr: 'b' }
        shape_vardecl: { fg: '#775dff' attr: 'u' }
        shape_variable: '#aa17e6'

        foreground: '#6c696e'
        background: '#ffffff'
        cursor: '#6c696e'

        empty: '#775dff'
        header: { fg: '#17ad98' attr: 'b' }
        hints: '#a7a5a8'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#17ad98' attr: 'b' }
        search_result: { fg: '#d8137f' bg: '#6c696e' }
        separator: '#6c696e'
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