# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c8a0d1'
        block: '#72b3cc'
        cell-path: '#b0b0b0'
        closure: '#218693'
        custom: '#f7f7f7'
        duration: '#d0b03c'
        float: '#e09690'
        glob: '#f7f7f7'
        int: '#c8a0d1'
        list: '#218693'
        nothing: '#c75646'
        range: '#d0b03c'
        record: '#218693'
        string: '#8eb33b'

        bool: {|| if $in { '#77dfd8' } else { '#d0b03c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c75646' attr: 'b' }
            } else if $in < 6hr {
                '#c75646'
            } else if $in < 1day {
                '#d0b03c'
            } else if $in < 3day {
                '#8eb33b'
            } else if $in < 1wk {
                { fg: '#8eb33b' attr: 'b' }
            } else if $in < 6wk {
                '#218693'
            } else if $in < 52wk {
                '#72b3cc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b0b0b0'
            } else if $e < 1mb {
                '#218693'
            } else {{ fg: '#72b3cc' }}
        }

        shape_and: { fg: '#c8a0d1' attr: 'b' }
        shape_binary: { fg: '#c8a0d1' attr: 'b' }
        shape_block: { fg: '#72b3cc' attr: 'b' }
        shape_bool: '#77dfd8'
        shape_closure: { fg: '#218693' attr: 'b' }
        shape_custom: '#8eb33b'
        shape_datetime: { fg: '#218693' attr: 'b' }
        shape_directory: '#218693'
        shape_external: '#218693'
        shape_external_resolved: '#77dfd8'
        shape_externalarg: { fg: '#8eb33b' attr: 'b' }
        shape_filepath: '#218693'
        shape_flag: { fg: '#72b3cc' attr: 'b' }
        shape_float: { fg: '#e09690' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#218693' attr: 'b' }
        shape_globpattern: { fg: '#218693' attr: 'b' }
        shape_int: { fg: '#c8a0d1' attr: 'b' }
        shape_internalcall: { fg: '#218693' attr: 'b' }
        shape_keyword: { fg: '#c8a0d1' attr: 'b' }
        shape_list: { fg: '#218693' attr: 'b' }
        shape_literal: '#72b3cc'
        shape_match_pattern: '#8eb33b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c75646'
        shape_operator: '#d0b03c'
        shape_or: { fg: '#c8a0d1' attr: 'b' }
        shape_pipe: { fg: '#c8a0d1' attr: 'b' }
        shape_range: { fg: '#d0b03c' attr: 'b' }
        shape_raw_string: { fg: '#f7f7f7' attr: 'b' }
        shape_record: { fg: '#218693' attr: 'b' }
        shape_redirection: { fg: '#c8a0d1' attr: 'b' }
        shape_signature: { fg: '#8eb33b' attr: 'b' }
        shape_string: '#8eb33b'
        shape_string_interpolation: { fg: '#218693' attr: 'b' }
        shape_table: { fg: '#72b3cc' attr: 'b' }
        shape_vardecl: { fg: '#72b3cc' attr: 'u' }
        shape_variable: '#c8a0d1'

        foreground: '#f7f7f7'
        background: '#242424'
        cursor: '#f7f7f7'

        empty: '#72b3cc'
        header: { fg: '#8eb33b' attr: 'b' }
        hints: '#5d5d5d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8eb33b' attr: 'b' }
        search_result: { fg: '#c75646' bg: '#b0b0b0' }
        separator: '#b0b0b0'
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