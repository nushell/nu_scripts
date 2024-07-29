# Retrieve the theme settings
export def main [] {
    return {
        binary: '#756b8a'
        block: '#46bddd'
        cell-path: '#c7dbdd'
        closure: '#3fb2b9'
        custom: '#d2faff'
        duration: '#fce380'
        float: '#fb6953'
        glob: '#d2faff'
        int: '#756b8a'
        list: '#3fb2b9'
        nothing: '#fb6953'
        range: '#fce380'
        record: '#3fb2b9'
        string: '#73d8ad'

        bool: {|| if $in { '#3fb2b9' } else { '#fce380' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fb6953' attr: 'b' }
            } else if $in < 6hr {
                '#fb6953'
            } else if $in < 1day {
                '#fce380'
            } else if $in < 3day {
                '#73d8ad'
            } else if $in < 1wk {
                { fg: '#73d8ad' attr: 'b' }
            } else if $in < 6wk {
                '#3fb2b9'
            } else if $in < 52wk {
                '#46bddd'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c7dbdd'
            } else if $e < 1mb {
                '#3fb2b9'
            } else {{ fg: '#46bddd' }}
        }

        shape_and: { fg: '#756b8a' attr: 'b' }
        shape_binary: { fg: '#756b8a' attr: 'b' }
        shape_block: { fg: '#46bddd' attr: 'b' }
        shape_bool: '#3fb2b9'
        shape_closure: { fg: '#3fb2b9' attr: 'b' }
        shape_custom: '#73d8ad'
        shape_datetime: { fg: '#3fb2b9' attr: 'b' }
        shape_directory: '#3fb2b9'
        shape_external: '#3fb2b9'
        shape_external_resolved: '#3fb2b9'
        shape_externalarg: { fg: '#73d8ad' attr: 'b' }
        shape_filepath: '#3fb2b9'
        shape_flag: { fg: '#46bddd' attr: 'b' }
        shape_float: { fg: '#fb6953' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3fb2b9' attr: 'b' }
        shape_globpattern: { fg: '#3fb2b9' attr: 'b' }
        shape_int: { fg: '#756b8a' attr: 'b' }
        shape_internalcall: { fg: '#3fb2b9' attr: 'b' }
        shape_keyword: { fg: '#756b8a' attr: 'b' }
        shape_list: { fg: '#3fb2b9' attr: 'b' }
        shape_literal: '#46bddd'
        shape_match_pattern: '#73d8ad'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fb6953'
        shape_operator: '#fce380'
        shape_or: { fg: '#756b8a' attr: 'b' }
        shape_pipe: { fg: '#756b8a' attr: 'b' }
        shape_range: { fg: '#fce380' attr: 'b' }
        shape_raw_string: { fg: '#d2faff' attr: 'b' }
        shape_record: { fg: '#3fb2b9' attr: 'b' }
        shape_redirection: { fg: '#756b8a' attr: 'b' }
        shape_signature: { fg: '#73d8ad' attr: 'b' }
        shape_string: '#73d8ad'
        shape_string_interpolation: { fg: '#3fb2b9' attr: 'b' }
        shape_table: { fg: '#46bddd' attr: 'b' }
        shape_vardecl: { fg: '#46bddd' attr: 'u' }
        shape_variable: '#756b8a'

        foreground: '#c7dbdd'
        background: '#0e3c46'
        cursor: '#c7dbdd'

        empty: '#46bddd'
        header: { fg: '#73d8ad' attr: 'b' }
        hints: '#587073'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#73d8ad' attr: 'b' }
        search_result: { fg: '#fb6953' bg: '#c7dbdd' }
        separator: '#c7dbdd'
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