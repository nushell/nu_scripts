# Retrieve the theme settings
export def main [] {
    return {
        binary: '#756bb1'
        block: '#3182bd'
        cell-path: '#b7b8b9'
        closure: '#80b1d3'
        custom: '#fcfdfe'
        duration: '#dca060'
        float: '#e31a1c'
        glob: '#fcfdfe'
        int: '#756bb1'
        list: '#80b1d3'
        nothing: '#e31a1c'
        range: '#dca060'
        record: '#80b1d3'
        string: '#31a354'

        bool: {|| if $in { '#80b1d3' } else { '#dca060' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e31a1c' attr: 'b' }
            } else if $in < 6hr {
                '#e31a1c'
            } else if $in < 1day {
                '#dca060'
            } else if $in < 3day {
                '#31a354'
            } else if $in < 1wk {
                { fg: '#31a354' attr: 'b' }
            } else if $in < 6wk {
                '#80b1d3'
            } else if $in < 52wk {
                '#3182bd'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b7b8b9'
            } else if $e < 1mb {
                '#80b1d3'
            } else {{ fg: '#3182bd' }}
        }

        shape_and: { fg: '#756bb1' attr: 'b' }
        shape_binary: { fg: '#756bb1' attr: 'b' }
        shape_block: { fg: '#3182bd' attr: 'b' }
        shape_bool: '#80b1d3'
        shape_closure: { fg: '#80b1d3' attr: 'b' }
        shape_custom: '#31a354'
        shape_datetime: { fg: '#80b1d3' attr: 'b' }
        shape_directory: '#80b1d3'
        shape_external: '#80b1d3'
        shape_external_resolved: '#80b1d3'
        shape_externalarg: { fg: '#31a354' attr: 'b' }
        shape_filepath: '#80b1d3'
        shape_flag: { fg: '#3182bd' attr: 'b' }
        shape_float: { fg: '#e31a1c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#80b1d3' attr: 'b' }
        shape_globpattern: { fg: '#80b1d3' attr: 'b' }
        shape_int: { fg: '#756bb1' attr: 'b' }
        shape_internalcall: { fg: '#80b1d3' attr: 'b' }
        shape_keyword: { fg: '#756bb1' attr: 'b' }
        shape_list: { fg: '#80b1d3' attr: 'b' }
        shape_literal: '#3182bd'
        shape_match_pattern: '#31a354'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e31a1c'
        shape_operator: '#dca060'
        shape_or: { fg: '#756bb1' attr: 'b' }
        shape_pipe: { fg: '#756bb1' attr: 'b' }
        shape_range: { fg: '#dca060' attr: 'b' }
        shape_raw_string: { fg: '#fcfdfe' attr: 'b' }
        shape_record: { fg: '#80b1d3' attr: 'b' }
        shape_redirection: { fg: '#756bb1' attr: 'b' }
        shape_signature: { fg: '#31a354' attr: 'b' }
        shape_string: '#31a354'
        shape_string_interpolation: { fg: '#80b1d3' attr: 'b' }
        shape_table: { fg: '#3182bd' attr: 'b' }
        shape_vardecl: { fg: '#3182bd' attr: 'u' }
        shape_variable: '#756bb1'

        foreground: '#b7b8b9'
        background: '#0c0d0e'
        cursor: '#b7b8b9'

        empty: '#3182bd'
        header: { fg: '#31a354' attr: 'b' }
        hints: '#737475'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#31a354' attr: 'b' }
        search_result: { fg: '#e31a1c' bg: '#b7b8b9' }
        separator: '#b7b8b9'
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