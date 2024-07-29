# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f02e4f'
        block: '#2c70b7'
        cell-path: '#adadad'
        closure: '#3ca1a6'
        custom: '#8c735b'
        duration: '#fa771d'
        float: '#f74319'
        glob: '#8c735b'
        int: '#f02e4f'
        list: '#3ca1a6'
        nothing: '#f8511b'
        range: '#fa771d'
        record: '#3ca1a6'
        string: '#565747'

        bool: {|| if $in { '#4fbce6' } else { '#fa771d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f8511b' attr: 'b' }
            } else if $in < 6hr {
                '#f8511b'
            } else if $in < 1day {
                '#fa771d'
            } else if $in < 3day {
                '#565747'
            } else if $in < 1wk {
                { fg: '#565747' attr: 'b' }
            } else if $in < 6wk {
                '#3ca1a6'
            } else if $in < 52wk {
                '#2c70b7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#adadad'
            } else if $e < 1mb {
                '#3ca1a6'
            } else {{ fg: '#2c70b7' }}
        }

        shape_and: { fg: '#f02e4f' attr: 'b' }
        shape_binary: { fg: '#f02e4f' attr: 'b' }
        shape_block: { fg: '#2c70b7' attr: 'b' }
        shape_bool: '#4fbce6'
        shape_closure: { fg: '#3ca1a6' attr: 'b' }
        shape_custom: '#565747'
        shape_datetime: { fg: '#3ca1a6' attr: 'b' }
        shape_directory: '#3ca1a6'
        shape_external: '#3ca1a6'
        shape_external_resolved: '#4fbce6'
        shape_externalarg: { fg: '#565747' attr: 'b' }
        shape_filepath: '#3ca1a6'
        shape_flag: { fg: '#2c70b7' attr: 'b' }
        shape_float: { fg: '#f74319' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3ca1a6' attr: 'b' }
        shape_globpattern: { fg: '#3ca1a6' attr: 'b' }
        shape_int: { fg: '#f02e4f' attr: 'b' }
        shape_internalcall: { fg: '#3ca1a6' attr: 'b' }
        shape_keyword: { fg: '#f02e4f' attr: 'b' }
        shape_list: { fg: '#3ca1a6' attr: 'b' }
        shape_literal: '#2c70b7'
        shape_match_pattern: '#565747'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f8511b'
        shape_operator: '#fa771d'
        shape_or: { fg: '#f02e4f' attr: 'b' }
        shape_pipe: { fg: '#f02e4f' attr: 'b' }
        shape_range: { fg: '#fa771d' attr: 'b' }
        shape_raw_string: { fg: '#8c735b' attr: 'b' }
        shape_record: { fg: '#3ca1a6' attr: 'b' }
        shape_redirection: { fg: '#f02e4f' attr: 'b' }
        shape_signature: { fg: '#565747' attr: 'b' }
        shape_string: '#565747'
        shape_string_interpolation: { fg: '#3ca1a6' attr: 'b' }
        shape_table: { fg: '#2c70b7' attr: 'b' }
        shape_vardecl: { fg: '#2c70b7' attr: 'u' }
        shape_variable: '#f02e4f'

        foreground: '#adadad'
        background: '#1b1c1d'
        cursor: '#adadad'

        empty: '#2c70b7'
        header: { fg: '#565747' attr: 'b' }
        hints: '#5fac6d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#565747' attr: 'b' }
        search_result: { fg: '#f8511b' bg: '#adadad' }
        separator: '#adadad'
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