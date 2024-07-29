# Retrieve the theme settings
export def main [] {
    return {
        binary: '#00bb00'
        block: '#009900'
        cell-path: '#00bb00'
        closure: '#005500'
        custom: '#00ff00'
        duration: '#007700'
        float: '#007700'
        glob: '#00ff00'
        int: '#00bb00'
        list: '#005500'
        nothing: '#007700'
        range: '#007700'
        record: '#005500'
        string: '#00bb00'

        bool: {|| if $in { '#005500' } else { '#007700' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#007700' attr: 'b' }
            } else if $in < 6hr {
                '#007700'
            } else if $in < 1day {
                '#007700'
            } else if $in < 3day {
                '#00bb00'
            } else if $in < 1wk {
                { fg: '#00bb00' attr: 'b' }
            } else if $in < 6wk {
                '#005500'
            } else if $in < 52wk {
                '#009900'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#00bb00'
            } else if $e < 1mb {
                '#005500'
            } else {{ fg: '#009900' }}
        }

        shape_and: { fg: '#00bb00' attr: 'b' }
        shape_binary: { fg: '#00bb00' attr: 'b' }
        shape_block: { fg: '#009900' attr: 'b' }
        shape_bool: '#005500'
        shape_closure: { fg: '#005500' attr: 'b' }
        shape_custom: '#00bb00'
        shape_datetime: { fg: '#005500' attr: 'b' }
        shape_directory: '#005500'
        shape_external: '#005500'
        shape_external_resolved: '#005500'
        shape_externalarg: { fg: '#00bb00' attr: 'b' }
        shape_filepath: '#005500'
        shape_flag: { fg: '#009900' attr: 'b' }
        shape_float: { fg: '#007700' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#005500' attr: 'b' }
        shape_globpattern: { fg: '#005500' attr: 'b' }
        shape_int: { fg: '#00bb00' attr: 'b' }
        shape_internalcall: { fg: '#005500' attr: 'b' }
        shape_keyword: { fg: '#00bb00' attr: 'b' }
        shape_list: { fg: '#005500' attr: 'b' }
        shape_literal: '#009900'
        shape_match_pattern: '#00bb00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#007700'
        shape_operator: '#007700'
        shape_or: { fg: '#00bb00' attr: 'b' }
        shape_pipe: { fg: '#00bb00' attr: 'b' }
        shape_range: { fg: '#007700' attr: 'b' }
        shape_raw_string: { fg: '#00ff00' attr: 'b' }
        shape_record: { fg: '#005500' attr: 'b' }
        shape_redirection: { fg: '#00bb00' attr: 'b' }
        shape_signature: { fg: '#00bb00' attr: 'b' }
        shape_string: '#00bb00'
        shape_string_interpolation: { fg: '#005500' attr: 'b' }
        shape_table: { fg: '#009900' attr: 'b' }
        shape_vardecl: { fg: '#009900' attr: 'u' }
        shape_variable: '#00bb00'

        foreground: '#00bb00'
        background: '#001100'
        cursor: '#00bb00'

        empty: '#009900'
        header: { fg: '#00bb00' attr: 'b' }
        hints: '#007700'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00bb00' attr: 'b' }
        search_result: { fg: '#007700' bg: '#00bb00' }
        separator: '#00bb00'
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