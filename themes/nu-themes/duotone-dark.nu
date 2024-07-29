# Retrieve the theme settings
export def main [] {
    return {
        binary: '#dd8d40'
        block: '#ffc183'
        cell-path: '#b6a0ff'
        closure: '#2388ff'
        custom: '#e9e4ff'
        duration: '#d8b76e'
        float: '#d8393d'
        glob: '#e9e4ff'
        int: '#dd8d40'
        list: '#2388ff'
        nothing: '#d8393d'
        range: '#d8b76e'
        record: '#2388ff'
        string: '#2dcc72'

        bool: {|| if $in { '#2388ff' } else { '#d8b76e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d8393d' attr: 'b' }
            } else if $in < 6hr {
                '#d8393d'
            } else if $in < 1day {
                '#d8b76e'
            } else if $in < 3day {
                '#2dcc72'
            } else if $in < 1wk {
                { fg: '#2dcc72' attr: 'b' }
            } else if $in < 6wk {
                '#2388ff'
            } else if $in < 52wk {
                '#ffc183'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b6a0ff'
            } else if $e < 1mb {
                '#2388ff'
            } else {{ fg: '#ffc183' }}
        }

        shape_and: { fg: '#dd8d40' attr: 'b' }
        shape_binary: { fg: '#dd8d40' attr: 'b' }
        shape_block: { fg: '#ffc183' attr: 'b' }
        shape_bool: '#2388ff'
        shape_closure: { fg: '#2388ff' attr: 'b' }
        shape_custom: '#2dcc72'
        shape_datetime: { fg: '#2388ff' attr: 'b' }
        shape_directory: '#2388ff'
        shape_external: '#2388ff'
        shape_external_resolved: '#2388ff'
        shape_externalarg: { fg: '#2dcc72' attr: 'b' }
        shape_filepath: '#2388ff'
        shape_flag: { fg: '#ffc183' attr: 'b' }
        shape_float: { fg: '#d8393d' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#2388ff' attr: 'b' }
        shape_globpattern: { fg: '#2388ff' attr: 'b' }
        shape_int: { fg: '#dd8d40' attr: 'b' }
        shape_internalcall: { fg: '#2388ff' attr: 'b' }
        shape_keyword: { fg: '#dd8d40' attr: 'b' }
        shape_list: { fg: '#2388ff' attr: 'b' }
        shape_literal: '#ffc183'
        shape_match_pattern: '#2dcc72'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d8393d'
        shape_operator: '#d8b76e'
        shape_or: { fg: '#dd8d40' attr: 'b' }
        shape_pipe: { fg: '#dd8d40' attr: 'b' }
        shape_range: { fg: '#d8b76e' attr: 'b' }
        shape_raw_string: { fg: '#e9e4ff' attr: 'b' }
        shape_record: { fg: '#2388ff' attr: 'b' }
        shape_redirection: { fg: '#dd8d40' attr: 'b' }
        shape_signature: { fg: '#2dcc72' attr: 'b' }
        shape_string: '#2dcc72'
        shape_string_interpolation: { fg: '#2388ff' attr: 'b' }
        shape_table: { fg: '#ffc183' attr: 'b' }
        shape_vardecl: { fg: '#ffc183' attr: 'u' }
        shape_variable: '#dd8d40'

        foreground: '#b6a0ff'
        background: '#1f1c27'
        cursor: '#ff9738'

        empty: '#ffc183'
        header: { fg: '#2dcc72' attr: 'b' }
        hints: '#353146'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#2dcc72' attr: 'b' }
        search_result: { fg: '#d8393d' bg: '#b6a0ff' }
        separator: '#b6a0ff'
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