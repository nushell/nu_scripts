# Retrieve the theme settings
export def main [] {
    return {
        binary: '#97363d'
        block: '#58859a'
        cell-path: '#786b53'
        closure: '#b25a1e'
        custom: '#ffc800'
        duration: '#aa820c'
        float: '#ed5d20'
        glob: '#ffc800'
        int: '#97363d'
        list: '#b25a1e'
        nothing: '#b2270e'
        range: '#aa820c'
        record: '#b25a1e'
        string: '#44a900'

        bool: {|| if $in { '#f07d14' } else { '#aa820c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b2270e' attr: 'b' }
            } else if $in < 6hr {
                '#b2270e'
            } else if $in < 1day {
                '#aa820c'
            } else if $in < 3day {
                '#44a900'
            } else if $in < 1wk {
                { fg: '#44a900' attr: 'b' }
            } else if $in < 6wk {
                '#b25a1e'
            } else if $in < 52wk {
                '#58859a'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#786b53'
            } else if $e < 1mb {
                '#b25a1e'
            } else {{ fg: '#58859a' }}
        }

        shape_and: { fg: '#97363d' attr: 'b' }
        shape_binary: { fg: '#97363d' attr: 'b' }
        shape_block: { fg: '#58859a' attr: 'b' }
        shape_bool: '#f07d14'
        shape_closure: { fg: '#b25a1e' attr: 'b' }
        shape_custom: '#44a900'
        shape_datetime: { fg: '#b25a1e' attr: 'b' }
        shape_directory: '#b25a1e'
        shape_external: '#b25a1e'
        shape_external_resolved: '#f07d14'
        shape_externalarg: { fg: '#44a900' attr: 'b' }
        shape_filepath: '#b25a1e'
        shape_flag: { fg: '#58859a' attr: 'b' }
        shape_float: { fg: '#ed5d20' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#b25a1e' attr: 'b' }
        shape_globpattern: { fg: '#b25a1e' attr: 'b' }
        shape_int: { fg: '#97363d' attr: 'b' }
        shape_internalcall: { fg: '#b25a1e' attr: 'b' }
        shape_keyword: { fg: '#97363d' attr: 'b' }
        shape_list: { fg: '#b25a1e' attr: 'b' }
        shape_literal: '#58859a'
        shape_match_pattern: '#44a900'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b2270e'
        shape_operator: '#aa820c'
        shape_or: { fg: '#97363d' attr: 'b' }
        shape_pipe: { fg: '#97363d' attr: 'b' }
        shape_range: { fg: '#aa820c' attr: 'b' }
        shape_raw_string: { fg: '#ffc800' attr: 'b' }
        shape_record: { fg: '#b25a1e' attr: 'b' }
        shape_redirection: { fg: '#97363d' attr: 'b' }
        shape_signature: { fg: '#44a900' attr: 'b' }
        shape_string: '#44a900'
        shape_string_interpolation: { fg: '#b25a1e' attr: 'b' }
        shape_table: { fg: '#58859a' attr: 'b' }
        shape_vardecl: { fg: '#58859a' attr: 'u' }
        shape_variable: '#97363d'

        foreground: '#786b53'
        background: '#191919'
        cursor: '#786b53'

        empty: '#58859a'
        header: { fg: '#44a900' attr: 'b' }
        hints: '#433626'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#44a900' attr: 'b' }
        search_result: { fg: '#b2270e' bg: '#786b53' }
        separator: '#786b53'
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