# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6a7fd2'
        block: '#008dd1'
        cell-path: '#afaba2'
        closure: '#00948b'
        custom: '#e7e2d9'
        duration: '#bb8801'
        float: '#f04339'
        glob: '#e7e2d9'
        int: '#6a7fd2'
        list: '#00948b'
        nothing: '#f04339'
        range: '#bb8801'
        record: '#00948b'
        string: '#7f8b00'

        bool: {|| if $in { '#00948b' } else { '#bb8801' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f04339' attr: 'b' }
            } else if $in < 6hr {
                '#f04339'
            } else if $in < 1day {
                '#bb8801'
            } else if $in < 3day {
                '#7f8b00'
            } else if $in < 1wk {
                { fg: '#7f8b00' attr: 'b' }
            } else if $in < 6wk {
                '#00948b'
            } else if $in < 52wk {
                '#008dd1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#afaba2'
            } else if $e < 1mb {
                '#00948b'
            } else {{ fg: '#008dd1' }}
        }

        shape_and: { fg: '#6a7fd2' attr: 'b' }
        shape_binary: { fg: '#6a7fd2' attr: 'b' }
        shape_block: { fg: '#008dd1' attr: 'b' }
        shape_bool: '#00948b'
        shape_closure: { fg: '#00948b' attr: 'b' }
        shape_custom: '#7f8b00'
        shape_datetime: { fg: '#00948b' attr: 'b' }
        shape_directory: '#00948b'
        shape_external: '#00948b'
        shape_external_resolved: '#00948b'
        shape_externalarg: { fg: '#7f8b00' attr: 'b' }
        shape_filepath: '#00948b'
        shape_flag: { fg: '#008dd1' attr: 'b' }
        shape_float: { fg: '#f04339' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00948b' attr: 'b' }
        shape_globpattern: { fg: '#00948b' attr: 'b' }
        shape_int: { fg: '#6a7fd2' attr: 'b' }
        shape_internalcall: { fg: '#00948b' attr: 'b' }
        shape_keyword: { fg: '#6a7fd2' attr: 'b' }
        shape_list: { fg: '#00948b' attr: 'b' }
        shape_literal: '#008dd1'
        shape_match_pattern: '#7f8b00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f04339'
        shape_operator: '#bb8801'
        shape_or: { fg: '#6a7fd2' attr: 'b' }
        shape_pipe: { fg: '#6a7fd2' attr: 'b' }
        shape_range: { fg: '#bb8801' attr: 'b' }
        shape_raw_string: { fg: '#e7e2d9' attr: 'b' }
        shape_record: { fg: '#00948b' attr: 'b' }
        shape_redirection: { fg: '#6a7fd2' attr: 'b' }
        shape_signature: { fg: '#7f8b00' attr: 'b' }
        shape_string: '#7f8b00'
        shape_string_interpolation: { fg: '#00948b' attr: 'b' }
        shape_table: { fg: '#008dd1' attr: 'b' }
        shape_vardecl: { fg: '#008dd1' attr: 'u' }
        shape_variable: '#6a7fd2'

        foreground: '#afaba2'
        background: '#0c1118'
        cursor: '#afaba2'

        empty: '#008dd1'
        header: { fg: '#7f8b00' attr: 'b' }
        hints: '#7b776e'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7f8b00' attr: 'b' }
        search_result: { fg: '#f04339' bg: '#afaba2' }
        separator: '#afaba2'
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