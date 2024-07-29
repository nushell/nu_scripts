# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8250df'
        block: '#0969da'
        cell-path: '#6e7781'
        closure: '#1b7c83'
        custom: '#8c959f'
        duration: '#4d2d00'
        float: '#a40e26'
        glob: '#8c959f'
        int: '#8250df'
        list: '#1b7c83'
        nothing: '#cf222e'
        range: '#4d2d00'
        record: '#1b7c83'
        string: '#116329'

        bool: {|| if $in { '#3192aa' } else { '#4d2d00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cf222e' attr: 'b' }
            } else if $in < 6hr {
                '#cf222e'
            } else if $in < 1day {
                '#4d2d00'
            } else if $in < 3day {
                '#116329'
            } else if $in < 1wk {
                { fg: '#116329' attr: 'b' }
            } else if $in < 6wk {
                '#1b7c83'
            } else if $in < 52wk {
                '#0969da'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#6e7781'
            } else if $e < 1mb {
                '#1b7c83'
            } else {{ fg: '#0969da' }}
        }

        shape_and: { fg: '#8250df' attr: 'b' }
        shape_binary: { fg: '#8250df' attr: 'b' }
        shape_block: { fg: '#0969da' attr: 'b' }
        shape_bool: '#3192aa'
        shape_closure: { fg: '#1b7c83' attr: 'b' }
        shape_custom: '#116329'
        shape_datetime: { fg: '#1b7c83' attr: 'b' }
        shape_directory: '#1b7c83'
        shape_external: '#1b7c83'
        shape_external_resolved: '#3192aa'
        shape_externalarg: { fg: '#116329' attr: 'b' }
        shape_filepath: '#1b7c83'
        shape_flag: { fg: '#0969da' attr: 'b' }
        shape_float: { fg: '#a40e26' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1b7c83' attr: 'b' }
        shape_globpattern: { fg: '#1b7c83' attr: 'b' }
        shape_int: { fg: '#8250df' attr: 'b' }
        shape_internalcall: { fg: '#1b7c83' attr: 'b' }
        shape_keyword: { fg: '#8250df' attr: 'b' }
        shape_list: { fg: '#1b7c83' attr: 'b' }
        shape_literal: '#0969da'
        shape_match_pattern: '#116329'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cf222e'
        shape_operator: '#4d2d00'
        shape_or: { fg: '#8250df' attr: 'b' }
        shape_pipe: { fg: '#8250df' attr: 'b' }
        shape_range: { fg: '#4d2d00' attr: 'b' }
        shape_raw_string: { fg: '#8c959f' attr: 'b' }
        shape_record: { fg: '#1b7c83' attr: 'b' }
        shape_redirection: { fg: '#8250df' attr: 'b' }
        shape_signature: { fg: '#116329' attr: 'b' }
        shape_string: '#116329'
        shape_string_interpolation: { fg: '#1b7c83' attr: 'b' }
        shape_table: { fg: '#0969da' attr: 'b' }
        shape_vardecl: { fg: '#0969da' attr: 'u' }
        shape_variable: '#8250df'

        foreground: '#0E1116'
        background: '#ffffff'
        cursor: '#044289'

        empty: '#0969da'
        header: { fg: '#116329' attr: 'b' }
        hints: '#57606a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#116329' attr: 'b' }
        search_result: { fg: '#cf222e' bg: '#6e7781' }
        separator: '#6e7781'
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