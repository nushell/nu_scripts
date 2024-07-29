# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c792ea'
        block: '#82aaff'
        cell-path: '#eeffff'
        closure: '#89ddff'
        custom: '#ffffff'
        duration: '#ffcb6b'
        float: '#f07178'
        glob: '#ffffff'
        int: '#c792ea'
        list: '#89ddff'
        nothing: '#f07178'
        range: '#ffcb6b'
        record: '#89ddff'
        string: '#c3e88d'

        bool: {|| if $in { '#89ddff' } else { '#ffcb6b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f07178' attr: 'b' }
            } else if $in < 6hr {
                '#f07178'
            } else if $in < 1day {
                '#ffcb6b'
            } else if $in < 3day {
                '#c3e88d'
            } else if $in < 1wk {
                { fg: '#c3e88d' attr: 'b' }
            } else if $in < 6wk {
                '#89ddff'
            } else if $in < 52wk {
                '#82aaff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#eeffff'
            } else if $e < 1mb {
                '#89ddff'
            } else {{ fg: '#82aaff' }}
        }

        shape_and: { fg: '#c792ea' attr: 'b' }
        shape_binary: { fg: '#c792ea' attr: 'b' }
        shape_block: { fg: '#82aaff' attr: 'b' }
        shape_bool: '#89ddff'
        shape_closure: { fg: '#89ddff' attr: 'b' }
        shape_custom: '#c3e88d'
        shape_datetime: { fg: '#89ddff' attr: 'b' }
        shape_directory: '#89ddff'
        shape_external: '#89ddff'
        shape_external_resolved: '#89ddff'
        shape_externalarg: { fg: '#c3e88d' attr: 'b' }
        shape_filepath: '#89ddff'
        shape_flag: { fg: '#82aaff' attr: 'b' }
        shape_float: { fg: '#f07178' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#89ddff' attr: 'b' }
        shape_globpattern: { fg: '#89ddff' attr: 'b' }
        shape_int: { fg: '#c792ea' attr: 'b' }
        shape_internalcall: { fg: '#89ddff' attr: 'b' }
        shape_keyword: { fg: '#c792ea' attr: 'b' }
        shape_list: { fg: '#89ddff' attr: 'b' }
        shape_literal: '#82aaff'
        shape_match_pattern: '#c3e88d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f07178'
        shape_operator: '#ffcb6b'
        shape_or: { fg: '#c792ea' attr: 'b' }
        shape_pipe: { fg: '#c792ea' attr: 'b' }
        shape_range: { fg: '#ffcb6b' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#89ddff' attr: 'b' }
        shape_redirection: { fg: '#c792ea' attr: 'b' }
        shape_signature: { fg: '#c3e88d' attr: 'b' }
        shape_string: '#c3e88d'
        shape_string_interpolation: { fg: '#89ddff' attr: 'b' }
        shape_table: { fg: '#82aaff' attr: 'b' }
        shape_vardecl: { fg: '#82aaff' attr: 'u' }
        shape_variable: '#c792ea'

        foreground: '#eeffff'
        background: '#263238'
        cursor: '#eeffff'

        empty: '#82aaff'
        header: { fg: '#c3e88d' attr: 'b' }
        hints: '#546e7a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#c3e88d' attr: 'b' }
        search_result: { fg: '#f07178' bg: '#eeffff' }
        separator: '#eeffff'
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