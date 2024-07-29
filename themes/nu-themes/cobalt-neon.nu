# Retrieve the theme settings
export def main [] {
    return {
        binary: '#781aa0'
        block: '#8ff586'
        cell-path: '#ba46b2'
        closure: '#8ff586'
        custom: '#8ff586'
        duration: '#e9e75c'
        float: '#d4312e'
        glob: '#8ff586'
        int: '#781aa0'
        list: '#8ff586'
        nothing: '#ff2320'
        range: '#e9e75c'
        record: '#8ff586'
        string: '#3ba5ff'

        bool: {|| if $in { '#6cbc67' } else { '#e9e75c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff2320' attr: 'b' }
            } else if $in < 6hr {
                '#ff2320'
            } else if $in < 1day {
                '#e9e75c'
            } else if $in < 3day {
                '#3ba5ff'
            } else if $in < 1wk {
                { fg: '#3ba5ff' attr: 'b' }
            } else if $in < 6wk {
                '#8ff586'
            } else if $in < 52wk {
                '#8ff586'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ba46b2'
            } else if $e < 1mb {
                '#8ff586'
            } else {{ fg: '#8ff586' }}
        }

        shape_and: { fg: '#781aa0' attr: 'b' }
        shape_binary: { fg: '#781aa0' attr: 'b' }
        shape_block: { fg: '#8ff586' attr: 'b' }
        shape_bool: '#6cbc67'
        shape_closure: { fg: '#8ff586' attr: 'b' }
        shape_custom: '#3ba5ff'
        shape_datetime: { fg: '#8ff586' attr: 'b' }
        shape_directory: '#8ff586'
        shape_external: '#8ff586'
        shape_external_resolved: '#6cbc67'
        shape_externalarg: { fg: '#3ba5ff' attr: 'b' }
        shape_filepath: '#8ff586'
        shape_flag: { fg: '#8ff586' attr: 'b' }
        shape_float: { fg: '#d4312e' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8ff586' attr: 'b' }
        shape_globpattern: { fg: '#8ff586' attr: 'b' }
        shape_int: { fg: '#781aa0' attr: 'b' }
        shape_internalcall: { fg: '#8ff586' attr: 'b' }
        shape_keyword: { fg: '#781aa0' attr: 'b' }
        shape_list: { fg: '#8ff586' attr: 'b' }
        shape_literal: '#8ff586'
        shape_match_pattern: '#3ba5ff'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff2320'
        shape_operator: '#e9e75c'
        shape_or: { fg: '#781aa0' attr: 'b' }
        shape_pipe: { fg: '#781aa0' attr: 'b' }
        shape_range: { fg: '#e9e75c' attr: 'b' }
        shape_raw_string: { fg: '#8ff586' attr: 'b' }
        shape_record: { fg: '#8ff586' attr: 'b' }
        shape_redirection: { fg: '#781aa0' attr: 'b' }
        shape_signature: { fg: '#3ba5ff' attr: 'b' }
        shape_string: '#3ba5ff'
        shape_string_interpolation: { fg: '#8ff586' attr: 'b' }
        shape_table: { fg: '#8ff586' attr: 'b' }
        shape_vardecl: { fg: '#8ff586' attr: 'u' }
        shape_variable: '#781aa0'

        foreground: '#8ff586'
        background: '#142838'
        cursor: '#8ff586'

        empty: '#8ff586'
        header: { fg: '#3ba5ff' attr: 'b' }
        hints: '#fff688'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#3ba5ff' attr: 'b' }
        search_result: { fg: '#ff2320' bg: '#ba46b2' }
        separator: '#ba46b2'
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