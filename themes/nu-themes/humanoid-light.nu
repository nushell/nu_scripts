# Retrieve the theme settings
export def main [] {
    return {
        binary: '#700f98'
        block: '#0082c9'
        cell-path: '#232629'
        closure: '#008e8e'
        custom: '#070708'
        duration: '#ffb627'
        float: '#b0151a'
        glob: '#070708'
        int: '#700f98'
        list: '#008e8e'
        nothing: '#b0151a'
        range: '#ffb627'
        record: '#008e8e'
        string: '#388e3c'

        bool: {|| if $in { '#008e8e' } else { '#ffb627' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b0151a' attr: 'b' }
            } else if $in < 6hr {
                '#b0151a'
            } else if $in < 1day {
                '#ffb627'
            } else if $in < 3day {
                '#388e3c'
            } else if $in < 1wk {
                { fg: '#388e3c' attr: 'b' }
            } else if $in < 6wk {
                '#008e8e'
            } else if $in < 52wk {
                '#0082c9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#232629'
            } else if $e < 1mb {
                '#008e8e'
            } else {{ fg: '#0082c9' }}
        }

        shape_and: { fg: '#700f98' attr: 'b' }
        shape_binary: { fg: '#700f98' attr: 'b' }
        shape_block: { fg: '#0082c9' attr: 'b' }
        shape_bool: '#008e8e'
        shape_closure: { fg: '#008e8e' attr: 'b' }
        shape_custom: '#388e3c'
        shape_datetime: { fg: '#008e8e' attr: 'b' }
        shape_directory: '#008e8e'
        shape_external: '#008e8e'
        shape_external_resolved: '#008e8e'
        shape_externalarg: { fg: '#388e3c' attr: 'b' }
        shape_filepath: '#008e8e'
        shape_flag: { fg: '#0082c9' attr: 'b' }
        shape_float: { fg: '#b0151a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#008e8e' attr: 'b' }
        shape_globpattern: { fg: '#008e8e' attr: 'b' }
        shape_int: { fg: '#700f98' attr: 'b' }
        shape_internalcall: { fg: '#008e8e' attr: 'b' }
        shape_keyword: { fg: '#700f98' attr: 'b' }
        shape_list: { fg: '#008e8e' attr: 'b' }
        shape_literal: '#0082c9'
        shape_match_pattern: '#388e3c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b0151a'
        shape_operator: '#ffb627'
        shape_or: { fg: '#700f98' attr: 'b' }
        shape_pipe: { fg: '#700f98' attr: 'b' }
        shape_range: { fg: '#ffb627' attr: 'b' }
        shape_raw_string: { fg: '#070708' attr: 'b' }
        shape_record: { fg: '#008e8e' attr: 'b' }
        shape_redirection: { fg: '#700f98' attr: 'b' }
        shape_signature: { fg: '#388e3c' attr: 'b' }
        shape_string: '#388e3c'
        shape_string_interpolation: { fg: '#008e8e' attr: 'b' }
        shape_table: { fg: '#0082c9' attr: 'b' }
        shape_vardecl: { fg: '#0082c9' attr: 'u' }
        shape_variable: '#700f98'

        foreground: '#232629'
        background: '#f8f8f2'
        cursor: '#232629'

        empty: '#0082c9'
        header: { fg: '#388e3c' attr: 'b' }
        hints: '#c0c0bd'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#388e3c' attr: 'b' }
        search_result: { fg: '#b0151a' bg: '#232629' }
        separator: '#232629'
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