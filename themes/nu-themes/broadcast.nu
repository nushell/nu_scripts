# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d0d0ff'
        block: '#6d9cbe'
        cell-path: '#ffffff'
        closure: '#6e9cbe'
        custom: '#ffffff'
        duration: '#ffd24a'
        float: '#ff7b6b'
        glob: '#ffffff'
        int: '#d0d0ff'
        list: '#6e9cbe'
        nothing: '#da4939'
        range: '#ffd24a'
        record: '#6e9cbe'
        string: '#519f50'

        bool: {|| if $in { '#a0cef0' } else { '#ffd24a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#da4939' attr: 'b' }
            } else if $in < 6hr {
                '#da4939'
            } else if $in < 1day {
                '#ffd24a'
            } else if $in < 3day {
                '#519f50'
            } else if $in < 1wk {
                { fg: '#519f50' attr: 'b' }
            } else if $in < 6wk {
                '#6e9cbe'
            } else if $in < 52wk {
                '#6d9cbe'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#6e9cbe'
            } else {{ fg: '#6d9cbe' }}
        }

        shape_and: { fg: '#d0d0ff' attr: 'b' }
        shape_binary: { fg: '#d0d0ff' attr: 'b' }
        shape_block: { fg: '#6d9cbe' attr: 'b' }
        shape_bool: '#a0cef0'
        shape_closure: { fg: '#6e9cbe' attr: 'b' }
        shape_custom: '#519f50'
        shape_datetime: { fg: '#6e9cbe' attr: 'b' }
        shape_directory: '#6e9cbe'
        shape_external: '#6e9cbe'
        shape_external_resolved: '#a0cef0'
        shape_externalarg: { fg: '#519f50' attr: 'b' }
        shape_filepath: '#6e9cbe'
        shape_flag: { fg: '#6d9cbe' attr: 'b' }
        shape_float: { fg: '#ff7b6b' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#6e9cbe' attr: 'b' }
        shape_globpattern: { fg: '#6e9cbe' attr: 'b' }
        shape_int: { fg: '#d0d0ff' attr: 'b' }
        shape_internalcall: { fg: '#6e9cbe' attr: 'b' }
        shape_keyword: { fg: '#d0d0ff' attr: 'b' }
        shape_list: { fg: '#6e9cbe' attr: 'b' }
        shape_literal: '#6d9cbe'
        shape_match_pattern: '#519f50'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#da4939'
        shape_operator: '#ffd24a'
        shape_or: { fg: '#d0d0ff' attr: 'b' }
        shape_pipe: { fg: '#d0d0ff' attr: 'b' }
        shape_range: { fg: '#ffd24a' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#6e9cbe' attr: 'b' }
        shape_redirection: { fg: '#d0d0ff' attr: 'b' }
        shape_signature: { fg: '#519f50' attr: 'b' }
        shape_string: '#519f50'
        shape_string_interpolation: { fg: '#6e9cbe' attr: 'b' }
        shape_table: { fg: '#6d9cbe' attr: 'b' }
        shape_vardecl: { fg: '#6d9cbe' attr: 'u' }
        shape_variable: '#d0d0ff'

        foreground: '#e6e1dc'
        background: '#2b2b2b'
        cursor: '#e6e1dc'

        empty: '#6d9cbe'
        header: { fg: '#519f50' attr: 'b' }
        hints: '#323232'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#519f50' attr: 'b' }
        search_result: { fg: '#da4939' bg: '#ffffff' }
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