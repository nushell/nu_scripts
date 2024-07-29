# Retrieve the theme settings
export def main [] {
    return {
        binary: '#5a32a3'
        block: '#0366d6'
        cell-path: '#6a737d'
        closure: '#0598bc'
        custom: '#d1d5da'
        duration: '#dbab09'
        float: '#cb2431'
        glob: '#d1d5da'
        int: '#5a32a3'
        list: '#0598bc'
        nothing: '#d73a49'
        range: '#dbab09'
        record: '#0598bc'
        string: '#28a745'

        bool: {|| if $in { '#3192aa' } else { '#dbab09' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d73a49' attr: 'b' }
            } else if $in < 6hr {
                '#d73a49'
            } else if $in < 1day {
                '#dbab09'
            } else if $in < 3day {
                '#28a745'
            } else if $in < 1wk {
                { fg: '#28a745' attr: 'b' }
            } else if $in < 6wk {
                '#0598bc'
            } else if $in < 52wk {
                '#0366d6'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#6a737d'
            } else if $e < 1mb {
                '#0598bc'
            } else {{ fg: '#0366d6' }}
        }

        shape_and: { fg: '#5a32a3' attr: 'b' }
        shape_binary: { fg: '#5a32a3' attr: 'b' }
        shape_block: { fg: '#0366d6' attr: 'b' }
        shape_bool: '#3192aa'
        shape_closure: { fg: '#0598bc' attr: 'b' }
        shape_custom: '#28a745'
        shape_datetime: { fg: '#0598bc' attr: 'b' }
        shape_directory: '#0598bc'
        shape_external: '#0598bc'
        shape_external_resolved: '#3192aa'
        shape_externalarg: { fg: '#28a745' attr: 'b' }
        shape_filepath: '#0598bc'
        shape_flag: { fg: '#0366d6' attr: 'b' }
        shape_float: { fg: '#cb2431' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0598bc' attr: 'b' }
        shape_globpattern: { fg: '#0598bc' attr: 'b' }
        shape_int: { fg: '#5a32a3' attr: 'b' }
        shape_internalcall: { fg: '#0598bc' attr: 'b' }
        shape_keyword: { fg: '#5a32a3' attr: 'b' }
        shape_list: { fg: '#0598bc' attr: 'b' }
        shape_literal: '#0366d6'
        shape_match_pattern: '#28a745'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d73a49'
        shape_operator: '#dbab09'
        shape_or: { fg: '#5a32a3' attr: 'b' }
        shape_pipe: { fg: '#5a32a3' attr: 'b' }
        shape_range: { fg: '#dbab09' attr: 'b' }
        shape_raw_string: { fg: '#d1d5da' attr: 'b' }
        shape_record: { fg: '#0598bc' attr: 'b' }
        shape_redirection: { fg: '#5a32a3' attr: 'b' }
        shape_signature: { fg: '#28a745' attr: 'b' }
        shape_string: '#28a745'
        shape_string_interpolation: { fg: '#0598bc' attr: 'b' }
        shape_table: { fg: '#0366d6' attr: 'b' }
        shape_vardecl: { fg: '#0366d6' attr: 'u' }
        shape_variable: '#5a32a3'

        foreground: '#24292f'
        background: '#ffffff'
        cursor: '#044289'

        empty: '#0366d6'
        header: { fg: '#28a745' attr: 'b' }
        hints: '#959da5'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#28a745' attr: 'b' }
        search_result: { fg: '#d73a49' bg: '#6a737d' }
        separator: '#6a737d'
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