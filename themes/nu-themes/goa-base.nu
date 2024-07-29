# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f43bff'
        block: '#000482'
        cell-path: '#000000'
        closure: '#3affff'
        custom: '#f5f4fb'
        duration: '#f40000'
        float: '#f800e1'
        glob: '#f5f4fb'
        int: '#f43bff'
        list: '#3affff'
        nothing: '#f78000'
        range: '#f40000'
        record: '#3affff'
        string: '#249000'

        bool: {|| if $in { '#c8f9f3' } else { '#f40000' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f78000' attr: 'b' }
            } else if $in < 6hr {
                '#f78000'
            } else if $in < 1day {
                '#f40000'
            } else if $in < 3day {
                '#249000'
            } else if $in < 1wk {
                { fg: '#249000' attr: 'b' }
            } else if $in < 6wk {
                '#3affff'
            } else if $in < 52wk {
                '#000482'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#000000'
            } else if $e < 1mb {
                '#3affff'
            } else {{ fg: '#000482' }}
        }

        shape_and: { fg: '#f43bff' attr: 'b' }
        shape_binary: { fg: '#f43bff' attr: 'b' }
        shape_block: { fg: '#000482' attr: 'b' }
        shape_bool: '#c8f9f3'
        shape_closure: { fg: '#3affff' attr: 'b' }
        shape_custom: '#249000'
        shape_datetime: { fg: '#3affff' attr: 'b' }
        shape_directory: '#3affff'
        shape_external: '#3affff'
        shape_external_resolved: '#c8f9f3'
        shape_externalarg: { fg: '#249000' attr: 'b' }
        shape_filepath: '#3affff'
        shape_flag: { fg: '#000482' attr: 'b' }
        shape_float: { fg: '#f800e1' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3affff' attr: 'b' }
        shape_globpattern: { fg: '#3affff' attr: 'b' }
        shape_int: { fg: '#f43bff' attr: 'b' }
        shape_internalcall: { fg: '#3affff' attr: 'b' }
        shape_keyword: { fg: '#f43bff' attr: 'b' }
        shape_list: { fg: '#3affff' attr: 'b' }
        shape_literal: '#000482'
        shape_match_pattern: '#249000'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f78000'
        shape_operator: '#f40000'
        shape_or: { fg: '#f43bff' attr: 'b' }
        shape_pipe: { fg: '#f43bff' attr: 'b' }
        shape_range: { fg: '#f40000' attr: 'b' }
        shape_raw_string: { fg: '#f5f4fb' attr: 'b' }
        shape_record: { fg: '#3affff' attr: 'b' }
        shape_redirection: { fg: '#f43bff' attr: 'b' }
        shape_signature: { fg: '#249000' attr: 'b' }
        shape_string: '#249000'
        shape_string_interpolation: { fg: '#3affff' attr: 'b' }
        shape_table: { fg: '#000482' attr: 'b' }
        shape_vardecl: { fg: '#000482' attr: 'u' }
        shape_variable: '#f43bff'

        foreground: '#f6ed00'
        background: '#2f0033'
        cursor: '#1a6500'

        empty: '#000482'
        header: { fg: '#249000' attr: 'b' }
        hints: '#411a6d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#249000' attr: 'b' }
        search_result: { fg: '#f78000' bg: '#000000' }
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