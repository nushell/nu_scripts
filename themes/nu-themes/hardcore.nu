# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9e6ffe'
        block: '#66d9ef'
        cell-path: '#cdcdcd'
        closure: '#708387'
        custom: '#ffffff'
        duration: '#e6db74'
        float: '#f92672'
        glob: '#ffffff'
        int: '#9e6ffe'
        list: '#708387'
        nothing: '#f92672'
        range: '#e6db74'
        record: '#708387'
        string: '#a6e22e'

        bool: {|| if $in { '#708387' } else { '#e6db74' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f92672' attr: 'b' }
            } else if $in < 6hr {
                '#f92672'
            } else if $in < 1day {
                '#e6db74'
            } else if $in < 3day {
                '#a6e22e'
            } else if $in < 1wk {
                { fg: '#a6e22e' attr: 'b' }
            } else if $in < 6wk {
                '#708387'
            } else if $in < 52wk {
                '#66d9ef'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cdcdcd'
            } else if $e < 1mb {
                '#708387'
            } else {{ fg: '#66d9ef' }}
        }

        shape_and: { fg: '#9e6ffe' attr: 'b' }
        shape_binary: { fg: '#9e6ffe' attr: 'b' }
        shape_block: { fg: '#66d9ef' attr: 'b' }
        shape_bool: '#708387'
        shape_closure: { fg: '#708387' attr: 'b' }
        shape_custom: '#a6e22e'
        shape_datetime: { fg: '#708387' attr: 'b' }
        shape_directory: '#708387'
        shape_external: '#708387'
        shape_external_resolved: '#708387'
        shape_externalarg: { fg: '#a6e22e' attr: 'b' }
        shape_filepath: '#708387'
        shape_flag: { fg: '#66d9ef' attr: 'b' }
        shape_float: { fg: '#f92672' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#708387' attr: 'b' }
        shape_globpattern: { fg: '#708387' attr: 'b' }
        shape_int: { fg: '#9e6ffe' attr: 'b' }
        shape_internalcall: { fg: '#708387' attr: 'b' }
        shape_keyword: { fg: '#9e6ffe' attr: 'b' }
        shape_list: { fg: '#708387' attr: 'b' }
        shape_literal: '#66d9ef'
        shape_match_pattern: '#a6e22e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f92672'
        shape_operator: '#e6db74'
        shape_or: { fg: '#9e6ffe' attr: 'b' }
        shape_pipe: { fg: '#9e6ffe' attr: 'b' }
        shape_range: { fg: '#e6db74' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#708387' attr: 'b' }
        shape_redirection: { fg: '#9e6ffe' attr: 'b' }
        shape_signature: { fg: '#a6e22e' attr: 'b' }
        shape_string: '#a6e22e'
        shape_string_interpolation: { fg: '#708387' attr: 'b' }
        shape_table: { fg: '#66d9ef' attr: 'b' }
        shape_vardecl: { fg: '#66d9ef' attr: 'u' }
        shape_variable: '#9e6ffe'

        foreground: '#cdcdcd'
        background: '#212121'
        cursor: '#cdcdcd'

        empty: '#66d9ef'
        header: { fg: '#a6e22e' attr: 'b' }
        hints: '#4a4a4a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a6e22e' attr: 'b' }
        search_result: { fg: '#f92672' bg: '#cdcdcd' }
        separator: '#cdcdcd'
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