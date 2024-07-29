# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c397d8'
        block: '#79a6da'
        cell-path: '#fffefe'
        closure: '#70c0b1'
        custom: '#fffefe'
        duration: '#e7c547'
        float: '#d44d53'
        glob: '#fffefe'
        int: '#c397d8'
        list: '#70c0b1'
        nothing: '#d54e53'
        range: '#e7c547'
        record: '#70c0b1'
        string: '#b9ca49'

        bool: {|| if $in { '#70c0b1' } else { '#e7c547' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d54e53' attr: 'b' }
            } else if $in < 6hr {
                '#d54e53'
            } else if $in < 1day {
                '#e7c547'
            } else if $in < 3day {
                '#b9ca49'
            } else if $in < 1wk {
                { fg: '#b9ca49' attr: 'b' }
            } else if $in < 6wk {
                '#70c0b1'
            } else if $in < 52wk {
                '#79a6da'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#fffefe'
            } else if $e < 1mb {
                '#70c0b1'
            } else {{ fg: '#79a6da' }}
        }

        shape_and: { fg: '#c397d8' attr: 'b' }
        shape_binary: { fg: '#c397d8' attr: 'b' }
        shape_block: { fg: '#79a6da' attr: 'b' }
        shape_bool: '#70c0b1'
        shape_closure: { fg: '#70c0b1' attr: 'b' }
        shape_custom: '#b9ca49'
        shape_datetime: { fg: '#70c0b1' attr: 'b' }
        shape_directory: '#70c0b1'
        shape_external: '#70c0b1'
        shape_external_resolved: '#70c0b1'
        shape_externalarg: { fg: '#b9ca49' attr: 'b' }
        shape_filepath: '#70c0b1'
        shape_flag: { fg: '#79a6da' attr: 'b' }
        shape_float: { fg: '#d44d53' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#70c0b1' attr: 'b' }
        shape_globpattern: { fg: '#70c0b1' attr: 'b' }
        shape_int: { fg: '#c397d8' attr: 'b' }
        shape_internalcall: { fg: '#70c0b1' attr: 'b' }
        shape_keyword: { fg: '#c397d8' attr: 'b' }
        shape_list: { fg: '#70c0b1' attr: 'b' }
        shape_literal: '#79a6da'
        shape_match_pattern: '#b9ca49'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d54e53'
        shape_operator: '#e7c547'
        shape_or: { fg: '#c397d8' attr: 'b' }
        shape_pipe: { fg: '#c397d8' attr: 'b' }
        shape_range: { fg: '#e7c547' attr: 'b' }
        shape_raw_string: { fg: '#fffefe' attr: 'b' }
        shape_record: { fg: '#70c0b1' attr: 'b' }
        shape_redirection: { fg: '#c397d8' attr: 'b' }
        shape_signature: { fg: '#b9ca49' attr: 'b' }
        shape_string: '#b9ca49'
        shape_string_interpolation: { fg: '#70c0b1' attr: 'b' }
        shape_table: { fg: '#79a6da' attr: 'b' }
        shape_vardecl: { fg: '#79a6da' attr: 'u' }
        shape_variable: '#c397d8'

        foreground: '#e9e9e9'
        background: '#000000'
        cursor: '#e9e9e9'

        empty: '#79a6da'
        header: { fg: '#b9ca49' attr: 'b' }
        hints: '#000000'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b9ca49' attr: 'b' }
        search_result: { fg: '#d54e53' bg: '#fffefe' }
        separator: '#fffefe'
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