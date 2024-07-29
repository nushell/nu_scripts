# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e69092'
        block: '#39b6ce'
        cell-path: '#96aca7'
        closure: '#36bd84'
        custom: '#b5b8b7'
        duration: '#a6af1a'
        float: '#e19900'
        glob: '#b5b8b7'
        int: '#e69092'
        list: '#36bd84'
        nothing: '#ff855a'
        range: '#a6af1a'
        record: '#36bd84'
        string: '#5cbc4d'

        bool: {|| if $in { '#3cbaa6' } else { '#a6af1a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff855a' attr: 'b' }
            } else if $in < 6hr {
                '#ff855a'
            } else if $in < 1day {
                '#a6af1a'
            } else if $in < 3day {
                '#5cbc4d'
            } else if $in < 1wk {
                { fg: '#5cbc4d' attr: 'b' }
            } else if $in < 6wk {
                '#36bd84'
            } else if $in < 52wk {
                '#39b6ce'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#96aca7'
            } else if $e < 1mb {
                '#36bd84'
            } else {{ fg: '#39b6ce' }}
        }

        shape_and: { fg: '#e69092' attr: 'b' }
        shape_binary: { fg: '#e69092' attr: 'b' }
        shape_block: { fg: '#39b6ce' attr: 'b' }
        shape_bool: '#3cbaa6'
        shape_closure: { fg: '#36bd84' attr: 'b' }
        shape_custom: '#5cbc4d'
        shape_datetime: { fg: '#36bd84' attr: 'b' }
        shape_directory: '#36bd84'
        shape_external: '#36bd84'
        shape_external_resolved: '#3cbaa6'
        shape_externalarg: { fg: '#5cbc4d' attr: 'b' }
        shape_filepath: '#36bd84'
        shape_flag: { fg: '#39b6ce' attr: 'b' }
        shape_float: { fg: '#e19900' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#36bd84' attr: 'b' }
        shape_globpattern: { fg: '#36bd84' attr: 'b' }
        shape_int: { fg: '#e69092' attr: 'b' }
        shape_internalcall: { fg: '#36bd84' attr: 'b' }
        shape_keyword: { fg: '#e69092' attr: 'b' }
        shape_list: { fg: '#36bd84' attr: 'b' }
        shape_literal: '#39b6ce'
        shape_match_pattern: '#5cbc4d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff855a'
        shape_operator: '#a6af1a'
        shape_or: { fg: '#e69092' attr: 'b' }
        shape_pipe: { fg: '#e69092' attr: 'b' }
        shape_range: { fg: '#a6af1a' attr: 'b' }
        shape_raw_string: { fg: '#b5b8b7' attr: 'b' }
        shape_record: { fg: '#36bd84' attr: 'b' }
        shape_redirection: { fg: '#e69092' attr: 'b' }
        shape_signature: { fg: '#5cbc4d' attr: 'b' }
        shape_string: '#5cbc4d'
        shape_string_interpolation: { fg: '#36bd84' attr: 'b' }
        shape_table: { fg: '#39b6ce' attr: 'b' }
        shape_vardecl: { fg: '#39b6ce' attr: 'u' }
        shape_variable: '#e69092'

        foreground: '#b5b8b7'
        background: '#283a37'
        cursor: '#b5b8b7'

        empty: '#39b6ce'
        header: { fg: '#5cbc4d' attr: 'b' }
        hints: '#2a423d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#5cbc4d' attr: 'b' }
        search_result: { fg: '#ff855a' bg: '#96aca7' }
        separator: '#96aca7'
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