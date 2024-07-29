# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b072d1'
        block: '#df5273'
        cell-path: '#cbced0'
        closure: '#24a8b4'
        custom: '#e3e6ee'
        duration: '#efb993'
        float: '#e93c58'
        glob: '#e3e6ee'
        int: '#b072d1'
        list: '#24a8b4'
        nothing: '#e93c58'
        range: '#efb993'
        record: '#24a8b4'
        string: '#efaf8e'

        bool: {|| if $in { '#24a8b4' } else { '#efb993' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e93c58' attr: 'b' }
            } else if $in < 6hr {
                '#e93c58'
            } else if $in < 1day {
                '#efb993'
            } else if $in < 3day {
                '#efaf8e'
            } else if $in < 1wk {
                { fg: '#efaf8e' attr: 'b' }
            } else if $in < 6wk {
                '#24a8b4'
            } else if $in < 52wk {
                '#df5273'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cbced0'
            } else if $e < 1mb {
                '#24a8b4'
            } else {{ fg: '#df5273' }}
        }

        shape_and: { fg: '#b072d1' attr: 'b' }
        shape_binary: { fg: '#b072d1' attr: 'b' }
        shape_block: { fg: '#df5273' attr: 'b' }
        shape_bool: '#24a8b4'
        shape_closure: { fg: '#24a8b4' attr: 'b' }
        shape_custom: '#efaf8e'
        shape_datetime: { fg: '#24a8b4' attr: 'b' }
        shape_directory: '#24a8b4'
        shape_external: '#24a8b4'
        shape_external_resolved: '#24a8b4'
        shape_externalarg: { fg: '#efaf8e' attr: 'b' }
        shape_filepath: '#24a8b4'
        shape_flag: { fg: '#df5273' attr: 'b' }
        shape_float: { fg: '#e93c58' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#24a8b4' attr: 'b' }
        shape_globpattern: { fg: '#24a8b4' attr: 'b' }
        shape_int: { fg: '#b072d1' attr: 'b' }
        shape_internalcall: { fg: '#24a8b4' attr: 'b' }
        shape_keyword: { fg: '#b072d1' attr: 'b' }
        shape_list: { fg: '#24a8b4' attr: 'b' }
        shape_literal: '#df5273'
        shape_match_pattern: '#efaf8e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e93c58'
        shape_operator: '#efb993'
        shape_or: { fg: '#b072d1' attr: 'b' }
        shape_pipe: { fg: '#b072d1' attr: 'b' }
        shape_range: { fg: '#efb993' attr: 'b' }
        shape_raw_string: { fg: '#e3e6ee' attr: 'b' }
        shape_record: { fg: '#24a8b4' attr: 'b' }
        shape_redirection: { fg: '#b072d1' attr: 'b' }
        shape_signature: { fg: '#efaf8e' attr: 'b' }
        shape_string: '#efaf8e'
        shape_string_interpolation: { fg: '#24a8b4' attr: 'b' }
        shape_table: { fg: '#df5273' attr: 'b' }
        shape_vardecl: { fg: '#df5273' attr: 'u' }
        shape_variable: '#b072d1'

        foreground: '#cbced0'
        background: '#1c1e26'
        cursor: '#cbced0'

        empty: '#df5273'
        header: { fg: '#efaf8e' attr: 'b' }
        hints: '#6f6f70'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#efaf8e' attr: 'b' }
        search_result: { fg: '#e93c58' bg: '#cbced0' }
        separator: '#cbced0'
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