# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b63052'
        block: '#385dc4'
        cell-path: '#eae9dd'
        closure: '#007070'
        custom: '#f8f2e5'
        duration: '#806000'
        float: '#b94000'
        glob: '#f8f2e5'
        int: '#b63052'
        list: '#007070'
        nothing: '#c81000'
        range: '#806000'
        record: '#007070'
        string: '#107410'

        bool: {|| if $in { '#337087' } else { '#806000' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c81000' attr: 'b' }
            } else if $in < 6hr {
                '#c81000'
            } else if $in < 1day {
                '#806000'
            } else if $in < 3day {
                '#107410'
            } else if $in < 1wk {
                { fg: '#107410' attr: 'b' }
            } else if $in < 6wk {
                '#007070'
            } else if $in < 52wk {
                '#385dc4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#eae9dd'
            } else if $e < 1mb {
                '#007070'
            } else {{ fg: '#385dc4' }}
        }

        shape_and: { fg: '#b63052' attr: 'b' }
        shape_binary: { fg: '#b63052' attr: 'b' }
        shape_block: { fg: '#385dc4' attr: 'b' }
        shape_bool: '#337087'
        shape_closure: { fg: '#007070' attr: 'b' }
        shape_custom: '#107410'
        shape_datetime: { fg: '#007070' attr: 'b' }
        shape_directory: '#007070'
        shape_external: '#007070'
        shape_external_resolved: '#337087'
        shape_externalarg: { fg: '#107410' attr: 'b' }
        shape_filepath: '#007070'
        shape_flag: { fg: '#385dc4' attr: 'b' }
        shape_float: { fg: '#b94000' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#007070' attr: 'b' }
        shape_globpattern: { fg: '#007070' attr: 'b' }
        shape_int: { fg: '#b63052' attr: 'b' }
        shape_internalcall: { fg: '#007070' attr: 'b' }
        shape_keyword: { fg: '#b63052' attr: 'b' }
        shape_list: { fg: '#007070' attr: 'b' }
        shape_literal: '#385dc4'
        shape_match_pattern: '#107410'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c81000'
        shape_operator: '#806000'
        shape_or: { fg: '#b63052' attr: 'b' }
        shape_pipe: { fg: '#b63052' attr: 'b' }
        shape_range: { fg: '#806000' attr: 'b' }
        shape_raw_string: { fg: '#f8f2e5' attr: 'b' }
        shape_record: { fg: '#007070' attr: 'b' }
        shape_redirection: { fg: '#b63052' attr: 'b' }
        shape_signature: { fg: '#107410' attr: 'b' }
        shape_string: '#107410'
        shape_string_interpolation: { fg: '#007070' attr: 'b' }
        shape_table: { fg: '#385dc4' attr: 'b' }
        shape_vardecl: { fg: '#385dc4' attr: 'u' }
        shape_variable: '#b63052'

        foreground: '#464340'
        background: '#f8f2e5'
        cursor: '#464340'

        empty: '#385dc4'
        header: { fg: '#107410' attr: 'b' }
        hints: '#68607d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#107410' attr: 'b' }
        search_result: { fg: '#c81000' bg: '#eae9dd' }
        separator: '#eae9dd'
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