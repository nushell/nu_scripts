# Retrieve the theme settings
export def main [] {
    return {
        binary: '#716cae'
        block: '#4d6bb6'
        cell-path: '#a4a6a9'
        closure: '#226f68'
        custom: '#8dbdaa'
        duration: '#4f9062'
        float: '#777abc'
        glob: '#8dbdaa'
        int: '#716cae'
        list: '#226f68'
        nothing: '#777abc'
        range: '#4f9062'
        record: '#226f68'
        string: '#6562a8'

        bool: {|| if $in { '#226f68' } else { '#4f9062' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#777abc' attr: 'b' }
            } else if $in < 6hr {
                '#777abc'
            } else if $in < 1day {
                '#4f9062'
            } else if $in < 3day {
                '#6562a8'
            } else if $in < 1wk {
                { fg: '#6562a8' attr: 'b' }
            } else if $in < 6wk {
                '#226f68'
            } else if $in < 52wk {
                '#4d6bb6'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a4a6a9'
            } else if $e < 1mb {
                '#226f68'
            } else {{ fg: '#4d6bb6' }}
        }

        shape_and: { fg: '#716cae' attr: 'b' }
        shape_binary: { fg: '#716cae' attr: 'b' }
        shape_block: { fg: '#4d6bb6' attr: 'b' }
        shape_bool: '#226f68'
        shape_closure: { fg: '#226f68' attr: 'b' }
        shape_custom: '#6562a8'
        shape_datetime: { fg: '#226f68' attr: 'b' }
        shape_directory: '#226f68'
        shape_external: '#226f68'
        shape_external_resolved: '#226f68'
        shape_externalarg: { fg: '#6562a8' attr: 'b' }
        shape_filepath: '#226f68'
        shape_flag: { fg: '#4d6bb6' attr: 'b' }
        shape_float: { fg: '#777abc' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#226f68' attr: 'b' }
        shape_globpattern: { fg: '#226f68' attr: 'b' }
        shape_int: { fg: '#716cae' attr: 'b' }
        shape_internalcall: { fg: '#226f68' attr: 'b' }
        shape_keyword: { fg: '#716cae' attr: 'b' }
        shape_list: { fg: '#226f68' attr: 'b' }
        shape_literal: '#4d6bb6'
        shape_match_pattern: '#6562a8'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#777abc'
        shape_operator: '#4f9062'
        shape_or: { fg: '#716cae' attr: 'b' }
        shape_pipe: { fg: '#716cae' attr: 'b' }
        shape_range: { fg: '#4f9062' attr: 'b' }
        shape_raw_string: { fg: '#8dbdaa' attr: 'b' }
        shape_record: { fg: '#226f68' attr: 'b' }
        shape_redirection: { fg: '#716cae' attr: 'b' }
        shape_signature: { fg: '#6562a8' attr: 'b' }
        shape_string: '#6562a8'
        shape_string_interpolation: { fg: '#226f68' attr: 'b' }
        shape_table: { fg: '#4d6bb6' attr: 'b' }
        shape_vardecl: { fg: '#4d6bb6' attr: 'u' }
        shape_variable: '#716cae'

        foreground: '#a4a6a9'
        background: '#22273b'
        cursor: '#a4a6a9'

        empty: '#4d6bb6'
        header: { fg: '#6562a8' attr: 'b' }
        hints: '#6e6f72'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6562a8' attr: 'b' }
        search_result: { fg: '#777abc' bg: '#a4a6a9' }
        separator: '#a4a6a9'
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