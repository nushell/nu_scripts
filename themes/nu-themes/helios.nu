# Retrieve the theme settings
export def main [] {
    return {
        binary: '#be4264'
        block: '#1e8bac'
        cell-path: '#d5d5d5'
        closure: '#1ba595'
        custom: '#e5e5e5'
        duration: '#f19d1a'
        float: '#d72638'
        glob: '#e5e5e5'
        int: '#be4264'
        list: '#1ba595'
        nothing: '#d72638'
        range: '#f19d1a'
        record: '#1ba595'
        string: '#88b92d'

        bool: {|| if $in { '#1ba595' } else { '#f19d1a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d72638' attr: 'b' }
            } else if $in < 6hr {
                '#d72638'
            } else if $in < 1day {
                '#f19d1a'
            } else if $in < 3day {
                '#88b92d'
            } else if $in < 1wk {
                { fg: '#88b92d' attr: 'b' }
            } else if $in < 6wk {
                '#1ba595'
            } else if $in < 52wk {
                '#1e8bac'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d5d5d5'
            } else if $e < 1mb {
                '#1ba595'
            } else {{ fg: '#1e8bac' }}
        }

        shape_and: { fg: '#be4264' attr: 'b' }
        shape_binary: { fg: '#be4264' attr: 'b' }
        shape_block: { fg: '#1e8bac' attr: 'b' }
        shape_bool: '#1ba595'
        shape_closure: { fg: '#1ba595' attr: 'b' }
        shape_custom: '#88b92d'
        shape_datetime: { fg: '#1ba595' attr: 'b' }
        shape_directory: '#1ba595'
        shape_external: '#1ba595'
        shape_external_resolved: '#1ba595'
        shape_externalarg: { fg: '#88b92d' attr: 'b' }
        shape_filepath: '#1ba595'
        shape_flag: { fg: '#1e8bac' attr: 'b' }
        shape_float: { fg: '#d72638' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1ba595' attr: 'b' }
        shape_globpattern: { fg: '#1ba595' attr: 'b' }
        shape_int: { fg: '#be4264' attr: 'b' }
        shape_internalcall: { fg: '#1ba595' attr: 'b' }
        shape_keyword: { fg: '#be4264' attr: 'b' }
        shape_list: { fg: '#1ba595' attr: 'b' }
        shape_literal: '#1e8bac'
        shape_match_pattern: '#88b92d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d72638'
        shape_operator: '#f19d1a'
        shape_or: { fg: '#be4264' attr: 'b' }
        shape_pipe: { fg: '#be4264' attr: 'b' }
        shape_range: { fg: '#f19d1a' attr: 'b' }
        shape_raw_string: { fg: '#e5e5e5' attr: 'b' }
        shape_record: { fg: '#1ba595' attr: 'b' }
        shape_redirection: { fg: '#be4264' attr: 'b' }
        shape_signature: { fg: '#88b92d' attr: 'b' }
        shape_string: '#88b92d'
        shape_string_interpolation: { fg: '#1ba595' attr: 'b' }
        shape_table: { fg: '#1e8bac' attr: 'b' }
        shape_vardecl: { fg: '#1e8bac' attr: 'u' }
        shape_variable: '#be4264'

        foreground: '#d5d5d5'
        background: '#1d2021'
        cursor: '#d5d5d5'

        empty: '#1e8bac'
        header: { fg: '#88b92d' attr: 'b' }
        hints: '#6f7579'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#88b92d' attr: 'b' }
        search_result: { fg: '#d72638' bg: '#d5d5d5' }
        separator: '#d5d5d5'
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