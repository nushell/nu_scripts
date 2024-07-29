# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8b3f96'
        block: '#40318d'
        cell-path: '#ffffff'
        closure: '#67b6bd'
        custom: '#f7f7f7'
        duration: '#bfce72'
        float: '#883932'
        glob: '#f7f7f7'
        int: '#8b3f96'
        list: '#67b6bd'
        nothing: '#883932'
        range: '#bfce72'
        record: '#67b6bd'
        string: '#55a049'

        bool: {|| if $in { '#67b6bd' } else { '#bfce72' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#883932' attr: 'b' }
            } else if $in < 6hr {
                '#883932'
            } else if $in < 1day {
                '#bfce72'
            } else if $in < 3day {
                '#55a049'
            } else if $in < 1wk {
                { fg: '#55a049' attr: 'b' }
            } else if $in < 6wk {
                '#67b6bd'
            } else if $in < 52wk {
                '#40318d'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#67b6bd'
            } else {{ fg: '#40318d' }}
        }

        shape_and: { fg: '#8b3f96' attr: 'b' }
        shape_binary: { fg: '#8b3f96' attr: 'b' }
        shape_block: { fg: '#40318d' attr: 'b' }
        shape_bool: '#67b6bd'
        shape_closure: { fg: '#67b6bd' attr: 'b' }
        shape_custom: '#55a049'
        shape_datetime: { fg: '#67b6bd' attr: 'b' }
        shape_directory: '#67b6bd'
        shape_external: '#67b6bd'
        shape_external_resolved: '#67b6bd'
        shape_externalarg: { fg: '#55a049' attr: 'b' }
        shape_filepath: '#67b6bd'
        shape_flag: { fg: '#40318d' attr: 'b' }
        shape_float: { fg: '#883932' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#67b6bd' attr: 'b' }
        shape_globpattern: { fg: '#67b6bd' attr: 'b' }
        shape_int: { fg: '#8b3f96' attr: 'b' }
        shape_internalcall: { fg: '#67b6bd' attr: 'b' }
        shape_keyword: { fg: '#8b3f96' attr: 'b' }
        shape_list: { fg: '#67b6bd' attr: 'b' }
        shape_literal: '#40318d'
        shape_match_pattern: '#55a049'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#883932'
        shape_operator: '#bfce72'
        shape_or: { fg: '#8b3f96' attr: 'b' }
        shape_pipe: { fg: '#8b3f96' attr: 'b' }
        shape_range: { fg: '#bfce72' attr: 'b' }
        shape_raw_string: { fg: '#f7f7f7' attr: 'b' }
        shape_record: { fg: '#67b6bd' attr: 'b' }
        shape_redirection: { fg: '#8b3f96' attr: 'b' }
        shape_signature: { fg: '#55a049' attr: 'b' }
        shape_string: '#55a049'
        shape_string_interpolation: { fg: '#67b6bd' attr: 'b' }
        shape_table: { fg: '#40318d' attr: 'b' }
        shape_vardecl: { fg: '#40318d' attr: 'u' }
        shape_variable: '#8b3f96'

        foreground: '#7869c4'
        background: '#40318d'
        cursor: '#7869c4'

        empty: '#40318d'
        header: { fg: '#55a049' attr: 'b' }
        hints: '#000000'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#55a049' attr: 'b' }
        search_result: { fg: '#883932' bg: '#ffffff' }
        separator: '#ffffff'
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