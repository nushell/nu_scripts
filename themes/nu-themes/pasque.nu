# Retrieve the theme settings
export def main [] {
    return {
        binary: '#953b9d'
        block: '#8e7dc6'
        cell-path: '#dedcdf'
        closure: '#7263aa'
        custom: '#bbaadd'
        duration: '#804ead'
        float: '#a92258'
        glob: '#bbaadd'
        int: '#953b9d'
        list: '#7263aa'
        nothing: '#a92258'
        range: '#804ead'
        record: '#7263aa'
        string: '#c6914b'

        bool: {|| if $in { '#7263aa' } else { '#804ead' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a92258' attr: 'b' }
            } else if $in < 6hr {
                '#a92258'
            } else if $in < 1day {
                '#804ead'
            } else if $in < 3day {
                '#c6914b'
            } else if $in < 1wk {
                { fg: '#c6914b' attr: 'b' }
            } else if $in < 6wk {
                '#7263aa'
            } else if $in < 52wk {
                '#8e7dc6'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#dedcdf'
            } else if $e < 1mb {
                '#7263aa'
            } else {{ fg: '#8e7dc6' }}
        }

        shape_and: { fg: '#953b9d' attr: 'b' }
        shape_binary: { fg: '#953b9d' attr: 'b' }
        shape_block: { fg: '#8e7dc6' attr: 'b' }
        shape_bool: '#7263aa'
        shape_closure: { fg: '#7263aa' attr: 'b' }
        shape_custom: '#c6914b'
        shape_datetime: { fg: '#7263aa' attr: 'b' }
        shape_directory: '#7263aa'
        shape_external: '#7263aa'
        shape_external_resolved: '#7263aa'
        shape_externalarg: { fg: '#c6914b' attr: 'b' }
        shape_filepath: '#7263aa'
        shape_flag: { fg: '#8e7dc6' attr: 'b' }
        shape_float: { fg: '#a92258' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#7263aa' attr: 'b' }
        shape_globpattern: { fg: '#7263aa' attr: 'b' }
        shape_int: { fg: '#953b9d' attr: 'b' }
        shape_internalcall: { fg: '#7263aa' attr: 'b' }
        shape_keyword: { fg: '#953b9d' attr: 'b' }
        shape_list: { fg: '#7263aa' attr: 'b' }
        shape_literal: '#8e7dc6'
        shape_match_pattern: '#c6914b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a92258'
        shape_operator: '#804ead'
        shape_or: { fg: '#953b9d' attr: 'b' }
        shape_pipe: { fg: '#953b9d' attr: 'b' }
        shape_range: { fg: '#804ead' attr: 'b' }
        shape_raw_string: { fg: '#bbaadd' attr: 'b' }
        shape_record: { fg: '#7263aa' attr: 'b' }
        shape_redirection: { fg: '#953b9d' attr: 'b' }
        shape_signature: { fg: '#c6914b' attr: 'b' }
        shape_string: '#c6914b'
        shape_string_interpolation: { fg: '#7263aa' attr: 'b' }
        shape_table: { fg: '#8e7dc6' attr: 'b' }
        shape_vardecl: { fg: '#8e7dc6' attr: 'u' }
        shape_variable: '#953b9d'

        foreground: '#dedcdf'
        background: '#271c3a'
        cursor: '#dedcdf'

        empty: '#8e7dc6'
        header: { fg: '#c6914b' attr: 'b' }
        hints: '#5d5766'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#c6914b' attr: 'b' }
        search_result: { fg: '#a92258' bg: '#dedcdf' }
        separator: '#dedcdf'
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