# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ec0048'
        block: '#004f9e'
        cell-path: '#f2f2f2'
        closure: '#2aa7e7'
        custom: '#a020f0'
        duration: '#ffc005'
        float: '#ff361e'
        glob: '#a020f0'
        int: '#ec0048'
        list: '#2aa7e7'
        nothing: '#e1321a'
        range: '#ffc005'
        record: '#2aa7e7'
        string: '#6ab017'

        bool: {|| if $in { '#4bb8fd' } else { '#ffc005' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e1321a' attr: 'b' }
            } else if $in < 6hr {
                '#e1321a'
            } else if $in < 1day {
                '#ffc005'
            } else if $in < 3day {
                '#6ab017'
            } else if $in < 1wk {
                { fg: '#6ab017' attr: 'b' }
            } else if $in < 6wk {
                '#2aa7e7'
            } else if $in < 52wk {
                '#004f9e'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f2f2f2'
            } else if $e < 1mb {
                '#2aa7e7'
            } else {{ fg: '#004f9e' }}
        }

        shape_and: { fg: '#ec0048' attr: 'b' }
        shape_binary: { fg: '#ec0048' attr: 'b' }
        shape_block: { fg: '#004f9e' attr: 'b' }
        shape_bool: '#4bb8fd'
        shape_closure: { fg: '#2aa7e7' attr: 'b' }
        shape_custom: '#6ab017'
        shape_datetime: { fg: '#2aa7e7' attr: 'b' }
        shape_directory: '#2aa7e7'
        shape_external: '#2aa7e7'
        shape_external_resolved: '#4bb8fd'
        shape_externalarg: { fg: '#6ab017' attr: 'b' }
        shape_filepath: '#2aa7e7'
        shape_flag: { fg: '#004f9e' attr: 'b' }
        shape_float: { fg: '#ff361e' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#2aa7e7' attr: 'b' }
        shape_globpattern: { fg: '#2aa7e7' attr: 'b' }
        shape_int: { fg: '#ec0048' attr: 'b' }
        shape_internalcall: { fg: '#2aa7e7' attr: 'b' }
        shape_keyword: { fg: '#ec0048' attr: 'b' }
        shape_list: { fg: '#2aa7e7' attr: 'b' }
        shape_literal: '#004f9e'
        shape_match_pattern: '#6ab017'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e1321a'
        shape_operator: '#ffc005'
        shape_or: { fg: '#ec0048' attr: 'b' }
        shape_pipe: { fg: '#ec0048' attr: 'b' }
        shape_range: { fg: '#ffc005' attr: 'b' }
        shape_raw_string: { fg: '#a020f0' attr: 'b' }
        shape_record: { fg: '#2aa7e7' attr: 'b' }
        shape_redirection: { fg: '#ec0048' attr: 'b' }
        shape_signature: { fg: '#6ab017' attr: 'b' }
        shape_string: '#6ab017'
        shape_string_interpolation: { fg: '#2aa7e7' attr: 'b' }
        shape_table: { fg: '#004f9e' attr: 'b' }
        shape_vardecl: { fg: '#004f9e' attr: 'u' }
        shape_variable: '#ec0048'

        foreground: '#f2f2f2'
        background: '#101010'
        cursor: '#f2f2f2'

        empty: '#004f9e'
        header: { fg: '#6ab017' attr: 'b' }
        hints: '#5d5d5d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6ab017' attr: 'b' }
        search_result: { fg: '#e1321a' bg: '#f2f2f2' }
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