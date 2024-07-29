# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a88cb3'
        block: '#759abd'
        cell-path: '#afb7c0'
        closure: '#5da19f'
        custom: '#cbd2d9'
        duration: '#ab916d'
        float: '#be868c'
        glob: '#cbd2d9'
        int: '#a88cb3'
        list: '#5da19f'
        nothing: '#be868c'
        range: '#ab916d'
        record: '#5da19f'
        string: '#7f9d77'

        bool: {|| if $in { '#5da19f' } else { '#ab916d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#be868c' attr: 'b' }
            } else if $in < 6hr {
                '#be868c'
            } else if $in < 1day {
                '#ab916d'
            } else if $in < 3day {
                '#7f9d77'
            } else if $in < 1wk {
                { fg: '#7f9d77' attr: 'b' }
            } else if $in < 6wk {
                '#5da19f'
            } else if $in < 52wk {
                '#759abd'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#afb7c0'
            } else if $e < 1mb {
                '#5da19f'
            } else {{ fg: '#759abd' }}
        }

        shape_and: { fg: '#a88cb3' attr: 'b' }
        shape_binary: { fg: '#a88cb3' attr: 'b' }
        shape_block: { fg: '#759abd' attr: 'b' }
        shape_bool: '#5da19f'
        shape_closure: { fg: '#5da19f' attr: 'b' }
        shape_custom: '#7f9d77'
        shape_datetime: { fg: '#5da19f' attr: 'b' }
        shape_directory: '#5da19f'
        shape_external: '#5da19f'
        shape_external_resolved: '#5da19f'
        shape_externalarg: { fg: '#7f9d77' attr: 'b' }
        shape_filepath: '#5da19f'
        shape_flag: { fg: '#759abd' attr: 'b' }
        shape_float: { fg: '#be868c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5da19f' attr: 'b' }
        shape_globpattern: { fg: '#5da19f' attr: 'b' }
        shape_int: { fg: '#a88cb3' attr: 'b' }
        shape_internalcall: { fg: '#5da19f' attr: 'b' }
        shape_keyword: { fg: '#a88cb3' attr: 'b' }
        shape_list: { fg: '#5da19f' attr: 'b' }
        shape_literal: '#759abd'
        shape_match_pattern: '#7f9d77'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#be868c'
        shape_operator: '#ab916d'
        shape_or: { fg: '#a88cb3' attr: 'b' }
        shape_pipe: { fg: '#a88cb3' attr: 'b' }
        shape_range: { fg: '#ab916d' attr: 'b' }
        shape_raw_string: { fg: '#cbd2d9' attr: 'b' }
        shape_record: { fg: '#5da19f' attr: 'b' }
        shape_redirection: { fg: '#a88cb3' attr: 'b' }
        shape_signature: { fg: '#7f9d77' attr: 'b' }
        shape_string: '#7f9d77'
        shape_string_interpolation: { fg: '#5da19f' attr: 'b' }
        shape_table: { fg: '#759abd' attr: 'b' }
        shape_vardecl: { fg: '#759abd' attr: 'u' }
        shape_variable: '#a88cb3'

        foreground: '#afb7c0'
        background: '#2c2d30'
        cursor: '#cbd2d9'

        empty: '#759abd'
        header: { fg: '#7f9d77' attr: 'b' }
        hints: '#363a3e'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7f9d77' attr: 'b' }
        search_result: { fg: '#be868c' bg: '#afb7c0' }
        separator: '#afb7c0'
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