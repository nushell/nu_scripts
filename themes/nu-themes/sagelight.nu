# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c8a0d2'
        block: '#a0a7d2'
        cell-path: '#383838'
        closure: '#a2d6f5'
        custom: '#181818'
        duration: '#ffdc61'
        float: '#fa8480'
        glob: '#181818'
        int: '#c8a0d2'
        list: '#a2d6f5'
        nothing: '#fa8480'
        range: '#ffdc61'
        record: '#a2d6f5'
        string: '#a0d2c8'

        bool: {|| if $in { '#a2d6f5' } else { '#ffdc61' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fa8480' attr: 'b' }
            } else if $in < 6hr {
                '#fa8480'
            } else if $in < 1day {
                '#ffdc61'
            } else if $in < 3day {
                '#a0d2c8'
            } else if $in < 1wk {
                { fg: '#a0d2c8' attr: 'b' }
            } else if $in < 6wk {
                '#a2d6f5'
            } else if $in < 52wk {
                '#a0a7d2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#383838'
            } else if $e < 1mb {
                '#a2d6f5'
            } else {{ fg: '#a0a7d2' }}
        }

        shape_and: { fg: '#c8a0d2' attr: 'b' }
        shape_binary: { fg: '#c8a0d2' attr: 'b' }
        shape_block: { fg: '#a0a7d2' attr: 'b' }
        shape_bool: '#a2d6f5'
        shape_closure: { fg: '#a2d6f5' attr: 'b' }
        shape_custom: '#a0d2c8'
        shape_datetime: { fg: '#a2d6f5' attr: 'b' }
        shape_directory: '#a2d6f5'
        shape_external: '#a2d6f5'
        shape_external_resolved: '#a2d6f5'
        shape_externalarg: { fg: '#a0d2c8' attr: 'b' }
        shape_filepath: '#a2d6f5'
        shape_flag: { fg: '#a0a7d2' attr: 'b' }
        shape_float: { fg: '#fa8480' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#a2d6f5' attr: 'b' }
        shape_globpattern: { fg: '#a2d6f5' attr: 'b' }
        shape_int: { fg: '#c8a0d2' attr: 'b' }
        shape_internalcall: { fg: '#a2d6f5' attr: 'b' }
        shape_keyword: { fg: '#c8a0d2' attr: 'b' }
        shape_list: { fg: '#a2d6f5' attr: 'b' }
        shape_literal: '#a0a7d2'
        shape_match_pattern: '#a0d2c8'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fa8480'
        shape_operator: '#ffdc61'
        shape_or: { fg: '#c8a0d2' attr: 'b' }
        shape_pipe: { fg: '#c8a0d2' attr: 'b' }
        shape_range: { fg: '#ffdc61' attr: 'b' }
        shape_raw_string: { fg: '#181818' attr: 'b' }
        shape_record: { fg: '#a2d6f5' attr: 'b' }
        shape_redirection: { fg: '#c8a0d2' attr: 'b' }
        shape_signature: { fg: '#a0d2c8' attr: 'b' }
        shape_string: '#a0d2c8'
        shape_string_interpolation: { fg: '#a2d6f5' attr: 'b' }
        shape_table: { fg: '#a0a7d2' attr: 'b' }
        shape_vardecl: { fg: '#a0a7d2' attr: 'u' }
        shape_variable: '#c8a0d2'

        foreground: '#383838'
        background: '#f8f8f8'
        cursor: '#383838'

        empty: '#a0a7d2'
        header: { fg: '#a0d2c8' attr: 'b' }
        hints: '#b8b8b8'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a0d2c8' attr: 'b' }
        search_result: { fg: '#fa8480' bg: '#383838' }
        separator: '#383838'
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