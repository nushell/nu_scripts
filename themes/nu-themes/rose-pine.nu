# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c4a7e7'
        block: '#9ccfd8'
        cell-path: '#e0def4'
        closure: '#31748f'
        custom: '#c5c3ce'
        duration: '#f6c177'
        float: '#e2e1e7'
        glob: '#c5c3ce'
        int: '#c4a7e7'
        list: '#31748f'
        nothing: '#e2e1e7'
        range: '#f6c177'
        record: '#31748f'
        string: '#ebbcba'

        bool: {|| if $in { '#31748f' } else { '#f6c177' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e2e1e7' attr: 'b' }
            } else if $in < 6hr {
                '#e2e1e7'
            } else if $in < 1day {
                '#f6c177'
            } else if $in < 3day {
                '#ebbcba'
            } else if $in < 1wk {
                { fg: '#ebbcba' attr: 'b' }
            } else if $in < 6wk {
                '#31748f'
            } else if $in < 52wk {
                '#9ccfd8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e0def4'
            } else if $e < 1mb {
                '#31748f'
            } else {{ fg: '#9ccfd8' }}
        }

        shape_and: { fg: '#c4a7e7' attr: 'b' }
        shape_binary: { fg: '#c4a7e7' attr: 'b' }
        shape_block: { fg: '#9ccfd8' attr: 'b' }
        shape_bool: '#31748f'
        shape_closure: { fg: '#31748f' attr: 'b' }
        shape_custom: '#ebbcba'
        shape_datetime: { fg: '#31748f' attr: 'b' }
        shape_directory: '#31748f'
        shape_external: '#31748f'
        shape_external_resolved: '#31748f'
        shape_externalarg: { fg: '#ebbcba' attr: 'b' }
        shape_filepath: '#31748f'
        shape_flag: { fg: '#9ccfd8' attr: 'b' }
        shape_float: { fg: '#e2e1e7' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#31748f' attr: 'b' }
        shape_globpattern: { fg: '#31748f' attr: 'b' }
        shape_int: { fg: '#c4a7e7' attr: 'b' }
        shape_internalcall: { fg: '#31748f' attr: 'b' }
        shape_keyword: { fg: '#c4a7e7' attr: 'b' }
        shape_list: { fg: '#31748f' attr: 'b' }
        shape_literal: '#9ccfd8'
        shape_match_pattern: '#ebbcba'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e2e1e7'
        shape_operator: '#f6c177'
        shape_or: { fg: '#c4a7e7' attr: 'b' }
        shape_pipe: { fg: '#c4a7e7' attr: 'b' }
        shape_range: { fg: '#f6c177' attr: 'b' }
        shape_raw_string: { fg: '#c5c3ce' attr: 'b' }
        shape_record: { fg: '#31748f' attr: 'b' }
        shape_redirection: { fg: '#c4a7e7' attr: 'b' }
        shape_signature: { fg: '#ebbcba' attr: 'b' }
        shape_string: '#ebbcba'
        shape_string_interpolation: { fg: '#31748f' attr: 'b' }
        shape_table: { fg: '#9ccfd8' attr: 'b' }
        shape_vardecl: { fg: '#9ccfd8' attr: 'u' }
        shape_variable: '#c4a7e7'

        foreground: '#e0def4'
        background: '#191724'
        cursor: '#e0def4'

        empty: '#9ccfd8'
        header: { fg: '#ebbcba' attr: 'b' }
        hints: '#555169'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#ebbcba' attr: 'b' }
        search_result: { fg: '#e2e1e7' bg: '#e0def4' }
        separator: '#e0def4'
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