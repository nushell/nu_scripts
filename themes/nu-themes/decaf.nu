# Retrieve the theme settings
export def main [] {
    return {
        binary: '#efb3f7'
        block: '#90bee1'
        cell-path: '#cccccc'
        closure: '#bed6ff'
        custom: '#ffffff'
        duration: '#ffd67c'
        float: '#ff7f7b'
        glob: '#ffffff'
        int: '#efb3f7'
        list: '#bed6ff'
        nothing: '#ff7f7b'
        range: '#ffd67c'
        record: '#bed6ff'
        string: '#beda78'

        bool: {|| if $in { '#bed6ff' } else { '#ffd67c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff7f7b' attr: 'b' }
            } else if $in < 6hr {
                '#ff7f7b'
            } else if $in < 1day {
                '#ffd67c'
            } else if $in < 3day {
                '#beda78'
            } else if $in < 1wk {
                { fg: '#beda78' attr: 'b' }
            } else if $in < 6wk {
                '#bed6ff'
            } else if $in < 52wk {
                '#90bee1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cccccc'
            } else if $e < 1mb {
                '#bed6ff'
            } else {{ fg: '#90bee1' }}
        }

        shape_and: { fg: '#efb3f7' attr: 'b' }
        shape_binary: { fg: '#efb3f7' attr: 'b' }
        shape_block: { fg: '#90bee1' attr: 'b' }
        shape_bool: '#bed6ff'
        shape_closure: { fg: '#bed6ff' attr: 'b' }
        shape_custom: '#beda78'
        shape_datetime: { fg: '#bed6ff' attr: 'b' }
        shape_directory: '#bed6ff'
        shape_external: '#bed6ff'
        shape_external_resolved: '#bed6ff'
        shape_externalarg: { fg: '#beda78' attr: 'b' }
        shape_filepath: '#bed6ff'
        shape_flag: { fg: '#90bee1' attr: 'b' }
        shape_float: { fg: '#ff7f7b' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#bed6ff' attr: 'b' }
        shape_globpattern: { fg: '#bed6ff' attr: 'b' }
        shape_int: { fg: '#efb3f7' attr: 'b' }
        shape_internalcall: { fg: '#bed6ff' attr: 'b' }
        shape_keyword: { fg: '#efb3f7' attr: 'b' }
        shape_list: { fg: '#bed6ff' attr: 'b' }
        shape_literal: '#90bee1'
        shape_match_pattern: '#beda78'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff7f7b'
        shape_operator: '#ffd67c'
        shape_or: { fg: '#efb3f7' attr: 'b' }
        shape_pipe: { fg: '#efb3f7' attr: 'b' }
        shape_range: { fg: '#ffd67c' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#bed6ff' attr: 'b' }
        shape_redirection: { fg: '#efb3f7' attr: 'b' }
        shape_signature: { fg: '#beda78' attr: 'b' }
        shape_string: '#beda78'
        shape_string_interpolation: { fg: '#bed6ff' attr: 'b' }
        shape_table: { fg: '#90bee1' attr: 'b' }
        shape_vardecl: { fg: '#90bee1' attr: 'u' }
        shape_variable: '#efb3f7'

        foreground: '#cccccc'
        background: '#2d2d2d'
        cursor: '#cccccc'

        empty: '#90bee1'
        header: { fg: '#beda78' attr: 'b' }
        hints: '#777777'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#beda78' attr: 'b' }
        search_result: { fg: '#ff7f7b' bg: '#cccccc' }
        separator: '#cccccc'
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