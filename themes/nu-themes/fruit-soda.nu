# Retrieve the theme settings
export def main [] {
    return {
        binary: '#611fce'
        block: '#2931df'
        cell-path: '#515151'
        closure: '#0f9cfd'
        custom: '#2d2c2c'
        duration: '#f7e203'
        float: '#fe3e31'
        glob: '#2d2c2c'
        int: '#611fce'
        list: '#0f9cfd'
        nothing: '#fe3e31'
        range: '#f7e203'
        record: '#0f9cfd'
        string: '#47f74c'

        bool: {|| if $in { '#0f9cfd' } else { '#f7e203' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fe3e31' attr: 'b' }
            } else if $in < 6hr {
                '#fe3e31'
            } else if $in < 1day {
                '#f7e203'
            } else if $in < 3day {
                '#47f74c'
            } else if $in < 1wk {
                { fg: '#47f74c' attr: 'b' }
            } else if $in < 6wk {
                '#0f9cfd'
            } else if $in < 52wk {
                '#2931df'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#515151'
            } else if $e < 1mb {
                '#0f9cfd'
            } else {{ fg: '#2931df' }}
        }

        shape_and: { fg: '#611fce' attr: 'b' }
        shape_binary: { fg: '#611fce' attr: 'b' }
        shape_block: { fg: '#2931df' attr: 'b' }
        shape_bool: '#0f9cfd'
        shape_closure: { fg: '#0f9cfd' attr: 'b' }
        shape_custom: '#47f74c'
        shape_datetime: { fg: '#0f9cfd' attr: 'b' }
        shape_directory: '#0f9cfd'
        shape_external: '#0f9cfd'
        shape_external_resolved: '#0f9cfd'
        shape_externalarg: { fg: '#47f74c' attr: 'b' }
        shape_filepath: '#0f9cfd'
        shape_flag: { fg: '#2931df' attr: 'b' }
        shape_float: { fg: '#fe3e31' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0f9cfd' attr: 'b' }
        shape_globpattern: { fg: '#0f9cfd' attr: 'b' }
        shape_int: { fg: '#611fce' attr: 'b' }
        shape_internalcall: { fg: '#0f9cfd' attr: 'b' }
        shape_keyword: { fg: '#611fce' attr: 'b' }
        shape_list: { fg: '#0f9cfd' attr: 'b' }
        shape_literal: '#2931df'
        shape_match_pattern: '#47f74c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fe3e31'
        shape_operator: '#f7e203'
        shape_or: { fg: '#611fce' attr: 'b' }
        shape_pipe: { fg: '#611fce' attr: 'b' }
        shape_range: { fg: '#f7e203' attr: 'b' }
        shape_raw_string: { fg: '#2d2c2c' attr: 'b' }
        shape_record: { fg: '#0f9cfd' attr: 'b' }
        shape_redirection: { fg: '#611fce' attr: 'b' }
        shape_signature: { fg: '#47f74c' attr: 'b' }
        shape_string: '#47f74c'
        shape_string_interpolation: { fg: '#0f9cfd' attr: 'b' }
        shape_table: { fg: '#2931df' attr: 'b' }
        shape_vardecl: { fg: '#2931df' attr: 'u' }
        shape_variable: '#611fce'

        foreground: '#515151'
        background: '#f1ecf1'
        cursor: '#515151'

        empty: '#2931df'
        header: { fg: '#47f74c' attr: 'b' }
        hints: '#b5b4b6'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#47f74c' attr: 'b' }
        search_result: { fg: '#fe3e31' bg: '#515151' }
        separator: '#515151'
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