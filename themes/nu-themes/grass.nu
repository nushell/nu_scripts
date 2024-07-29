# Retrieve the theme settings
export def main [] {
    return {
        binary: '#950062'
        block: '#0000a3'
        cell-path: '#bbbbbb'
        closure: '#00bbbb'
        custom: '#ffffff'
        duration: '#e7b000'
        float: '#bb0000'
        glob: '#ffffff'
        int: '#950062'
        list: '#00bbbb'
        nothing: '#bb0000'
        range: '#e7b000'
        record: '#00bbbb'
        string: '#00bb00'

        bool: {|| if $in { '#55ffff' } else { '#e7b000' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#bb0000' attr: 'b' }
            } else if $in < 6hr {
                '#bb0000'
            } else if $in < 1day {
                '#e7b000'
            } else if $in < 3day {
                '#00bb00'
            } else if $in < 1wk {
                { fg: '#00bb00' attr: 'b' }
            } else if $in < 6wk {
                '#00bbbb'
            } else if $in < 52wk {
                '#0000a3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#00bbbb'
            } else {{ fg: '#0000a3' }}
        }

        shape_and: { fg: '#950062' attr: 'b' }
        shape_binary: { fg: '#950062' attr: 'b' }
        shape_block: { fg: '#0000a3' attr: 'b' }
        shape_bool: '#55ffff'
        shape_closure: { fg: '#00bbbb' attr: 'b' }
        shape_custom: '#00bb00'
        shape_datetime: { fg: '#00bbbb' attr: 'b' }
        shape_directory: '#00bbbb'
        shape_external: '#00bbbb'
        shape_external_resolved: '#55ffff'
        shape_externalarg: { fg: '#00bb00' attr: 'b' }
        shape_filepath: '#00bbbb'
        shape_flag: { fg: '#0000a3' attr: 'b' }
        shape_float: { fg: '#bb0000' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00bbbb' attr: 'b' }
        shape_globpattern: { fg: '#00bbbb' attr: 'b' }
        shape_int: { fg: '#950062' attr: 'b' }
        shape_internalcall: { fg: '#00bbbb' attr: 'b' }
        shape_keyword: { fg: '#950062' attr: 'b' }
        shape_list: { fg: '#00bbbb' attr: 'b' }
        shape_literal: '#0000a3'
        shape_match_pattern: '#00bb00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#bb0000'
        shape_operator: '#e7b000'
        shape_or: { fg: '#950062' attr: 'b' }
        shape_pipe: { fg: '#950062' attr: 'b' }
        shape_range: { fg: '#e7b000' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00bbbb' attr: 'b' }
        shape_redirection: { fg: '#950062' attr: 'b' }
        shape_signature: { fg: '#00bb00' attr: 'b' }
        shape_string: '#00bb00'
        shape_string_interpolation: { fg: '#00bbbb' attr: 'b' }
        shape_table: { fg: '#0000a3' attr: 'b' }
        shape_vardecl: { fg: '#0000a3' attr: 'u' }
        shape_variable: '#950062'

        foreground: '#fff0a5'
        background: '#13773d'
        cursor: '#fff0a5'

        empty: '#0000a3'
        header: { fg: '#00bb00' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00bb00' attr: 'b' }
        search_result: { fg: '#bb0000' bg: '#bbbbbb' }
        separator: '#bbbbbb'
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