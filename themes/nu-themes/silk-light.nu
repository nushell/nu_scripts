# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6e6582'
        block: '#39aac9'
        cell-path: '#385156'
        closure: '#329ca2'
        custom: '#d2faff'
        duration: '#cfad25'
        float: '#cf432e'
        glob: '#d2faff'
        int: '#6e6582'
        list: '#329ca2'
        nothing: '#cf432e'
        range: '#cfad25'
        record: '#329ca2'
        string: '#6ca38c'

        bool: {|| if $in { '#329ca2' } else { '#cfad25' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cf432e' attr: 'b' }
            } else if $in < 6hr {
                '#cf432e'
            } else if $in < 1day {
                '#cfad25'
            } else if $in < 3day {
                '#6ca38c'
            } else if $in < 1wk {
                { fg: '#6ca38c' attr: 'b' }
            } else if $in < 6wk {
                '#329ca2'
            } else if $in < 52wk {
                '#39aac9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#385156'
            } else if $e < 1mb {
                '#329ca2'
            } else {{ fg: '#39aac9' }}
        }

        shape_and: { fg: '#6e6582' attr: 'b' }
        shape_binary: { fg: '#6e6582' attr: 'b' }
        shape_block: { fg: '#39aac9' attr: 'b' }
        shape_bool: '#329ca2'
        shape_closure: { fg: '#329ca2' attr: 'b' }
        shape_custom: '#6ca38c'
        shape_datetime: { fg: '#329ca2' attr: 'b' }
        shape_directory: '#329ca2'
        shape_external: '#329ca2'
        shape_external_resolved: '#329ca2'
        shape_externalarg: { fg: '#6ca38c' attr: 'b' }
        shape_filepath: '#329ca2'
        shape_flag: { fg: '#39aac9' attr: 'b' }
        shape_float: { fg: '#cf432e' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#329ca2' attr: 'b' }
        shape_globpattern: { fg: '#329ca2' attr: 'b' }
        shape_int: { fg: '#6e6582' attr: 'b' }
        shape_internalcall: { fg: '#329ca2' attr: 'b' }
        shape_keyword: { fg: '#6e6582' attr: 'b' }
        shape_list: { fg: '#329ca2' attr: 'b' }
        shape_literal: '#39aac9'
        shape_match_pattern: '#6ca38c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cf432e'
        shape_operator: '#cfad25'
        shape_or: { fg: '#6e6582' attr: 'b' }
        shape_pipe: { fg: '#6e6582' attr: 'b' }
        shape_range: { fg: '#cfad25' attr: 'b' }
        shape_raw_string: { fg: '#d2faff' attr: 'b' }
        shape_record: { fg: '#329ca2' attr: 'b' }
        shape_redirection: { fg: '#6e6582' attr: 'b' }
        shape_signature: { fg: '#6ca38c' attr: 'b' }
        shape_string: '#6ca38c'
        shape_string_interpolation: { fg: '#329ca2' attr: 'b' }
        shape_table: { fg: '#39aac9' attr: 'b' }
        shape_vardecl: { fg: '#39aac9' attr: 'u' }
        shape_variable: '#6e6582'

        foreground: '#385156'
        background: '#e9f1ef'
        cursor: '#385156'

        empty: '#39aac9'
        header: { fg: '#6ca38c' attr: 'b' }
        hints: '#5c787b'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6ca38c' attr: 'b' }
        search_result: { fg: '#cf432e' bg: '#385156' }
        separator: '#385156'
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