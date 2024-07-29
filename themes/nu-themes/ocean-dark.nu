# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a4799d'
        block: '#7d90a4'
        cell-path: '#eeedee'
        closure: '#85a6a5'
        custom: '#fefffe'
        duration: '#e5c079'
        float: '#af4b57'
        glob: '#fefffe'
        int: '#a4799d'
        list: '#85a6a5'
        nothing: '#af4b57'
        range: '#e5c079'
        record: '#85a6a5'
        string: '#afd383'

        bool: {|| if $in { '#dfdffd' } else { '#e5c079' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#af4b57' attr: 'b' }
            } else if $in < 6hr {
                '#af4b57'
            } else if $in < 1day {
                '#e5c079'
            } else if $in < 3day {
                '#afd383'
            } else if $in < 1wk {
                { fg: '#afd383' attr: 'b' }
            } else if $in < 6wk {
                '#85a6a5'
            } else if $in < 52wk {
                '#7d90a4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#eeedee'
            } else if $e < 1mb {
                '#85a6a5'
            } else {{ fg: '#7d90a4' }}
        }

        shape_and: { fg: '#a4799d' attr: 'b' }
        shape_binary: { fg: '#a4799d' attr: 'b' }
        shape_block: { fg: '#7d90a4' attr: 'b' }
        shape_bool: '#dfdffd'
        shape_closure: { fg: '#85a6a5' attr: 'b' }
        shape_custom: '#afd383'
        shape_datetime: { fg: '#85a6a5' attr: 'b' }
        shape_directory: '#85a6a5'
        shape_external: '#85a6a5'
        shape_external_resolved: '#dfdffd'
        shape_externalarg: { fg: '#afd383' attr: 'b' }
        shape_filepath: '#85a6a5'
        shape_flag: { fg: '#7d90a4' attr: 'b' }
        shape_float: { fg: '#af4b57' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#85a6a5' attr: 'b' }
        shape_globpattern: { fg: '#85a6a5' attr: 'b' }
        shape_int: { fg: '#a4799d' attr: 'b' }
        shape_internalcall: { fg: '#85a6a5' attr: 'b' }
        shape_keyword: { fg: '#a4799d' attr: 'b' }
        shape_list: { fg: '#85a6a5' attr: 'b' }
        shape_literal: '#7d90a4'
        shape_match_pattern: '#afd383'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#af4b57'
        shape_operator: '#e5c079'
        shape_or: { fg: '#a4799d' attr: 'b' }
        shape_pipe: { fg: '#a4799d' attr: 'b' }
        shape_range: { fg: '#e5c079' attr: 'b' }
        shape_raw_string: { fg: '#fefffe' attr: 'b' }
        shape_record: { fg: '#85a6a5' attr: 'b' }
        shape_redirection: { fg: '#a4799d' attr: 'b' }
        shape_signature: { fg: '#afd383' attr: 'b' }
        shape_string: '#afd383'
        shape_string_interpolation: { fg: '#85a6a5' attr: 'b' }
        shape_table: { fg: '#7d90a4' attr: 'b' }
        shape_vardecl: { fg: '#7d90a4' attr: 'u' }
        shape_variable: '#a4799d'

        foreground: '#979cac'
        background: '#1c1f27'
        cursor: '#979cac'

        empty: '#7d90a4'
        header: { fg: '#afd383' attr: 'b' }
        hints: '#7b7b7b'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#afd383' attr: 'b' }
        search_result: { fg: '#af4b57' bg: '#eeedee' }
        separator: '#eeedee'
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