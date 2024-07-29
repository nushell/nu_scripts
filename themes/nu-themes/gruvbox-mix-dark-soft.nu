# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d3869b'
        block: '#80aa9e'
        cell-path: '#e2cca9'
        closure: '#8bba7f'
        custom: '#e2cca9'
        duration: '#e9b143'
        float: '#f2594b'
        glob: '#e2cca9'
        int: '#d3869b'
        list: '#8bba7f'
        nothing: '#f2594b'
        range: '#e9b143'
        record: '#8bba7f'
        string: '#b0b846'

        bool: {|| if $in { '#8bba7f' } else { '#e9b143' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f2594b' attr: 'b' }
            } else if $in < 6hr {
                '#f2594b'
            } else if $in < 1day {
                '#e9b143'
            } else if $in < 3day {
                '#b0b846'
            } else if $in < 1wk {
                { fg: '#b0b846' attr: 'b' }
            } else if $in < 6wk {
                '#8bba7f'
            } else if $in < 52wk {
                '#80aa9e'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e2cca9'
            } else if $e < 1mb {
                '#8bba7f'
            } else {{ fg: '#80aa9e' }}
        }

        shape_and: { fg: '#d3869b' attr: 'b' }
        shape_binary: { fg: '#d3869b' attr: 'b' }
        shape_block: { fg: '#80aa9e' attr: 'b' }
        shape_bool: '#8bba7f'
        shape_closure: { fg: '#8bba7f' attr: 'b' }
        shape_custom: '#b0b846'
        shape_datetime: { fg: '#8bba7f' attr: 'b' }
        shape_directory: '#8bba7f'
        shape_external: '#8bba7f'
        shape_external_resolved: '#8bba7f'
        shape_externalarg: { fg: '#b0b846' attr: 'b' }
        shape_filepath: '#8bba7f'
        shape_flag: { fg: '#80aa9e' attr: 'b' }
        shape_float: { fg: '#f2594b' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8bba7f' attr: 'b' }
        shape_globpattern: { fg: '#8bba7f' attr: 'b' }
        shape_int: { fg: '#d3869b' attr: 'b' }
        shape_internalcall: { fg: '#8bba7f' attr: 'b' }
        shape_keyword: { fg: '#d3869b' attr: 'b' }
        shape_list: { fg: '#8bba7f' attr: 'b' }
        shape_literal: '#80aa9e'
        shape_match_pattern: '#b0b846'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f2594b'
        shape_operator: '#e9b143'
        shape_or: { fg: '#d3869b' attr: 'b' }
        shape_pipe: { fg: '#d3869b' attr: 'b' }
        shape_range: { fg: '#e9b143' attr: 'b' }
        shape_raw_string: { fg: '#e2cca9' attr: 'b' }
        shape_record: { fg: '#8bba7f' attr: 'b' }
        shape_redirection: { fg: '#d3869b' attr: 'b' }
        shape_signature: { fg: '#b0b846' attr: 'b' }
        shape_string: '#b0b846'
        shape_string_interpolation: { fg: '#8bba7f' attr: 'b' }
        shape_table: { fg: '#80aa9e' attr: 'b' }
        shape_vardecl: { fg: '#80aa9e' attr: 'u' }
        shape_variable: '#d3869b'

        foreground: '#e2cca9'
        background: '#32302f'
        cursor: '#e2cca9'

        empty: '#80aa9e'
        header: { fg: '#b0b846' attr: 'b' }
        hints: '#32302f'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b0b846' attr: 'b' }
        search_result: { fg: '#f2594b' bg: '#e2cca9' }
        separator: '#e2cca9'
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