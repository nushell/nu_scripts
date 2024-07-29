# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d4bfff'
        block: '#91ddff'
        cell-path: '#cbe3e7'
        closure: '#87dfeb'
        custom: '#8a889d'
        duration: '#ffe6b3'
        float: '#f02e6e'
        glob: '#8a889d'
        int: '#d4bfff'
        list: '#87dfeb'
        nothing: '#f48fb1'
        range: '#ffe6b3'
        record: '#87dfeb'
        string: '#a1efd3'

        bool: {|| if $in { '#63f2f1' } else { '#ffe6b3' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f48fb1' attr: 'b' }
            } else if $in < 6hr {
                '#f48fb1'
            } else if $in < 1day {
                '#ffe6b3'
            } else if $in < 3day {
                '#a1efd3'
            } else if $in < 1wk {
                { fg: '#a1efd3' attr: 'b' }
            } else if $in < 6wk {
                '#87dfeb'
            } else if $in < 52wk {
                '#91ddff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cbe3e7'
            } else if $e < 1mb {
                '#87dfeb'
            } else {{ fg: '#91ddff' }}
        }

        shape_and: { fg: '#d4bfff' attr: 'b' }
        shape_binary: { fg: '#d4bfff' attr: 'b' }
        shape_block: { fg: '#91ddff' attr: 'b' }
        shape_bool: '#63f2f1'
        shape_closure: { fg: '#87dfeb' attr: 'b' }
        shape_custom: '#a1efd3'
        shape_datetime: { fg: '#87dfeb' attr: 'b' }
        shape_directory: '#87dfeb'
        shape_external: '#87dfeb'
        shape_external_resolved: '#63f2f1'
        shape_externalarg: { fg: '#a1efd3' attr: 'b' }
        shape_filepath: '#87dfeb'
        shape_flag: { fg: '#91ddff' attr: 'b' }
        shape_float: { fg: '#f02e6e' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#87dfeb' attr: 'b' }
        shape_globpattern: { fg: '#87dfeb' attr: 'b' }
        shape_int: { fg: '#d4bfff' attr: 'b' }
        shape_internalcall: { fg: '#87dfeb' attr: 'b' }
        shape_keyword: { fg: '#d4bfff' attr: 'b' }
        shape_list: { fg: '#87dfeb' attr: 'b' }
        shape_literal: '#91ddff'
        shape_match_pattern: '#a1efd3'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f48fb1'
        shape_operator: '#ffe6b3'
        shape_or: { fg: '#d4bfff' attr: 'b' }
        shape_pipe: { fg: '#d4bfff' attr: 'b' }
        shape_range: { fg: '#ffe6b3' attr: 'b' }
        shape_raw_string: { fg: '#8a889d' attr: 'b' }
        shape_record: { fg: '#87dfeb' attr: 'b' }
        shape_redirection: { fg: '#d4bfff' attr: 'b' }
        shape_signature: { fg: '#a1efd3' attr: 'b' }
        shape_string: '#a1efd3'
        shape_string_interpolation: { fg: '#87dfeb' attr: 'b' }
        shape_table: { fg: '#91ddff' attr: 'b' }
        shape_vardecl: { fg: '#91ddff' attr: 'u' }
        shape_variable: '#d4bfff'

        foreground: '#cbe3e7'
        background: '#1e1c31'
        cursor: '#cbe3e7'

        empty: '#91ddff'
        header: { fg: '#a1efd3' attr: 'b' }
        hints: '#585273'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a1efd3' attr: 'b' }
        search_result: { fg: '#f48fb1' bg: '#cbe3e7' }
        separator: '#cbe3e7'
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