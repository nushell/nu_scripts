# Retrieve the theme settings
export def main [] {
    return {
        separator: '#fffefe'
        leading_trailing_space_bg: { attr: 'n' }
        header: { fg: '#d1f1a9' attr: 'b' }
        empty: '#bbdaff'
        bool: {|| if $in { '#99ffff' } else { 'light_gray' } }
        int: '#fffefe'
        filesize: {|e|
            if $e == 0b {
                '#fffefe'
            } else if $e < 1mb {
                '#99ffff'
            } else {{ fg: '#bbdaff' }}
        }
        duration: '#fffefe'
        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff9da3' attr: 'b' }
            } else if $in < 6hr {
                '#ff9da3'
            } else if $in < 1day {
                '#ffeead'
            } else if $in < 3day {
                '#d1f1a9'
            } else if $in < 1wk {
                { fg: '#d1f1a9' attr: 'b' }
            } else if $in < 6wk {
                '#99ffff'
            } else if $in < 52wk {
                '#bbdaff'
            } else { 'dark_gray' }
        }
        range: '#fffefe'
        float: '#fffefe'
        string: '#fffefe'
        nothing: '#fffefe'
        binary: '#fffefe'
        cell-path: '#fffefe'
        row_index: { fg: '#d1f1a9' attr: 'b' }
        record: '#fffefe'
        list: '#fffefe'
        block: '#fffefe'
        hints: 'dark_gray'
        search_result: { fg: '#ff9da3' bg: '#fffefe' }

        shape_and: { fg: '#ebbbff' attr: 'b' }
        shape_binary: { fg: '#ebbbff' attr: 'b' }
        shape_block: { fg: '#bbdaff' attr: 'b' }
        shape_bool: '#99ffff'
        shape_custom: '#d1f1a9'
        shape_datetime: { fg: '#99ffff' attr: 'b' }
        shape_directory: '#99ffff'
        shape_external: '#99ffff'
        shape_externalarg: { fg: '#d1f1a9' attr: 'b' }
        shape_filepath: '#99ffff'
        shape_flag: { fg: '#bbdaff' attr: 'b' }
        shape_float: { fg: '#ebbbff' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_globpattern: { fg: '#99ffff' attr: 'b' }
        shape_int: { fg: '#ebbbff' attr: 'b' }
        shape_internalcall: { fg: '#99ffff' attr: 'b' }
        shape_list: { fg: '#99ffff' attr: 'b' }
        shape_literal: '#bbdaff'
        shape_match_pattern: '#d1f1a9'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#99ffff'
        shape_operator: '#ffeead'
        shape_or: { fg: '#ebbbff' attr: 'b' }
        shape_pipe: { fg: '#ebbbff' attr: 'b' }
        shape_range: { fg: '#ffeead' attr: 'b' }
        shape_record: { fg: '#99ffff' attr: 'b' }
        shape_redirection: { fg: '#ebbbff' attr: 'b' }
        shape_signature: { fg: '#d1f1a9' attr: 'b' }
        shape_string: '#d1f1a9'
        shape_string_interpolation: { fg: '#99ffff' attr: 'b' }
        shape_table: { fg: '#bbdaff' attr: 'b' }
        shape_variable: '#ebbbff'

        background: '#002451'
        foreground: '#fffefe'
        cursor: '#fffefe'
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
    # to one line
    | str replace --all "\n" ''
    | print $in
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

# Activate the theme when sourced
use activate