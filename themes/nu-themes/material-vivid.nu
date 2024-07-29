# Retrieve the theme settings
export def main [] {
    return {
        binary: '#673ab7'
        block: '#2196f3'
        cell-path: '#80868b'
        closure: '#00bcd4'
        custom: '#ffffff'
        duration: '#ffeb3b'
        float: '#f44336'
        glob: '#ffffff'
        int: '#673ab7'
        list: '#00bcd4'
        nothing: '#f44336'
        range: '#ffeb3b'
        record: '#00bcd4'
        string: '#00e676'

        bool: {|| if $in { '#00bcd4' } else { '#ffeb3b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f44336' attr: 'b' }
            } else if $in < 6hr {
                '#f44336'
            } else if $in < 1day {
                '#ffeb3b'
            } else if $in < 3day {
                '#00e676'
            } else if $in < 1wk {
                { fg: '#00e676' attr: 'b' }
            } else if $in < 6wk {
                '#00bcd4'
            } else if $in < 52wk {
                '#2196f3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#80868b'
            } else if $e < 1mb {
                '#00bcd4'
            } else {{ fg: '#2196f3' }}
        }

        shape_and: { fg: '#673ab7' attr: 'b' }
        shape_binary: { fg: '#673ab7' attr: 'b' }
        shape_block: { fg: '#2196f3' attr: 'b' }
        shape_bool: '#00bcd4'
        shape_closure: { fg: '#00bcd4' attr: 'b' }
        shape_custom: '#00e676'
        shape_datetime: { fg: '#00bcd4' attr: 'b' }
        shape_directory: '#00bcd4'
        shape_external: '#00bcd4'
        shape_external_resolved: '#00bcd4'
        shape_externalarg: { fg: '#00e676' attr: 'b' }
        shape_filepath: '#00bcd4'
        shape_flag: { fg: '#2196f3' attr: 'b' }
        shape_float: { fg: '#f44336' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00bcd4' attr: 'b' }
        shape_globpattern: { fg: '#00bcd4' attr: 'b' }
        shape_int: { fg: '#673ab7' attr: 'b' }
        shape_internalcall: { fg: '#00bcd4' attr: 'b' }
        shape_keyword: { fg: '#673ab7' attr: 'b' }
        shape_list: { fg: '#00bcd4' attr: 'b' }
        shape_literal: '#2196f3'
        shape_match_pattern: '#00e676'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f44336'
        shape_operator: '#ffeb3b'
        shape_or: { fg: '#673ab7' attr: 'b' }
        shape_pipe: { fg: '#673ab7' attr: 'b' }
        shape_range: { fg: '#ffeb3b' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00bcd4' attr: 'b' }
        shape_redirection: { fg: '#673ab7' attr: 'b' }
        shape_signature: { fg: '#00e676' attr: 'b' }
        shape_string: '#00e676'
        shape_string_interpolation: { fg: '#00bcd4' attr: 'b' }
        shape_table: { fg: '#2196f3' attr: 'b' }
        shape_vardecl: { fg: '#2196f3' attr: 'u' }
        shape_variable: '#673ab7'

        foreground: '#80868b'
        background: '#202124'
        cursor: '#80868b'

        empty: '#2196f3'
        header: { fg: '#00e676' attr: 'b' }
        hints: '#44464d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00e676' attr: 'b' }
        search_result: { fg: '#f44336' bg: '#80868b' }
        separator: '#80868b'
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