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
    # to one line
    | str replace --all "\n" ''
    | print $in
}

# Update the Nushell configuration
export def --env "set color_config" [] {
    $env.config.color_config = (main)
}

# Retrieve the theme settings
export def main [] {
    return {
        separator: '#cabcb1'
        leading_trailing_space_bg: { attr: 'n' }
        header: { fg: '#b7ba53' attr: 'b' }
        empty: '#88a4d3'
        bool: {|| if $in { '#6eb958' } else { 'light_gray' } }
        int: '#cabcb1'
        filesize: {|e|
            if $e == 0b {
                '#cabcb1'
            } else if $e < 1mb {
                '#6eb958'
            } else {{ fg: '#88a4d3' }}
        }
        duration: '#cabcb1'
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
        range: '#cabcb1'
        float: '#cabcb1'
        string: '#cabcb1'
        nothing: '#cabcb1'
        binary: '#cabcb1'
        cellpath: '#cabcb1'
        row_index: { fg: '#b7ba53' attr: 'b' }
        record: '#cabcb1'
        list: '#cabcb1'
        block: '#cabcb1'
        hints: 'dark_gray'
        search_result: { fg: '#d35c5c' bg: '#cabcb1' }

        shape_and: { fg: '#bb90e2' attr: 'b' }
        shape_binary: { fg: '#bb90e2' attr: 'b' }
        shape_block: { fg: '#88a4d3' attr: 'b' }
        shape_bool: '#6eb958'
        shape_custom: '#b7ba53'
        shape_datetime: { fg: '#6eb958' attr: 'b' }
        shape_directory: '#6eb958'
        shape_external: '#6eb958'
        shape_externalarg: { fg: '#b7ba53' attr: 'b' }
        shape_filepath: '#6eb958'
        shape_flag: { fg: '#88a4d3' attr: 'b' }
        shape_float: { fg: '#bb90e2' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_globpattern: { fg: '#6eb958' attr: 'b' }
        shape_int: { fg: '#bb90e2' attr: 'b' }
        shape_internalcall: { fg: '#6eb958' attr: 'b' }
        shape_list: { fg: '#6eb958' attr: 'b' }
        shape_literal: '#88a4d3'
        shape_match_pattern: '#b7ba53'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#6eb958'
        shape_operator: '#e0ac16'
        shape_or: { fg: '#bb90e2' attr: 'b' }
        shape_pipe: { fg: '#bb90e2' attr: 'b' }
        shape_range: { fg: '#e0ac16' attr: 'b' }
        shape_record: { fg: '#6eb958' attr: 'b' }
        shape_redirection: { fg: '#bb90e2' attr: 'b' }
        shape_signature: { fg: '#b7ba53' attr: 'b' }
        shape_string: '#b7ba53'
        shape_string_interpolation: { fg: '#6eb958' attr: 'b' }
        shape_table: { fg: '#88a4d3' attr: 'b' }
        shape_variable: '#bb90e2'

        background: '#231e18'
        foreground: '#cabcb1'
        cursor: '#cabcb1'
    }
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

# Activate the theme when sourced
use activate