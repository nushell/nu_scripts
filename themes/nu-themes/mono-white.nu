# Retrieve the theme settings
export def main [] {
    return {
        binary: '#fafafa'
        block: '#fafafa'
        cell-path: '#fafafa'
        closure: '#fafafa'
        custom: '#fafafa'
        duration: '#fafafa'
        float: '#fafafa'
        glob: '#fafafa'
        int: '#fafafa'
        list: '#fafafa'
        nothing: '#fafafa'
        range: '#fafafa'
        record: '#fafafa'
        string: '#fafafa'

        bool: {|| if $in { '#fafafa' } else { '#fafafa' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fafafa' attr: 'b' }
            } else if $in < 6hr {
                '#fafafa'
            } else if $in < 1day {
                '#fafafa'
            } else if $in < 3day {
                '#fafafa'
            } else if $in < 1wk {
                { fg: '#fafafa' attr: 'b' }
            } else if $in < 6wk {
                '#fafafa'
            } else if $in < 52wk {
                '#fafafa'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#fafafa'
            } else if $e < 1mb {
                '#fafafa'
            } else {{ fg: '#fafafa' }}
        }

        shape_and: { fg: '#fafafa' attr: 'b' }
        shape_binary: { fg: '#fafafa' attr: 'b' }
        shape_block: { fg: '#fafafa' attr: 'b' }
        shape_bool: '#fafafa'
        shape_closure: { fg: '#fafafa' attr: 'b' }
        shape_custom: '#fafafa'
        shape_datetime: { fg: '#fafafa' attr: 'b' }
        shape_directory: '#fafafa'
        shape_external: '#fafafa'
        shape_external_resolved: '#fafafa'
        shape_externalarg: { fg: '#fafafa' attr: 'b' }
        shape_filepath: '#fafafa'
        shape_flag: { fg: '#fafafa' attr: 'b' }
        shape_float: { fg: '#fafafa' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#fafafa' attr: 'b' }
        shape_globpattern: { fg: '#fafafa' attr: 'b' }
        shape_int: { fg: '#fafafa' attr: 'b' }
        shape_internalcall: { fg: '#fafafa' attr: 'b' }
        shape_keyword: { fg: '#fafafa' attr: 'b' }
        shape_list: { fg: '#fafafa' attr: 'b' }
        shape_literal: '#fafafa'
        shape_match_pattern: '#fafafa'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fafafa'
        shape_operator: '#fafafa'
        shape_or: { fg: '#fafafa' attr: 'b' }
        shape_pipe: { fg: '#fafafa' attr: 'b' }
        shape_range: { fg: '#fafafa' attr: 'b' }
        shape_raw_string: { fg: '#fafafa' attr: 'b' }
        shape_record: { fg: '#fafafa' attr: 'b' }
        shape_redirection: { fg: '#fafafa' attr: 'b' }
        shape_signature: { fg: '#fafafa' attr: 'b' }
        shape_string: '#fafafa'
        shape_string_interpolation: { fg: '#fafafa' attr: 'b' }
        shape_table: { fg: '#fafafa' attr: 'b' }
        shape_vardecl: { fg: '#fafafa' attr: 'u' }
        shape_variable: '#fafafa'

        foreground: '#fafafa'
        background: '#262626'
        cursor: '#fafafa'

        empty: '#fafafa'
        header: { fg: '#fafafa' attr: 'b' }
        hints: '#fafafa'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#fafafa' attr: 'b' }
        search_result: { fg: '#fafafa' bg: '#fafafa' }
        separator: '#fafafa'
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