# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9b59b6'
        block: '#3498db'
        cell-path: '#e0e0e0'
        closure: '#1abc9c'
        custom: '#ecf0f1'
        duration: '#f1c40f'
        float: '#e74c3c'
        glob: '#ecf0f1'
        int: '#9b59b6'
        list: '#1abc9c'
        nothing: '#e74c3c'
        range: '#f1c40f'
        record: '#1abc9c'
        string: '#2ecc71'

        bool: {|| if $in { '#1abc9c' } else { '#f1c40f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e74c3c' attr: 'b' }
            } else if $in < 6hr {
                '#e74c3c'
            } else if $in < 1day {
                '#f1c40f'
            } else if $in < 3day {
                '#2ecc71'
            } else if $in < 1wk {
                { fg: '#2ecc71' attr: 'b' }
            } else if $in < 6wk {
                '#1abc9c'
            } else if $in < 52wk {
                '#3498db'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e0e0e0'
            } else if $e < 1mb {
                '#1abc9c'
            } else {{ fg: '#3498db' }}
        }

        shape_and: { fg: '#9b59b6' attr: 'b' }
        shape_binary: { fg: '#9b59b6' attr: 'b' }
        shape_block: { fg: '#3498db' attr: 'b' }
        shape_bool: '#1abc9c'
        shape_closure: { fg: '#1abc9c' attr: 'b' }
        shape_custom: '#2ecc71'
        shape_datetime: { fg: '#1abc9c' attr: 'b' }
        shape_directory: '#1abc9c'
        shape_external: '#1abc9c'
        shape_external_resolved: '#1abc9c'
        shape_externalarg: { fg: '#2ecc71' attr: 'b' }
        shape_filepath: '#1abc9c'
        shape_flag: { fg: '#3498db' attr: 'b' }
        shape_float: { fg: '#e74c3c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1abc9c' attr: 'b' }
        shape_globpattern: { fg: '#1abc9c' attr: 'b' }
        shape_int: { fg: '#9b59b6' attr: 'b' }
        shape_internalcall: { fg: '#1abc9c' attr: 'b' }
        shape_keyword: { fg: '#9b59b6' attr: 'b' }
        shape_list: { fg: '#1abc9c' attr: 'b' }
        shape_literal: '#3498db'
        shape_match_pattern: '#2ecc71'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e74c3c'
        shape_operator: '#f1c40f'
        shape_or: { fg: '#9b59b6' attr: 'b' }
        shape_pipe: { fg: '#9b59b6' attr: 'b' }
        shape_range: { fg: '#f1c40f' attr: 'b' }
        shape_raw_string: { fg: '#ecf0f1' attr: 'b' }
        shape_record: { fg: '#1abc9c' attr: 'b' }
        shape_redirection: { fg: '#9b59b6' attr: 'b' }
        shape_signature: { fg: '#2ecc71' attr: 'b' }
        shape_string: '#2ecc71'
        shape_string_interpolation: { fg: '#1abc9c' attr: 'b' }
        shape_table: { fg: '#3498db' attr: 'b' }
        shape_vardecl: { fg: '#3498db' attr: 'u' }
        shape_variable: '#9b59b6'

        foreground: '#e0e0e0'
        background: '#2c3e50'
        cursor: '#e0e0e0'

        empty: '#3498db'
        header: { fg: '#2ecc71' attr: 'b' }
        hints: '#95a5a6'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#2ecc71' attr: 'b' }
        search_result: { fg: '#e74c3c' bg: '#e0e0e0' }
        separator: '#e0e0e0'
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