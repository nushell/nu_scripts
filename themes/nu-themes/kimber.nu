# Retrieve the theme settings
export def main [] {
    return {
        binary: '#86cacd'
        block: '#537c9c'
        cell-path: '#dedee7'
        closure: '#78b4b4'
        custom: '#ffffe6'
        duration: '#d8b56d'
        float: '#c88c8c'
        glob: '#ffffe6'
        int: '#86cacd'
        list: '#78b4b4'
        nothing: '#c88c8c'
        range: '#d8b56d'
        record: '#78b4b4'
        string: '#99c899'

        bool: {|| if $in { '#78b4b4' } else { '#d8b56d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c88c8c' attr: 'b' }
            } else if $in < 6hr {
                '#c88c8c'
            } else if $in < 1day {
                '#d8b56d'
            } else if $in < 3day {
                '#99c899'
            } else if $in < 1wk {
                { fg: '#99c899' attr: 'b' }
            } else if $in < 6wk {
                '#78b4b4'
            } else if $in < 52wk {
                '#537c9c'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#dedee7'
            } else if $e < 1mb {
                '#78b4b4'
            } else {{ fg: '#537c9c' }}
        }

        shape_and: { fg: '#86cacd' attr: 'b' }
        shape_binary: { fg: '#86cacd' attr: 'b' }
        shape_block: { fg: '#537c9c' attr: 'b' }
        shape_bool: '#78b4b4'
        shape_closure: { fg: '#78b4b4' attr: 'b' }
        shape_custom: '#99c899'
        shape_datetime: { fg: '#78b4b4' attr: 'b' }
        shape_directory: '#78b4b4'
        shape_external: '#78b4b4'
        shape_external_resolved: '#78b4b4'
        shape_externalarg: { fg: '#99c899' attr: 'b' }
        shape_filepath: '#78b4b4'
        shape_flag: { fg: '#537c9c' attr: 'b' }
        shape_float: { fg: '#c88c8c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#78b4b4' attr: 'b' }
        shape_globpattern: { fg: '#78b4b4' attr: 'b' }
        shape_int: { fg: '#86cacd' attr: 'b' }
        shape_internalcall: { fg: '#78b4b4' attr: 'b' }
        shape_keyword: { fg: '#86cacd' attr: 'b' }
        shape_list: { fg: '#78b4b4' attr: 'b' }
        shape_literal: '#537c9c'
        shape_match_pattern: '#99c899'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c88c8c'
        shape_operator: '#d8b56d'
        shape_or: { fg: '#86cacd' attr: 'b' }
        shape_pipe: { fg: '#86cacd' attr: 'b' }
        shape_range: { fg: '#d8b56d' attr: 'b' }
        shape_raw_string: { fg: '#ffffe6' attr: 'b' }
        shape_record: { fg: '#78b4b4' attr: 'b' }
        shape_redirection: { fg: '#86cacd' attr: 'b' }
        shape_signature: { fg: '#99c899' attr: 'b' }
        shape_string: '#99c899'
        shape_string_interpolation: { fg: '#78b4b4' attr: 'b' }
        shape_table: { fg: '#537c9c' attr: 'b' }
        shape_vardecl: { fg: '#537c9c' attr: 'u' }
        shape_variable: '#86cacd'

        foreground: '#dedee7'
        background: '#222222'
        cursor: '#dedee7'

        empty: '#537c9c'
        header: { fg: '#99c899' attr: 'b' }
        hints: '#644646'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#99c899' attr: 'b' }
        search_result: { fg: '#c88c8c' bg: '#dedee7' }
        separator: '#dedee7'
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