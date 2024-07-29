# Retrieve the theme settings
export def main [] {
    return {
        binary: '#000090'
        block: '#007300'
        cell-path: '#000000'
        closure: '#755b00'
        custom: '#c4d9c4'
        duration: '#755b00'
        float: '#840000'
        glob: '#c4d9c4'
        int: '#000090'
        list: '#755b00'
        nothing: '#840000'
        range: '#755b00'
        record: '#755b00'
        string: '#730073'

        bool: {|| if $in { '#755b00' } else { '#755b00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#840000' attr: 'b' }
            } else if $in < 6hr {
                '#840000'
            } else if $in < 1day {
                '#755b00'
            } else if $in < 3day {
                '#730073'
            } else if $in < 1wk {
                { fg: '#730073' attr: 'b' }
            } else if $in < 6wk {
                '#755b00'
            } else if $in < 52wk {
                '#007300'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#000000'
            } else if $e < 1mb {
                '#755b00'
            } else {{ fg: '#007300' }}
        }

        shape_and: { fg: '#000090' attr: 'b' }
        shape_binary: { fg: '#000090' attr: 'b' }
        shape_block: { fg: '#007300' attr: 'b' }
        shape_bool: '#755b00'
        shape_closure: { fg: '#755b00' attr: 'b' }
        shape_custom: '#730073'
        shape_datetime: { fg: '#755b00' attr: 'b' }
        shape_directory: '#755b00'
        shape_external: '#755b00'
        shape_external_resolved: '#755b00'
        shape_externalarg: { fg: '#730073' attr: 'b' }
        shape_filepath: '#755b00'
        shape_flag: { fg: '#007300' attr: 'b' }
        shape_float: { fg: '#840000' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#755b00' attr: 'b' }
        shape_globpattern: { fg: '#755b00' attr: 'b' }
        shape_int: { fg: '#000090' attr: 'b' }
        shape_internalcall: { fg: '#755b00' attr: 'b' }
        shape_keyword: { fg: '#000090' attr: 'b' }
        shape_list: { fg: '#755b00' attr: 'b' }
        shape_literal: '#007300'
        shape_match_pattern: '#730073'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#840000'
        shape_operator: '#755b00'
        shape_or: { fg: '#000090' attr: 'b' }
        shape_pipe: { fg: '#000090' attr: 'b' }
        shape_range: { fg: '#755b00' attr: 'b' }
        shape_raw_string: { fg: '#c4d9c4' attr: 'b' }
        shape_record: { fg: '#755b00' attr: 'b' }
        shape_redirection: { fg: '#000090' attr: 'b' }
        shape_signature: { fg: '#730073' attr: 'b' }
        shape_string: '#730073'
        shape_string_interpolation: { fg: '#755b00' attr: 'b' }
        shape_table: { fg: '#007300' attr: 'b' }
        shape_vardecl: { fg: '#007300' attr: 'u' }
        shape_variable: '#000090'

        foreground: '#000000'
        background: '#e0e0e0'
        cursor: '#000000'

        empty: '#007300'
        header: { fg: '#730073' attr: 'b' }
        hints: '#707070'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#730073' attr: 'b' }
        search_result: { fg: '#840000' bg: '#000000' }
        separator: '#000000'
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