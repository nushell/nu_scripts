# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9b1d29'
        block: '#515c5d'
        cell-path: '#f7d75c'
        closure: '#588056'
        custom: '#ffe598'
        duration: '#c36e28'
        float: '#ff4331'
        glob: '#ffe598'
        int: '#9b1d29'
        list: '#588056'
        nothing: '#9b291c'
        range: '#c36e28'
        record: '#588056'
        string: '#636232'

        bool: {|| if $in { '#8acd8f' } else { '#c36e28' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#9b291c' attr: 'b' }
            } else if $in < 6hr {
                '#9b291c'
            } else if $in < 1day {
                '#c36e28'
            } else if $in < 3day {
                '#636232'
            } else if $in < 1wk {
                { fg: '#636232' attr: 'b' }
            } else if $in < 6wk {
                '#588056'
            } else if $in < 52wk {
                '#515c5d'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f7d75c'
            } else if $e < 1mb {
                '#588056'
            } else {{ fg: '#515c5d' }}
        }

        shape_and: { fg: '#9b1d29' attr: 'b' }
        shape_binary: { fg: '#9b1d29' attr: 'b' }
        shape_block: { fg: '#515c5d' attr: 'b' }
        shape_bool: '#8acd8f'
        shape_closure: { fg: '#588056' attr: 'b' }
        shape_custom: '#636232'
        shape_datetime: { fg: '#588056' attr: 'b' }
        shape_directory: '#588056'
        shape_external: '#588056'
        shape_external_resolved: '#8acd8f'
        shape_externalarg: { fg: '#636232' attr: 'b' }
        shape_filepath: '#588056'
        shape_flag: { fg: '#515c5d' attr: 'b' }
        shape_float: { fg: '#ff4331' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#588056' attr: 'b' }
        shape_globpattern: { fg: '#588056' attr: 'b' }
        shape_int: { fg: '#9b1d29' attr: 'b' }
        shape_internalcall: { fg: '#588056' attr: 'b' }
        shape_keyword: { fg: '#9b1d29' attr: 'b' }
        shape_list: { fg: '#588056' attr: 'b' }
        shape_literal: '#515c5d'
        shape_match_pattern: '#636232'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#9b291c'
        shape_operator: '#c36e28'
        shape_or: { fg: '#9b1d29' attr: 'b' }
        shape_pipe: { fg: '#9b1d29' attr: 'b' }
        shape_range: { fg: '#c36e28' attr: 'b' }
        shape_raw_string: { fg: '#ffe598' attr: 'b' }
        shape_record: { fg: '#588056' attr: 'b' }
        shape_redirection: { fg: '#9b1d29' attr: 'b' }
        shape_signature: { fg: '#636232' attr: 'b' }
        shape_string: '#636232'
        shape_string_interpolation: { fg: '#588056' attr: 'b' }
        shape_table: { fg: '#515c5d' attr: 'b' }
        shape_vardecl: { fg: '#515c5d' attr: 'u' }
        shape_variable: '#9b1d29'

        foreground: '#f7d66a'
        background: '#120b0d'
        cursor: '#f7d66a'

        empty: '#515c5d'
        header: { fg: '#636232' attr: 'b' }
        hints: '#874228'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#636232' attr: 'b' }
        search_result: { fg: '#9b291c' bg: '#f7d75c' }
        separator: '#f7d75c'
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