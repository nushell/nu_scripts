# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9b859d'
        block: '#7587a6'
        cell-path: '#a7a7a7'
        closure: '#afc4db'
        custom: '#ffffff'
        duration: '#f9ee98'
        float: '#cf6a4c'
        glob: '#ffffff'
        int: '#9b859d'
        list: '#afc4db'
        nothing: '#cf6a4c'
        range: '#f9ee98'
        record: '#afc4db'
        string: '#8f9d6a'

        bool: {|| if $in { '#afc4db' } else { '#f9ee98' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cf6a4c' attr: 'b' }
            } else if $in < 6hr {
                '#cf6a4c'
            } else if $in < 1day {
                '#f9ee98'
            } else if $in < 3day {
                '#8f9d6a'
            } else if $in < 1wk {
                { fg: '#8f9d6a' attr: 'b' }
            } else if $in < 6wk {
                '#afc4db'
            } else if $in < 52wk {
                '#7587a6'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a7a7a7'
            } else if $e < 1mb {
                '#afc4db'
            } else {{ fg: '#7587a6' }}
        }

        shape_and: { fg: '#9b859d' attr: 'b' }
        shape_binary: { fg: '#9b859d' attr: 'b' }
        shape_block: { fg: '#7587a6' attr: 'b' }
        shape_bool: '#afc4db'
        shape_closure: { fg: '#afc4db' attr: 'b' }
        shape_custom: '#8f9d6a'
        shape_datetime: { fg: '#afc4db' attr: 'b' }
        shape_directory: '#afc4db'
        shape_external: '#afc4db'
        shape_external_resolved: '#afc4db'
        shape_externalarg: { fg: '#8f9d6a' attr: 'b' }
        shape_filepath: '#afc4db'
        shape_flag: { fg: '#7587a6' attr: 'b' }
        shape_float: { fg: '#cf6a4c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#afc4db' attr: 'b' }
        shape_globpattern: { fg: '#afc4db' attr: 'b' }
        shape_int: { fg: '#9b859d' attr: 'b' }
        shape_internalcall: { fg: '#afc4db' attr: 'b' }
        shape_keyword: { fg: '#9b859d' attr: 'b' }
        shape_list: { fg: '#afc4db' attr: 'b' }
        shape_literal: '#7587a6'
        shape_match_pattern: '#8f9d6a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cf6a4c'
        shape_operator: '#f9ee98'
        shape_or: { fg: '#9b859d' attr: 'b' }
        shape_pipe: { fg: '#9b859d' attr: 'b' }
        shape_range: { fg: '#f9ee98' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#afc4db' attr: 'b' }
        shape_redirection: { fg: '#9b859d' attr: 'b' }
        shape_signature: { fg: '#8f9d6a' attr: 'b' }
        shape_string: '#8f9d6a'
        shape_string_interpolation: { fg: '#afc4db' attr: 'b' }
        shape_table: { fg: '#7587a6' attr: 'b' }
        shape_vardecl: { fg: '#7587a6' attr: 'u' }
        shape_variable: '#9b859d'

        foreground: '#a7a7a7'
        background: '#1e1e1e'
        cursor: '#a7a7a7'

        empty: '#7587a6'
        header: { fg: '#8f9d6a' attr: 'b' }
        hints: '#5f5a60'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8f9d6a' attr: 'b' }
        search_result: { fg: '#cf6a4c' bg: '#a7a7a7' }
        separator: '#a7a7a7'
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