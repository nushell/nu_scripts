# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8a7267'
        block: '#4d7b82'
        cell-path: '#e0e0e0'
        closure: '#729494'
        custom: '#e0e0e0'
        duration: '#ada16d'
        float: '#cf937a'
        glob: '#e0e0e0'
        int: '#8a7267'
        list: '#729494'
        nothing: '#825d4d'
        range: '#ada16d'
        record: '#729494'
        string: '#728c62'

        bool: {|| if $in { '#ade0e0' } else { '#ada16d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#825d4d' attr: 'b' }
            } else if $in < 6hr {
                '#825d4d'
            } else if $in < 1day {
                '#ada16d'
            } else if $in < 3day {
                '#728c62'
            } else if $in < 1wk {
                { fg: '#728c62' attr: 'b' }
            } else if $in < 6wk {
                '#729494'
            } else if $in < 52wk {
                '#4d7b82'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e0e0e0'
            } else if $e < 1mb {
                '#729494'
            } else {{ fg: '#4d7b82' }}
        }

        shape_and: { fg: '#8a7267' attr: 'b' }
        shape_binary: { fg: '#8a7267' attr: 'b' }
        shape_block: { fg: '#4d7b82' attr: 'b' }
        shape_bool: '#ade0e0'
        shape_closure: { fg: '#729494' attr: 'b' }
        shape_custom: '#728c62'
        shape_datetime: { fg: '#729494' attr: 'b' }
        shape_directory: '#729494'
        shape_external: '#729494'
        shape_external_resolved: '#ade0e0'
        shape_externalarg: { fg: '#728c62' attr: 'b' }
        shape_filepath: '#729494'
        shape_flag: { fg: '#4d7b82' attr: 'b' }
        shape_float: { fg: '#cf937a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#729494' attr: 'b' }
        shape_globpattern: { fg: '#729494' attr: 'b' }
        shape_int: { fg: '#8a7267' attr: 'b' }
        shape_internalcall: { fg: '#729494' attr: 'b' }
        shape_keyword: { fg: '#8a7267' attr: 'b' }
        shape_list: { fg: '#729494' attr: 'b' }
        shape_literal: '#4d7b82'
        shape_match_pattern: '#728c62'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#825d4d'
        shape_operator: '#ada16d'
        shape_or: { fg: '#8a7267' attr: 'b' }
        shape_pipe: { fg: '#8a7267' attr: 'b' }
        shape_range: { fg: '#ada16d' attr: 'b' }
        shape_raw_string: { fg: '#e0e0e0' attr: 'b' }
        shape_record: { fg: '#729494' attr: 'b' }
        shape_redirection: { fg: '#8a7267' attr: 'b' }
        shape_signature: { fg: '#728c62' attr: 'b' }
        shape_string: '#728c62'
        shape_string_interpolation: { fg: '#729494' attr: 'b' }
        shape_table: { fg: '#4d7b82' attr: 'b' }
        shape_vardecl: { fg: '#4d7b82' attr: 'u' }
        shape_variable: '#8a7267'

        foreground: '#d4e7d4'
        background: '#243435'
        cursor: '#d4e7d4'

        empty: '#4d7b82'
        header: { fg: '#728c62' attr: 'b' }
        hints: '#8a8a8a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#728c62' attr: 'b' }
        search_result: { fg: '#825d4d' bg: '#e0e0e0' }
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