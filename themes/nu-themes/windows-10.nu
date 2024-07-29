# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b4009e'
        block: '#3b78ff'
        cell-path: '#cccccc'
        closure: '#61d6d6'
        custom: '#f2f2f2'
        duration: '#f9f1a5'
        float: '#e74856'
        glob: '#f2f2f2'
        int: '#b4009e'
        list: '#61d6d6'
        nothing: '#e74856'
        range: '#f9f1a5'
        record: '#61d6d6'
        string: '#16c60c'

        bool: {|| if $in { '#61d6d6' } else { '#f9f1a5' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e74856' attr: 'b' }
            } else if $in < 6hr {
                '#e74856'
            } else if $in < 1day {
                '#f9f1a5'
            } else if $in < 3day {
                '#16c60c'
            } else if $in < 1wk {
                { fg: '#16c60c' attr: 'b' }
            } else if $in < 6wk {
                '#61d6d6'
            } else if $in < 52wk {
                '#3b78ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cccccc'
            } else if $e < 1mb {
                '#61d6d6'
            } else {{ fg: '#3b78ff' }}
        }

        shape_and: { fg: '#b4009e' attr: 'b' }
        shape_binary: { fg: '#b4009e' attr: 'b' }
        shape_block: { fg: '#3b78ff' attr: 'b' }
        shape_bool: '#61d6d6'
        shape_closure: { fg: '#61d6d6' attr: 'b' }
        shape_custom: '#16c60c'
        shape_datetime: { fg: '#61d6d6' attr: 'b' }
        shape_directory: '#61d6d6'
        shape_external: '#61d6d6'
        shape_external_resolved: '#61d6d6'
        shape_externalarg: { fg: '#16c60c' attr: 'b' }
        shape_filepath: '#61d6d6'
        shape_flag: { fg: '#3b78ff' attr: 'b' }
        shape_float: { fg: '#e74856' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#61d6d6' attr: 'b' }
        shape_globpattern: { fg: '#61d6d6' attr: 'b' }
        shape_int: { fg: '#b4009e' attr: 'b' }
        shape_internalcall: { fg: '#61d6d6' attr: 'b' }
        shape_keyword: { fg: '#b4009e' attr: 'b' }
        shape_list: { fg: '#61d6d6' attr: 'b' }
        shape_literal: '#3b78ff'
        shape_match_pattern: '#16c60c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e74856'
        shape_operator: '#f9f1a5'
        shape_or: { fg: '#b4009e' attr: 'b' }
        shape_pipe: { fg: '#b4009e' attr: 'b' }
        shape_range: { fg: '#f9f1a5' attr: 'b' }
        shape_raw_string: { fg: '#f2f2f2' attr: 'b' }
        shape_record: { fg: '#61d6d6' attr: 'b' }
        shape_redirection: { fg: '#b4009e' attr: 'b' }
        shape_signature: { fg: '#16c60c' attr: 'b' }
        shape_string: '#16c60c'
        shape_string_interpolation: { fg: '#61d6d6' attr: 'b' }
        shape_table: { fg: '#3b78ff' attr: 'b' }
        shape_vardecl: { fg: '#3b78ff' attr: 'u' }
        shape_variable: '#b4009e'

        foreground: '#cccccc'
        background: '#0c0c0c'
        cursor: '#cccccc'

        empty: '#3b78ff'
        header: { fg: '#16c60c' attr: 'b' }
        hints: '#767676'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#16c60c' attr: 'b' }
        search_result: { fg: '#e74856' bg: '#cccccc' }
        separator: '#cccccc'
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