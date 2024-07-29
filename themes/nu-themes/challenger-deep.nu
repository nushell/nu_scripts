# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c991e1'
        block: '#91ddff'
        cell-path: '#cbe3e7'
        closure: '#aaffe4'
        custom: '#a6b3cc'
        duration: '#ffe9aa'
        float: '#ff5458'
        glob: '#a6b3cc'
        int: '#c991e1'
        list: '#aaffe4'
        nothing: '#ff8080'
        range: '#ffe9aa'
        record: '#aaffe4'
        string: '#95ffa4'

        bool: {|| if $in { '#63f2f1' } else { '#ffe9aa' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff8080' attr: 'b' }
            } else if $in < 6hr {
                '#ff8080'
            } else if $in < 1day {
                '#ffe9aa'
            } else if $in < 3day {
                '#95ffa4'
            } else if $in < 1wk {
                { fg: '#95ffa4' attr: 'b' }
            } else if $in < 6wk {
                '#aaffe4'
            } else if $in < 52wk {
                '#91ddff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cbe3e7'
            } else if $e < 1mb {
                '#aaffe4'
            } else {{ fg: '#91ddff' }}
        }

        shape_and: { fg: '#c991e1' attr: 'b' }
        shape_binary: { fg: '#c991e1' attr: 'b' }
        shape_block: { fg: '#91ddff' attr: 'b' }
        shape_bool: '#63f2f1'
        shape_closure: { fg: '#aaffe4' attr: 'b' }
        shape_custom: '#95ffa4'
        shape_datetime: { fg: '#aaffe4' attr: 'b' }
        shape_directory: '#aaffe4'
        shape_external: '#aaffe4'
        shape_external_resolved: '#63f2f1'
        shape_externalarg: { fg: '#95ffa4' attr: 'b' }
        shape_filepath: '#aaffe4'
        shape_flag: { fg: '#91ddff' attr: 'b' }
        shape_float: { fg: '#ff5458' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#aaffe4' attr: 'b' }
        shape_globpattern: { fg: '#aaffe4' attr: 'b' }
        shape_int: { fg: '#c991e1' attr: 'b' }
        shape_internalcall: { fg: '#aaffe4' attr: 'b' }
        shape_keyword: { fg: '#c991e1' attr: 'b' }
        shape_list: { fg: '#aaffe4' attr: 'b' }
        shape_literal: '#91ddff'
        shape_match_pattern: '#95ffa4'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff8080'
        shape_operator: '#ffe9aa'
        shape_or: { fg: '#c991e1' attr: 'b' }
        shape_pipe: { fg: '#c991e1' attr: 'b' }
        shape_range: { fg: '#ffe9aa' attr: 'b' }
        shape_raw_string: { fg: '#a6b3cc' attr: 'b' }
        shape_record: { fg: '#aaffe4' attr: 'b' }
        shape_redirection: { fg: '#c991e1' attr: 'b' }
        shape_signature: { fg: '#95ffa4' attr: 'b' }
        shape_string: '#95ffa4'
        shape_string_interpolation: { fg: '#aaffe4' attr: 'b' }
        shape_table: { fg: '#91ddff' attr: 'b' }
        shape_vardecl: { fg: '#91ddff' attr: 'u' }
        shape_variable: '#c991e1'

        foreground: '#cbe3e7'
        background: '#1e1c31'
        cursor: '#cbe3e7'

        empty: '#91ddff'
        header: { fg: '#95ffa4' attr: 'b' }
        hints: '#100e23'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#95ffa4' attr: 'b' }
        search_result: { fg: '#ff8080' bg: '#cbe3e7' }
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