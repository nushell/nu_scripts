# Retrieve the theme settings
export def main [] {
    return {
        binary: '#deb887'
        block: '#6495ed'
        cell-path: '#bbaa99'
        closure: '#b0c4de'
        custom: '#ddccbb'
        duration: '#e8ae5b'
        float: '#cc5533'
        glob: '#ddccbb'
        int: '#deb887'
        list: '#b0c4de'
        nothing: '#cd5c5c'
        range: '#e8ae5b'
        record: '#b0c4de'
        string: '#86af80'

        bool: {|| if $in { '#b0c4de' } else { '#e8ae5b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cd5c5c' attr: 'b' }
            } else if $in < 6hr {
                '#cd5c5c'
            } else if $in < 1day {
                '#e8ae5b'
            } else if $in < 3day {
                '#86af80'
            } else if $in < 1wk {
                { fg: '#86af80' attr: 'b' }
            } else if $in < 6wk {
                '#b0c4de'
            } else if $in < 52wk {
                '#6495ed'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbaa99'
            } else if $e < 1mb {
                '#b0c4de'
            } else {{ fg: '#6495ed' }}
        }

        shape_and: { fg: '#deb887' attr: 'b' }
        shape_binary: { fg: '#deb887' attr: 'b' }
        shape_block: { fg: '#6495ed' attr: 'b' }
        shape_bool: '#b0c4de'
        shape_closure: { fg: '#b0c4de' attr: 'b' }
        shape_custom: '#86af80'
        shape_datetime: { fg: '#b0c4de' attr: 'b' }
        shape_directory: '#b0c4de'
        shape_external: '#b0c4de'
        shape_external_resolved: '#b0c4de'
        shape_externalarg: { fg: '#86af80' attr: 'b' }
        shape_filepath: '#b0c4de'
        shape_flag: { fg: '#6495ed' attr: 'b' }
        shape_float: { fg: '#cc5533' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#b0c4de' attr: 'b' }
        shape_globpattern: { fg: '#b0c4de' attr: 'b' }
        shape_int: { fg: '#deb887' attr: 'b' }
        shape_internalcall: { fg: '#b0c4de' attr: 'b' }
        shape_keyword: { fg: '#deb887' attr: 'b' }
        shape_list: { fg: '#b0c4de' attr: 'b' }
        shape_literal: '#6495ed'
        shape_match_pattern: '#86af80'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cd5c5c'
        shape_operator: '#e8ae5b'
        shape_or: { fg: '#deb887' attr: 'b' }
        shape_pipe: { fg: '#deb887' attr: 'b' }
        shape_range: { fg: '#e8ae5b' attr: 'b' }
        shape_raw_string: { fg: '#ddccbb' attr: 'b' }
        shape_record: { fg: '#b0c4de' attr: 'b' }
        shape_redirection: { fg: '#deb887' attr: 'b' }
        shape_signature: { fg: '#86af80' attr: 'b' }
        shape_string: '#86af80'
        shape_string_interpolation: { fg: '#b0c4de' attr: 'b' }
        shape_table: { fg: '#6495ed' attr: 'b' }
        shape_vardecl: { fg: '#6495ed' attr: 'u' }
        shape_variable: '#deb887'

        foreground: '#ddeedd'
        background: '#1c1c1c'
        cursor: '#ddeedd'

        empty: '#6495ed'
        header: { fg: '#86af80' attr: 'b' }
        hints: '#554444'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#86af80' attr: 'b' }
        search_result: { fg: '#cd5c5c' bg: '#bbaa99' }
        separator: '#bbaa99'
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