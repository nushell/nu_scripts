# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ee64ac'
        block: '#26bbd9'
        cell-path: '#403c3d'
        closure: '#59e1e3'
        custom: '#201c1d'
        duration: '#fadad1'
        float: '#e95678'
        glob: '#201c1d'
        int: '#ee64ac'
        list: '#59e1e3'
        nothing: '#e95678'
        range: '#fadad1'
        record: '#59e1e3'
        string: '#29d398'

        bool: {|| if $in { '#59e1e3' } else { '#fadad1' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e95678' attr: 'b' }
            } else if $in < 6hr {
                '#e95678'
            } else if $in < 1day {
                '#fadad1'
            } else if $in < 3day {
                '#29d398'
            } else if $in < 1wk {
                { fg: '#29d398' attr: 'b' }
            } else if $in < 6wk {
                '#59e1e3'
            } else if $in < 52wk {
                '#26bbd9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#403c3d'
            } else if $e < 1mb {
                '#59e1e3'
            } else {{ fg: '#26bbd9' }}
        }

        shape_and: { fg: '#ee64ac' attr: 'b' }
        shape_binary: { fg: '#ee64ac' attr: 'b' }
        shape_block: { fg: '#26bbd9' attr: 'b' }
        shape_bool: '#59e1e3'
        shape_closure: { fg: '#59e1e3' attr: 'b' }
        shape_custom: '#29d398'
        shape_datetime: { fg: '#59e1e3' attr: 'b' }
        shape_directory: '#59e1e3'
        shape_external: '#59e1e3'
        shape_external_resolved: '#59e1e3'
        shape_externalarg: { fg: '#29d398' attr: 'b' }
        shape_filepath: '#59e1e3'
        shape_flag: { fg: '#26bbd9' attr: 'b' }
        shape_float: { fg: '#e95678' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#59e1e3' attr: 'b' }
        shape_globpattern: { fg: '#59e1e3' attr: 'b' }
        shape_int: { fg: '#ee64ac' attr: 'b' }
        shape_internalcall: { fg: '#59e1e3' attr: 'b' }
        shape_keyword: { fg: '#ee64ac' attr: 'b' }
        shape_list: { fg: '#59e1e3' attr: 'b' }
        shape_literal: '#26bbd9'
        shape_match_pattern: '#29d398'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e95678'
        shape_operator: '#fadad1'
        shape_or: { fg: '#ee64ac' attr: 'b' }
        shape_pipe: { fg: '#ee64ac' attr: 'b' }
        shape_range: { fg: '#fadad1' attr: 'b' }
        shape_raw_string: { fg: '#201c1d' attr: 'b' }
        shape_record: { fg: '#59e1e3' attr: 'b' }
        shape_redirection: { fg: '#ee64ac' attr: 'b' }
        shape_signature: { fg: '#29d398' attr: 'b' }
        shape_string: '#29d398'
        shape_string_interpolation: { fg: '#59e1e3' attr: 'b' }
        shape_table: { fg: '#26bbd9' attr: 'b' }
        shape_vardecl: { fg: '#26bbd9' attr: 'u' }
        shape_variable: '#ee64ac'

        foreground: '#403c3d'
        background: '#fdf0ed'
        cursor: '#403c3d'

        empty: '#26bbd9'
        header: { fg: '#29d398' attr: 'b' }
        hints: '#bdb3b1'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#29d398' attr: 'b' }
        search_result: { fg: '#e95678' bg: '#403c3d' }
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