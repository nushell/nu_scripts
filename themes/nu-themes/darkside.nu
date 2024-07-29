# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8e69c9'
        block: '#1c98e8'
        cell-path: '#bababa'
        closure: '#1c98e8'
        custom: '#bababa'
        duration: '#f2d42c'
        float: '#e05a4f'
        glob: '#bababa'
        int: '#8e69c9'
        list: '#1c98e8'
        nothing: '#e8341c'
        range: '#f2d42c'
        record: '#1c98e8'
        string: '#68c256'

        bool: {|| if $in { '#3d97e2' } else { '#f2d42c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e8341c' attr: 'b' }
            } else if $in < 6hr {
                '#e8341c'
            } else if $in < 1day {
                '#f2d42c'
            } else if $in < 3day {
                '#68c256'
            } else if $in < 1wk {
                { fg: '#68c256' attr: 'b' }
            } else if $in < 6wk {
                '#1c98e8'
            } else if $in < 52wk {
                '#1c98e8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bababa'
            } else if $e < 1mb {
                '#1c98e8'
            } else {{ fg: '#1c98e8' }}
        }

        shape_and: { fg: '#8e69c9' attr: 'b' }
        shape_binary: { fg: '#8e69c9' attr: 'b' }
        shape_block: { fg: '#1c98e8' attr: 'b' }
        shape_bool: '#3d97e2'
        shape_closure: { fg: '#1c98e8' attr: 'b' }
        shape_custom: '#68c256'
        shape_datetime: { fg: '#1c98e8' attr: 'b' }
        shape_directory: '#1c98e8'
        shape_external: '#1c98e8'
        shape_external_resolved: '#3d97e2'
        shape_externalarg: { fg: '#68c256' attr: 'b' }
        shape_filepath: '#1c98e8'
        shape_flag: { fg: '#1c98e8' attr: 'b' }
        shape_float: { fg: '#e05a4f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1c98e8' attr: 'b' }
        shape_globpattern: { fg: '#1c98e8' attr: 'b' }
        shape_int: { fg: '#8e69c9' attr: 'b' }
        shape_internalcall: { fg: '#1c98e8' attr: 'b' }
        shape_keyword: { fg: '#8e69c9' attr: 'b' }
        shape_list: { fg: '#1c98e8' attr: 'b' }
        shape_literal: '#1c98e8'
        shape_match_pattern: '#68c256'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e8341c'
        shape_operator: '#f2d42c'
        shape_or: { fg: '#8e69c9' attr: 'b' }
        shape_pipe: { fg: '#8e69c9' attr: 'b' }
        shape_range: { fg: '#f2d42c' attr: 'b' }
        shape_raw_string: { fg: '#bababa' attr: 'b' }
        shape_record: { fg: '#1c98e8' attr: 'b' }
        shape_redirection: { fg: '#8e69c9' attr: 'b' }
        shape_signature: { fg: '#68c256' attr: 'b' }
        shape_string: '#68c256'
        shape_string_interpolation: { fg: '#1c98e8' attr: 'b' }
        shape_table: { fg: '#1c98e8' attr: 'b' }
        shape_vardecl: { fg: '#1c98e8' attr: 'u' }
        shape_variable: '#8e69c9'

        foreground: '#bababa'
        background: '#222324'
        cursor: '#bababa'

        empty: '#1c98e8'
        header: { fg: '#68c256' attr: 'b' }
        hints: '#000000'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#68c256' attr: 'b' }
        search_result: { fg: '#e8341c' bg: '#bababa' }
        separator: '#bababa'
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