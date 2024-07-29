# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bb9af7'
        block: '#7aa2f7'
        cell-path: '#a9b1d6'
        closure: '#7dcfff'
        custom: '#c0caf5'
        duration: '#e0af68'
        float: '#f7768e'
        glob: '#c0caf5'
        int: '#bb9af7'
        list: '#7dcfff'
        nothing: '#f7768e'
        range: '#e0af68'
        record: '#7dcfff'
        string: '#9ece6a'

        bool: {|| if $in { '#7dcfff' } else { '#e0af68' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f7768e' attr: 'b' }
            } else if $in < 6hr {
                '#f7768e'
            } else if $in < 1day {
                '#e0af68'
            } else if $in < 3day {
                '#9ece6a'
            } else if $in < 1wk {
                { fg: '#9ece6a' attr: 'b' }
            } else if $in < 6wk {
                '#7dcfff'
            } else if $in < 52wk {
                '#7aa2f7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a9b1d6'
            } else if $e < 1mb {
                '#7dcfff'
            } else {{ fg: '#7aa2f7' }}
        }

        shape_and: { fg: '#bb9af7' attr: 'b' }
        shape_binary: { fg: '#bb9af7' attr: 'b' }
        shape_block: { fg: '#7aa2f7' attr: 'b' }
        shape_bool: '#7dcfff'
        shape_closure: { fg: '#7dcfff' attr: 'b' }
        shape_custom: '#9ece6a'
        shape_datetime: { fg: '#7dcfff' attr: 'b' }
        shape_directory: '#7dcfff'
        shape_external: '#7dcfff'
        shape_external_resolved: '#7dcfff'
        shape_externalarg: { fg: '#9ece6a' attr: 'b' }
        shape_filepath: '#7dcfff'
        shape_flag: { fg: '#7aa2f7' attr: 'b' }
        shape_float: { fg: '#f7768e' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#7dcfff' attr: 'b' }
        shape_globpattern: { fg: '#7dcfff' attr: 'b' }
        shape_int: { fg: '#bb9af7' attr: 'b' }
        shape_internalcall: { fg: '#7dcfff' attr: 'b' }
        shape_keyword: { fg: '#bb9af7' attr: 'b' }
        shape_list: { fg: '#7dcfff' attr: 'b' }
        shape_literal: '#7aa2f7'
        shape_match_pattern: '#9ece6a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f7768e'
        shape_operator: '#e0af68'
        shape_or: { fg: '#bb9af7' attr: 'b' }
        shape_pipe: { fg: '#bb9af7' attr: 'b' }
        shape_range: { fg: '#e0af68' attr: 'b' }
        shape_raw_string: { fg: '#c0caf5' attr: 'b' }
        shape_record: { fg: '#7dcfff' attr: 'b' }
        shape_redirection: { fg: '#bb9af7' attr: 'b' }
        shape_signature: { fg: '#9ece6a' attr: 'b' }
        shape_string: '#9ece6a'
        shape_string_interpolation: { fg: '#7dcfff' attr: 'b' }
        shape_table: { fg: '#7aa2f7' attr: 'b' }
        shape_vardecl: { fg: '#7aa2f7' attr: 'u' }
        shape_variable: '#bb9af7'

        foreground: '#c0caf5'
        background: '#24283b'
        cursor: '#c0caf5'

        empty: '#7aa2f7'
        header: { fg: '#9ece6a' attr: 'b' }
        hints: '#414868'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#9ece6a' attr: 'b' }
        search_result: { fg: '#f7768e' bg: '#a9b1d6' }
        separator: '#a9b1d6'
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