# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a31db1'
        block: '#4f97d7'
        cell-path: '#a3a3a3'
        closure: '#2d9574'
        custom: '#f8f8f8'
        duration: '#b1951d'
        float: '#f2241f'
        glob: '#f8f8f8'
        int: '#a31db1'
        list: '#2d9574'
        nothing: '#f2241f'
        range: '#b1951d'
        record: '#2d9574'
        string: '#67b11d'

        bool: {|| if $in { '#2d9574' } else { '#b1951d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f2241f' attr: 'b' }
            } else if $in < 6hr {
                '#f2241f'
            } else if $in < 1day {
                '#b1951d'
            } else if $in < 3day {
                '#67b11d'
            } else if $in < 1wk {
                { fg: '#67b11d' attr: 'b' }
            } else if $in < 6wk {
                '#2d9574'
            } else if $in < 52wk {
                '#4f97d7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a3a3a3'
            } else if $e < 1mb {
                '#2d9574'
            } else {{ fg: '#4f97d7' }}
        }

        shape_and: { fg: '#a31db1' attr: 'b' }
        shape_binary: { fg: '#a31db1' attr: 'b' }
        shape_block: { fg: '#4f97d7' attr: 'b' }
        shape_bool: '#2d9574'
        shape_closure: { fg: '#2d9574' attr: 'b' }
        shape_custom: '#67b11d'
        shape_datetime: { fg: '#2d9574' attr: 'b' }
        shape_directory: '#2d9574'
        shape_external: '#2d9574'
        shape_external_resolved: '#2d9574'
        shape_externalarg: { fg: '#67b11d' attr: 'b' }
        shape_filepath: '#2d9574'
        shape_flag: { fg: '#4f97d7' attr: 'b' }
        shape_float: { fg: '#f2241f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#2d9574' attr: 'b' }
        shape_globpattern: { fg: '#2d9574' attr: 'b' }
        shape_int: { fg: '#a31db1' attr: 'b' }
        shape_internalcall: { fg: '#2d9574' attr: 'b' }
        shape_keyword: { fg: '#a31db1' attr: 'b' }
        shape_list: { fg: '#2d9574' attr: 'b' }
        shape_literal: '#4f97d7'
        shape_match_pattern: '#67b11d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f2241f'
        shape_operator: '#b1951d'
        shape_or: { fg: '#a31db1' attr: 'b' }
        shape_pipe: { fg: '#a31db1' attr: 'b' }
        shape_range: { fg: '#b1951d' attr: 'b' }
        shape_raw_string: { fg: '#f8f8f8' attr: 'b' }
        shape_record: { fg: '#2d9574' attr: 'b' }
        shape_redirection: { fg: '#a31db1' attr: 'b' }
        shape_signature: { fg: '#67b11d' attr: 'b' }
        shape_string: '#67b11d'
        shape_string_interpolation: { fg: '#2d9574' attr: 'b' }
        shape_table: { fg: '#4f97d7' attr: 'b' }
        shape_vardecl: { fg: '#4f97d7' attr: 'u' }
        shape_variable: '#a31db1'

        foreground: '#a3a3a3'
        background: '#1f2022'
        cursor: '#a3a3a3'

        empty: '#4f97d7'
        header: { fg: '#67b11d' attr: 'b' }
        hints: '#585858'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#67b11d' attr: 'b' }
        search_result: { fg: '#f2241f' bg: '#a3a3a3' }
        separator: '#a3a3a3'
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