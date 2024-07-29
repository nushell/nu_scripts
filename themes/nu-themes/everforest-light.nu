# Retrieve the theme settings
export def main [] {
    return {
        binary: '#df69ba'
        block: '#3a94c5'
        cell-path: '#dfddc8'
        closure: '#35a77c'
        custom: '#dfddc8'
        duration: '#dfa000'
        float: '#f85552'
        glob: '#dfddc8'
        int: '#df69ba'
        list: '#35a77c'
        nothing: '#f85552'
        range: '#dfa000'
        record: '#35a77c'
        string: '#8da101'

        bool: {|| if $in { '#35a77c' } else { '#dfa000' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f85552' attr: 'b' }
            } else if $in < 6hr {
                '#f85552'
            } else if $in < 1day {
                '#dfa000'
            } else if $in < 3day {
                '#8da101'
            } else if $in < 1wk {
                { fg: '#8da101' attr: 'b' }
            } else if $in < 6wk {
                '#35a77c'
            } else if $in < 52wk {
                '#3a94c5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#dfddc8'
            } else if $e < 1mb {
                '#35a77c'
            } else {{ fg: '#3a94c5' }}
        }

        shape_and: { fg: '#df69ba' attr: 'b' }
        shape_binary: { fg: '#df69ba' attr: 'b' }
        shape_block: { fg: '#3a94c5' attr: 'b' }
        shape_bool: '#35a77c'
        shape_closure: { fg: '#35a77c' attr: 'b' }
        shape_custom: '#8da101'
        shape_datetime: { fg: '#35a77c' attr: 'b' }
        shape_directory: '#35a77c'
        shape_external: '#35a77c'
        shape_external_resolved: '#35a77c'
        shape_externalarg: { fg: '#8da101' attr: 'b' }
        shape_filepath: '#35a77c'
        shape_flag: { fg: '#3a94c5' attr: 'b' }
        shape_float: { fg: '#f85552' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#35a77c' attr: 'b' }
        shape_globpattern: { fg: '#35a77c' attr: 'b' }
        shape_int: { fg: '#df69ba' attr: 'b' }
        shape_internalcall: { fg: '#35a77c' attr: 'b' }
        shape_keyword: { fg: '#df69ba' attr: 'b' }
        shape_list: { fg: '#35a77c' attr: 'b' }
        shape_literal: '#3a94c5'
        shape_match_pattern: '#8da101'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f85552'
        shape_operator: '#dfa000'
        shape_or: { fg: '#df69ba' attr: 'b' }
        shape_pipe: { fg: '#df69ba' attr: 'b' }
        shape_range: { fg: '#dfa000' attr: 'b' }
        shape_raw_string: { fg: '#dfddc8' attr: 'b' }
        shape_record: { fg: '#35a77c' attr: 'b' }
        shape_redirection: { fg: '#df69ba' attr: 'b' }
        shape_signature: { fg: '#8da101' attr: 'b' }
        shape_string: '#8da101'
        shape_string_interpolation: { fg: '#35a77c' attr: 'b' }
        shape_table: { fg: '#3a94c5' attr: 'b' }
        shape_vardecl: { fg: '#3a94c5' attr: 'u' }
        shape_variable: '#df69ba'

        foreground: '#5c6a72'
        background: '#f8f0dc'
        cursor: '#5c6a72'

        empty: '#3a94c5'
        header: { fg: '#8da101' attr: 'b' }
        hints: '#5c6a72'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8da101' attr: 'b' }
        search_result: { fg: '#f85552' bg: '#dfddc8' }
        separator: '#dfddc8'
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