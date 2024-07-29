# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b87ab8'
        block: '#7a7ab8'
        cell-path: '#d9d9d9'
        closure: '#7ab8b8'
        custom: '#ffffff'
        duration: '#b8b87a'
        float: '#dbbdbd'
        glob: '#ffffff'
        int: '#b87ab8'
        list: '#7ab8b8'
        nothing: '#b87a7a'
        range: '#b8b87a'
        record: '#7ab8b8'
        string: '#7ab87a'

        bool: {|| if $in { '#bddbdb' } else { '#b8b87a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b87a7a' attr: 'b' }
            } else if $in < 6hr {
                '#b87a7a'
            } else if $in < 1day {
                '#b8b87a'
            } else if $in < 3day {
                '#7ab87a'
            } else if $in < 1wk {
                { fg: '#7ab87a' attr: 'b' }
            } else if $in < 6wk {
                '#7ab8b8'
            } else if $in < 52wk {
                '#7a7ab8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d9d9d9'
            } else if $e < 1mb {
                '#7ab8b8'
            } else {{ fg: '#7a7ab8' }}
        }

        shape_and: { fg: '#b87ab8' attr: 'b' }
        shape_binary: { fg: '#b87ab8' attr: 'b' }
        shape_block: { fg: '#7a7ab8' attr: 'b' }
        shape_bool: '#bddbdb'
        shape_closure: { fg: '#7ab8b8' attr: 'b' }
        shape_custom: '#7ab87a'
        shape_datetime: { fg: '#7ab8b8' attr: 'b' }
        shape_directory: '#7ab8b8'
        shape_external: '#7ab8b8'
        shape_external_resolved: '#bddbdb'
        shape_externalarg: { fg: '#7ab87a' attr: 'b' }
        shape_filepath: '#7ab8b8'
        shape_flag: { fg: '#7a7ab8' attr: 'b' }
        shape_float: { fg: '#dbbdbd' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#7ab8b8' attr: 'b' }
        shape_globpattern: { fg: '#7ab8b8' attr: 'b' }
        shape_int: { fg: '#b87ab8' attr: 'b' }
        shape_internalcall: { fg: '#7ab8b8' attr: 'b' }
        shape_keyword: { fg: '#b87ab8' attr: 'b' }
        shape_list: { fg: '#7ab8b8' attr: 'b' }
        shape_literal: '#7a7ab8'
        shape_match_pattern: '#7ab87a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b87a7a'
        shape_operator: '#b8b87a'
        shape_or: { fg: '#b87ab8' attr: 'b' }
        shape_pipe: { fg: '#b87ab8' attr: 'b' }
        shape_range: { fg: '#b8b87a' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#7ab8b8' attr: 'b' }
        shape_redirection: { fg: '#b87ab8' attr: 'b' }
        shape_signature: { fg: '#7ab87a' attr: 'b' }
        shape_string: '#7ab87a'
        shape_string_interpolation: { fg: '#7ab8b8' attr: 'b' }
        shape_table: { fg: '#7a7ab8' attr: 'b' }
        shape_vardecl: { fg: '#7a7ab8' attr: 'u' }
        shape_variable: '#b87ab8'

        foreground: '#d9e6f2'
        background: '#0d1926'
        cursor: '#d9e6f2'

        empty: '#7a7ab8'
        header: { fg: '#7ab87a' attr: 'b' }
        hints: '#262626'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7ab87a' attr: 'b' }
        search_result: { fg: '#b87a7a' bg: '#d9d9d9' }
        separator: '#d9d9d9'
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