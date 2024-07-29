# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ae94f9'
        block: '#40bfff'
        cell-path: '#e9e7e1'
        closure: '#fb6acb'
        custom: '#f2fbff'
        duration: '#ffdc2d'
        float: '#ff661a'
        glob: '#f2fbff'
        int: '#ae94f9'
        list: '#fb6acb'
        nothing: '#ff661a'
        range: '#ffdc2d'
        record: '#fb6acb'
        string: '#f2e6a9'

        bool: {|| if $in { '#fb6acb' } else { '#ffdc2d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff661a' attr: 'b' }
            } else if $in < 6hr {
                '#ff661a'
            } else if $in < 1day {
                '#ffdc2d'
            } else if $in < 3day {
                '#f2e6a9'
            } else if $in < 1wk {
                { fg: '#f2e6a9' attr: 'b' }
            } else if $in < 6wk {
                '#fb6acb'
            } else if $in < 52wk {
                '#40bfff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e9e7e1'
            } else if $e < 1mb {
                '#fb6acb'
            } else {{ fg: '#40bfff' }}
        }

        shape_and: { fg: '#ae94f9' attr: 'b' }
        shape_binary: { fg: '#ae94f9' attr: 'b' }
        shape_block: { fg: '#40bfff' attr: 'b' }
        shape_bool: '#fb6acb'
        shape_closure: { fg: '#fb6acb' attr: 'b' }
        shape_custom: '#f2e6a9'
        shape_datetime: { fg: '#fb6acb' attr: 'b' }
        shape_directory: '#fb6acb'
        shape_external: '#fb6acb'
        shape_external_resolved: '#fb6acb'
        shape_externalarg: { fg: '#f2e6a9' attr: 'b' }
        shape_filepath: '#fb6acb'
        shape_flag: { fg: '#40bfff' attr: 'b' }
        shape_float: { fg: '#ff661a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#fb6acb' attr: 'b' }
        shape_globpattern: { fg: '#fb6acb' attr: 'b' }
        shape_int: { fg: '#ae94f9' attr: 'b' }
        shape_internalcall: { fg: '#fb6acb' attr: 'b' }
        shape_keyword: { fg: '#ae94f9' attr: 'b' }
        shape_list: { fg: '#fb6acb' attr: 'b' }
        shape_literal: '#40bfff'
        shape_match_pattern: '#f2e6a9'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff661a'
        shape_operator: '#ffdc2d'
        shape_or: { fg: '#ae94f9' attr: 'b' }
        shape_pipe: { fg: '#ae94f9' attr: 'b' }
        shape_range: { fg: '#ffdc2d' attr: 'b' }
        shape_raw_string: { fg: '#f2fbff' attr: 'b' }
        shape_record: { fg: '#fb6acb' attr: 'b' }
        shape_redirection: { fg: '#ae94f9' attr: 'b' }
        shape_signature: { fg: '#f2e6a9' attr: 'b' }
        shape_string: '#f2e6a9'
        shape_string_interpolation: { fg: '#fb6acb' attr: 'b' }
        shape_table: { fg: '#40bfff' attr: 'b' }
        shape_vardecl: { fg: '#40bfff' attr: 'u' }
        shape_variable: '#ae94f9'

        foreground: '#e9e7e1'
        background: '#202126'
        cursor: '#e9e7e1'

        empty: '#40bfff'
        header: { fg: '#f2e6a9' attr: 'b' }
        hints: '#a1d2e6'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#f2e6a9' attr: 'b' }
        search_result: { fg: '#ff661a' bg: '#e9e7e1' }
        separator: '#e9e7e1'
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