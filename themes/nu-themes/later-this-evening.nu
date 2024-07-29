# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c092d6'
        block: '#a0bad6'
        cell-path: '#3c3d3d'
        closure: '#91bfb7'
        custom: '#c1c2c2'
        duration: '#e5d289'
        float: '#d3232f'
        glob: '#c1c2c2'
        int: '#c092d6'
        list: '#91bfb7'
        nothing: '#d45a60'
        range: '#e5d289'
        record: '#91bfb7'
        string: '#afba67'

        bool: {|| if $in { '#5fc0ae' } else { '#e5d289' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d45a60' attr: 'b' }
            } else if $in < 6hr {
                '#d45a60'
            } else if $in < 1day {
                '#e5d289'
            } else if $in < 3day {
                '#afba67'
            } else if $in < 1wk {
                { fg: '#afba67' attr: 'b' }
            } else if $in < 6wk {
                '#91bfb7'
            } else if $in < 52wk {
                '#a0bad6'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#3c3d3d'
            } else if $e < 1mb {
                '#91bfb7'
            } else {{ fg: '#a0bad6' }}
        }

        shape_and: { fg: '#c092d6' attr: 'b' }
        shape_binary: { fg: '#c092d6' attr: 'b' }
        shape_block: { fg: '#a0bad6' attr: 'b' }
        shape_bool: '#5fc0ae'
        shape_closure: { fg: '#91bfb7' attr: 'b' }
        shape_custom: '#afba67'
        shape_datetime: { fg: '#91bfb7' attr: 'b' }
        shape_directory: '#91bfb7'
        shape_external: '#91bfb7'
        shape_external_resolved: '#5fc0ae'
        shape_externalarg: { fg: '#afba67' attr: 'b' }
        shape_filepath: '#91bfb7'
        shape_flag: { fg: '#a0bad6' attr: 'b' }
        shape_float: { fg: '#d3232f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#91bfb7' attr: 'b' }
        shape_globpattern: { fg: '#91bfb7' attr: 'b' }
        shape_int: { fg: '#c092d6' attr: 'b' }
        shape_internalcall: { fg: '#91bfb7' attr: 'b' }
        shape_keyword: { fg: '#c092d6' attr: 'b' }
        shape_list: { fg: '#91bfb7' attr: 'b' }
        shape_literal: '#a0bad6'
        shape_match_pattern: '#afba67'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d45a60'
        shape_operator: '#e5d289'
        shape_or: { fg: '#c092d6' attr: 'b' }
        shape_pipe: { fg: '#c092d6' attr: 'b' }
        shape_range: { fg: '#e5d289' attr: 'b' }
        shape_raw_string: { fg: '#c1c2c2' attr: 'b' }
        shape_record: { fg: '#91bfb7' attr: 'b' }
        shape_redirection: { fg: '#c092d6' attr: 'b' }
        shape_signature: { fg: '#afba67' attr: 'b' }
        shape_string: '#afba67'
        shape_string_interpolation: { fg: '#91bfb7' attr: 'b' }
        shape_table: { fg: '#a0bad6' attr: 'b' }
        shape_vardecl: { fg: '#a0bad6' attr: 'u' }
        shape_variable: '#c092d6'

        foreground: '#959595'
        background: '#222222'
        cursor: '#959595'

        empty: '#a0bad6'
        header: { fg: '#afba67' attr: 'b' }
        hints: '#454747'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#afba67' attr: 'b' }
        search_result: { fg: '#d45a60' bg: '#3c3d3d' }
        separator: '#3c3d3d'
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