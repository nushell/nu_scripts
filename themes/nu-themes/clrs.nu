# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9f00bd'
        block: '#135cd0'
        cell-path: '#b3b3b3'
        closure: '#33c3c1'
        custom: '#eeeeec'
        duration: '#fa701d'
        float: '#fb0416'
        glob: '#eeeeec'
        int: '#9f00bd'
        list: '#33c3c1'
        nothing: '#f8282a'
        range: '#fa701d'
        record: '#33c3c1'
        string: '#328a5d'

        bool: {|| if $in { '#3ad5ce' } else { '#fa701d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f8282a' attr: 'b' }
            } else if $in < 6hr {
                '#f8282a'
            } else if $in < 1day {
                '#fa701d'
            } else if $in < 3day {
                '#328a5d'
            } else if $in < 1wk {
                { fg: '#328a5d' attr: 'b' }
            } else if $in < 6wk {
                '#33c3c1'
            } else if $in < 52wk {
                '#135cd0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b3b3b3'
            } else if $e < 1mb {
                '#33c3c1'
            } else {{ fg: '#135cd0' }}
        }

        shape_and: { fg: '#9f00bd' attr: 'b' }
        shape_binary: { fg: '#9f00bd' attr: 'b' }
        shape_block: { fg: '#135cd0' attr: 'b' }
        shape_bool: '#3ad5ce'
        shape_closure: { fg: '#33c3c1' attr: 'b' }
        shape_custom: '#328a5d'
        shape_datetime: { fg: '#33c3c1' attr: 'b' }
        shape_directory: '#33c3c1'
        shape_external: '#33c3c1'
        shape_external_resolved: '#3ad5ce'
        shape_externalarg: { fg: '#328a5d' attr: 'b' }
        shape_filepath: '#33c3c1'
        shape_flag: { fg: '#135cd0' attr: 'b' }
        shape_float: { fg: '#fb0416' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#33c3c1' attr: 'b' }
        shape_globpattern: { fg: '#33c3c1' attr: 'b' }
        shape_int: { fg: '#9f00bd' attr: 'b' }
        shape_internalcall: { fg: '#33c3c1' attr: 'b' }
        shape_keyword: { fg: '#9f00bd' attr: 'b' }
        shape_list: { fg: '#33c3c1' attr: 'b' }
        shape_literal: '#135cd0'
        shape_match_pattern: '#328a5d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f8282a'
        shape_operator: '#fa701d'
        shape_or: { fg: '#9f00bd' attr: 'b' }
        shape_pipe: { fg: '#9f00bd' attr: 'b' }
        shape_range: { fg: '#fa701d' attr: 'b' }
        shape_raw_string: { fg: '#eeeeec' attr: 'b' }
        shape_record: { fg: '#33c3c1' attr: 'b' }
        shape_redirection: { fg: '#9f00bd' attr: 'b' }
        shape_signature: { fg: '#328a5d' attr: 'b' }
        shape_string: '#328a5d'
        shape_string_interpolation: { fg: '#33c3c1' attr: 'b' }
        shape_table: { fg: '#135cd0' attr: 'b' }
        shape_vardecl: { fg: '#135cd0' attr: 'u' }
        shape_variable: '#9f00bd'

        foreground: '#262626'
        background: '#ffffff'
        cursor: '#262626'

        empty: '#135cd0'
        header: { fg: '#328a5d' attr: 'b' }
        hints: '#555753'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#328a5d' attr: 'b' }
        search_result: { fg: '#f8282a' bg: '#b3b3b3' }
        separator: '#b3b3b3'
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