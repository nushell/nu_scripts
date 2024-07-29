# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9a70a4'
        block: '#5dd7b9'
        cell-path: '#a1a19a'
        closure: '#14747e'
        custom: '#fafaf8'
        duration: '#ffcc1b'
        float: '#ff5a67'
        glob: '#fafaf8'
        int: '#9a70a4'
        list: '#14747e'
        nothing: '#ff5a67'
        range: '#ffcc1b'
        record: '#14747e'
        string: '#7fc06e'

        bool: {|| if $in { '#14747e' } else { '#ffcc1b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff5a67' attr: 'b' }
            } else if $in < 6hr {
                '#ff5a67'
            } else if $in < 1day {
                '#ffcc1b'
            } else if $in < 3day {
                '#7fc06e'
            } else if $in < 1wk {
                { fg: '#7fc06e' attr: 'b' }
            } else if $in < 6wk {
                '#14747e'
            } else if $in < 52wk {
                '#5dd7b9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a1a19a'
            } else if $e < 1mb {
                '#14747e'
            } else {{ fg: '#5dd7b9' }}
        }

        shape_and: { fg: '#9a70a4' attr: 'b' }
        shape_binary: { fg: '#9a70a4' attr: 'b' }
        shape_block: { fg: '#5dd7b9' attr: 'b' }
        shape_bool: '#14747e'
        shape_closure: { fg: '#14747e' attr: 'b' }
        shape_custom: '#7fc06e'
        shape_datetime: { fg: '#14747e' attr: 'b' }
        shape_directory: '#14747e'
        shape_external: '#14747e'
        shape_external_resolved: '#14747e'
        shape_externalarg: { fg: '#7fc06e' attr: 'b' }
        shape_filepath: '#14747e'
        shape_flag: { fg: '#5dd7b9' attr: 'b' }
        shape_float: { fg: '#ff5a67' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#14747e' attr: 'b' }
        shape_globpattern: { fg: '#14747e' attr: 'b' }
        shape_int: { fg: '#9a70a4' attr: 'b' }
        shape_internalcall: { fg: '#14747e' attr: 'b' }
        shape_keyword: { fg: '#9a70a4' attr: 'b' }
        shape_list: { fg: '#14747e' attr: 'b' }
        shape_literal: '#5dd7b9'
        shape_match_pattern: '#7fc06e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff5a67'
        shape_operator: '#ffcc1b'
        shape_or: { fg: '#9a70a4' attr: 'b' }
        shape_pipe: { fg: '#9a70a4' attr: 'b' }
        shape_range: { fg: '#ffcc1b' attr: 'b' }
        shape_raw_string: { fg: '#fafaf8' attr: 'b' }
        shape_record: { fg: '#14747e' attr: 'b' }
        shape_redirection: { fg: '#9a70a4' attr: 'b' }
        shape_signature: { fg: '#7fc06e' attr: 'b' }
        shape_string: '#7fc06e'
        shape_string_interpolation: { fg: '#14747e' attr: 'b' }
        shape_table: { fg: '#5dd7b9' attr: 'b' }
        shape_vardecl: { fg: '#5dd7b9' attr: 'u' }
        shape_variable: '#9a70a4'

        foreground: '#a1a19a'
        background: '#002635'
        cursor: '#a1a19a'

        empty: '#5dd7b9'
        header: { fg: '#7fc06e' attr: 'b' }
        hints: '#6c8b91'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7fc06e' attr: 'b' }
        search_result: { fg: '#ff5a67' bg: '#a1a19a' }
        separator: '#a1a19a'
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