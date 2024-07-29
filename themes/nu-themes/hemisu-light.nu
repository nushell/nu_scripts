# Retrieve the theme settings
export def main [] {
    return {
        binary: '#5b345e'
        block: '#538091'
        cell-path: '#999999'
        closure: '#538091'
        custom: '#bababa'
        duration: '#503d15'
        float: '#d65e76'
        glob: '#bababa'
        int: '#5b345e'
        list: '#538091'
        nothing: '#ff0055'
        range: '#503d15'
        record: '#538091'
        string: '#739100'

        bool: {|| if $in { '#85b2aa' } else { '#503d15' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff0055' attr: 'b' }
            } else if $in < 6hr {
                '#ff0055'
            } else if $in < 1day {
                '#503d15'
            } else if $in < 3day {
                '#739100'
            } else if $in < 1wk {
                { fg: '#739100' attr: 'b' }
            } else if $in < 6wk {
                '#538091'
            } else if $in < 52wk {
                '#538091'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#999999'
            } else if $e < 1mb {
                '#538091'
            } else {{ fg: '#538091' }}
        }

        shape_and: { fg: '#5b345e' attr: 'b' }
        shape_binary: { fg: '#5b345e' attr: 'b' }
        shape_block: { fg: '#538091' attr: 'b' }
        shape_bool: '#85b2aa'
        shape_closure: { fg: '#538091' attr: 'b' }
        shape_custom: '#739100'
        shape_datetime: { fg: '#538091' attr: 'b' }
        shape_directory: '#538091'
        shape_external: '#538091'
        shape_external_resolved: '#85b2aa'
        shape_externalarg: { fg: '#739100' attr: 'b' }
        shape_filepath: '#538091'
        shape_flag: { fg: '#538091' attr: 'b' }
        shape_float: { fg: '#d65e76' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#538091' attr: 'b' }
        shape_globpattern: { fg: '#538091' attr: 'b' }
        shape_int: { fg: '#5b345e' attr: 'b' }
        shape_internalcall: { fg: '#538091' attr: 'b' }
        shape_keyword: { fg: '#5b345e' attr: 'b' }
        shape_list: { fg: '#538091' attr: 'b' }
        shape_literal: '#538091'
        shape_match_pattern: '#739100'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff0055'
        shape_operator: '#503d15'
        shape_or: { fg: '#5b345e' attr: 'b' }
        shape_pipe: { fg: '#5b345e' attr: 'b' }
        shape_range: { fg: '#503d15' attr: 'b' }
        shape_raw_string: { fg: '#bababa' attr: 'b' }
        shape_record: { fg: '#538091' attr: 'b' }
        shape_redirection: { fg: '#5b345e' attr: 'b' }
        shape_signature: { fg: '#739100' attr: 'b' }
        shape_string: '#739100'
        shape_string_interpolation: { fg: '#538091' attr: 'b' }
        shape_table: { fg: '#538091' attr: 'b' }
        shape_vardecl: { fg: '#538091' attr: 'u' }
        shape_variable: '#5b345e'

        foreground: '#444444'
        background: '#efefef'
        cursor: '#ff0054'

        empty: '#538091'
        header: { fg: '#739100' attr: 'b' }
        hints: '#999999'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#739100' attr: 'b' }
        search_result: { fg: '#ff0055' bg: '#999999' }
        separator: '#999999'
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