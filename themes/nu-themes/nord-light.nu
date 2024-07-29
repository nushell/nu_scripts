# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d961dc'
        block: '#439ecf'
        cell-path: '#b3b3b3'
        closure: '#64aaaf'
        custom: '#dedede'
        duration: '#dab752'
        float: '#e4859a'
        glob: '#dedede'
        int: '#d961dc'
        list: '#64aaaf'
        nothing: '#e64569'
        range: '#dab752'
        record: '#64aaaf'
        string: '#89d287'

        bool: {|| if $in { '#96dcda' } else { '#dab752' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e64569' attr: 'b' }
            } else if $in < 6hr {
                '#e64569'
            } else if $in < 1day {
                '#dab752'
            } else if $in < 3day {
                '#89d287'
            } else if $in < 1wk {
                { fg: '#89d287' attr: 'b' }
            } else if $in < 6wk {
                '#64aaaf'
            } else if $in < 52wk {
                '#439ecf'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b3b3b3'
            } else if $e < 1mb {
                '#64aaaf'
            } else {{ fg: '#439ecf' }}
        }

        shape_and: { fg: '#d961dc' attr: 'b' }
        shape_binary: { fg: '#d961dc' attr: 'b' }
        shape_block: { fg: '#439ecf' attr: 'b' }
        shape_bool: '#96dcda'
        shape_closure: { fg: '#64aaaf' attr: 'b' }
        shape_custom: '#89d287'
        shape_datetime: { fg: '#64aaaf' attr: 'b' }
        shape_directory: '#64aaaf'
        shape_external: '#64aaaf'
        shape_external_resolved: '#96dcda'
        shape_externalarg: { fg: '#89d287' attr: 'b' }
        shape_filepath: '#64aaaf'
        shape_flag: { fg: '#439ecf' attr: 'b' }
        shape_float: { fg: '#e4859a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#64aaaf' attr: 'b' }
        shape_globpattern: { fg: '#64aaaf' attr: 'b' }
        shape_int: { fg: '#d961dc' attr: 'b' }
        shape_internalcall: { fg: '#64aaaf' attr: 'b' }
        shape_keyword: { fg: '#d961dc' attr: 'b' }
        shape_list: { fg: '#64aaaf' attr: 'b' }
        shape_literal: '#439ecf'
        shape_match_pattern: '#89d287'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e64569'
        shape_operator: '#dab752'
        shape_or: { fg: '#d961dc' attr: 'b' }
        shape_pipe: { fg: '#d961dc' attr: 'b' }
        shape_range: { fg: '#dab752' attr: 'b' }
        shape_raw_string: { fg: '#dedede' attr: 'b' }
        shape_record: { fg: '#64aaaf' attr: 'b' }
        shape_redirection: { fg: '#d961dc' attr: 'b' }
        shape_signature: { fg: '#89d287' attr: 'b' }
        shape_string: '#89d287'
        shape_string_interpolation: { fg: '#64aaaf' attr: 'b' }
        shape_table: { fg: '#439ecf' attr: 'b' }
        shape_vardecl: { fg: '#439ecf' attr: 'u' }
        shape_variable: '#d961dc'

        foreground: '#004f7c'
        background: '#ebeaf2'
        cursor: '#004f7c'

        empty: '#439ecf'
        header: { fg: '#89d287' attr: 'b' }
        hints: '#535353'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#89d287' attr: 'b' }
        search_result: { fg: '#e64569' bg: '#b3b3b3' }
        separator: '#b3b3b3'
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