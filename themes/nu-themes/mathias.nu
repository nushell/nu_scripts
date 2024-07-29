# Retrieve the theme settings
export def main [] {
    return {
        binary: '#fa2573'
        block: '#c48dff'
        cell-path: '#f2f2f2'
        closure: '#67d9f0'
        custom: '#ffffff'
        duration: '#fc951e'
        float: '#ff5555'
        glob: '#ffffff'
        int: '#fa2573'
        list: '#67d9f0'
        nothing: '#e52222'
        range: '#fc951e'
        record: '#67d9f0'
        string: '#a6e32d'

        bool: {|| if $in { '#55ffff' } else { '#fc951e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e52222' attr: 'b' }
            } else if $in < 6hr {
                '#e52222'
            } else if $in < 1day {
                '#fc951e'
            } else if $in < 3day {
                '#a6e32d'
            } else if $in < 1wk {
                { fg: '#a6e32d' attr: 'b' }
            } else if $in < 6wk {
                '#67d9f0'
            } else if $in < 52wk {
                '#c48dff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f2f2f2'
            } else if $e < 1mb {
                '#67d9f0'
            } else {{ fg: '#c48dff' }}
        }

        shape_and: { fg: '#fa2573' attr: 'b' }
        shape_binary: { fg: '#fa2573' attr: 'b' }
        shape_block: { fg: '#c48dff' attr: 'b' }
        shape_bool: '#55ffff'
        shape_closure: { fg: '#67d9f0' attr: 'b' }
        shape_custom: '#a6e32d'
        shape_datetime: { fg: '#67d9f0' attr: 'b' }
        shape_directory: '#67d9f0'
        shape_external: '#67d9f0'
        shape_external_resolved: '#55ffff'
        shape_externalarg: { fg: '#a6e32d' attr: 'b' }
        shape_filepath: '#67d9f0'
        shape_flag: { fg: '#c48dff' attr: 'b' }
        shape_float: { fg: '#ff5555' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#67d9f0' attr: 'b' }
        shape_globpattern: { fg: '#67d9f0' attr: 'b' }
        shape_int: { fg: '#fa2573' attr: 'b' }
        shape_internalcall: { fg: '#67d9f0' attr: 'b' }
        shape_keyword: { fg: '#fa2573' attr: 'b' }
        shape_list: { fg: '#67d9f0' attr: 'b' }
        shape_literal: '#c48dff'
        shape_match_pattern: '#a6e32d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e52222'
        shape_operator: '#fc951e'
        shape_or: { fg: '#fa2573' attr: 'b' }
        shape_pipe: { fg: '#fa2573' attr: 'b' }
        shape_range: { fg: '#fc951e' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#67d9f0' attr: 'b' }
        shape_redirection: { fg: '#fa2573' attr: 'b' }
        shape_signature: { fg: '#a6e32d' attr: 'b' }
        shape_string: '#a6e32d'
        shape_string_interpolation: { fg: '#67d9f0' attr: 'b' }
        shape_table: { fg: '#c48dff' attr: 'b' }
        shape_vardecl: { fg: '#c48dff' attr: 'u' }
        shape_variable: '#fa2573'

        foreground: '#bbbbbb'
        background: '#000000'
        cursor: '#bbbbbb'

        empty: '#c48dff'
        header: { fg: '#a6e32d' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a6e32d' attr: 'b' }
        search_result: { fg: '#e52222' bg: '#f2f2f2' }
        separator: '#f2f2f2'
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