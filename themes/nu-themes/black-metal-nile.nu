# Retrieve the theme settings
export def main [] {
    return {
        binary: '#999999'
        block: '#888888'
        cell-path: '#c1c1c1'
        closure: '#aaaaaa'
        custom: '#c1c1c1'
        duration: '#777755'
        float: '#5f8787'
        glob: '#c1c1c1'
        int: '#999999'
        list: '#aaaaaa'
        nothing: '#5f8787'
        range: '#777755'
        record: '#aaaaaa'
        string: '#aa9988'

        bool: {|| if $in { '#aaaaaa' } else { '#777755' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#5f8787' attr: 'b' }
            } else if $in < 6hr {
                '#5f8787'
            } else if $in < 1day {
                '#777755'
            } else if $in < 3day {
                '#aa9988'
            } else if $in < 1wk {
                { fg: '#aa9988' attr: 'b' }
            } else if $in < 6wk {
                '#aaaaaa'
            } else if $in < 52wk {
                '#888888'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c1c1c1'
            } else if $e < 1mb {
                '#aaaaaa'
            } else {{ fg: '#888888' }}
        }

        shape_and: { fg: '#999999' attr: 'b' }
        shape_binary: { fg: '#999999' attr: 'b' }
        shape_block: { fg: '#888888' attr: 'b' }
        shape_bool: '#aaaaaa'
        shape_closure: { fg: '#aaaaaa' attr: 'b' }
        shape_custom: '#aa9988'
        shape_datetime: { fg: '#aaaaaa' attr: 'b' }
        shape_directory: '#aaaaaa'
        shape_external: '#aaaaaa'
        shape_external_resolved: '#aaaaaa'
        shape_externalarg: { fg: '#aa9988' attr: 'b' }
        shape_filepath: '#aaaaaa'
        shape_flag: { fg: '#888888' attr: 'b' }
        shape_float: { fg: '#5f8787' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#aaaaaa' attr: 'b' }
        shape_globpattern: { fg: '#aaaaaa' attr: 'b' }
        shape_int: { fg: '#999999' attr: 'b' }
        shape_internalcall: { fg: '#aaaaaa' attr: 'b' }
        shape_keyword: { fg: '#999999' attr: 'b' }
        shape_list: { fg: '#aaaaaa' attr: 'b' }
        shape_literal: '#888888'
        shape_match_pattern: '#aa9988'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#5f8787'
        shape_operator: '#777755'
        shape_or: { fg: '#999999' attr: 'b' }
        shape_pipe: { fg: '#999999' attr: 'b' }
        shape_range: { fg: '#777755' attr: 'b' }
        shape_raw_string: { fg: '#c1c1c1' attr: 'b' }
        shape_record: { fg: '#aaaaaa' attr: 'b' }
        shape_redirection: { fg: '#999999' attr: 'b' }
        shape_signature: { fg: '#aa9988' attr: 'b' }
        shape_string: '#aa9988'
        shape_string_interpolation: { fg: '#aaaaaa' attr: 'b' }
        shape_table: { fg: '#888888' attr: 'b' }
        shape_vardecl: { fg: '#888888' attr: 'u' }
        shape_variable: '#999999'

        foreground: '#c1c1c1'
        background: '#000000'
        cursor: '#c1c1c1'

        empty: '#888888'
        header: { fg: '#aa9988' attr: 'b' }
        hints: '#333333'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#aa9988' attr: 'b' }
        search_result: { fg: '#5f8787' bg: '#c1c1c1' }
        separator: '#c1c1c1'
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