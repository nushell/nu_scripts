# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bb90e2'
        block: '#88a4d3'
        cell-path: '#cabcb1'
        closure: '#6eb958'
        custom: '#e4d4c8'
        duration: '#e0ac16'
        float: '#d35c5c'
        glob: '#e4d4c8'
        int: '#bb90e2'
        list: '#6eb958'
        nothing: '#d35c5c'
        range: '#e0ac16'
        record: '#6eb958'
        string: '#b7ba53'

        bool: {|| if $in { '#6eb958' } else { '#e0ac16' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d35c5c' attr: 'b' }
            } else if $in < 6hr {
                '#d35c5c'
            } else if $in < 1day {
                '#e0ac16'
            } else if $in < 3day {
                '#b7ba53'
            } else if $in < 1wk {
                { fg: '#b7ba53' attr: 'b' }
            } else if $in < 6wk {
                '#6eb958'
            } else if $in < 52wk {
                '#88a4d3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cabcb1'
            } else if $e < 1mb {
                '#6eb958'
            } else {{ fg: '#88a4d3' }}
        }

        shape_and: { fg: '#bb90e2' attr: 'b' }
        shape_binary: { fg: '#bb90e2' attr: 'b' }
        shape_block: { fg: '#88a4d3' attr: 'b' }
        shape_bool: '#6eb958'
        shape_closure: { fg: '#6eb958' attr: 'b' }
        shape_custom: '#b7ba53'
        shape_datetime: { fg: '#6eb958' attr: 'b' }
        shape_directory: '#6eb958'
        shape_external: '#6eb958'
        shape_external_resolved: '#6eb958'
        shape_externalarg: { fg: '#b7ba53' attr: 'b' }
        shape_filepath: '#6eb958'
        shape_flag: { fg: '#88a4d3' attr: 'b' }
        shape_float: { fg: '#d35c5c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#6eb958' attr: 'b' }
        shape_globpattern: { fg: '#6eb958' attr: 'b' }
        shape_int: { fg: '#bb90e2' attr: 'b' }
        shape_internalcall: { fg: '#6eb958' attr: 'b' }
        shape_keyword: { fg: '#bb90e2' attr: 'b' }
        shape_list: { fg: '#6eb958' attr: 'b' }
        shape_literal: '#88a4d3'
        shape_match_pattern: '#b7ba53'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d35c5c'
        shape_operator: '#e0ac16'
        shape_or: { fg: '#bb90e2' attr: 'b' }
        shape_pipe: { fg: '#bb90e2' attr: 'b' }
        shape_range: { fg: '#e0ac16' attr: 'b' }
        shape_raw_string: { fg: '#e4d4c8' attr: 'b' }
        shape_record: { fg: '#6eb958' attr: 'b' }
        shape_redirection: { fg: '#bb90e2' attr: 'b' }
        shape_signature: { fg: '#b7ba53' attr: 'b' }
        shape_string: '#b7ba53'
        shape_string_interpolation: { fg: '#6eb958' attr: 'b' }
        shape_table: { fg: '#88a4d3' attr: 'b' }
        shape_vardecl: { fg: '#88a4d3' attr: 'u' }
        shape_variable: '#bb90e2'

        foreground: '#cabcb1'
        background: '#231e18'
        cursor: '#cabcb1'

        empty: '#88a4d3'
        header: { fg: '#b7ba53' attr: 'b' }
        hints: '#9d8b70'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b7ba53' attr: 'b' }
        search_result: { fg: '#d35c5c' bg: '#cabcb1' }
        separator: '#cabcb1'
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