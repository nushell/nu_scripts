# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e17599'
        block: '#44aae6'
        cell-path: '#c3dde1'
        closure: '#3dd5e7'
        custom: '#d9fbff'
        duration: '#e5b684'
        float: '#e65029'
        glob: '#d9fbff'
        int: '#e17599'
        list: '#3dd5e7'
        nothing: '#e9653b'
        range: '#e5b684'
        record: '#3dd5e7'
        string: '#39e9a8'

        bool: {|| if $in { '#5fffff' } else { '#e5b684' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e9653b' attr: 'b' }
            } else if $in < 6hr {
                '#e9653b'
            } else if $in < 1day {
                '#e5b684'
            } else if $in < 3day {
                '#39e9a8'
            } else if $in < 1wk {
                { fg: '#39e9a8' attr: 'b' }
            } else if $in < 6wk {
                '#3dd5e7'
            } else if $in < 52wk {
                '#44aae6'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c3dde1'
            } else if $e < 1mb {
                '#3dd5e7'
            } else {{ fg: '#44aae6' }}
        }

        shape_and: { fg: '#e17599' attr: 'b' }
        shape_binary: { fg: '#e17599' attr: 'b' }
        shape_block: { fg: '#44aae6' attr: 'b' }
        shape_bool: '#5fffff'
        shape_closure: { fg: '#3dd5e7' attr: 'b' }
        shape_custom: '#39e9a8'
        shape_datetime: { fg: '#3dd5e7' attr: 'b' }
        shape_directory: '#3dd5e7'
        shape_external: '#3dd5e7'
        shape_external_resolved: '#5fffff'
        shape_externalarg: { fg: '#39e9a8' attr: 'b' }
        shape_filepath: '#3dd5e7'
        shape_flag: { fg: '#44aae6' attr: 'b' }
        shape_float: { fg: '#e65029' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3dd5e7' attr: 'b' }
        shape_globpattern: { fg: '#3dd5e7' attr: 'b' }
        shape_int: { fg: '#e17599' attr: 'b' }
        shape_internalcall: { fg: '#3dd5e7' attr: 'b' }
        shape_keyword: { fg: '#e17599' attr: 'b' }
        shape_list: { fg: '#3dd5e7' attr: 'b' }
        shape_literal: '#44aae6'
        shape_match_pattern: '#39e9a8'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e9653b'
        shape_operator: '#e5b684'
        shape_or: { fg: '#e17599' attr: 'b' }
        shape_pipe: { fg: '#e17599' attr: 'b' }
        shape_range: { fg: '#e5b684' attr: 'b' }
        shape_raw_string: { fg: '#d9fbff' attr: 'b' }
        shape_record: { fg: '#3dd5e7' attr: 'b' }
        shape_redirection: { fg: '#e17599' attr: 'b' }
        shape_signature: { fg: '#39e9a8' attr: 'b' }
        shape_string: '#39e9a8'
        shape_string_interpolation: { fg: '#3dd5e7' attr: 'b' }
        shape_table: { fg: '#44aae6' attr: 'b' }
        shape_vardecl: { fg: '#44aae6' attr: 'u' }
        shape_variable: '#e17599'

        foreground: '#cccccc'
        background: '#1e1e1e'
        cursor: '#cccccc'

        empty: '#44aae6'
        header: { fg: '#39e9a8' attr: 'b' }
        hints: '#598489'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#39e9a8' attr: 'b' }
        search_result: { fg: '#e9653b' bg: '#c3dde1' }
        separator: '#c3dde1'
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