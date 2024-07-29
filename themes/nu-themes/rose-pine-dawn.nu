# Retrieve the theme settings
export def main [] {
    return {
        binary: '#907aa9'
        block: '#56949f'
        cell-path: '#575279'
        closure: '#286983'
        custom: '#26233a'
        duration: '#ea9d34'
        float: '#1f1d2e'
        glob: '#26233a'
        int: '#907aa9'
        list: '#286983'
        nothing: '#1f1d2e'
        range: '#ea9d34'
        record: '#286983'
        string: '#d7827e'

        bool: {|| if $in { '#286983' } else { '#ea9d34' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#1f1d2e' attr: 'b' }
            } else if $in < 6hr {
                '#1f1d2e'
            } else if $in < 1day {
                '#ea9d34'
            } else if $in < 3day {
                '#d7827e'
            } else if $in < 1wk {
                { fg: '#d7827e' attr: 'b' }
            } else if $in < 6wk {
                '#286983'
            } else if $in < 52wk {
                '#56949f'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#575279'
            } else if $e < 1mb {
                '#286983'
            } else {{ fg: '#56949f' }}
        }

        shape_and: { fg: '#907aa9' attr: 'b' }
        shape_binary: { fg: '#907aa9' attr: 'b' }
        shape_block: { fg: '#56949f' attr: 'b' }
        shape_bool: '#286983'
        shape_closure: { fg: '#286983' attr: 'b' }
        shape_custom: '#d7827e'
        shape_datetime: { fg: '#286983' attr: 'b' }
        shape_directory: '#286983'
        shape_external: '#286983'
        shape_external_resolved: '#286983'
        shape_externalarg: { fg: '#d7827e' attr: 'b' }
        shape_filepath: '#286983'
        shape_flag: { fg: '#56949f' attr: 'b' }
        shape_float: { fg: '#1f1d2e' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#286983' attr: 'b' }
        shape_globpattern: { fg: '#286983' attr: 'b' }
        shape_int: { fg: '#907aa9' attr: 'b' }
        shape_internalcall: { fg: '#286983' attr: 'b' }
        shape_keyword: { fg: '#907aa9' attr: 'b' }
        shape_list: { fg: '#286983' attr: 'b' }
        shape_literal: '#56949f'
        shape_match_pattern: '#d7827e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#1f1d2e'
        shape_operator: '#ea9d34'
        shape_or: { fg: '#907aa9' attr: 'b' }
        shape_pipe: { fg: '#907aa9' attr: 'b' }
        shape_range: { fg: '#ea9d34' attr: 'b' }
        shape_raw_string: { fg: '#26233a' attr: 'b' }
        shape_record: { fg: '#286983' attr: 'b' }
        shape_redirection: { fg: '#907aa9' attr: 'b' }
        shape_signature: { fg: '#d7827e' attr: 'b' }
        shape_string: '#d7827e'
        shape_string_interpolation: { fg: '#286983' attr: 'b' }
        shape_table: { fg: '#56949f' attr: 'b' }
        shape_vardecl: { fg: '#56949f' attr: 'u' }
        shape_variable: '#907aa9'

        foreground: '#575279'
        background: '#faf4ed'
        cursor: '#575279'

        empty: '#56949f'
        header: { fg: '#d7827e' attr: 'b' }
        hints: '#9893a5'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#d7827e' attr: 'b' }
        search_result: { fg: '#1f1d2e' bg: '#575279' }
        separator: '#575279'
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