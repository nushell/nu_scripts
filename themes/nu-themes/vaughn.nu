# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f08cc3'
        block: '#5555ff'
        cell-path: '#709080'
        closure: '#8cd0d3'
        custom: '#ffffff'
        duration: '#dfaf8f'
        float: '#dca3a3'
        glob: '#ffffff'
        int: '#f08cc3'
        list: '#8cd0d3'
        nothing: '#705050'
        range: '#dfaf8f'
        record: '#8cd0d3'
        string: '#60b48a'

        bool: {|| if $in { '#93e0e3' } else { '#dfaf8f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#705050' attr: 'b' }
            } else if $in < 6hr {
                '#705050'
            } else if $in < 1day {
                '#dfaf8f'
            } else if $in < 3day {
                '#60b48a'
            } else if $in < 1wk {
                { fg: '#60b48a' attr: 'b' }
            } else if $in < 6wk {
                '#8cd0d3'
            } else if $in < 52wk {
                '#5555ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#709080'
            } else if $e < 1mb {
                '#8cd0d3'
            } else {{ fg: '#5555ff' }}
        }

        shape_and: { fg: '#f08cc3' attr: 'b' }
        shape_binary: { fg: '#f08cc3' attr: 'b' }
        shape_block: { fg: '#5555ff' attr: 'b' }
        shape_bool: '#93e0e3'
        shape_closure: { fg: '#8cd0d3' attr: 'b' }
        shape_custom: '#60b48a'
        shape_datetime: { fg: '#8cd0d3' attr: 'b' }
        shape_directory: '#8cd0d3'
        shape_external: '#8cd0d3'
        shape_external_resolved: '#93e0e3'
        shape_externalarg: { fg: '#60b48a' attr: 'b' }
        shape_filepath: '#8cd0d3'
        shape_flag: { fg: '#5555ff' attr: 'b' }
        shape_float: { fg: '#dca3a3' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8cd0d3' attr: 'b' }
        shape_globpattern: { fg: '#8cd0d3' attr: 'b' }
        shape_int: { fg: '#f08cc3' attr: 'b' }
        shape_internalcall: { fg: '#8cd0d3' attr: 'b' }
        shape_keyword: { fg: '#f08cc3' attr: 'b' }
        shape_list: { fg: '#8cd0d3' attr: 'b' }
        shape_literal: '#5555ff'
        shape_match_pattern: '#60b48a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#705050'
        shape_operator: '#dfaf8f'
        shape_or: { fg: '#f08cc3' attr: 'b' }
        shape_pipe: { fg: '#f08cc3' attr: 'b' }
        shape_range: { fg: '#dfaf8f' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#8cd0d3' attr: 'b' }
        shape_redirection: { fg: '#f08cc3' attr: 'b' }
        shape_signature: { fg: '#60b48a' attr: 'b' }
        shape_string: '#60b48a'
        shape_string_interpolation: { fg: '#8cd0d3' attr: 'b' }
        shape_table: { fg: '#5555ff' attr: 'b' }
        shape_vardecl: { fg: '#5555ff' attr: 'u' }
        shape_variable: '#f08cc3'

        foreground: '#dcdccc'
        background: '#25234f'
        cursor: '#dcdccc'

        empty: '#5555ff'
        header: { fg: '#60b48a' attr: 'b' }
        hints: '#709080'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#60b48a' attr: 'b' }
        search_result: { fg: '#705050' bg: '#709080' }
        separator: '#709080'
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