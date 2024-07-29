# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b9b6fc'
        block: '#85befd'
        cell-path: '#e0e0e0'
        closure: '#85befd'
        custom: '#e0e0e0'
        duration: '#ffd7b1'
        float: '#fd5ff1'
        glob: '#e0e0e0'
        int: '#b9b6fc'
        list: '#85befd'
        nothing: '#fd5ff1'
        range: '#ffd7b1'
        record: '#85befd'
        string: '#87c38a'

        bool: {|| if $in { '#85befd' } else { '#ffd7b1' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fd5ff1' attr: 'b' }
            } else if $in < 6hr {
                '#fd5ff1'
            } else if $in < 1day {
                '#ffd7b1'
            } else if $in < 3day {
                '#87c38a'
            } else if $in < 1wk {
                { fg: '#87c38a' attr: 'b' }
            } else if $in < 6wk {
                '#85befd'
            } else if $in < 52wk {
                '#85befd'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e0e0e0'
            } else if $e < 1mb {
                '#85befd'
            } else {{ fg: '#85befd' }}
        }

        shape_and: { fg: '#b9b6fc' attr: 'b' }
        shape_binary: { fg: '#b9b6fc' attr: 'b' }
        shape_block: { fg: '#85befd' attr: 'b' }
        shape_bool: '#85befd'
        shape_closure: { fg: '#85befd' attr: 'b' }
        shape_custom: '#87c38a'
        shape_datetime: { fg: '#85befd' attr: 'b' }
        shape_directory: '#85befd'
        shape_external: '#85befd'
        shape_external_resolved: '#85befd'
        shape_externalarg: { fg: '#87c38a' attr: 'b' }
        shape_filepath: '#85befd'
        shape_flag: { fg: '#85befd' attr: 'b' }
        shape_float: { fg: '#fd5ff1' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#85befd' attr: 'b' }
        shape_globpattern: { fg: '#85befd' attr: 'b' }
        shape_int: { fg: '#b9b6fc' attr: 'b' }
        shape_internalcall: { fg: '#85befd' attr: 'b' }
        shape_keyword: { fg: '#b9b6fc' attr: 'b' }
        shape_list: { fg: '#85befd' attr: 'b' }
        shape_literal: '#85befd'
        shape_match_pattern: '#87c38a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fd5ff1'
        shape_operator: '#ffd7b1'
        shape_or: { fg: '#b9b6fc' attr: 'b' }
        shape_pipe: { fg: '#b9b6fc' attr: 'b' }
        shape_range: { fg: '#ffd7b1' attr: 'b' }
        shape_raw_string: { fg: '#e0e0e0' attr: 'b' }
        shape_record: { fg: '#85befd' attr: 'b' }
        shape_redirection: { fg: '#b9b6fc' attr: 'b' }
        shape_signature: { fg: '#87c38a' attr: 'b' }
        shape_string: '#87c38a'
        shape_string_interpolation: { fg: '#85befd' attr: 'b' }
        shape_table: { fg: '#85befd' attr: 'b' }
        shape_vardecl: { fg: '#85befd' attr: 'u' }
        shape_variable: '#b9b6fc'

        foreground: '#c5c8c6'
        background: '#161719'
        cursor: '#c5c8c6'

        empty: '#85befd'
        header: { fg: '#87c38a' attr: 'b' }
        hints: '#000000'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#87c38a' attr: 'b' }
        search_result: { fg: '#fd5ff1' bg: '#e0e0e0' }
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