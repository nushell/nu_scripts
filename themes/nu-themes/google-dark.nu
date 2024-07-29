# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a36ac7'
        block: '#3971ed'
        cell-path: '#c5c8c6'
        closure: '#3971ed'
        custom: '#ffffff'
        duration: '#fba922'
        float: '#cc342b'
        glob: '#ffffff'
        int: '#a36ac7'
        list: '#3971ed'
        nothing: '#cc342b'
        range: '#fba922'
        record: '#3971ed'
        string: '#198844'

        bool: {|| if $in { '#3971ed' } else { '#fba922' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cc342b' attr: 'b' }
            } else if $in < 6hr {
                '#cc342b'
            } else if $in < 1day {
                '#fba922'
            } else if $in < 3day {
                '#198844'
            } else if $in < 1wk {
                { fg: '#198844' attr: 'b' }
            } else if $in < 6wk {
                '#3971ed'
            } else if $in < 52wk {
                '#3971ed'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c5c8c6'
            } else if $e < 1mb {
                '#3971ed'
            } else {{ fg: '#3971ed' }}
        }

        shape_and: { fg: '#a36ac7' attr: 'b' }
        shape_binary: { fg: '#a36ac7' attr: 'b' }
        shape_block: { fg: '#3971ed' attr: 'b' }
        shape_bool: '#3971ed'
        shape_closure: { fg: '#3971ed' attr: 'b' }
        shape_custom: '#198844'
        shape_datetime: { fg: '#3971ed' attr: 'b' }
        shape_directory: '#3971ed'
        shape_external: '#3971ed'
        shape_external_resolved: '#3971ed'
        shape_externalarg: { fg: '#198844' attr: 'b' }
        shape_filepath: '#3971ed'
        shape_flag: { fg: '#3971ed' attr: 'b' }
        shape_float: { fg: '#cc342b' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3971ed' attr: 'b' }
        shape_globpattern: { fg: '#3971ed' attr: 'b' }
        shape_int: { fg: '#a36ac7' attr: 'b' }
        shape_internalcall: { fg: '#3971ed' attr: 'b' }
        shape_keyword: { fg: '#a36ac7' attr: 'b' }
        shape_list: { fg: '#3971ed' attr: 'b' }
        shape_literal: '#3971ed'
        shape_match_pattern: '#198844'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cc342b'
        shape_operator: '#fba922'
        shape_or: { fg: '#a36ac7' attr: 'b' }
        shape_pipe: { fg: '#a36ac7' attr: 'b' }
        shape_range: { fg: '#fba922' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#3971ed' attr: 'b' }
        shape_redirection: { fg: '#a36ac7' attr: 'b' }
        shape_signature: { fg: '#198844' attr: 'b' }
        shape_string: '#198844'
        shape_string_interpolation: { fg: '#3971ed' attr: 'b' }
        shape_table: { fg: '#3971ed' attr: 'b' }
        shape_vardecl: { fg: '#3971ed' attr: 'u' }
        shape_variable: '#a36ac7'

        foreground: '#c5c8c6'
        background: '#1d1f21'
        cursor: '#c5c8c6'

        empty: '#3971ed'
        header: { fg: '#198844' attr: 'b' }
        hints: '#969896'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#198844' attr: 'b' }
        search_result: { fg: '#cc342b' bg: '#c5c8c6' }
        separator: '#c5c8c6'
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