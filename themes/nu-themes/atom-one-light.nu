# Retrieve the theme settings
export def main [] {
    return {
        binary: '#950095'
        block: '#2f5af3'
        cell-path: '#bbbbbb'
        closure: '#3e953a'
        custom: '#ffffff'
        duration: '#d2b67b'
        float: '#de3d35'
        glob: '#ffffff'
        int: '#950095'
        list: '#3e953a'
        nothing: '#de3d35'
        range: '#d2b67b'
        record: '#3e953a'
        string: '#3e953a'

        bool: {|| if $in { '#3e953a' } else { '#d2b67b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#de3d35' attr: 'b' }
            } else if $in < 6hr {
                '#de3d35'
            } else if $in < 1day {
                '#d2b67b'
            } else if $in < 3day {
                '#3e953a'
            } else if $in < 1wk {
                { fg: '#3e953a' attr: 'b' }
            } else if $in < 6wk {
                '#3e953a'
            } else if $in < 52wk {
                '#2f5af3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#3e953a'
            } else {{ fg: '#2f5af3' }}
        }

        shape_and: { fg: '#950095' attr: 'b' }
        shape_binary: { fg: '#950095' attr: 'b' }
        shape_block: { fg: '#2f5af3' attr: 'b' }
        shape_bool: '#3e953a'
        shape_closure: { fg: '#3e953a' attr: 'b' }
        shape_custom: '#3e953a'
        shape_datetime: { fg: '#3e953a' attr: 'b' }
        shape_directory: '#3e953a'
        shape_external: '#3e953a'
        shape_external_resolved: '#3e953a'
        shape_externalarg: { fg: '#3e953a' attr: 'b' }
        shape_filepath: '#3e953a'
        shape_flag: { fg: '#2f5af3' attr: 'b' }
        shape_float: { fg: '#de3d35' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3e953a' attr: 'b' }
        shape_globpattern: { fg: '#3e953a' attr: 'b' }
        shape_int: { fg: '#950095' attr: 'b' }
        shape_internalcall: { fg: '#3e953a' attr: 'b' }
        shape_keyword: { fg: '#950095' attr: 'b' }
        shape_list: { fg: '#3e953a' attr: 'b' }
        shape_literal: '#2f5af3'
        shape_match_pattern: '#3e953a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#de3d35'
        shape_operator: '#d2b67b'
        shape_or: { fg: '#950095' attr: 'b' }
        shape_pipe: { fg: '#950095' attr: 'b' }
        shape_range: { fg: '#d2b67b' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#3e953a' attr: 'b' }
        shape_redirection: { fg: '#950095' attr: 'b' }
        shape_signature: { fg: '#3e953a' attr: 'b' }
        shape_string: '#3e953a'
        shape_string_interpolation: { fg: '#3e953a' attr: 'b' }
        shape_table: { fg: '#2f5af3' attr: 'b' }
        shape_vardecl: { fg: '#2f5af3' attr: 'u' }
        shape_variable: '#950095'

        foreground: '#2a2b33'
        background: '#f8f8f8'
        cursor: '#bbbbbb'

        empty: '#2f5af3'
        header: { fg: '#3e953a' attr: 'b' }
        hints: '#000000'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#3e953a' attr: 'b' }
        search_result: { fg: '#de3d35' bg: '#bbbbbb' }
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