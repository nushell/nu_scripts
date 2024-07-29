# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff0080'
        block: '#253b76'
        cell-path: '#f8f8f8'
        closure: '#8da6ce'
        custom: '#f8f8f8'
        duration: '#fbde2d'
        float: '#800000'
        glob: '#f8f8f8'
        int: '#ff0080'
        list: '#8da6ce'
        nothing: '#800000'
        range: '#fbde2d'
        record: '#8da6ce'
        string: '#61ce3c'

        bool: {|| if $in { '#8da6ce' } else { '#fbde2d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#800000' attr: 'b' }
            } else if $in < 6hr {
                '#800000'
            } else if $in < 1day {
                '#fbde2d'
            } else if $in < 3day {
                '#61ce3c'
            } else if $in < 1wk {
                { fg: '#61ce3c' attr: 'b' }
            } else if $in < 6wk {
                '#8da6ce'
            } else if $in < 52wk {
                '#253b76'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f8f8f8'
            } else if $e < 1mb {
                '#8da6ce'
            } else {{ fg: '#253b76' }}
        }

        shape_and: { fg: '#ff0080' attr: 'b' }
        shape_binary: { fg: '#ff0080' attr: 'b' }
        shape_block: { fg: '#253b76' attr: 'b' }
        shape_bool: '#8da6ce'
        shape_closure: { fg: '#8da6ce' attr: 'b' }
        shape_custom: '#61ce3c'
        shape_datetime: { fg: '#8da6ce' attr: 'b' }
        shape_directory: '#8da6ce'
        shape_external: '#8da6ce'
        shape_external_resolved: '#8da6ce'
        shape_externalarg: { fg: '#61ce3c' attr: 'b' }
        shape_filepath: '#8da6ce'
        shape_flag: { fg: '#253b76' attr: 'b' }
        shape_float: { fg: '#800000' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8da6ce' attr: 'b' }
        shape_globpattern: { fg: '#8da6ce' attr: 'b' }
        shape_int: { fg: '#ff0080' attr: 'b' }
        shape_internalcall: { fg: '#8da6ce' attr: 'b' }
        shape_keyword: { fg: '#ff0080' attr: 'b' }
        shape_list: { fg: '#8da6ce' attr: 'b' }
        shape_literal: '#253b76'
        shape_match_pattern: '#61ce3c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#800000'
        shape_operator: '#fbde2d'
        shape_or: { fg: '#ff0080' attr: 'b' }
        shape_pipe: { fg: '#ff0080' attr: 'b' }
        shape_range: { fg: '#fbde2d' attr: 'b' }
        shape_raw_string: { fg: '#f8f8f8' attr: 'b' }
        shape_record: { fg: '#8da6ce' attr: 'b' }
        shape_redirection: { fg: '#ff0080' attr: 'b' }
        shape_signature: { fg: '#61ce3c' attr: 'b' }
        shape_string: '#61ce3c'
        shape_string_interpolation: { fg: '#8da6ce' attr: 'b' }
        shape_table: { fg: '#253b76' attr: 'b' }
        shape_vardecl: { fg: '#253b76' attr: 'u' }
        shape_variable: '#ff0080'

        foreground: '#ffffff'
        background: '#271f19'
        cursor: '#ffffff'

        empty: '#253b76'
        header: { fg: '#61ce3c' attr: 'b' }
        hints: '#000000'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#61ce3c' attr: 'b' }
        search_result: { fg: '#800000' bg: '#f8f8f8' }
        separator: '#f8f8f8'
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