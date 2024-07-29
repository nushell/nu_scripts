# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d381c3'
        block: '#6fb3d2'
        cell-path: '#e0e0e0'
        closure: '#76c7b7'
        custom: '#ffffff'
        duration: '#fda331'
        float: '#fb0120'
        glob: '#ffffff'
        int: '#d381c3'
        list: '#76c7b7'
        nothing: '#fb0120'
        range: '#fda331'
        record: '#76c7b7'
        string: '#a1c659'

        bool: {|| if $in { '#76c7b7' } else { '#fda331' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fb0120' attr: 'b' }
            } else if $in < 6hr {
                '#fb0120'
            } else if $in < 1day {
                '#fda331'
            } else if $in < 3day {
                '#a1c659'
            } else if $in < 1wk {
                { fg: '#a1c659' attr: 'b' }
            } else if $in < 6wk {
                '#76c7b7'
            } else if $in < 52wk {
                '#6fb3d2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e0e0e0'
            } else if $e < 1mb {
                '#76c7b7'
            } else {{ fg: '#6fb3d2' }}
        }

        shape_and: { fg: '#d381c3' attr: 'b' }
        shape_binary: { fg: '#d381c3' attr: 'b' }
        shape_block: { fg: '#6fb3d2' attr: 'b' }
        shape_bool: '#76c7b7'
        shape_closure: { fg: '#76c7b7' attr: 'b' }
        shape_custom: '#a1c659'
        shape_datetime: { fg: '#76c7b7' attr: 'b' }
        shape_directory: '#76c7b7'
        shape_external: '#76c7b7'
        shape_external_resolved: '#76c7b7'
        shape_externalarg: { fg: '#a1c659' attr: 'b' }
        shape_filepath: '#76c7b7'
        shape_flag: { fg: '#6fb3d2' attr: 'b' }
        shape_float: { fg: '#fb0120' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#76c7b7' attr: 'b' }
        shape_globpattern: { fg: '#76c7b7' attr: 'b' }
        shape_int: { fg: '#d381c3' attr: 'b' }
        shape_internalcall: { fg: '#76c7b7' attr: 'b' }
        shape_keyword: { fg: '#d381c3' attr: 'b' }
        shape_list: { fg: '#76c7b7' attr: 'b' }
        shape_literal: '#6fb3d2'
        shape_match_pattern: '#a1c659'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fb0120'
        shape_operator: '#fda331'
        shape_or: { fg: '#d381c3' attr: 'b' }
        shape_pipe: { fg: '#d381c3' attr: 'b' }
        shape_range: { fg: '#fda331' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#76c7b7' attr: 'b' }
        shape_redirection: { fg: '#d381c3' attr: 'b' }
        shape_signature: { fg: '#a1c659' attr: 'b' }
        shape_string: '#a1c659'
        shape_string_interpolation: { fg: '#76c7b7' attr: 'b' }
        shape_table: { fg: '#6fb3d2' attr: 'b' }
        shape_vardecl: { fg: '#6fb3d2' attr: 'u' }
        shape_variable: '#d381c3'

        foreground: '#e0e0e0'
        background: '#000000'
        cursor: '#e0e0e0'

        empty: '#6fb3d2'
        header: { fg: '#a1c659' attr: 'b' }
        hints: '#b0b0b0'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a1c659' attr: 'b' }
        search_result: { fg: '#fb0120' bg: '#e0e0e0' }
        separator: '#e0e0e0'
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