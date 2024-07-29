# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b200b2'
        block: '#0000b2'
        cell-path: '#bfbfbf'
        closure: '#00a6b2'
        custom: '#e5e5e5'
        duration: '#999900'
        float: '#e50000'
        glob: '#e5e5e5'
        int: '#b200b2'
        list: '#00a6b2'
        nothing: '#990000'
        range: '#999900'
        record: '#00a6b2'
        string: '#00a600'

        bool: {|| if $in { '#00e5e5' } else { '#999900' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#990000' attr: 'b' }
            } else if $in < 6hr {
                '#990000'
            } else if $in < 1day {
                '#999900'
            } else if $in < 3day {
                '#00a600'
            } else if $in < 1wk {
                { fg: '#00a600' attr: 'b' }
            } else if $in < 6wk {
                '#00a6b2'
            } else if $in < 52wk {
                '#0000b2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bfbfbf'
            } else if $e < 1mb {
                '#00a6b2'
            } else {{ fg: '#0000b2' }}
        }

        shape_and: { fg: '#b200b2' attr: 'b' }
        shape_binary: { fg: '#b200b2' attr: 'b' }
        shape_block: { fg: '#0000b2' attr: 'b' }
        shape_bool: '#00e5e5'
        shape_closure: { fg: '#00a6b2' attr: 'b' }
        shape_custom: '#00a600'
        shape_datetime: { fg: '#00a6b2' attr: 'b' }
        shape_directory: '#00a6b2'
        shape_external: '#00a6b2'
        shape_external_resolved: '#00e5e5'
        shape_externalarg: { fg: '#00a600' attr: 'b' }
        shape_filepath: '#00a6b2'
        shape_flag: { fg: '#0000b2' attr: 'b' }
        shape_float: { fg: '#e50000' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00a6b2' attr: 'b' }
        shape_globpattern: { fg: '#00a6b2' attr: 'b' }
        shape_int: { fg: '#b200b2' attr: 'b' }
        shape_internalcall: { fg: '#00a6b2' attr: 'b' }
        shape_keyword: { fg: '#b200b2' attr: 'b' }
        shape_list: { fg: '#00a6b2' attr: 'b' }
        shape_literal: '#0000b2'
        shape_match_pattern: '#00a600'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#990000'
        shape_operator: '#999900'
        shape_or: { fg: '#b200b2' attr: 'b' }
        shape_pipe: { fg: '#b200b2' attr: 'b' }
        shape_range: { fg: '#999900' attr: 'b' }
        shape_raw_string: { fg: '#e5e5e5' attr: 'b' }
        shape_record: { fg: '#00a6b2' attr: 'b' }
        shape_redirection: { fg: '#b200b2' attr: 'b' }
        shape_signature: { fg: '#00a600' attr: 'b' }
        shape_string: '#00a600'
        shape_string_interpolation: { fg: '#00a6b2' attr: 'b' }
        shape_table: { fg: '#0000b2' attr: 'b' }
        shape_vardecl: { fg: '#0000b2' attr: 'u' }
        shape_variable: '#b200b2'

        foreground: '#00ff00'
        background: '#000000'
        cursor: '#00ff00'

        empty: '#0000b2'
        header: { fg: '#00a600' attr: 'b' }
        hints: '#666666'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00a600' attr: 'b' }
        search_result: { fg: '#990000' bg: '#bfbfbf' }
        separator: '#bfbfbf'
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