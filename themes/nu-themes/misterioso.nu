# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9414e6'
        block: '#338f86'
        cell-path: '#e1e1e0'
        closure: '#23d7d7'
        custom: '#ffffff'
        duration: '#ffad29'
        float: '#ff3242'
        glob: '#ffffff'
        int: '#9414e6'
        list: '#23d7d7'
        nothing: '#ff4242'
        range: '#ffad29'
        record: '#23d7d7'
        string: '#74af68'

        bool: {|| if $in { '#00ede1' } else { '#ffad29' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff4242' attr: 'b' }
            } else if $in < 6hr {
                '#ff4242'
            } else if $in < 1day {
                '#ffad29'
            } else if $in < 3day {
                '#74af68'
            } else if $in < 1wk {
                { fg: '#74af68' attr: 'b' }
            } else if $in < 6wk {
                '#23d7d7'
            } else if $in < 52wk {
                '#338f86'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e1e1e0'
            } else if $e < 1mb {
                '#23d7d7'
            } else {{ fg: '#338f86' }}
        }

        shape_and: { fg: '#9414e6' attr: 'b' }
        shape_binary: { fg: '#9414e6' attr: 'b' }
        shape_block: { fg: '#338f86' attr: 'b' }
        shape_bool: '#00ede1'
        shape_closure: { fg: '#23d7d7' attr: 'b' }
        shape_custom: '#74af68'
        shape_datetime: { fg: '#23d7d7' attr: 'b' }
        shape_directory: '#23d7d7'
        shape_external: '#23d7d7'
        shape_external_resolved: '#00ede1'
        shape_externalarg: { fg: '#74af68' attr: 'b' }
        shape_filepath: '#23d7d7'
        shape_flag: { fg: '#338f86' attr: 'b' }
        shape_float: { fg: '#ff3242' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#23d7d7' attr: 'b' }
        shape_globpattern: { fg: '#23d7d7' attr: 'b' }
        shape_int: { fg: '#9414e6' attr: 'b' }
        shape_internalcall: { fg: '#23d7d7' attr: 'b' }
        shape_keyword: { fg: '#9414e6' attr: 'b' }
        shape_list: { fg: '#23d7d7' attr: 'b' }
        shape_literal: '#338f86'
        shape_match_pattern: '#74af68'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff4242'
        shape_operator: '#ffad29'
        shape_or: { fg: '#9414e6' attr: 'b' }
        shape_pipe: { fg: '#9414e6' attr: 'b' }
        shape_range: { fg: '#ffad29' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#23d7d7' attr: 'b' }
        shape_redirection: { fg: '#9414e6' attr: 'b' }
        shape_signature: { fg: '#74af68' attr: 'b' }
        shape_string: '#74af68'
        shape_string_interpolation: { fg: '#23d7d7' attr: 'b' }
        shape_table: { fg: '#338f86' attr: 'b' }
        shape_vardecl: { fg: '#338f86' attr: 'u' }
        shape_variable: '#9414e6'

        foreground: '#e1e1e0'
        background: '#2d3743'
        cursor: '#e1e1e0'

        empty: '#338f86'
        header: { fg: '#74af68' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#74af68' attr: 'b' }
        search_result: { fg: '#ff4242' bg: '#e1e1e0' }
        separator: '#e1e1e0'
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