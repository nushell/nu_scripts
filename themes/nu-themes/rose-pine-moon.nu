# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c4a7e7'
        block: '#9ccfd8'
        cell-path: '#e0def4'
        closure: '#3e8fb0'
        custom: '#d9d7e1'
        duration: '#f6c177'
        float: '#ecebf0'
        glob: '#d9d7e1'
        int: '#c4a7e7'
        list: '#3e8fb0'
        nothing: '#ecebf0'
        range: '#f6c177'
        record: '#3e8fb0'
        string: '#ea9a97'

        bool: {|| if $in { '#3e8fb0' } else { '#f6c177' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ecebf0' attr: 'b' }
            } else if $in < 6hr {
                '#ecebf0'
            } else if $in < 1day {
                '#f6c177'
            } else if $in < 3day {
                '#ea9a97'
            } else if $in < 1wk {
                { fg: '#ea9a97' attr: 'b' }
            } else if $in < 6wk {
                '#3e8fb0'
            } else if $in < 52wk {
                '#9ccfd8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e0def4'
            } else if $e < 1mb {
                '#3e8fb0'
            } else {{ fg: '#9ccfd8' }}
        }

        shape_and: { fg: '#c4a7e7' attr: 'b' }
        shape_binary: { fg: '#c4a7e7' attr: 'b' }
        shape_block: { fg: '#9ccfd8' attr: 'b' }
        shape_bool: '#3e8fb0'
        shape_closure: { fg: '#3e8fb0' attr: 'b' }
        shape_custom: '#ea9a97'
        shape_datetime: { fg: '#3e8fb0' attr: 'b' }
        shape_directory: '#3e8fb0'
        shape_external: '#3e8fb0'
        shape_external_resolved: '#3e8fb0'
        shape_externalarg: { fg: '#ea9a97' attr: 'b' }
        shape_filepath: '#3e8fb0'
        shape_flag: { fg: '#9ccfd8' attr: 'b' }
        shape_float: { fg: '#ecebf0' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3e8fb0' attr: 'b' }
        shape_globpattern: { fg: '#3e8fb0' attr: 'b' }
        shape_int: { fg: '#c4a7e7' attr: 'b' }
        shape_internalcall: { fg: '#3e8fb0' attr: 'b' }
        shape_keyword: { fg: '#c4a7e7' attr: 'b' }
        shape_list: { fg: '#3e8fb0' attr: 'b' }
        shape_literal: '#9ccfd8'
        shape_match_pattern: '#ea9a97'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ecebf0'
        shape_operator: '#f6c177'
        shape_or: { fg: '#c4a7e7' attr: 'b' }
        shape_pipe: { fg: '#c4a7e7' attr: 'b' }
        shape_range: { fg: '#f6c177' attr: 'b' }
        shape_raw_string: { fg: '#d9d7e1' attr: 'b' }
        shape_record: { fg: '#3e8fb0' attr: 'b' }
        shape_redirection: { fg: '#c4a7e7' attr: 'b' }
        shape_signature: { fg: '#ea9a97' attr: 'b' }
        shape_string: '#ea9a97'
        shape_string_interpolation: { fg: '#3e8fb0' attr: 'b' }
        shape_table: { fg: '#9ccfd8' attr: 'b' }
        shape_vardecl: { fg: '#9ccfd8' attr: 'u' }
        shape_variable: '#c4a7e7'

        foreground: '#e0def4'
        background: '#232136'
        cursor: '#e0def4'

        empty: '#9ccfd8'
        header: { fg: '#ea9a97' attr: 'b' }
        hints: '#59546d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#ea9a97' attr: 'b' }
        search_result: { fg: '#ecebf0' bg: '#e0def4' }
        separator: '#e0def4'
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