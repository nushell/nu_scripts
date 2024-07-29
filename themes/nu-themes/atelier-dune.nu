# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b854d4'
        block: '#6684e1'
        cell-path: '#a6a28c'
        closure: '#1fad83'
        custom: '#fefbec'
        duration: '#ae9513'
        float: '#d73737'
        glob: '#fefbec'
        int: '#b854d4'
        list: '#1fad83'
        nothing: '#d73737'
        range: '#ae9513'
        record: '#1fad83'
        string: '#60ac39'

        bool: {|| if $in { '#1fad83' } else { '#ae9513' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d73737' attr: 'b' }
            } else if $in < 6hr {
                '#d73737'
            } else if $in < 1day {
                '#ae9513'
            } else if $in < 3day {
                '#60ac39'
            } else if $in < 1wk {
                { fg: '#60ac39' attr: 'b' }
            } else if $in < 6wk {
                '#1fad83'
            } else if $in < 52wk {
                '#6684e1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a6a28c'
            } else if $e < 1mb {
                '#1fad83'
            } else {{ fg: '#6684e1' }}
        }

        shape_and: { fg: '#b854d4' attr: 'b' }
        shape_binary: { fg: '#b854d4' attr: 'b' }
        shape_block: { fg: '#6684e1' attr: 'b' }
        shape_bool: '#1fad83'
        shape_closure: { fg: '#1fad83' attr: 'b' }
        shape_custom: '#60ac39'
        shape_datetime: { fg: '#1fad83' attr: 'b' }
        shape_directory: '#1fad83'
        shape_external: '#1fad83'
        shape_external_resolved: '#1fad83'
        shape_externalarg: { fg: '#60ac39' attr: 'b' }
        shape_filepath: '#1fad83'
        shape_flag: { fg: '#6684e1' attr: 'b' }
        shape_float: { fg: '#d73737' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1fad83' attr: 'b' }
        shape_globpattern: { fg: '#1fad83' attr: 'b' }
        shape_int: { fg: '#b854d4' attr: 'b' }
        shape_internalcall: { fg: '#1fad83' attr: 'b' }
        shape_keyword: { fg: '#b854d4' attr: 'b' }
        shape_list: { fg: '#1fad83' attr: 'b' }
        shape_literal: '#6684e1'
        shape_match_pattern: '#60ac39'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d73737'
        shape_operator: '#ae9513'
        shape_or: { fg: '#b854d4' attr: 'b' }
        shape_pipe: { fg: '#b854d4' attr: 'b' }
        shape_range: { fg: '#ae9513' attr: 'b' }
        shape_raw_string: { fg: '#fefbec' attr: 'b' }
        shape_record: { fg: '#1fad83' attr: 'b' }
        shape_redirection: { fg: '#b854d4' attr: 'b' }
        shape_signature: { fg: '#60ac39' attr: 'b' }
        shape_string: '#60ac39'
        shape_string_interpolation: { fg: '#1fad83' attr: 'b' }
        shape_table: { fg: '#6684e1' attr: 'b' }
        shape_vardecl: { fg: '#6684e1' attr: 'u' }
        shape_variable: '#b854d4'

        foreground: '#a6a28c'
        background: '#20201d'
        cursor: '#a6a28c'

        empty: '#6684e1'
        header: { fg: '#60ac39' attr: 'b' }
        hints: '#7d7a68'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#60ac39' attr: 'b' }
        search_result: { fg: '#d73737' bg: '#a6a28c' }
        separator: '#a6a28c'
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