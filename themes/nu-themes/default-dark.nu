# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ba8baf'
        block: '#7cafc2'
        cell-path: '#d8d8d8'
        closure: '#86c1b9'
        custom: '#f8f8f8'
        duration: '#f7ca88'
        float: '#ab4642'
        glob: '#f8f8f8'
        int: '#ba8baf'
        list: '#86c1b9'
        nothing: '#ab4642'
        range: '#f7ca88'
        record: '#86c1b9'
        string: '#a1b56c'

        bool: {|| if $in { '#86c1b9' } else { '#f7ca88' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ab4642' attr: 'b' }
            } else if $in < 6hr {
                '#ab4642'
            } else if $in < 1day {
                '#f7ca88'
            } else if $in < 3day {
                '#a1b56c'
            } else if $in < 1wk {
                { fg: '#a1b56c' attr: 'b' }
            } else if $in < 6wk {
                '#86c1b9'
            } else if $in < 52wk {
                '#7cafc2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d8d8d8'
            } else if $e < 1mb {
                '#86c1b9'
            } else {{ fg: '#7cafc2' }}
        }

        shape_and: { fg: '#ba8baf' attr: 'b' }
        shape_binary: { fg: '#ba8baf' attr: 'b' }
        shape_block: { fg: '#7cafc2' attr: 'b' }
        shape_bool: '#86c1b9'
        shape_closure: { fg: '#86c1b9' attr: 'b' }
        shape_custom: '#a1b56c'
        shape_datetime: { fg: '#86c1b9' attr: 'b' }
        shape_directory: '#86c1b9'
        shape_external: '#86c1b9'
        shape_external_resolved: '#86c1b9'
        shape_externalarg: { fg: '#a1b56c' attr: 'b' }
        shape_filepath: '#86c1b9'
        shape_flag: { fg: '#7cafc2' attr: 'b' }
        shape_float: { fg: '#ab4642' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#86c1b9' attr: 'b' }
        shape_globpattern: { fg: '#86c1b9' attr: 'b' }
        shape_int: { fg: '#ba8baf' attr: 'b' }
        shape_internalcall: { fg: '#86c1b9' attr: 'b' }
        shape_keyword: { fg: '#ba8baf' attr: 'b' }
        shape_list: { fg: '#86c1b9' attr: 'b' }
        shape_literal: '#7cafc2'
        shape_match_pattern: '#a1b56c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ab4642'
        shape_operator: '#f7ca88'
        shape_or: { fg: '#ba8baf' attr: 'b' }
        shape_pipe: { fg: '#ba8baf' attr: 'b' }
        shape_range: { fg: '#f7ca88' attr: 'b' }
        shape_raw_string: { fg: '#f8f8f8' attr: 'b' }
        shape_record: { fg: '#86c1b9' attr: 'b' }
        shape_redirection: { fg: '#ba8baf' attr: 'b' }
        shape_signature: { fg: '#a1b56c' attr: 'b' }
        shape_string: '#a1b56c'
        shape_string_interpolation: { fg: '#86c1b9' attr: 'b' }
        shape_table: { fg: '#7cafc2' attr: 'b' }
        shape_vardecl: { fg: '#7cafc2' attr: 'u' }
        shape_variable: '#ba8baf'

        foreground: '#d8d8d8'
        background: '#181818'
        cursor: '#d8d8d8'

        empty: '#7cafc2'
        header: { fg: '#a1b56c' attr: 'b' }
        hints: '#585858'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a1b56c' attr: 'b' }
        search_result: { fg: '#ab4642' bg: '#d8d8d8' }
        separator: '#d8d8d8'
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