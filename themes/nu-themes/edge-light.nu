# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b870ce'
        block: '#6587bf'
        cell-path: '#5e646f'
        closure: '#509c93'
        custom: '#5e646f'
        duration: '#d69822'
        float: '#db7070'
        glob: '#5e646f'
        int: '#b870ce'
        list: '#509c93'
        nothing: '#db7070'
        range: '#d69822'
        record: '#509c93'
        string: '#7c9f4b'

        bool: {|| if $in { '#509c93' } else { '#d69822' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#db7070' attr: 'b' }
            } else if $in < 6hr {
                '#db7070'
            } else if $in < 1day {
                '#d69822'
            } else if $in < 3day {
                '#7c9f4b'
            } else if $in < 1wk {
                { fg: '#7c9f4b' attr: 'b' }
            } else if $in < 6wk {
                '#509c93'
            } else if $in < 52wk {
                '#6587bf'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#5e646f'
            } else if $e < 1mb {
                '#509c93'
            } else {{ fg: '#6587bf' }}
        }

        shape_and: { fg: '#b870ce' attr: 'b' }
        shape_binary: { fg: '#b870ce' attr: 'b' }
        shape_block: { fg: '#6587bf' attr: 'b' }
        shape_bool: '#509c93'
        shape_closure: { fg: '#509c93' attr: 'b' }
        shape_custom: '#7c9f4b'
        shape_datetime: { fg: '#509c93' attr: 'b' }
        shape_directory: '#509c93'
        shape_external: '#509c93'
        shape_external_resolved: '#509c93'
        shape_externalarg: { fg: '#7c9f4b' attr: 'b' }
        shape_filepath: '#509c93'
        shape_flag: { fg: '#6587bf' attr: 'b' }
        shape_float: { fg: '#db7070' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#509c93' attr: 'b' }
        shape_globpattern: { fg: '#509c93' attr: 'b' }
        shape_int: { fg: '#b870ce' attr: 'b' }
        shape_internalcall: { fg: '#509c93' attr: 'b' }
        shape_keyword: { fg: '#b870ce' attr: 'b' }
        shape_list: { fg: '#509c93' attr: 'b' }
        shape_literal: '#6587bf'
        shape_match_pattern: '#7c9f4b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#db7070'
        shape_operator: '#d69822'
        shape_or: { fg: '#b870ce' attr: 'b' }
        shape_pipe: { fg: '#b870ce' attr: 'b' }
        shape_range: { fg: '#d69822' attr: 'b' }
        shape_raw_string: { fg: '#5e646f' attr: 'b' }
        shape_record: { fg: '#509c93' attr: 'b' }
        shape_redirection: { fg: '#b870ce' attr: 'b' }
        shape_signature: { fg: '#7c9f4b' attr: 'b' }
        shape_string: '#7c9f4b'
        shape_string_interpolation: { fg: '#509c93' attr: 'b' }
        shape_table: { fg: '#6587bf' attr: 'b' }
        shape_vardecl: { fg: '#6587bf' attr: 'u' }
        shape_variable: '#b870ce'

        foreground: '#5e646f'
        background: '#fafafa'
        cursor: '#5e646f'

        empty: '#6587bf'
        header: { fg: '#7c9f4b' attr: 'b' }
        hints: '#5e646f'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7c9f4b' attr: 'b' }
        search_result: { fg: '#db7070' bg: '#5e646f' }
        separator: '#5e646f'
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