# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d3869b'
        block: '#7daea3'
        cell-path: '#d4be98'
        closure: '#89b482'
        custom: '#d4be98'
        duration: '#d8a657'
        float: '#ea6962'
        glob: '#d4be98'
        int: '#d3869b'
        list: '#89b482'
        nothing: '#ea6962'
        range: '#d8a657'
        record: '#89b482'
        string: '#a9b665'

        bool: {|| if $in { '#89b482' } else { '#d8a657' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ea6962' attr: 'b' }
            } else if $in < 6hr {
                '#ea6962'
            } else if $in < 1day {
                '#d8a657'
            } else if $in < 3day {
                '#a9b665'
            } else if $in < 1wk {
                { fg: '#a9b665' attr: 'b' }
            } else if $in < 6wk {
                '#89b482'
            } else if $in < 52wk {
                '#7daea3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d4be98'
            } else if $e < 1mb {
                '#89b482'
            } else {{ fg: '#7daea3' }}
        }

        shape_and: { fg: '#d3869b' attr: 'b' }
        shape_binary: { fg: '#d3869b' attr: 'b' }
        shape_block: { fg: '#7daea3' attr: 'b' }
        shape_bool: '#89b482'
        shape_closure: { fg: '#89b482' attr: 'b' }
        shape_custom: '#a9b665'
        shape_datetime: { fg: '#89b482' attr: 'b' }
        shape_directory: '#89b482'
        shape_external: '#89b482'
        shape_external_resolved: '#89b482'
        shape_externalarg: { fg: '#a9b665' attr: 'b' }
        shape_filepath: '#89b482'
        shape_flag: { fg: '#7daea3' attr: 'b' }
        shape_float: { fg: '#ea6962' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#89b482' attr: 'b' }
        shape_globpattern: { fg: '#89b482' attr: 'b' }
        shape_int: { fg: '#d3869b' attr: 'b' }
        shape_internalcall: { fg: '#89b482' attr: 'b' }
        shape_keyword: { fg: '#d3869b' attr: 'b' }
        shape_list: { fg: '#89b482' attr: 'b' }
        shape_literal: '#7daea3'
        shape_match_pattern: '#a9b665'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ea6962'
        shape_operator: '#d8a657'
        shape_or: { fg: '#d3869b' attr: 'b' }
        shape_pipe: { fg: '#d3869b' attr: 'b' }
        shape_range: { fg: '#d8a657' attr: 'b' }
        shape_raw_string: { fg: '#d4be98' attr: 'b' }
        shape_record: { fg: '#89b482' attr: 'b' }
        shape_redirection: { fg: '#d3869b' attr: 'b' }
        shape_signature: { fg: '#a9b665' attr: 'b' }
        shape_string: '#a9b665'
        shape_string_interpolation: { fg: '#89b482' attr: 'b' }
        shape_table: { fg: '#7daea3' attr: 'b' }
        shape_vardecl: { fg: '#7daea3' attr: 'u' }
        shape_variable: '#d3869b'

        foreground: '#d4be98'
        background: '#282828'
        cursor: '#d4be98'

        empty: '#7daea3'
        header: { fg: '#a9b665' attr: 'b' }
        hints: '#282828'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a9b665' attr: 'b' }
        search_result: { fg: '#ea6962' bg: '#d4be98' }
        separator: '#d4be98'
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