# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b888e2'
        block: '#639ee4'
        cell-path: '#a7a7a7'
        closure: '#4bb1a7'
        custom: '#ffffff'
        duration: '#c3ba63'
        float: '#dc657d'
        glob: '#ffffff'
        int: '#b888e2'
        list: '#4bb1a7'
        nothing: '#dc657d'
        range: '#c3ba63'
        record: '#4bb1a7'
        string: '#84b97c'

        bool: {|| if $in { '#4bb1a7' } else { '#c3ba63' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#dc657d' attr: 'b' }
            } else if $in < 6hr {
                '#dc657d'
            } else if $in < 1day {
                '#c3ba63'
            } else if $in < 3day {
                '#84b97c'
            } else if $in < 1wk {
                { fg: '#84b97c' attr: 'b' }
            } else if $in < 6wk {
                '#4bb1a7'
            } else if $in < 52wk {
                '#639ee4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a7a7a7'
            } else if $e < 1mb {
                '#4bb1a7'
            } else {{ fg: '#639ee4' }}
        }

        shape_and: { fg: '#b888e2' attr: 'b' }
        shape_binary: { fg: '#b888e2' attr: 'b' }
        shape_block: { fg: '#639ee4' attr: 'b' }
        shape_bool: '#4bb1a7'
        shape_closure: { fg: '#4bb1a7' attr: 'b' }
        shape_custom: '#84b97c'
        shape_datetime: { fg: '#4bb1a7' attr: 'b' }
        shape_directory: '#4bb1a7'
        shape_external: '#4bb1a7'
        shape_external_resolved: '#4bb1a7'
        shape_externalarg: { fg: '#84b97c' attr: 'b' }
        shape_filepath: '#4bb1a7'
        shape_flag: { fg: '#639ee4' attr: 'b' }
        shape_float: { fg: '#dc657d' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#4bb1a7' attr: 'b' }
        shape_globpattern: { fg: '#4bb1a7' attr: 'b' }
        shape_int: { fg: '#b888e2' attr: 'b' }
        shape_internalcall: { fg: '#4bb1a7' attr: 'b' }
        shape_keyword: { fg: '#b888e2' attr: 'b' }
        shape_list: { fg: '#4bb1a7' attr: 'b' }
        shape_literal: '#639ee4'
        shape_match_pattern: '#84b97c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#dc657d'
        shape_operator: '#c3ba63'
        shape_or: { fg: '#b888e2' attr: 'b' }
        shape_pipe: { fg: '#b888e2' attr: 'b' }
        shape_range: { fg: '#c3ba63' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#4bb1a7' attr: 'b' }
        shape_redirection: { fg: '#b888e2' attr: 'b' }
        shape_signature: { fg: '#84b97c' attr: 'b' }
        shape_string: '#84b97c'
        shape_string_interpolation: { fg: '#4bb1a7' attr: 'b' }
        shape_table: { fg: '#639ee4' attr: 'b' }
        shape_vardecl: { fg: '#639ee4' attr: 'u' }
        shape_variable: '#b888e2'

        foreground: '#a7a7a7'
        background: '#191919'
        cursor: '#a7a7a7'

        empty: '#639ee4'
        header: { fg: '#84b97c' attr: 'b' }
        hints: '#5f5a60'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#84b97c' attr: 'b' }
        search_result: { fg: '#dc657d' bg: '#a7a7a7' }
        separator: '#a7a7a7'
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