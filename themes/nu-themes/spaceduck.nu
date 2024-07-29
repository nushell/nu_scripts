# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f2ce00'
        block: '#00a3cc'
        cell-path: '#686f9a'
        closure: '#7a5ccc'
        custom: '#f0f1ce'
        duration: '#b3a1e6'
        float: '#e33400'
        glob: '#f0f1ce'
        int: '#f2ce00'
        list: '#7a5ccc'
        nothing: '#e33400'
        range: '#b3a1e6'
        record: '#7a5ccc'
        string: '#5ccc96'

        bool: {|| if $in { '#7a5ccc' } else { '#b3a1e6' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e33400' attr: 'b' }
            } else if $in < 6hr {
                '#e33400'
            } else if $in < 1day {
                '#b3a1e6'
            } else if $in < 3day {
                '#5ccc96'
            } else if $in < 1wk {
                { fg: '#5ccc96' attr: 'b' }
            } else if $in < 6wk {
                '#7a5ccc'
            } else if $in < 52wk {
                '#00a3cc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#686f9a'
            } else if $e < 1mb {
                '#7a5ccc'
            } else {{ fg: '#00a3cc' }}
        }

        shape_and: { fg: '#f2ce00' attr: 'b' }
        shape_binary: { fg: '#f2ce00' attr: 'b' }
        shape_block: { fg: '#00a3cc' attr: 'b' }
        shape_bool: '#7a5ccc'
        shape_closure: { fg: '#7a5ccc' attr: 'b' }
        shape_custom: '#5ccc96'
        shape_datetime: { fg: '#7a5ccc' attr: 'b' }
        shape_directory: '#7a5ccc'
        shape_external: '#7a5ccc'
        shape_external_resolved: '#7a5ccc'
        shape_externalarg: { fg: '#5ccc96' attr: 'b' }
        shape_filepath: '#7a5ccc'
        shape_flag: { fg: '#00a3cc' attr: 'b' }
        shape_float: { fg: '#e33400' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#7a5ccc' attr: 'b' }
        shape_globpattern: { fg: '#7a5ccc' attr: 'b' }
        shape_int: { fg: '#f2ce00' attr: 'b' }
        shape_internalcall: { fg: '#7a5ccc' attr: 'b' }
        shape_keyword: { fg: '#f2ce00' attr: 'b' }
        shape_list: { fg: '#7a5ccc' attr: 'b' }
        shape_literal: '#00a3cc'
        shape_match_pattern: '#5ccc96'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e33400'
        shape_operator: '#b3a1e6'
        shape_or: { fg: '#f2ce00' attr: 'b' }
        shape_pipe: { fg: '#f2ce00' attr: 'b' }
        shape_range: { fg: '#b3a1e6' attr: 'b' }
        shape_raw_string: { fg: '#f0f1ce' attr: 'b' }
        shape_record: { fg: '#7a5ccc' attr: 'b' }
        shape_redirection: { fg: '#f2ce00' attr: 'b' }
        shape_signature: { fg: '#5ccc96' attr: 'b' }
        shape_string: '#5ccc96'
        shape_string_interpolation: { fg: '#7a5ccc' attr: 'b' }
        shape_table: { fg: '#00a3cc' attr: 'b' }
        shape_vardecl: { fg: '#00a3cc' attr: 'u' }
        shape_variable: '#f2ce00'

        foreground: '#ecf0c1'
        background: '#0f111b'
        cursor: '#ecf0c1'

        empty: '#00a3cc'
        header: { fg: '#5ccc96' attr: 'b' }
        hints: '#686f9a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#5ccc96' attr: 'b' }
        search_result: { fg: '#e33400' bg: '#686f9a' }
        separator: '#686f9a'
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