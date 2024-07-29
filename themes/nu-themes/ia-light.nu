# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a94598'
        block: '#48bac2'
        cell-path: '#181818'
        closure: '#2d6bb1'
        custom: '#f8f8f8'
        duration: '#c48218'
        float: '#9c5a02'
        glob: '#f8f8f8'
        int: '#a94598'
        list: '#2d6bb1'
        nothing: '#9c5a02'
        range: '#c48218'
        record: '#2d6bb1'
        string: '#38781c'

        bool: {|| if $in { '#2d6bb1' } else { '#c48218' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#9c5a02' attr: 'b' }
            } else if $in < 6hr {
                '#9c5a02'
            } else if $in < 1day {
                '#c48218'
            } else if $in < 3day {
                '#38781c'
            } else if $in < 1wk {
                { fg: '#38781c' attr: 'b' }
            } else if $in < 6wk {
                '#2d6bb1'
            } else if $in < 52wk {
                '#48bac2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#181818'
            } else if $e < 1mb {
                '#2d6bb1'
            } else {{ fg: '#48bac2' }}
        }

        shape_and: { fg: '#a94598' attr: 'b' }
        shape_binary: { fg: '#a94598' attr: 'b' }
        shape_block: { fg: '#48bac2' attr: 'b' }
        shape_bool: '#2d6bb1'
        shape_closure: { fg: '#2d6bb1' attr: 'b' }
        shape_custom: '#38781c'
        shape_datetime: { fg: '#2d6bb1' attr: 'b' }
        shape_directory: '#2d6bb1'
        shape_external: '#2d6bb1'
        shape_external_resolved: '#2d6bb1'
        shape_externalarg: { fg: '#38781c' attr: 'b' }
        shape_filepath: '#2d6bb1'
        shape_flag: { fg: '#48bac2' attr: 'b' }
        shape_float: { fg: '#9c5a02' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#2d6bb1' attr: 'b' }
        shape_globpattern: { fg: '#2d6bb1' attr: 'b' }
        shape_int: { fg: '#a94598' attr: 'b' }
        shape_internalcall: { fg: '#2d6bb1' attr: 'b' }
        shape_keyword: { fg: '#a94598' attr: 'b' }
        shape_list: { fg: '#2d6bb1' attr: 'b' }
        shape_literal: '#48bac2'
        shape_match_pattern: '#38781c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#9c5a02'
        shape_operator: '#c48218'
        shape_or: { fg: '#a94598' attr: 'b' }
        shape_pipe: { fg: '#a94598' attr: 'b' }
        shape_range: { fg: '#c48218' attr: 'b' }
        shape_raw_string: { fg: '#f8f8f8' attr: 'b' }
        shape_record: { fg: '#2d6bb1' attr: 'b' }
        shape_redirection: { fg: '#a94598' attr: 'b' }
        shape_signature: { fg: '#38781c' attr: 'b' }
        shape_string: '#38781c'
        shape_string_interpolation: { fg: '#2d6bb1' attr: 'b' }
        shape_table: { fg: '#48bac2' attr: 'b' }
        shape_vardecl: { fg: '#48bac2' attr: 'u' }
        shape_variable: '#a94598'

        foreground: '#181818'
        background: '#f6f6f6'
        cursor: '#181818'

        empty: '#48bac2'
        header: { fg: '#38781c' attr: 'b' }
        hints: '#898989'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#38781c' attr: 'b' }
        search_result: { fg: '#9c5a02' bg: '#181818' }
        separator: '#181818'
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