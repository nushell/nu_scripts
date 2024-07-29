# Retrieve the theme settings
export def main [] {
    return {
        binary: '#1d8991'
        block: '#da103f'
        cell-path: '#403c3d'
        closure: '#dc3318'
        custom: '#201c1d'
        duration: '#fbe0d9'
        float: '#f7939b'
        glob: '#201c1d'
        int: '#1d8991'
        list: '#dc3318'
        nothing: '#f7939b'
        range: '#fbe0d9'
        record: '#dc3318'
        string: '#94e1b0'

        bool: {|| if $in { '#dc3318' } else { '#fbe0d9' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f7939b' attr: 'b' }
            } else if $in < 6hr {
                '#f7939b'
            } else if $in < 1day {
                '#fbe0d9'
            } else if $in < 3day {
                '#94e1b0'
            } else if $in < 1wk {
                { fg: '#94e1b0' attr: 'b' }
            } else if $in < 6wk {
                '#dc3318'
            } else if $in < 52wk {
                '#da103f'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#403c3d'
            } else if $e < 1mb {
                '#dc3318'
            } else {{ fg: '#da103f' }}
        }

        shape_and: { fg: '#1d8991' attr: 'b' }
        shape_binary: { fg: '#1d8991' attr: 'b' }
        shape_block: { fg: '#da103f' attr: 'b' }
        shape_bool: '#dc3318'
        shape_closure: { fg: '#dc3318' attr: 'b' }
        shape_custom: '#94e1b0'
        shape_datetime: { fg: '#dc3318' attr: 'b' }
        shape_directory: '#dc3318'
        shape_external: '#dc3318'
        shape_external_resolved: '#dc3318'
        shape_externalarg: { fg: '#94e1b0' attr: 'b' }
        shape_filepath: '#dc3318'
        shape_flag: { fg: '#da103f' attr: 'b' }
        shape_float: { fg: '#f7939b' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#dc3318' attr: 'b' }
        shape_globpattern: { fg: '#dc3318' attr: 'b' }
        shape_int: { fg: '#1d8991' attr: 'b' }
        shape_internalcall: { fg: '#dc3318' attr: 'b' }
        shape_keyword: { fg: '#1d8991' attr: 'b' }
        shape_list: { fg: '#dc3318' attr: 'b' }
        shape_literal: '#da103f'
        shape_match_pattern: '#94e1b0'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f7939b'
        shape_operator: '#fbe0d9'
        shape_or: { fg: '#1d8991' attr: 'b' }
        shape_pipe: { fg: '#1d8991' attr: 'b' }
        shape_range: { fg: '#fbe0d9' attr: 'b' }
        shape_raw_string: { fg: '#201c1d' attr: 'b' }
        shape_record: { fg: '#dc3318' attr: 'b' }
        shape_redirection: { fg: '#1d8991' attr: 'b' }
        shape_signature: { fg: '#94e1b0' attr: 'b' }
        shape_string: '#94e1b0'
        shape_string_interpolation: { fg: '#dc3318' attr: 'b' }
        shape_table: { fg: '#da103f' attr: 'b' }
        shape_vardecl: { fg: '#da103f' attr: 'u' }
        shape_variable: '#1d8991'

        foreground: '#403c3d'
        background: '#fdf0ed'
        cursor: '#403c3d'

        empty: '#da103f'
        header: { fg: '#94e1b0' attr: 'b' }
        hints: '#bdb3b1'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#94e1b0' attr: 'b' }
        search_result: { fg: '#f7939b' bg: '#403c3d' }
        separator: '#403c3d'
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