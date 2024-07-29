# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c0c4aa'
        block: '#60d4cd'
        cell-path: '#b0c8ca'
        closure: '#8ad0b0'
        custom: '#b6e0ca'
        duration: '#bfc94a'
        float: '#d1d933'
        glob: '#b6e0ca'
        int: '#c0c4aa'
        list: '#8ad0b0'
        nothing: '#c6c80a'
        range: '#bfc94a'
        record: '#8ad0b0'
        string: '#7ad67a'

        bool: {|| if $in { '#9bdfc4' } else { '#bfc94a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c6c80a' attr: 'b' }
            } else if $in < 6hr {
                '#c6c80a'
            } else if $in < 1day {
                '#bfc94a'
            } else if $in < 3day {
                '#7ad67a'
            } else if $in < 1wk {
                { fg: '#7ad67a' attr: 'b' }
            } else if $in < 6wk {
                '#8ad0b0'
            } else if $in < 52wk {
                '#60d4cd'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b0c8ca'
            } else if $e < 1mb {
                '#8ad0b0'
            } else {{ fg: '#60d4cd' }}
        }

        shape_and: { fg: '#c0c4aa' attr: 'b' }
        shape_binary: { fg: '#c0c4aa' attr: 'b' }
        shape_block: { fg: '#60d4cd' attr: 'b' }
        shape_bool: '#9bdfc4'
        shape_closure: { fg: '#8ad0b0' attr: 'b' }
        shape_custom: '#7ad67a'
        shape_datetime: { fg: '#8ad0b0' attr: 'b' }
        shape_directory: '#8ad0b0'
        shape_external: '#8ad0b0'
        shape_external_resolved: '#9bdfc4'
        shape_externalarg: { fg: '#7ad67a' attr: 'b' }
        shape_filepath: '#8ad0b0'
        shape_flag: { fg: '#60d4cd' attr: 'b' }
        shape_float: { fg: '#d1d933' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8ad0b0' attr: 'b' }
        shape_globpattern: { fg: '#8ad0b0' attr: 'b' }
        shape_int: { fg: '#c0c4aa' attr: 'b' }
        shape_internalcall: { fg: '#8ad0b0' attr: 'b' }
        shape_keyword: { fg: '#c0c4aa' attr: 'b' }
        shape_list: { fg: '#8ad0b0' attr: 'b' }
        shape_literal: '#60d4cd'
        shape_match_pattern: '#7ad67a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c6c80a'
        shape_operator: '#bfc94a'
        shape_or: { fg: '#c0c4aa' attr: 'b' }
        shape_pipe: { fg: '#c0c4aa' attr: 'b' }
        shape_range: { fg: '#bfc94a' attr: 'b' }
        shape_raw_string: { fg: '#b6e0ca' attr: 'b' }
        shape_record: { fg: '#8ad0b0' attr: 'b' }
        shape_redirection: { fg: '#c0c4aa' attr: 'b' }
        shape_signature: { fg: '#7ad67a' attr: 'b' }
        shape_string: '#7ad67a'
        shape_string_interpolation: { fg: '#8ad0b0' attr: 'b' }
        shape_table: { fg: '#60d4cd' attr: 'b' }
        shape_vardecl: { fg: '#60d4cd' attr: 'u' }
        shape_variable: '#c0c4aa'

        foreground: '#b6e0ca'
        background: '#282b2b'
        cursor: '#b6e0ca'

        empty: '#60d4cd'
        header: { fg: '#7ad67a' attr: 'b' }
        hints: '#303434'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7ad67a' attr: 'b' }
        search_result: { fg: '#c6c80a' bg: '#b0c8ca' }
        separator: '#b0c8ca'
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