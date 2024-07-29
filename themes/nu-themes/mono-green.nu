# Retrieve the theme settings
export def main [] {
    return {
        binary: '#0bff00'
        block: '#0bff00'
        cell-path: '#0bff00'
        closure: '#0bff00'
        custom: '#0bff00'
        duration: '#0bff00'
        float: '#0bff00'
        glob: '#0bff00'
        int: '#0bff00'
        list: '#0bff00'
        nothing: '#0bff00'
        range: '#0bff00'
        record: '#0bff00'
        string: '#0bff00'

        bool: {|| if $in { '#0bff00' } else { '#0bff00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#0bff00' attr: 'b' }
            } else if $in < 6hr {
                '#0bff00'
            } else if $in < 1day {
                '#0bff00'
            } else if $in < 3day {
                '#0bff00'
            } else if $in < 1wk {
                { fg: '#0bff00' attr: 'b' }
            } else if $in < 6wk {
                '#0bff00'
            } else if $in < 52wk {
                '#0bff00'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#0bff00'
            } else if $e < 1mb {
                '#0bff00'
            } else {{ fg: '#0bff00' }}
        }

        shape_and: { fg: '#0bff00' attr: 'b' }
        shape_binary: { fg: '#0bff00' attr: 'b' }
        shape_block: { fg: '#0bff00' attr: 'b' }
        shape_bool: '#0bff00'
        shape_closure: { fg: '#0bff00' attr: 'b' }
        shape_custom: '#0bff00'
        shape_datetime: { fg: '#0bff00' attr: 'b' }
        shape_directory: '#0bff00'
        shape_external: '#0bff00'
        shape_external_resolved: '#0bff00'
        shape_externalarg: { fg: '#0bff00' attr: 'b' }
        shape_filepath: '#0bff00'
        shape_flag: { fg: '#0bff00' attr: 'b' }
        shape_float: { fg: '#0bff00' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0bff00' attr: 'b' }
        shape_globpattern: { fg: '#0bff00' attr: 'b' }
        shape_int: { fg: '#0bff00' attr: 'b' }
        shape_internalcall: { fg: '#0bff00' attr: 'b' }
        shape_keyword: { fg: '#0bff00' attr: 'b' }
        shape_list: { fg: '#0bff00' attr: 'b' }
        shape_literal: '#0bff00'
        shape_match_pattern: '#0bff00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#0bff00'
        shape_operator: '#0bff00'
        shape_or: { fg: '#0bff00' attr: 'b' }
        shape_pipe: { fg: '#0bff00' attr: 'b' }
        shape_range: { fg: '#0bff00' attr: 'b' }
        shape_raw_string: { fg: '#0bff00' attr: 'b' }
        shape_record: { fg: '#0bff00' attr: 'b' }
        shape_redirection: { fg: '#0bff00' attr: 'b' }
        shape_signature: { fg: '#0bff00' attr: 'b' }
        shape_string: '#0bff00'
        shape_string_interpolation: { fg: '#0bff00' attr: 'b' }
        shape_table: { fg: '#0bff00' attr: 'b' }
        shape_vardecl: { fg: '#0bff00' attr: 'u' }
        shape_variable: '#0bff00'

        foreground: '#0bff00'
        background: '#022b00'
        cursor: '#0bff00'

        empty: '#0bff00'
        header: { fg: '#0bff00' attr: 'b' }
        hints: '#0bff00'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#0bff00' attr: 'b' }
        search_result: { fg: '#0bff00' bg: '#0bff00' }
        separator: '#0bff00'
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