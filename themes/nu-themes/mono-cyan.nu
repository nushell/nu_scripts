# Retrieve the theme settings
export def main [] {
    return {
        binary: '#00ccff'
        block: '#00ccff'
        cell-path: '#00ccff'
        closure: '#00ccff'
        custom: '#00ccff'
        duration: '#00ccff'
        float: '#00ccff'
        glob: '#00ccff'
        int: '#00ccff'
        list: '#00ccff'
        nothing: '#00ccff'
        range: '#00ccff'
        record: '#00ccff'
        string: '#00ccff'

        bool: {|| if $in { '#00ccff' } else { '#00ccff' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#00ccff' attr: 'b' }
            } else if $in < 6hr {
                '#00ccff'
            } else if $in < 1day {
                '#00ccff'
            } else if $in < 3day {
                '#00ccff'
            } else if $in < 1wk {
                { fg: '#00ccff' attr: 'b' }
            } else if $in < 6wk {
                '#00ccff'
            } else if $in < 52wk {
                '#00ccff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#00ccff'
            } else if $e < 1mb {
                '#00ccff'
            } else {{ fg: '#00ccff' }}
        }

        shape_and: { fg: '#00ccff' attr: 'b' }
        shape_binary: { fg: '#00ccff' attr: 'b' }
        shape_block: { fg: '#00ccff' attr: 'b' }
        shape_bool: '#00ccff'
        shape_closure: { fg: '#00ccff' attr: 'b' }
        shape_custom: '#00ccff'
        shape_datetime: { fg: '#00ccff' attr: 'b' }
        shape_directory: '#00ccff'
        shape_external: '#00ccff'
        shape_external_resolved: '#00ccff'
        shape_externalarg: { fg: '#00ccff' attr: 'b' }
        shape_filepath: '#00ccff'
        shape_flag: { fg: '#00ccff' attr: 'b' }
        shape_float: { fg: '#00ccff' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00ccff' attr: 'b' }
        shape_globpattern: { fg: '#00ccff' attr: 'b' }
        shape_int: { fg: '#00ccff' attr: 'b' }
        shape_internalcall: { fg: '#00ccff' attr: 'b' }
        shape_keyword: { fg: '#00ccff' attr: 'b' }
        shape_list: { fg: '#00ccff' attr: 'b' }
        shape_literal: '#00ccff'
        shape_match_pattern: '#00ccff'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#00ccff'
        shape_operator: '#00ccff'
        shape_or: { fg: '#00ccff' attr: 'b' }
        shape_pipe: { fg: '#00ccff' attr: 'b' }
        shape_range: { fg: '#00ccff' attr: 'b' }
        shape_raw_string: { fg: '#00ccff' attr: 'b' }
        shape_record: { fg: '#00ccff' attr: 'b' }
        shape_redirection: { fg: '#00ccff' attr: 'b' }
        shape_signature: { fg: '#00ccff' attr: 'b' }
        shape_string: '#00ccff'
        shape_string_interpolation: { fg: '#00ccff' attr: 'b' }
        shape_table: { fg: '#00ccff' attr: 'b' }
        shape_vardecl: { fg: '#00ccff' attr: 'u' }
        shape_variable: '#00ccff'

        foreground: '#00ccff'
        background: '#00222b'
        cursor: '#00ccff'

        empty: '#00ccff'
        header: { fg: '#00ccff' attr: 'b' }
        hints: '#00ccff'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00ccff' attr: 'b' }
        search_result: { fg: '#00ccff' bg: '#00ccff' }
        separator: '#00ccff'
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