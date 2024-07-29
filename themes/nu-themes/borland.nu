# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff73fd'
        block: '#96cbfe'
        cell-path: '#eeeeee'
        closure: '#c6c5fe'
        custom: '#ffffff'
        duration: '#ffffb6'
        float: '#ffb6b0'
        glob: '#ffffff'
        int: '#ff73fd'
        list: '#c6c5fe'
        nothing: '#ff6c60'
        range: '#ffffb6'
        record: '#c6c5fe'
        string: '#a8ff60'

        bool: {|| if $in { '#dfdffe' } else { '#ffffb6' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff6c60' attr: 'b' }
            } else if $in < 6hr {
                '#ff6c60'
            } else if $in < 1day {
                '#ffffb6'
            } else if $in < 3day {
                '#a8ff60'
            } else if $in < 1wk {
                { fg: '#a8ff60' attr: 'b' }
            } else if $in < 6wk {
                '#c6c5fe'
            } else if $in < 52wk {
                '#96cbfe'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#eeeeee'
            } else if $e < 1mb {
                '#c6c5fe'
            } else {{ fg: '#96cbfe' }}
        }

        shape_and: { fg: '#ff73fd' attr: 'b' }
        shape_binary: { fg: '#ff73fd' attr: 'b' }
        shape_block: { fg: '#96cbfe' attr: 'b' }
        shape_bool: '#dfdffe'
        shape_closure: { fg: '#c6c5fe' attr: 'b' }
        shape_custom: '#a8ff60'
        shape_datetime: { fg: '#c6c5fe' attr: 'b' }
        shape_directory: '#c6c5fe'
        shape_external: '#c6c5fe'
        shape_external_resolved: '#dfdffe'
        shape_externalarg: { fg: '#a8ff60' attr: 'b' }
        shape_filepath: '#c6c5fe'
        shape_flag: { fg: '#96cbfe' attr: 'b' }
        shape_float: { fg: '#ffb6b0' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#c6c5fe' attr: 'b' }
        shape_globpattern: { fg: '#c6c5fe' attr: 'b' }
        shape_int: { fg: '#ff73fd' attr: 'b' }
        shape_internalcall: { fg: '#c6c5fe' attr: 'b' }
        shape_keyword: { fg: '#ff73fd' attr: 'b' }
        shape_list: { fg: '#c6c5fe' attr: 'b' }
        shape_literal: '#96cbfe'
        shape_match_pattern: '#a8ff60'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff6c60'
        shape_operator: '#ffffb6'
        shape_or: { fg: '#ff73fd' attr: 'b' }
        shape_pipe: { fg: '#ff73fd' attr: 'b' }
        shape_range: { fg: '#ffffb6' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#c6c5fe' attr: 'b' }
        shape_redirection: { fg: '#ff73fd' attr: 'b' }
        shape_signature: { fg: '#a8ff60' attr: 'b' }
        shape_string: '#a8ff60'
        shape_string_interpolation: { fg: '#c6c5fe' attr: 'b' }
        shape_table: { fg: '#96cbfe' attr: 'b' }
        shape_vardecl: { fg: '#96cbfe' attr: 'u' }
        shape_variable: '#ff73fd'

        foreground: '#ffff4e'
        background: '#0000a4'
        cursor: '#ffff4e'

        empty: '#96cbfe'
        header: { fg: '#a8ff60' attr: 'b' }
        hints: '#7c7c7c'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a8ff60' attr: 'b' }
        search_result: { fg: '#ff6c60' bg: '#eeeeee' }
        separator: '#eeeeee'
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