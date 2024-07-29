# Retrieve the theme settings
export def main [] {
    return {
        binary: '#68d4f1'
        block: '#1e4950'
        cell-path: '#deb88d'
        closure: '#50a3b5'
        custom: '#fee4ce'
        duration: '#fca02f'
        float: '#d48678'
        glob: '#fee4ce'
        int: '#68d4f1'
        list: '#50a3b5'
        nothing: '#d15123'
        range: '#fca02f'
        record: '#50a3b5'
        string: '#027c9b'

        bool: {|| if $in { '#87acb4' } else { '#fca02f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d15123' attr: 'b' }
            } else if $in < 6hr {
                '#d15123'
            } else if $in < 1day {
                '#fca02f'
            } else if $in < 3day {
                '#027c9b'
            } else if $in < 1wk {
                { fg: '#027c9b' attr: 'b' }
            } else if $in < 6wk {
                '#50a3b5'
            } else if $in < 52wk {
                '#1e4950'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#deb88d'
            } else if $e < 1mb {
                '#50a3b5'
            } else {{ fg: '#1e4950' }}
        }

        shape_and: { fg: '#68d4f1' attr: 'b' }
        shape_binary: { fg: '#68d4f1' attr: 'b' }
        shape_block: { fg: '#1e4950' attr: 'b' }
        shape_bool: '#87acb4'
        shape_closure: { fg: '#50a3b5' attr: 'b' }
        shape_custom: '#027c9b'
        shape_datetime: { fg: '#50a3b5' attr: 'b' }
        shape_directory: '#50a3b5'
        shape_external: '#50a3b5'
        shape_external_resolved: '#87acb4'
        shape_externalarg: { fg: '#027c9b' attr: 'b' }
        shape_filepath: '#50a3b5'
        shape_flag: { fg: '#1e4950' attr: 'b' }
        shape_float: { fg: '#d48678' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#50a3b5' attr: 'b' }
        shape_globpattern: { fg: '#50a3b5' attr: 'b' }
        shape_int: { fg: '#68d4f1' attr: 'b' }
        shape_internalcall: { fg: '#50a3b5' attr: 'b' }
        shape_keyword: { fg: '#68d4f1' attr: 'b' }
        shape_list: { fg: '#50a3b5' attr: 'b' }
        shape_literal: '#1e4950'
        shape_match_pattern: '#027c9b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d15123'
        shape_operator: '#fca02f'
        shape_or: { fg: '#68d4f1' attr: 'b' }
        shape_pipe: { fg: '#68d4f1' attr: 'b' }
        shape_range: { fg: '#fca02f' attr: 'b' }
        shape_raw_string: { fg: '#fee4ce' attr: 'b' }
        shape_record: { fg: '#50a3b5' attr: 'b' }
        shape_redirection: { fg: '#68d4f1' attr: 'b' }
        shape_signature: { fg: '#027c9b' attr: 'b' }
        shape_string: '#027c9b'
        shape_string_interpolation: { fg: '#50a3b5' attr: 'b' }
        shape_table: { fg: '#1e4950' attr: 'b' }
        shape_vardecl: { fg: '#1e4950' attr: 'u' }
        shape_variable: '#68d4f1'

        foreground: '#deb88d'
        background: '#09141b'
        cursor: '#deb88d'

        empty: '#1e4950'
        header: { fg: '#027c9b' attr: 'b' }
        hints: '#434b53'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#027c9b' attr: 'b' }
        search_result: { fg: '#d15123' bg: '#deb88d' }
        separator: '#deb88d'
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