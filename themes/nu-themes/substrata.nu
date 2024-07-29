# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a18daf'
        block: '#8296b0'
        cell-path: '#b5b4c9'
        closure: '#659ea2'
        custom: '#f0ecfe'
        duration: '#ab924c'
        float: '#fe9f7c'
        glob: '#f0ecfe'
        int: '#a18daf'
        list: '#659ea2'
        nothing: '#cf8164'
        range: '#ab924c'
        record: '#659ea2'
        string: '#76a065'

        bool: {|| if $in { '#7dc2c7' } else { '#ab924c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cf8164' attr: 'b' }
            } else if $in < 6hr {
                '#cf8164'
            } else if $in < 1day {
                '#ab924c'
            } else if $in < 3day {
                '#76a065'
            } else if $in < 1wk {
                { fg: '#76a065' attr: 'b' }
            } else if $in < 6wk {
                '#659ea2'
            } else if $in < 52wk {
                '#8296b0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b5b4c9'
            } else if $e < 1mb {
                '#659ea2'
            } else {{ fg: '#8296b0' }}
        }

        shape_and: { fg: '#a18daf' attr: 'b' }
        shape_binary: { fg: '#a18daf' attr: 'b' }
        shape_block: { fg: '#8296b0' attr: 'b' }
        shape_bool: '#7dc2c7'
        shape_closure: { fg: '#659ea2' attr: 'b' }
        shape_custom: '#76a065'
        shape_datetime: { fg: '#659ea2' attr: 'b' }
        shape_directory: '#659ea2'
        shape_external: '#659ea2'
        shape_external_resolved: '#7dc2c7'
        shape_externalarg: { fg: '#76a065' attr: 'b' }
        shape_filepath: '#659ea2'
        shape_flag: { fg: '#8296b0' attr: 'b' }
        shape_float: { fg: '#fe9f7c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#659ea2' attr: 'b' }
        shape_globpattern: { fg: '#659ea2' attr: 'b' }
        shape_int: { fg: '#a18daf' attr: 'b' }
        shape_internalcall: { fg: '#659ea2' attr: 'b' }
        shape_keyword: { fg: '#a18daf' attr: 'b' }
        shape_list: { fg: '#659ea2' attr: 'b' }
        shape_literal: '#8296b0'
        shape_match_pattern: '#76a065'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cf8164'
        shape_operator: '#ab924c'
        shape_or: { fg: '#a18daf' attr: 'b' }
        shape_pipe: { fg: '#a18daf' attr: 'b' }
        shape_range: { fg: '#ab924c' attr: 'b' }
        shape_raw_string: { fg: '#f0ecfe' attr: 'b' }
        shape_record: { fg: '#659ea2' attr: 'b' }
        shape_redirection: { fg: '#a18daf' attr: 'b' }
        shape_signature: { fg: '#76a065' attr: 'b' }
        shape_string: '#76a065'
        shape_string_interpolation: { fg: '#659ea2' attr: 'b' }
        shape_table: { fg: '#8296b0' attr: 'b' }
        shape_vardecl: { fg: '#8296b0' attr: 'u' }
        shape_variable: '#a18daf'

        foreground: '#b5b4c9'
        background: '#191c25'
        cursor: '#b5b4c9'

        empty: '#8296b0'
        header: { fg: '#76a065' attr: 'b' }
        hints: '#5b5f71'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#76a065' attr: 'b' }
        search_result: { fg: '#cf8164' bg: '#b5b4c9' }
        separator: '#b5b4c9'
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