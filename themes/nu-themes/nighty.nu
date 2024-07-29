# Retrieve the theme settings
export def main [] {
    return {
        binary: '#823065'
        block: '#1d3e6f'
        cell-path: '#828282'
        closure: '#3a7458'
        custom: '#dfdfdf'
        duration: '#808020'
        float: '#d0555f'
        glob: '#dfdfdf'
        int: '#823065'
        list: '#3a7458'
        nothing: '#9b3e46'
        range: '#808020'
        record: '#3a7458'
        string: '#095b32'

        bool: {|| if $in { '#70d2a4' } else { '#808020' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#9b3e46' attr: 'b' }
            } else if $in < 6hr {
                '#9b3e46'
            } else if $in < 1day {
                '#808020'
            } else if $in < 3day {
                '#095b32'
            } else if $in < 1wk {
                { fg: '#095b32' attr: 'b' }
            } else if $in < 6wk {
                '#3a7458'
            } else if $in < 52wk {
                '#1d3e6f'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#828282'
            } else if $e < 1mb {
                '#3a7458'
            } else {{ fg: '#1d3e6f' }}
        }

        shape_and: { fg: '#823065' attr: 'b' }
        shape_binary: { fg: '#823065' attr: 'b' }
        shape_block: { fg: '#1d3e6f' attr: 'b' }
        shape_bool: '#70d2a4'
        shape_closure: { fg: '#3a7458' attr: 'b' }
        shape_custom: '#095b32'
        shape_datetime: { fg: '#3a7458' attr: 'b' }
        shape_directory: '#3a7458'
        shape_external: '#3a7458'
        shape_external_resolved: '#70d2a4'
        shape_externalarg: { fg: '#095b32' attr: 'b' }
        shape_filepath: '#3a7458'
        shape_flag: { fg: '#1d3e6f' attr: 'b' }
        shape_float: { fg: '#d0555f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3a7458' attr: 'b' }
        shape_globpattern: { fg: '#3a7458' attr: 'b' }
        shape_int: { fg: '#823065' attr: 'b' }
        shape_internalcall: { fg: '#3a7458' attr: 'b' }
        shape_keyword: { fg: '#823065' attr: 'b' }
        shape_list: { fg: '#3a7458' attr: 'b' }
        shape_literal: '#1d3e6f'
        shape_match_pattern: '#095b32'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#9b3e46'
        shape_operator: '#808020'
        shape_or: { fg: '#823065' attr: 'b' }
        shape_pipe: { fg: '#823065' attr: 'b' }
        shape_range: { fg: '#808020' attr: 'b' }
        shape_raw_string: { fg: '#dfdfdf' attr: 'b' }
        shape_record: { fg: '#3a7458' attr: 'b' }
        shape_redirection: { fg: '#823065' attr: 'b' }
        shape_signature: { fg: '#095b32' attr: 'b' }
        shape_string: '#095b32'
        shape_string_interpolation: { fg: '#3a7458' attr: 'b' }
        shape_table: { fg: '#1d3e6f' attr: 'b' }
        shape_vardecl: { fg: '#1d3e6f' attr: 'u' }
        shape_variable: '#823065'

        foreground: '#dfdfdf'
        background: '#2f2f2f'
        cursor: '#dfdfdf'

        empty: '#1d3e6f'
        header: { fg: '#095b32' attr: 'b' }
        hints: '#5c6370'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#095b32' attr: 'b' }
        search_result: { fg: '#9b3e46' bg: '#828282' }
        separator: '#828282'
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