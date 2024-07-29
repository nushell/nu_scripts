# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d6aed6'
        block: '#86aed6'
        cell-path: '#d0d0d0'
        closure: '#8adbb4'
        custom: '#efefef'
        duration: '#d7af87'
        float: '#d68686'
        glob: '#efefef'
        int: '#d6aed6'
        list: '#8adbb4'
        nothing: '#d68686'
        range: '#d7af87'
        record: '#8adbb4'
        string: '#aed686'

        bool: {|| if $in { '#b1e7dd' } else { '#d7af87' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d68686' attr: 'b' }
            } else if $in < 6hr {
                '#d68686'
            } else if $in < 1day {
                '#d7af87'
            } else if $in < 3day {
                '#aed686'
            } else if $in < 1wk {
                { fg: '#aed686' attr: 'b' }
            } else if $in < 6wk {
                '#8adbb4'
            } else if $in < 52wk {
                '#86aed6'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0d0d0'
            } else if $e < 1mb {
                '#8adbb4'
            } else {{ fg: '#86aed6' }}
        }

        shape_and: { fg: '#d6aed6' attr: 'b' }
        shape_binary: { fg: '#d6aed6' attr: 'b' }
        shape_block: { fg: '#86aed6' attr: 'b' }
        shape_bool: '#b1e7dd'
        shape_closure: { fg: '#8adbb4' attr: 'b' }
        shape_custom: '#aed686'
        shape_datetime: { fg: '#8adbb4' attr: 'b' }
        shape_directory: '#8adbb4'
        shape_external: '#8adbb4'
        shape_external_resolved: '#b1e7dd'
        shape_externalarg: { fg: '#aed686' attr: 'b' }
        shape_filepath: '#8adbb4'
        shape_flag: { fg: '#86aed6' attr: 'b' }
        shape_float: { fg: '#d68686' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8adbb4' attr: 'b' }
        shape_globpattern: { fg: '#8adbb4' attr: 'b' }
        shape_int: { fg: '#d6aed6' attr: 'b' }
        shape_internalcall: { fg: '#8adbb4' attr: 'b' }
        shape_keyword: { fg: '#d6aed6' attr: 'b' }
        shape_list: { fg: '#8adbb4' attr: 'b' }
        shape_literal: '#86aed6'
        shape_match_pattern: '#aed686'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d68686'
        shape_operator: '#d7af87'
        shape_or: { fg: '#d6aed6' attr: 'b' }
        shape_pipe: { fg: '#d6aed6' attr: 'b' }
        shape_range: { fg: '#d7af87' attr: 'b' }
        shape_raw_string: { fg: '#efefef' attr: 'b' }
        shape_record: { fg: '#8adbb4' attr: 'b' }
        shape_redirection: { fg: '#d6aed6' attr: 'b' }
        shape_signature: { fg: '#aed686' attr: 'b' }
        shape_string: '#aed686'
        shape_string_interpolation: { fg: '#8adbb4' attr: 'b' }
        shape_table: { fg: '#86aed6' attr: 'b' }
        shape_vardecl: { fg: '#86aed6' attr: 'u' }
        shape_variable: '#d6aed6'

        foreground: '#d0d0d0'
        background: '#262626'
        cursor: '#d0d0d0'

        empty: '#86aed6'
        header: { fg: '#aed686' attr: 'b' }
        hints: '#1c1c1c'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#aed686' attr: 'b' }
        search_result: { fg: '#d68686' bg: '#d0d0d0' }
        separator: '#d0d0d0'
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