# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e35b00'
        block: '#0f548b'
        cell-path: '#f0f1ce'
        closure: '#06afc7'
        custom: '#fefff1'
        duration: '#e3cd7b'
        float: '#ff8a3a'
        glob: '#fefff1'
        int: '#e35b00'
        list: '#06afc7'
        nothing: '#e35b00'
        range: '#e3cd7b'
        record: '#06afc7'
        string: '#5cab96'

        bool: {|| if $in { '#83a7b4' } else { '#e3cd7b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e35b00' attr: 'b' }
            } else if $in < 6hr {
                '#e35b00'
            } else if $in < 1day {
                '#e3cd7b'
            } else if $in < 3day {
                '#5cab96'
            } else if $in < 1wk {
                { fg: '#5cab96' attr: 'b' }
            } else if $in < 6wk {
                '#06afc7'
            } else if $in < 52wk {
                '#0f548b'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f0f1ce'
            } else if $e < 1mb {
                '#06afc7'
            } else {{ fg: '#0f548b' }}
        }

        shape_and: { fg: '#e35b00' attr: 'b' }
        shape_binary: { fg: '#e35b00' attr: 'b' }
        shape_block: { fg: '#0f548b' attr: 'b' }
        shape_bool: '#83a7b4'
        shape_closure: { fg: '#06afc7' attr: 'b' }
        shape_custom: '#5cab96'
        shape_datetime: { fg: '#06afc7' attr: 'b' }
        shape_directory: '#06afc7'
        shape_external: '#06afc7'
        shape_external_resolved: '#83a7b4'
        shape_externalarg: { fg: '#5cab96' attr: 'b' }
        shape_filepath: '#06afc7'
        shape_flag: { fg: '#0f548b' attr: 'b' }
        shape_float: { fg: '#ff8a3a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#06afc7' attr: 'b' }
        shape_globpattern: { fg: '#06afc7' attr: 'b' }
        shape_int: { fg: '#e35b00' attr: 'b' }
        shape_internalcall: { fg: '#06afc7' attr: 'b' }
        shape_keyword: { fg: '#e35b00' attr: 'b' }
        shape_list: { fg: '#06afc7' attr: 'b' }
        shape_literal: '#0f548b'
        shape_match_pattern: '#5cab96'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e35b00'
        shape_operator: '#e3cd7b'
        shape_or: { fg: '#e35b00' attr: 'b' }
        shape_pipe: { fg: '#e35b00' attr: 'b' }
        shape_range: { fg: '#e3cd7b' attr: 'b' }
        shape_raw_string: { fg: '#fefff1' attr: 'b' }
        shape_record: { fg: '#06afc7' attr: 'b' }
        shape_redirection: { fg: '#e35b00' attr: 'b' }
        shape_signature: { fg: '#5cab96' attr: 'b' }
        shape_string: '#5cab96'
        shape_string_interpolation: { fg: '#06afc7' attr: 'b' }
        shape_table: { fg: '#0f548b' attr: 'b' }
        shape_vardecl: { fg: '#0f548b' attr: 'u' }
        shape_variable: '#e35b00'

        foreground: '#ecf0c1'
        background: '#0a1e24'
        cursor: '#ecf0c1'

        empty: '#0f548b'
        header: { fg: '#5cab96' attr: 'b' }
        hints: '#684c31'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#5cab96' attr: 'b' }
        search_result: { fg: '#e35b00' bg: '#f0f1ce' }
        separator: '#f0f1ce'
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