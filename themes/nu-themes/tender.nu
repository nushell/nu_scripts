# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d3b987'
        block: '#b3deef'
        cell-path: '#eeeeee'
        closure: '#73cef4'
        custom: '#ffffff'
        duration: '#ffc24b'
        float: '#f43753'
        glob: '#ffffff'
        int: '#d3b987'
        list: '#73cef4'
        nothing: '#f43753'
        range: '#ffc24b'
        record: '#73cef4'
        string: '#c9d05c'

        bool: {|| if $in { '#73cef4' } else { '#ffc24b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f43753' attr: 'b' }
            } else if $in < 6hr {
                '#f43753'
            } else if $in < 1day {
                '#ffc24b'
            } else if $in < 3day {
                '#c9d05c'
            } else if $in < 1wk {
                { fg: '#c9d05c' attr: 'b' }
            } else if $in < 6wk {
                '#73cef4'
            } else if $in < 52wk {
                '#b3deef'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#eeeeee'
            } else if $e < 1mb {
                '#73cef4'
            } else {{ fg: '#b3deef' }}
        }

        shape_and: { fg: '#d3b987' attr: 'b' }
        shape_binary: { fg: '#d3b987' attr: 'b' }
        shape_block: { fg: '#b3deef' attr: 'b' }
        shape_bool: '#73cef4'
        shape_closure: { fg: '#73cef4' attr: 'b' }
        shape_custom: '#c9d05c'
        shape_datetime: { fg: '#73cef4' attr: 'b' }
        shape_directory: '#73cef4'
        shape_external: '#73cef4'
        shape_external_resolved: '#73cef4'
        shape_externalarg: { fg: '#c9d05c' attr: 'b' }
        shape_filepath: '#73cef4'
        shape_flag: { fg: '#b3deef' attr: 'b' }
        shape_float: { fg: '#f43753' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#73cef4' attr: 'b' }
        shape_globpattern: { fg: '#73cef4' attr: 'b' }
        shape_int: { fg: '#d3b987' attr: 'b' }
        shape_internalcall: { fg: '#73cef4' attr: 'b' }
        shape_keyword: { fg: '#d3b987' attr: 'b' }
        shape_list: { fg: '#73cef4' attr: 'b' }
        shape_literal: '#b3deef'
        shape_match_pattern: '#c9d05c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f43753'
        shape_operator: '#ffc24b'
        shape_or: { fg: '#d3b987' attr: 'b' }
        shape_pipe: { fg: '#d3b987' attr: 'b' }
        shape_range: { fg: '#ffc24b' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#73cef4' attr: 'b' }
        shape_redirection: { fg: '#d3b987' attr: 'b' }
        shape_signature: { fg: '#c9d05c' attr: 'b' }
        shape_string: '#c9d05c'
        shape_string_interpolation: { fg: '#73cef4' attr: 'b' }
        shape_table: { fg: '#b3deef' attr: 'b' }
        shape_vardecl: { fg: '#b3deef' attr: 'u' }
        shape_variable: '#d3b987'

        foreground: '#eeeeee'
        background: '#282828'
        cursor: '#eeeeee'

        empty: '#b3deef'
        header: { fg: '#c9d05c' attr: 'b' }
        hints: '#1d1d1d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#c9d05c' attr: 'b' }
        search_result: { fg: '#f43753' bg: '#eeeeee' }
        separator: '#eeeeee'
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