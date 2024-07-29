# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c594c5'
        block: '#6699cc'
        cell-path: '#c0c5ce'
        closure: '#5fb3b3'
        custom: '#d8dee9'
        duration: '#fac863'
        float: '#ec5f67'
        glob: '#d8dee9'
        int: '#c594c5'
        list: '#5fb3b3'
        nothing: '#ec5f67'
        range: '#fac863'
        record: '#5fb3b3'
        string: '#99c794'

        bool: {|| if $in { '#5fb3b3' } else { '#fac863' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ec5f67' attr: 'b' }
            } else if $in < 6hr {
                '#ec5f67'
            } else if $in < 1day {
                '#fac863'
            } else if $in < 3day {
                '#99c794'
            } else if $in < 1wk {
                { fg: '#99c794' attr: 'b' }
            } else if $in < 6wk {
                '#5fb3b3'
            } else if $in < 52wk {
                '#6699cc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c0c5ce'
            } else if $e < 1mb {
                '#5fb3b3'
            } else {{ fg: '#6699cc' }}
        }

        shape_and: { fg: '#c594c5' attr: 'b' }
        shape_binary: { fg: '#c594c5' attr: 'b' }
        shape_block: { fg: '#6699cc' attr: 'b' }
        shape_bool: '#5fb3b3'
        shape_closure: { fg: '#5fb3b3' attr: 'b' }
        shape_custom: '#99c794'
        shape_datetime: { fg: '#5fb3b3' attr: 'b' }
        shape_directory: '#5fb3b3'
        shape_external: '#5fb3b3'
        shape_external_resolved: '#5fb3b3'
        shape_externalarg: { fg: '#99c794' attr: 'b' }
        shape_filepath: '#5fb3b3'
        shape_flag: { fg: '#6699cc' attr: 'b' }
        shape_float: { fg: '#ec5f67' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5fb3b3' attr: 'b' }
        shape_globpattern: { fg: '#5fb3b3' attr: 'b' }
        shape_int: { fg: '#c594c5' attr: 'b' }
        shape_internalcall: { fg: '#5fb3b3' attr: 'b' }
        shape_keyword: { fg: '#c594c5' attr: 'b' }
        shape_list: { fg: '#5fb3b3' attr: 'b' }
        shape_literal: '#6699cc'
        shape_match_pattern: '#99c794'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ec5f67'
        shape_operator: '#fac863'
        shape_or: { fg: '#c594c5' attr: 'b' }
        shape_pipe: { fg: '#c594c5' attr: 'b' }
        shape_range: { fg: '#fac863' attr: 'b' }
        shape_raw_string: { fg: '#d8dee9' attr: 'b' }
        shape_record: { fg: '#5fb3b3' attr: 'b' }
        shape_redirection: { fg: '#c594c5' attr: 'b' }
        shape_signature: { fg: '#99c794' attr: 'b' }
        shape_string: '#99c794'
        shape_string_interpolation: { fg: '#5fb3b3' attr: 'b' }
        shape_table: { fg: '#6699cc' attr: 'b' }
        shape_vardecl: { fg: '#6699cc' attr: 'u' }
        shape_variable: '#c594c5'

        foreground: '#c0c5ce'
        background: '#1b2b34'
        cursor: '#c0c5ce'

        empty: '#6699cc'
        header: { fg: '#99c794' attr: 'b' }
        hints: '#65737e'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#99c794' attr: 'b' }
        search_result: { fg: '#ec5f67' bg: '#c0c5ce' }
        separator: '#c0c5ce'
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