# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b6b3eb'
        block: '#6d9cbe'
        cell-path: '#e6e1dc'
        closure: '#519f50'
        custom: '#f9f7f3'
        duration: '#ffc66d'
        float: '#da4939'
        glob: '#f9f7f3'
        int: '#b6b3eb'
        list: '#519f50'
        nothing: '#da4939'
        range: '#ffc66d'
        record: '#519f50'
        string: '#a5c261'

        bool: {|| if $in { '#519f50' } else { '#ffc66d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#da4939' attr: 'b' }
            } else if $in < 6hr {
                '#da4939'
            } else if $in < 1day {
                '#ffc66d'
            } else if $in < 3day {
                '#a5c261'
            } else if $in < 1wk {
                { fg: '#a5c261' attr: 'b' }
            } else if $in < 6wk {
                '#519f50'
            } else if $in < 52wk {
                '#6d9cbe'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e6e1dc'
            } else if $e < 1mb {
                '#519f50'
            } else {{ fg: '#6d9cbe' }}
        }

        shape_and: { fg: '#b6b3eb' attr: 'b' }
        shape_binary: { fg: '#b6b3eb' attr: 'b' }
        shape_block: { fg: '#6d9cbe' attr: 'b' }
        shape_bool: '#519f50'
        shape_closure: { fg: '#519f50' attr: 'b' }
        shape_custom: '#a5c261'
        shape_datetime: { fg: '#519f50' attr: 'b' }
        shape_directory: '#519f50'
        shape_external: '#519f50'
        shape_external_resolved: '#519f50'
        shape_externalarg: { fg: '#a5c261' attr: 'b' }
        shape_filepath: '#519f50'
        shape_flag: { fg: '#6d9cbe' attr: 'b' }
        shape_float: { fg: '#da4939' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#519f50' attr: 'b' }
        shape_globpattern: { fg: '#519f50' attr: 'b' }
        shape_int: { fg: '#b6b3eb' attr: 'b' }
        shape_internalcall: { fg: '#519f50' attr: 'b' }
        shape_keyword: { fg: '#b6b3eb' attr: 'b' }
        shape_list: { fg: '#519f50' attr: 'b' }
        shape_literal: '#6d9cbe'
        shape_match_pattern: '#a5c261'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#da4939'
        shape_operator: '#ffc66d'
        shape_or: { fg: '#b6b3eb' attr: 'b' }
        shape_pipe: { fg: '#b6b3eb' attr: 'b' }
        shape_range: { fg: '#ffc66d' attr: 'b' }
        shape_raw_string: { fg: '#f9f7f3' attr: 'b' }
        shape_record: { fg: '#519f50' attr: 'b' }
        shape_redirection: { fg: '#b6b3eb' attr: 'b' }
        shape_signature: { fg: '#a5c261' attr: 'b' }
        shape_string: '#a5c261'
        shape_string_interpolation: { fg: '#519f50' attr: 'b' }
        shape_table: { fg: '#6d9cbe' attr: 'b' }
        shape_vardecl: { fg: '#6d9cbe' attr: 'u' }
        shape_variable: '#b6b3eb'

        foreground: '#e6e1dc'
        background: '#2b2b2b'
        cursor: '#e6e1dc'

        empty: '#6d9cbe'
        header: { fg: '#a5c261' attr: 'b' }
        hints: '#5a647e'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a5c261' attr: 'b' }
        search_result: { fg: '#da4939' bg: '#e6e1dc' }
        separator: '#e6e1dc'
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