# Retrieve the theme settings
export def main [] {
    return {
        binary: '#864651'
        block: '#485b98'
        cell-path: '#c9c9c9'
        closure: '#9c814f'
        custom: '#ffffff'
        duration: '#9d602a'
        float: '#aa000c'
        glob: '#ffffff'
        int: '#864651'
        list: '#9c814f'
        nothing: '#a7463d'
        range: '#9d602a'
        record: '#9c814f'
        string: '#587744'

        bool: {|| if $in { '#fad484' } else { '#9d602a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a7463d' attr: 'b' }
            } else if $in < 6hr {
                '#a7463d'
            } else if $in < 1day {
                '#9d602a'
            } else if $in < 3day {
                '#587744'
            } else if $in < 1wk {
                { fg: '#587744' attr: 'b' }
            } else if $in < 6wk {
                '#9c814f'
            } else if $in < 52wk {
                '#485b98'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c9c9c9'
            } else if $e < 1mb {
                '#9c814f'
            } else {{ fg: '#485b98' }}
        }

        shape_and: { fg: '#864651' attr: 'b' }
        shape_binary: { fg: '#864651' attr: 'b' }
        shape_block: { fg: '#485b98' attr: 'b' }
        shape_bool: '#fad484'
        shape_closure: { fg: '#9c814f' attr: 'b' }
        shape_custom: '#587744'
        shape_datetime: { fg: '#9c814f' attr: 'b' }
        shape_directory: '#9c814f'
        shape_external: '#9c814f'
        shape_external_resolved: '#fad484'
        shape_externalarg: { fg: '#587744' attr: 'b' }
        shape_filepath: '#9c814f'
        shape_flag: { fg: '#485b98' attr: 'b' }
        shape_float: { fg: '#aa000c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#9c814f' attr: 'b' }
        shape_globpattern: { fg: '#9c814f' attr: 'b' }
        shape_int: { fg: '#864651' attr: 'b' }
        shape_internalcall: { fg: '#9c814f' attr: 'b' }
        shape_keyword: { fg: '#864651' attr: 'b' }
        shape_list: { fg: '#9c814f' attr: 'b' }
        shape_literal: '#485b98'
        shape_match_pattern: '#587744'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a7463d'
        shape_operator: '#9d602a'
        shape_or: { fg: '#864651' attr: 'b' }
        shape_pipe: { fg: '#864651' attr: 'b' }
        shape_range: { fg: '#9d602a' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#9c814f' attr: 'b' }
        shape_redirection: { fg: '#864651' attr: 'b' }
        shape_signature: { fg: '#587744' attr: 'b' }
        shape_string: '#587744'
        shape_string_interpolation: { fg: '#9c814f' attr: 'b' }
        shape_table: { fg: '#485b98' attr: 'b' }
        shape_vardecl: { fg: '#485b98' attr: 'u' }
        shape_variable: '#864651'

        foreground: '#c9c9c9'
        background: '#1a1818'
        cursor: '#c9c9c9'

        empty: '#485b98'
        header: { fg: '#587744' attr: 'b' }
        hints: '#4d4e48'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#587744' attr: 'b' }
        search_result: { fg: '#a7463d' bg: '#c9c9c9' }
        separator: '#c9c9c9'
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