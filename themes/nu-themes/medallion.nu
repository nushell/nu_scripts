# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8c5a90'
        block: '#616bb0'
        cell-path: '#cac29a'
        closure: '#916c25'
        custom: '#fed698'
        duration: '#d3bd26'
        float: '#ff9149'
        glob: '#fed698'
        int: '#8c5a90'
        list: '#916c25'
        nothing: '#b64c00'
        range: '#d3bd26'
        record: '#916c25'
        string: '#7c8b16'

        bool: {|| if $in { '#ffbc51' } else { '#d3bd26' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b64c00' attr: 'b' }
            } else if $in < 6hr {
                '#b64c00'
            } else if $in < 1day {
                '#d3bd26'
            } else if $in < 3day {
                '#7c8b16'
            } else if $in < 1wk {
                { fg: '#7c8b16' attr: 'b' }
            } else if $in < 6wk {
                '#916c25'
            } else if $in < 52wk {
                '#616bb0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cac29a'
            } else if $e < 1mb {
                '#916c25'
            } else {{ fg: '#616bb0' }}
        }

        shape_and: { fg: '#8c5a90' attr: 'b' }
        shape_binary: { fg: '#8c5a90' attr: 'b' }
        shape_block: { fg: '#616bb0' attr: 'b' }
        shape_bool: '#ffbc51'
        shape_closure: { fg: '#916c25' attr: 'b' }
        shape_custom: '#7c8b16'
        shape_datetime: { fg: '#916c25' attr: 'b' }
        shape_directory: '#916c25'
        shape_external: '#916c25'
        shape_external_resolved: '#ffbc51'
        shape_externalarg: { fg: '#7c8b16' attr: 'b' }
        shape_filepath: '#916c25'
        shape_flag: { fg: '#616bb0' attr: 'b' }
        shape_float: { fg: '#ff9149' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#916c25' attr: 'b' }
        shape_globpattern: { fg: '#916c25' attr: 'b' }
        shape_int: { fg: '#8c5a90' attr: 'b' }
        shape_internalcall: { fg: '#916c25' attr: 'b' }
        shape_keyword: { fg: '#8c5a90' attr: 'b' }
        shape_list: { fg: '#916c25' attr: 'b' }
        shape_literal: '#616bb0'
        shape_match_pattern: '#7c8b16'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b64c00'
        shape_operator: '#d3bd26'
        shape_or: { fg: '#8c5a90' attr: 'b' }
        shape_pipe: { fg: '#8c5a90' attr: 'b' }
        shape_range: { fg: '#d3bd26' attr: 'b' }
        shape_raw_string: { fg: '#fed698' attr: 'b' }
        shape_record: { fg: '#916c25' attr: 'b' }
        shape_redirection: { fg: '#8c5a90' attr: 'b' }
        shape_signature: { fg: '#7c8b16' attr: 'b' }
        shape_string: '#7c8b16'
        shape_string_interpolation: { fg: '#916c25' attr: 'b' }
        shape_table: { fg: '#616bb0' attr: 'b' }
        shape_vardecl: { fg: '#616bb0' attr: 'u' }
        shape_variable: '#8c5a90'

        foreground: '#cac296'
        background: '#1d1908'
        cursor: '#cac296'

        empty: '#616bb0'
        header: { fg: '#7c8b16' attr: 'b' }
        hints: '#5e5219'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7c8b16' attr: 'b' }
        search_result: { fg: '#b64c00' bg: '#cac29a' }
        separator: '#cac29a'
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