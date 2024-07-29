# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8464c4'
        block: '#7272ca'
        cell-path: '#585050'
        closure: '#5485b6'
        custom: '#1b1818'
        duration: '#a06e3b'
        float: '#ca4949'
        glob: '#1b1818'
        int: '#8464c4'
        list: '#5485b6'
        nothing: '#ca4949'
        range: '#a06e3b'
        record: '#5485b6'
        string: '#4b8b8b'

        bool: {|| if $in { '#5485b6' } else { '#a06e3b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ca4949' attr: 'b' }
            } else if $in < 6hr {
                '#ca4949'
            } else if $in < 1day {
                '#a06e3b'
            } else if $in < 3day {
                '#4b8b8b'
            } else if $in < 1wk {
                { fg: '#4b8b8b' attr: 'b' }
            } else if $in < 6wk {
                '#5485b6'
            } else if $in < 52wk {
                '#7272ca'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#585050'
            } else if $e < 1mb {
                '#5485b6'
            } else {{ fg: '#7272ca' }}
        }

        shape_and: { fg: '#8464c4' attr: 'b' }
        shape_binary: { fg: '#8464c4' attr: 'b' }
        shape_block: { fg: '#7272ca' attr: 'b' }
        shape_bool: '#5485b6'
        shape_closure: { fg: '#5485b6' attr: 'b' }
        shape_custom: '#4b8b8b'
        shape_datetime: { fg: '#5485b6' attr: 'b' }
        shape_directory: '#5485b6'
        shape_external: '#5485b6'
        shape_external_resolved: '#5485b6'
        shape_externalarg: { fg: '#4b8b8b' attr: 'b' }
        shape_filepath: '#5485b6'
        shape_flag: { fg: '#7272ca' attr: 'b' }
        shape_float: { fg: '#ca4949' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5485b6' attr: 'b' }
        shape_globpattern: { fg: '#5485b6' attr: 'b' }
        shape_int: { fg: '#8464c4' attr: 'b' }
        shape_internalcall: { fg: '#5485b6' attr: 'b' }
        shape_keyword: { fg: '#8464c4' attr: 'b' }
        shape_list: { fg: '#5485b6' attr: 'b' }
        shape_literal: '#7272ca'
        shape_match_pattern: '#4b8b8b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ca4949'
        shape_operator: '#a06e3b'
        shape_or: { fg: '#8464c4' attr: 'b' }
        shape_pipe: { fg: '#8464c4' attr: 'b' }
        shape_range: { fg: '#a06e3b' attr: 'b' }
        shape_raw_string: { fg: '#1b1818' attr: 'b' }
        shape_record: { fg: '#5485b6' attr: 'b' }
        shape_redirection: { fg: '#8464c4' attr: 'b' }
        shape_signature: { fg: '#4b8b8b' attr: 'b' }
        shape_string: '#4b8b8b'
        shape_string_interpolation: { fg: '#5485b6' attr: 'b' }
        shape_table: { fg: '#7272ca' attr: 'b' }
        shape_vardecl: { fg: '#7272ca' attr: 'u' }
        shape_variable: '#8464c4'

        foreground: '#585050'
        background: '#f4ecec'
        cursor: '#585050'

        empty: '#7272ca'
        header: { fg: '#4b8b8b' attr: 'b' }
        hints: '#7e7777'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#4b8b8b' attr: 'b' }
        search_result: { fg: '#ca4949' bg: '#585050' }
        separator: '#585050'
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