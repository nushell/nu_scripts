# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9198a3'
        block: '#977d7c'
        cell-path: '#5b778c'
        closure: '#977d7c'
        custom: '#214d68'
        duration: '#adb4b9'
        float: '#818591'
        glob: '#214d68'
        int: '#9198a3'
        list: '#977d7c'
        nothing: '#818591'
        range: '#adb4b9'
        record: '#977d7c'
        string: '#977d7c'

        bool: {|| if $in { '#977d7c' } else { '#adb4b9' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#818591' attr: 'b' }
            } else if $in < 6hr {
                '#818591'
            } else if $in < 1day {
                '#adb4b9'
            } else if $in < 3day {
                '#977d7c'
            } else if $in < 1wk {
                { fg: '#977d7c' attr: 'b' }
            } else if $in < 6wk {
                '#977d7c'
            } else if $in < 52wk {
                '#977d7c'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#5b778c'
            } else if $e < 1mb {
                '#977d7c'
            } else {{ fg: '#977d7c' }}
        }

        shape_and: { fg: '#9198a3' attr: 'b' }
        shape_binary: { fg: '#9198a3' attr: 'b' }
        shape_block: { fg: '#977d7c' attr: 'b' }
        shape_bool: '#977d7c'
        shape_closure: { fg: '#977d7c' attr: 'b' }
        shape_custom: '#977d7c'
        shape_datetime: { fg: '#977d7c' attr: 'b' }
        shape_directory: '#977d7c'
        shape_external: '#977d7c'
        shape_external_resolved: '#977d7c'
        shape_externalarg: { fg: '#977d7c' attr: 'b' }
        shape_filepath: '#977d7c'
        shape_flag: { fg: '#977d7c' attr: 'b' }
        shape_float: { fg: '#818591' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#977d7c' attr: 'b' }
        shape_globpattern: { fg: '#977d7c' attr: 'b' }
        shape_int: { fg: '#9198a3' attr: 'b' }
        shape_internalcall: { fg: '#977d7c' attr: 'b' }
        shape_keyword: { fg: '#9198a3' attr: 'b' }
        shape_list: { fg: '#977d7c' attr: 'b' }
        shape_literal: '#977d7c'
        shape_match_pattern: '#977d7c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#818591'
        shape_operator: '#adb4b9'
        shape_or: { fg: '#9198a3' attr: 'b' }
        shape_pipe: { fg: '#9198a3' attr: 'b' }
        shape_range: { fg: '#adb4b9' attr: 'b' }
        shape_raw_string: { fg: '#214d68' attr: 'b' }
        shape_record: { fg: '#977d7c' attr: 'b' }
        shape_redirection: { fg: '#9198a3' attr: 'b' }
        shape_signature: { fg: '#977d7c' attr: 'b' }
        shape_string: '#977d7c'
        shape_string_interpolation: { fg: '#977d7c' attr: 'b' }
        shape_table: { fg: '#977d7c' attr: 'b' }
        shape_vardecl: { fg: '#977d7c' attr: 'u' }
        shape_variable: '#9198a3'

        foreground: '#5b778c'
        background: '#041523'
        cursor: '#5b778c'

        empty: '#977d7c'
        header: { fg: '#977d7c' attr: 'b' }
        hints: '#7a5759'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#977d7c' attr: 'b' }
        search_result: { fg: '#818591' bg: '#5b778c' }
        separator: '#5b778c'
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