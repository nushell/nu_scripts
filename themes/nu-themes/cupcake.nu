# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bb99b4'
        block: '#7297b9'
        cell-path: '#8b8198'
        closure: '#69a9a7'
        custom: '#585062'
        duration: '#dcb16c'
        float: '#d57e85'
        glob: '#585062'
        int: '#bb99b4'
        list: '#69a9a7'
        nothing: '#d57e85'
        range: '#dcb16c'
        record: '#69a9a7'
        string: '#a3b367'

        bool: {|| if $in { '#69a9a7' } else { '#dcb16c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d57e85' attr: 'b' }
            } else if $in < 6hr {
                '#d57e85'
            } else if $in < 1day {
                '#dcb16c'
            } else if $in < 3day {
                '#a3b367'
            } else if $in < 1wk {
                { fg: '#a3b367' attr: 'b' }
            } else if $in < 6wk {
                '#69a9a7'
            } else if $in < 52wk {
                '#7297b9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#8b8198'
            } else if $e < 1mb {
                '#69a9a7'
            } else {{ fg: '#7297b9' }}
        }

        shape_and: { fg: '#bb99b4' attr: 'b' }
        shape_binary: { fg: '#bb99b4' attr: 'b' }
        shape_block: { fg: '#7297b9' attr: 'b' }
        shape_bool: '#69a9a7'
        shape_closure: { fg: '#69a9a7' attr: 'b' }
        shape_custom: '#a3b367'
        shape_datetime: { fg: '#69a9a7' attr: 'b' }
        shape_directory: '#69a9a7'
        shape_external: '#69a9a7'
        shape_external_resolved: '#69a9a7'
        shape_externalarg: { fg: '#a3b367' attr: 'b' }
        shape_filepath: '#69a9a7'
        shape_flag: { fg: '#7297b9' attr: 'b' }
        shape_float: { fg: '#d57e85' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#69a9a7' attr: 'b' }
        shape_globpattern: { fg: '#69a9a7' attr: 'b' }
        shape_int: { fg: '#bb99b4' attr: 'b' }
        shape_internalcall: { fg: '#69a9a7' attr: 'b' }
        shape_keyword: { fg: '#bb99b4' attr: 'b' }
        shape_list: { fg: '#69a9a7' attr: 'b' }
        shape_literal: '#7297b9'
        shape_match_pattern: '#a3b367'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d57e85'
        shape_operator: '#dcb16c'
        shape_or: { fg: '#bb99b4' attr: 'b' }
        shape_pipe: { fg: '#bb99b4' attr: 'b' }
        shape_range: { fg: '#dcb16c' attr: 'b' }
        shape_raw_string: { fg: '#585062' attr: 'b' }
        shape_record: { fg: '#69a9a7' attr: 'b' }
        shape_redirection: { fg: '#bb99b4' attr: 'b' }
        shape_signature: { fg: '#a3b367' attr: 'b' }
        shape_string: '#a3b367'
        shape_string_interpolation: { fg: '#69a9a7' attr: 'b' }
        shape_table: { fg: '#7297b9' attr: 'b' }
        shape_vardecl: { fg: '#7297b9' attr: 'u' }
        shape_variable: '#bb99b4'

        foreground: '#8b8198'
        background: '#fbf1f2'
        cursor: '#8b8198'

        empty: '#7297b9'
        header: { fg: '#a3b367' attr: 'b' }
        hints: '#bfb9c6'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a3b367' attr: 'b' }
        search_result: { fg: '#d57e85' bg: '#8b8198' }
        separator: '#8b8198'
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