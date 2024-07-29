# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff0087'
        block: '#d08010'
        cell-path: '#bbbbbb'
        closure: '#d0a843'
        custom: '#ffffff'
        duration: '#60d4df'
        float: '#9d66f6'
        glob: '#ffffff'
        int: '#ff0087'
        list: '#d0a843'
        nothing: '#7325fa'
        range: '#60d4df'
        record: '#d0a843'
        string: '#23e298'

        bool: {|| if $in { '#ffce51' } else { '#60d4df' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#7325fa' attr: 'b' }
            } else if $in < 6hr {
                '#7325fa'
            } else if $in < 1day {
                '#60d4df'
            } else if $in < 3day {
                '#23e298'
            } else if $in < 1wk {
                { fg: '#23e298' attr: 'b' }
            } else if $in < 6wk {
                '#d0a843'
            } else if $in < 52wk {
                '#d08010'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#d0a843'
            } else {{ fg: '#d08010' }}
        }

        shape_and: { fg: '#ff0087' attr: 'b' }
        shape_binary: { fg: '#ff0087' attr: 'b' }
        shape_block: { fg: '#d08010' attr: 'b' }
        shape_bool: '#ffce51'
        shape_closure: { fg: '#d0a843' attr: 'b' }
        shape_custom: '#23e298'
        shape_datetime: { fg: '#d0a843' attr: 'b' }
        shape_directory: '#d0a843'
        shape_external: '#d0a843'
        shape_external_resolved: '#ffce51'
        shape_externalarg: { fg: '#23e298' attr: 'b' }
        shape_filepath: '#d0a843'
        shape_flag: { fg: '#d08010' attr: 'b' }
        shape_float: { fg: '#9d66f6' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#d0a843' attr: 'b' }
        shape_globpattern: { fg: '#d0a843' attr: 'b' }
        shape_int: { fg: '#ff0087' attr: 'b' }
        shape_internalcall: { fg: '#d0a843' attr: 'b' }
        shape_keyword: { fg: '#ff0087' attr: 'b' }
        shape_list: { fg: '#d0a843' attr: 'b' }
        shape_literal: '#d08010'
        shape_match_pattern: '#23e298'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#7325fa'
        shape_operator: '#60d4df'
        shape_or: { fg: '#ff0087' attr: 'b' }
        shape_pipe: { fg: '#ff0087' attr: 'b' }
        shape_range: { fg: '#60d4df' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#d0a843' attr: 'b' }
        shape_redirection: { fg: '#ff0087' attr: 'b' }
        shape_signature: { fg: '#23e298' attr: 'b' }
        shape_string: '#23e298'
        shape_string_interpolation: { fg: '#d0a843' attr: 'b' }
        shape_table: { fg: '#d08010' attr: 'b' }
        shape_vardecl: { fg: '#d08010' attr: 'u' }
        shape_variable: '#ff0087'

        foreground: '#bbbbbb'
        background: '#1b1d1e'
        cursor: '#bbbbbb'

        empty: '#d08010'
        header: { fg: '#23e298' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#23e298' attr: 'b' }
        search_result: { fg: '#7325fa' bg: '#bbbbbb' }
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