# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e68ac1'
        block: '#9985d1'
        cell-path: '#dedbeb'
        closure: '#aabae7'
        custom: '#edebf7'
        duration: '#eacac0'
        float: '#fb5c8e'
        glob: '#edebf7'
        int: '#e68ac1'
        list: '#aabae7'
        nothing: '#ed3f7f'
        range: '#eacac0'
        record: '#aabae7'
        string: '#a2baa8'

        bool: {|| if $in { '#c4d1f5' } else { '#eacac0' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ed3f7f' attr: 'b' }
            } else if $in < 6hr {
                '#ed3f7f'
            } else if $in < 1day {
                '#eacac0'
            } else if $in < 3day {
                '#a2baa8'
            } else if $in < 1wk {
                { fg: '#a2baa8' attr: 'b' }
            } else if $in < 6wk {
                '#aabae7'
            } else if $in < 52wk {
                '#9985d1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#dedbeb'
            } else if $e < 1mb {
                '#aabae7'
            } else {{ fg: '#9985d1' }}
        }

        shape_and: { fg: '#e68ac1' attr: 'b' }
        shape_binary: { fg: '#e68ac1' attr: 'b' }
        shape_block: { fg: '#9985d1' attr: 'b' }
        shape_bool: '#c4d1f5'
        shape_closure: { fg: '#aabae7' attr: 'b' }
        shape_custom: '#a2baa8'
        shape_datetime: { fg: '#aabae7' attr: 'b' }
        shape_directory: '#aabae7'
        shape_external: '#aabae7'
        shape_external_resolved: '#c4d1f5'
        shape_externalarg: { fg: '#a2baa8' attr: 'b' }
        shape_filepath: '#aabae7'
        shape_flag: { fg: '#9985d1' attr: 'b' }
        shape_float: { fg: '#fb5c8e' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#aabae7' attr: 'b' }
        shape_globpattern: { fg: '#aabae7' attr: 'b' }
        shape_int: { fg: '#e68ac1' attr: 'b' }
        shape_internalcall: { fg: '#aabae7' attr: 'b' }
        shape_keyword: { fg: '#e68ac1' attr: 'b' }
        shape_list: { fg: '#aabae7' attr: 'b' }
        shape_literal: '#9985d1'
        shape_match_pattern: '#a2baa8'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ed3f7f'
        shape_operator: '#eacac0'
        shape_or: { fg: '#e68ac1' attr: 'b' }
        shape_pipe: { fg: '#e68ac1' attr: 'b' }
        shape_range: { fg: '#eacac0' attr: 'b' }
        shape_raw_string: { fg: '#edebf7' attr: 'b' }
        shape_record: { fg: '#aabae7' attr: 'b' }
        shape_redirection: { fg: '#e68ac1' attr: 'b' }
        shape_signature: { fg: '#a2baa8' attr: 'b' }
        shape_string: '#a2baa8'
        shape_string_interpolation: { fg: '#aabae7' attr: 'b' }
        shape_table: { fg: '#9985d1' attr: 'b' }
        shape_vardecl: { fg: '#9985d1' attr: 'u' }
        shape_variable: '#e68ac1'

        foreground: '#dedbeb'
        background: '#2a2331'
        cursor: '#dedbeb'

        empty: '#9985d1'
        header: { fg: '#a2baa8' attr: 'b' }
        hints: '#302838'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a2baa8' attr: 'b' }
        search_result: { fg: '#ed3f7f' bg: '#dedbeb' }
        separator: '#dedbeb'
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