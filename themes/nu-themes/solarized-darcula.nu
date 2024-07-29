# Retrieve the theme settings
export def main [] {
    return {
        binary: '#797fd4'
        block: '#2075c7'
        cell-path: '#d2d8d9'
        closure: '#15968d'
        custom: '#d2d8d9'
        duration: '#b68800'
        float: '#f24840'
        glob: '#d2d8d9'
        int: '#797fd4'
        list: '#15968d'
        nothing: '#f24840'
        range: '#b68800'
        record: '#15968d'
        string: '#629655'

        bool: {|| if $in { '#15968d' } else { '#b68800' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f24840' attr: 'b' }
            } else if $in < 6hr {
                '#f24840'
            } else if $in < 1day {
                '#b68800'
            } else if $in < 3day {
                '#629655'
            } else if $in < 1wk {
                { fg: '#629655' attr: 'b' }
            } else if $in < 6wk {
                '#15968d'
            } else if $in < 52wk {
                '#2075c7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d2d8d9'
            } else if $e < 1mb {
                '#15968d'
            } else {{ fg: '#2075c7' }}
        }

        shape_and: { fg: '#797fd4' attr: 'b' }
        shape_binary: { fg: '#797fd4' attr: 'b' }
        shape_block: { fg: '#2075c7' attr: 'b' }
        shape_bool: '#15968d'
        shape_closure: { fg: '#15968d' attr: 'b' }
        shape_custom: '#629655'
        shape_datetime: { fg: '#15968d' attr: 'b' }
        shape_directory: '#15968d'
        shape_external: '#15968d'
        shape_external_resolved: '#15968d'
        shape_externalarg: { fg: '#629655' attr: 'b' }
        shape_filepath: '#15968d'
        shape_flag: { fg: '#2075c7' attr: 'b' }
        shape_float: { fg: '#f24840' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#15968d' attr: 'b' }
        shape_globpattern: { fg: '#15968d' attr: 'b' }
        shape_int: { fg: '#797fd4' attr: 'b' }
        shape_internalcall: { fg: '#15968d' attr: 'b' }
        shape_keyword: { fg: '#797fd4' attr: 'b' }
        shape_list: { fg: '#15968d' attr: 'b' }
        shape_literal: '#2075c7'
        shape_match_pattern: '#629655'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f24840'
        shape_operator: '#b68800'
        shape_or: { fg: '#797fd4' attr: 'b' }
        shape_pipe: { fg: '#797fd4' attr: 'b' }
        shape_range: { fg: '#b68800' attr: 'b' }
        shape_raw_string: { fg: '#d2d8d9' attr: 'b' }
        shape_record: { fg: '#15968d' attr: 'b' }
        shape_redirection: { fg: '#797fd4' attr: 'b' }
        shape_signature: { fg: '#629655' attr: 'b' }
        shape_string: '#629655'
        shape_string_interpolation: { fg: '#15968d' attr: 'b' }
        shape_table: { fg: '#2075c7' attr: 'b' }
        shape_vardecl: { fg: '#2075c7' attr: 'u' }
        shape_variable: '#797fd4'

        foreground: '#d2d8d9'
        background: '#3d3f41'
        cursor: '#d2d8d9'

        empty: '#2075c7'
        header: { fg: '#629655' attr: 'b' }
        hints: '#25292a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#629655' attr: 'b' }
        search_result: { fg: '#f24840' bg: '#d2d8d9' }
        separator: '#d2d8d9'
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