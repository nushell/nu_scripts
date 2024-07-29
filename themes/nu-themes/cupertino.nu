# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a90d91'
        block: '#0000ff'
        cell-path: '#404040'
        closure: '#318495'
        custom: '#5e5e5e'
        duration: '#826b28'
        float: '#c41a15'
        glob: '#5e5e5e'
        int: '#a90d91'
        list: '#318495'
        nothing: '#c41a15'
        range: '#826b28'
        record: '#318495'
        string: '#007400'

        bool: {|| if $in { '#318495' } else { '#826b28' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c41a15' attr: 'b' }
            } else if $in < 6hr {
                '#c41a15'
            } else if $in < 1day {
                '#826b28'
            } else if $in < 3day {
                '#007400'
            } else if $in < 1wk {
                { fg: '#007400' attr: 'b' }
            } else if $in < 6wk {
                '#318495'
            } else if $in < 52wk {
                '#0000ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#404040'
            } else if $e < 1mb {
                '#318495'
            } else {{ fg: '#0000ff' }}
        }

        shape_and: { fg: '#a90d91' attr: 'b' }
        shape_binary: { fg: '#a90d91' attr: 'b' }
        shape_block: { fg: '#0000ff' attr: 'b' }
        shape_bool: '#318495'
        shape_closure: { fg: '#318495' attr: 'b' }
        shape_custom: '#007400'
        shape_datetime: { fg: '#318495' attr: 'b' }
        shape_directory: '#318495'
        shape_external: '#318495'
        shape_external_resolved: '#318495'
        shape_externalarg: { fg: '#007400' attr: 'b' }
        shape_filepath: '#318495'
        shape_flag: { fg: '#0000ff' attr: 'b' }
        shape_float: { fg: '#c41a15' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#318495' attr: 'b' }
        shape_globpattern: { fg: '#318495' attr: 'b' }
        shape_int: { fg: '#a90d91' attr: 'b' }
        shape_internalcall: { fg: '#318495' attr: 'b' }
        shape_keyword: { fg: '#a90d91' attr: 'b' }
        shape_list: { fg: '#318495' attr: 'b' }
        shape_literal: '#0000ff'
        shape_match_pattern: '#007400'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c41a15'
        shape_operator: '#826b28'
        shape_or: { fg: '#a90d91' attr: 'b' }
        shape_pipe: { fg: '#a90d91' attr: 'b' }
        shape_range: { fg: '#826b28' attr: 'b' }
        shape_raw_string: { fg: '#5e5e5e' attr: 'b' }
        shape_record: { fg: '#318495' attr: 'b' }
        shape_redirection: { fg: '#a90d91' attr: 'b' }
        shape_signature: { fg: '#007400' attr: 'b' }
        shape_string: '#007400'
        shape_string_interpolation: { fg: '#318495' attr: 'b' }
        shape_table: { fg: '#0000ff' attr: 'b' }
        shape_vardecl: { fg: '#0000ff' attr: 'u' }
        shape_variable: '#a90d91'

        foreground: '#404040'
        background: '#ffffff'
        cursor: '#404040'

        empty: '#0000ff'
        header: { fg: '#007400' attr: 'b' }
        hints: '#808080'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#007400' attr: 'b' }
        search_result: { fg: '#c41a15' bg: '#404040' }
        separator: '#404040'
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