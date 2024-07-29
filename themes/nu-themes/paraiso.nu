# Retrieve the theme settings
export def main [] {
    return {
        binary: '#815ba4'
        block: '#06b6ef'
        cell-path: '#a39e9b'
        closure: '#5bc4bf'
        custom: '#e7e9db'
        duration: '#fec418'
        float: '#ef6155'
        glob: '#e7e9db'
        int: '#815ba4'
        list: '#5bc4bf'
        nothing: '#ef6155'
        range: '#fec418'
        record: '#5bc4bf'
        string: '#48b685'

        bool: {|| if $in { '#5bc4bf' } else { '#fec418' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ef6155' attr: 'b' }
            } else if $in < 6hr {
                '#ef6155'
            } else if $in < 1day {
                '#fec418'
            } else if $in < 3day {
                '#48b685'
            } else if $in < 1wk {
                { fg: '#48b685' attr: 'b' }
            } else if $in < 6wk {
                '#5bc4bf'
            } else if $in < 52wk {
                '#06b6ef'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a39e9b'
            } else if $e < 1mb {
                '#5bc4bf'
            } else {{ fg: '#06b6ef' }}
        }

        shape_and: { fg: '#815ba4' attr: 'b' }
        shape_binary: { fg: '#815ba4' attr: 'b' }
        shape_block: { fg: '#06b6ef' attr: 'b' }
        shape_bool: '#5bc4bf'
        shape_closure: { fg: '#5bc4bf' attr: 'b' }
        shape_custom: '#48b685'
        shape_datetime: { fg: '#5bc4bf' attr: 'b' }
        shape_directory: '#5bc4bf'
        shape_external: '#5bc4bf'
        shape_external_resolved: '#5bc4bf'
        shape_externalarg: { fg: '#48b685' attr: 'b' }
        shape_filepath: '#5bc4bf'
        shape_flag: { fg: '#06b6ef' attr: 'b' }
        shape_float: { fg: '#ef6155' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5bc4bf' attr: 'b' }
        shape_globpattern: { fg: '#5bc4bf' attr: 'b' }
        shape_int: { fg: '#815ba4' attr: 'b' }
        shape_internalcall: { fg: '#5bc4bf' attr: 'b' }
        shape_keyword: { fg: '#815ba4' attr: 'b' }
        shape_list: { fg: '#5bc4bf' attr: 'b' }
        shape_literal: '#06b6ef'
        shape_match_pattern: '#48b685'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ef6155'
        shape_operator: '#fec418'
        shape_or: { fg: '#815ba4' attr: 'b' }
        shape_pipe: { fg: '#815ba4' attr: 'b' }
        shape_range: { fg: '#fec418' attr: 'b' }
        shape_raw_string: { fg: '#e7e9db' attr: 'b' }
        shape_record: { fg: '#5bc4bf' attr: 'b' }
        shape_redirection: { fg: '#815ba4' attr: 'b' }
        shape_signature: { fg: '#48b685' attr: 'b' }
        shape_string: '#48b685'
        shape_string_interpolation: { fg: '#5bc4bf' attr: 'b' }
        shape_table: { fg: '#06b6ef' attr: 'b' }
        shape_vardecl: { fg: '#06b6ef' attr: 'u' }
        shape_variable: '#815ba4'

        foreground: '#a39e9b'
        background: '#2f1e2e'
        cursor: '#a39e9b'

        empty: '#06b6ef'
        header: { fg: '#48b685' attr: 'b' }
        hints: '#776e71'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#48b685' attr: 'b' }
        search_result: { fg: '#ef6155' bg: '#a39e9b' }
        separator: '#a39e9b'
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