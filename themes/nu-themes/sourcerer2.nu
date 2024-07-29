# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8f6f8f'
        block: '#6688aa'
        cell-path: '#d3d3d3'
        closure: '#528b8b'
        custom: '#c1cdc1'
        duration: '#ff9800'
        float: '#ff6a6a'
        glob: '#c1cdc1'
        int: '#8f6f8f'
        list: '#528b8b'
        nothing: '#aa4450'
        range: '#ff9800'
        record: '#528b8b'
        string: '#719611'

        bool: {|| if $in { '#87ceeb' } else { '#ff9800' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#aa4450' attr: 'b' }
            } else if $in < 6hr {
                '#aa4450'
            } else if $in < 1day {
                '#ff9800'
            } else if $in < 3day {
                '#719611'
            } else if $in < 1wk {
                { fg: '#719611' attr: 'b' }
            } else if $in < 6wk {
                '#528b8b'
            } else if $in < 52wk {
                '#6688aa'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d3d3d3'
            } else if $e < 1mb {
                '#528b8b'
            } else {{ fg: '#6688aa' }}
        }

        shape_and: { fg: '#8f6f8f' attr: 'b' }
        shape_binary: { fg: '#8f6f8f' attr: 'b' }
        shape_block: { fg: '#6688aa' attr: 'b' }
        shape_bool: '#87ceeb'
        shape_closure: { fg: '#528b8b' attr: 'b' }
        shape_custom: '#719611'
        shape_datetime: { fg: '#528b8b' attr: 'b' }
        shape_directory: '#528b8b'
        shape_external: '#528b8b'
        shape_external_resolved: '#87ceeb'
        shape_externalarg: { fg: '#719611' attr: 'b' }
        shape_filepath: '#528b8b'
        shape_flag: { fg: '#6688aa' attr: 'b' }
        shape_float: { fg: '#ff6a6a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#528b8b' attr: 'b' }
        shape_globpattern: { fg: '#528b8b' attr: 'b' }
        shape_int: { fg: '#8f6f8f' attr: 'b' }
        shape_internalcall: { fg: '#528b8b' attr: 'b' }
        shape_keyword: { fg: '#8f6f8f' attr: 'b' }
        shape_list: { fg: '#528b8b' attr: 'b' }
        shape_literal: '#6688aa'
        shape_match_pattern: '#719611'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#aa4450'
        shape_operator: '#ff9800'
        shape_or: { fg: '#8f6f8f' attr: 'b' }
        shape_pipe: { fg: '#8f6f8f' attr: 'b' }
        shape_range: { fg: '#ff9800' attr: 'b' }
        shape_raw_string: { fg: '#c1cdc1' attr: 'b' }
        shape_record: { fg: '#528b8b' attr: 'b' }
        shape_redirection: { fg: '#8f6f8f' attr: 'b' }
        shape_signature: { fg: '#719611' attr: 'b' }
        shape_string: '#719611'
        shape_string_interpolation: { fg: '#528b8b' attr: 'b' }
        shape_table: { fg: '#6688aa' attr: 'b' }
        shape_vardecl: { fg: '#6688aa' attr: 'u' }
        shape_variable: '#8f6f8f'

        foreground: '#c2c2b0'
        background: '#222222'
        cursor: '#c2c2b0'

        empty: '#6688aa'
        header: { fg: '#719611' attr: 'b' }
        hints: '#181818'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#719611' attr: 'b' }
        search_result: { fg: '#aa4450' bg: '#d3d3d3' }
        separator: '#d3d3d3'
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