# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a353b2'
        block: '#3b5ea7'
        cell-path: '#ffffff'
        closure: '#66781d'
        custom: '#f1f1f1'
        duration: '#cc6e33'
        float: '#da3365'
        glob: '#f1f1f1'
        int: '#a353b2'
        list: '#66781d'
        nothing: '#b23670'
        range: '#cc6e33'
        record: '#66781d'
        string: '#66781d'

        bool: {|| if $in { '#829428' } else { '#cc6e33' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b23670' attr: 'b' }
            } else if $in < 6hr {
                '#b23670'
            } else if $in < 1day {
                '#cc6e33'
            } else if $in < 3day {
                '#66781d'
            } else if $in < 1wk {
                { fg: '#66781d' attr: 'b' }
            } else if $in < 6wk {
                '#66781d'
            } else if $in < 52wk {
                '#3b5ea7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#66781d'
            } else {{ fg: '#3b5ea7' }}
        }

        shape_and: { fg: '#a353b2' attr: 'b' }
        shape_binary: { fg: '#a353b2' attr: 'b' }
        shape_block: { fg: '#3b5ea7' attr: 'b' }
        shape_bool: '#829428'
        shape_closure: { fg: '#66781d' attr: 'b' }
        shape_custom: '#66781d'
        shape_datetime: { fg: '#66781d' attr: 'b' }
        shape_directory: '#66781d'
        shape_external: '#66781d'
        shape_external_resolved: '#829428'
        shape_externalarg: { fg: '#66781d' attr: 'b' }
        shape_filepath: '#66781d'
        shape_flag: { fg: '#3b5ea7' attr: 'b' }
        shape_float: { fg: '#da3365' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#66781d' attr: 'b' }
        shape_globpattern: { fg: '#66781d' attr: 'b' }
        shape_int: { fg: '#a353b2' attr: 'b' }
        shape_internalcall: { fg: '#66781d' attr: 'b' }
        shape_keyword: { fg: '#a353b2' attr: 'b' }
        shape_list: { fg: '#66781d' attr: 'b' }
        shape_literal: '#3b5ea7'
        shape_match_pattern: '#66781d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b23670'
        shape_operator: '#cc6e33'
        shape_or: { fg: '#a353b2' attr: 'b' }
        shape_pipe: { fg: '#a353b2' attr: 'b' }
        shape_range: { fg: '#cc6e33' attr: 'b' }
        shape_raw_string: { fg: '#f1f1f1' attr: 'b' }
        shape_record: { fg: '#66781d' attr: 'b' }
        shape_redirection: { fg: '#a353b2' attr: 'b' }
        shape_signature: { fg: '#66781d' attr: 'b' }
        shape_string: '#66781d'
        shape_string_interpolation: { fg: '#66781d' attr: 'b' }
        shape_table: { fg: '#3b5ea7' attr: 'b' }
        shape_vardecl: { fg: '#3b5ea7' attr: 'u' }
        shape_variable: '#a353b2'

        foreground: '#414141'
        background: '#ffffff'
        cursor: '#5e76c7'

        empty: '#3b5ea7'
        header: { fg: '#66781d' attr: 'b' }
        hints: '#3e3e3e'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#66781d' attr: 'b' }
        search_result: { fg: '#b23670' bg: '#ffffff' }
        separator: '#ffffff'
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