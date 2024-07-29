# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bd0152'
        block: '#47f9f5'
        cell-path: '#5a496e'
        closure: '#c33678'
        custom: '#190134'
        duration: '#5ba2b6'
        float: '#27d9d5'
        glob: '#190134'
        int: '#bd0152'
        list: '#c33678'
        nothing: '#27d9d5'
        range: '#5ba2b6'
        record: '#c33678'
        string: '#f80059'

        bool: {|| if $in { '#c33678' } else { '#5ba2b6' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#27d9d5' attr: 'b' }
            } else if $in < 6hr {
                '#27d9d5'
            } else if $in < 1day {
                '#5ba2b6'
            } else if $in < 3day {
                '#f80059'
            } else if $in < 1wk {
                { fg: '#f80059' attr: 'b' }
            } else if $in < 6wk {
                '#c33678'
            } else if $in < 52wk {
                '#47f9f5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#5a496e'
            } else if $e < 1mb {
                '#c33678'
            } else {{ fg: '#47f9f5' }}
        }

        shape_and: { fg: '#bd0152' attr: 'b' }
        shape_binary: { fg: '#bd0152' attr: 'b' }
        shape_block: { fg: '#47f9f5' attr: 'b' }
        shape_bool: '#c33678'
        shape_closure: { fg: '#c33678' attr: 'b' }
        shape_custom: '#f80059'
        shape_datetime: { fg: '#c33678' attr: 'b' }
        shape_directory: '#c33678'
        shape_external: '#c33678'
        shape_external_resolved: '#c33678'
        shape_externalarg: { fg: '#f80059' attr: 'b' }
        shape_filepath: '#c33678'
        shape_flag: { fg: '#47f9f5' attr: 'b' }
        shape_float: { fg: '#27d9d5' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#c33678' attr: 'b' }
        shape_globpattern: { fg: '#c33678' attr: 'b' }
        shape_int: { fg: '#bd0152' attr: 'b' }
        shape_internalcall: { fg: '#c33678' attr: 'b' }
        shape_keyword: { fg: '#bd0152' attr: 'b' }
        shape_list: { fg: '#c33678' attr: 'b' }
        shape_literal: '#47f9f5'
        shape_match_pattern: '#f80059'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#27d9d5'
        shape_operator: '#5ba2b6'
        shape_or: { fg: '#bd0152' attr: 'b' }
        shape_pipe: { fg: '#bd0152' attr: 'b' }
        shape_range: { fg: '#5ba2b6' attr: 'b' }
        shape_raw_string: { fg: '#190134' attr: 'b' }
        shape_record: { fg: '#c33678' attr: 'b' }
        shape_redirection: { fg: '#bd0152' attr: 'b' }
        shape_signature: { fg: '#f80059' attr: 'b' }
        shape_string: '#f80059'
        shape_string_interpolation: { fg: '#c33678' attr: 'b' }
        shape_table: { fg: '#47f9f5' attr: 'b' }
        shape_vardecl: { fg: '#47f9f5' attr: 'u' }
        shape_variable: '#bd0152'

        foreground: '#5a496e'
        background: '#feffff'
        cursor: '#5a496e'

        empty: '#47f9f5'
        header: { fg: '#f80059' attr: 'b' }
        hints: '#9c92a8'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#f80059' attr: 'b' }
        search_result: { fg: '#27d9d5' bg: '#5a496e' }
        separator: '#5a496e'
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