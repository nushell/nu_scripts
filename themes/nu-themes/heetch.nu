# Retrieve the theme settings
export def main [] {
    return {
        binary: '#82034c'
        block: '#bd0152'
        cell-path: '#bdb6c5'
        closure: '#f80059'
        custom: '#feffff'
        duration: '#8f6c97'
        float: '#27d9d5'
        glob: '#feffff'
        int: '#82034c'
        list: '#f80059'
        nothing: '#27d9d5'
        range: '#8f6c97'
        record: '#f80059'
        string: '#c33678'

        bool: {|| if $in { '#f80059' } else { '#8f6c97' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#27d9d5' attr: 'b' }
            } else if $in < 6hr {
                '#27d9d5'
            } else if $in < 1day {
                '#8f6c97'
            } else if $in < 3day {
                '#c33678'
            } else if $in < 1wk {
                { fg: '#c33678' attr: 'b' }
            } else if $in < 6wk {
                '#f80059'
            } else if $in < 52wk {
                '#bd0152'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bdb6c5'
            } else if $e < 1mb {
                '#f80059'
            } else {{ fg: '#bd0152' }}
        }

        shape_and: { fg: '#82034c' attr: 'b' }
        shape_binary: { fg: '#82034c' attr: 'b' }
        shape_block: { fg: '#bd0152' attr: 'b' }
        shape_bool: '#f80059'
        shape_closure: { fg: '#f80059' attr: 'b' }
        shape_custom: '#c33678'
        shape_datetime: { fg: '#f80059' attr: 'b' }
        shape_directory: '#f80059'
        shape_external: '#f80059'
        shape_external_resolved: '#f80059'
        shape_externalarg: { fg: '#c33678' attr: 'b' }
        shape_filepath: '#f80059'
        shape_flag: { fg: '#bd0152' attr: 'b' }
        shape_float: { fg: '#27d9d5' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#f80059' attr: 'b' }
        shape_globpattern: { fg: '#f80059' attr: 'b' }
        shape_int: { fg: '#82034c' attr: 'b' }
        shape_internalcall: { fg: '#f80059' attr: 'b' }
        shape_keyword: { fg: '#82034c' attr: 'b' }
        shape_list: { fg: '#f80059' attr: 'b' }
        shape_literal: '#bd0152'
        shape_match_pattern: '#c33678'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#27d9d5'
        shape_operator: '#8f6c97'
        shape_or: { fg: '#82034c' attr: 'b' }
        shape_pipe: { fg: '#82034c' attr: 'b' }
        shape_range: { fg: '#8f6c97' attr: 'b' }
        shape_raw_string: { fg: '#feffff' attr: 'b' }
        shape_record: { fg: '#f80059' attr: 'b' }
        shape_redirection: { fg: '#82034c' attr: 'b' }
        shape_signature: { fg: '#c33678' attr: 'b' }
        shape_string: '#c33678'
        shape_string_interpolation: { fg: '#f80059' attr: 'b' }
        shape_table: { fg: '#bd0152' attr: 'b' }
        shape_vardecl: { fg: '#bd0152' attr: 'u' }
        shape_variable: '#82034c'

        foreground: '#bdb6c5'
        background: '#190134'
        cursor: '#bdb6c5'

        empty: '#bd0152'
        header: { fg: '#c33678' attr: 'b' }
        hints: '#7b6d8b'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#c33678' attr: 'b' }
        search_result: { fg: '#27d9d5' bg: '#bdb6c5' }
        separator: '#bdb6c5'
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