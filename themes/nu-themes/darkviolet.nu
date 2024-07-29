# Retrieve the theme settings
export def main [] {
    return {
        binary: '#7e5ce6'
        block: '#4136d9'
        cell-path: '#b08ae6'
        closure: '#40dfff'
        custom: '#a366ff'
        duration: '#f29df2'
        float: '#a82ee6'
        glob: '#a366ff'
        int: '#7e5ce6'
        list: '#40dfff'
        nothing: '#a82ee6'
        range: '#f29df2'
        record: '#40dfff'
        string: '#4595e6'

        bool: {|| if $in { '#40dfff' } else { '#f29df2' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a82ee6' attr: 'b' }
            } else if $in < 6hr {
                '#a82ee6'
            } else if $in < 1day {
                '#f29df2'
            } else if $in < 3day {
                '#4595e6'
            } else if $in < 1wk {
                { fg: '#4595e6' attr: 'b' }
            } else if $in < 6wk {
                '#40dfff'
            } else if $in < 52wk {
                '#4136d9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b08ae6'
            } else if $e < 1mb {
                '#40dfff'
            } else {{ fg: '#4136d9' }}
        }

        shape_and: { fg: '#7e5ce6' attr: 'b' }
        shape_binary: { fg: '#7e5ce6' attr: 'b' }
        shape_block: { fg: '#4136d9' attr: 'b' }
        shape_bool: '#40dfff'
        shape_closure: { fg: '#40dfff' attr: 'b' }
        shape_custom: '#4595e6'
        shape_datetime: { fg: '#40dfff' attr: 'b' }
        shape_directory: '#40dfff'
        shape_external: '#40dfff'
        shape_external_resolved: '#40dfff'
        shape_externalarg: { fg: '#4595e6' attr: 'b' }
        shape_filepath: '#40dfff'
        shape_flag: { fg: '#4136d9' attr: 'b' }
        shape_float: { fg: '#a82ee6' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#40dfff' attr: 'b' }
        shape_globpattern: { fg: '#40dfff' attr: 'b' }
        shape_int: { fg: '#7e5ce6' attr: 'b' }
        shape_internalcall: { fg: '#40dfff' attr: 'b' }
        shape_keyword: { fg: '#7e5ce6' attr: 'b' }
        shape_list: { fg: '#40dfff' attr: 'b' }
        shape_literal: '#4136d9'
        shape_match_pattern: '#4595e6'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a82ee6'
        shape_operator: '#f29df2'
        shape_or: { fg: '#7e5ce6' attr: 'b' }
        shape_pipe: { fg: '#7e5ce6' attr: 'b' }
        shape_range: { fg: '#f29df2' attr: 'b' }
        shape_raw_string: { fg: '#a366ff' attr: 'b' }
        shape_record: { fg: '#40dfff' attr: 'b' }
        shape_redirection: { fg: '#7e5ce6' attr: 'b' }
        shape_signature: { fg: '#4595e6' attr: 'b' }
        shape_string: '#4595e6'
        shape_string_interpolation: { fg: '#40dfff' attr: 'b' }
        shape_table: { fg: '#4136d9' attr: 'b' }
        shape_vardecl: { fg: '#4136d9' attr: 'u' }
        shape_variable: '#7e5ce6'

        foreground: '#b08ae6'
        background: '#000000'
        cursor: '#b08ae6'

        empty: '#4136d9'
        header: { fg: '#4595e6' attr: 'b' }
        hints: '#593380'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#4595e6' attr: 'b' }
        search_result: { fg: '#a82ee6' bg: '#b08ae6' }
        separator: '#b08ae6'
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