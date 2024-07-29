# Retrieve the theme settings
export def main [] {
    return {
        binary: '#00acc1'
        block: '#00bcd4'
        cell-path: '#095b67'
        closure: '#26c6da'
        custom: '#109cb0'
        duration: '#80deea'
        float: '#16c1d9'
        glob: '#109cb0'
        int: '#00acc1'
        list: '#26c6da'
        nothing: '#16c1d9'
        range: '#80deea'
        record: '#26c6da'
        string: '#4dd0e1'

        bool: {|| if $in { '#26c6da' } else { '#80deea' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#16c1d9' attr: 'b' }
            } else if $in < 6hr {
                '#16c1d9'
            } else if $in < 1day {
                '#80deea'
            } else if $in < 3day {
                '#4dd0e1'
            } else if $in < 1wk {
                { fg: '#4dd0e1' attr: 'b' }
            } else if $in < 6wk {
                '#26c6da'
            } else if $in < 52wk {
                '#00bcd4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#095b67'
            } else if $e < 1mb {
                '#26c6da'
            } else {{ fg: '#00bcd4' }}
        }

        shape_and: { fg: '#00acc1' attr: 'b' }
        shape_binary: { fg: '#00acc1' attr: 'b' }
        shape_block: { fg: '#00bcd4' attr: 'b' }
        shape_bool: '#26c6da'
        shape_closure: { fg: '#26c6da' attr: 'b' }
        shape_custom: '#4dd0e1'
        shape_datetime: { fg: '#26c6da' attr: 'b' }
        shape_directory: '#26c6da'
        shape_external: '#26c6da'
        shape_external_resolved: '#26c6da'
        shape_externalarg: { fg: '#4dd0e1' attr: 'b' }
        shape_filepath: '#26c6da'
        shape_flag: { fg: '#00bcd4' attr: 'b' }
        shape_float: { fg: '#16c1d9' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#26c6da' attr: 'b' }
        shape_globpattern: { fg: '#26c6da' attr: 'b' }
        shape_int: { fg: '#00acc1' attr: 'b' }
        shape_internalcall: { fg: '#26c6da' attr: 'b' }
        shape_keyword: { fg: '#00acc1' attr: 'b' }
        shape_list: { fg: '#26c6da' attr: 'b' }
        shape_literal: '#00bcd4'
        shape_match_pattern: '#4dd0e1'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#16c1d9'
        shape_operator: '#80deea'
        shape_or: { fg: '#00acc1' attr: 'b' }
        shape_pipe: { fg: '#00acc1' attr: 'b' }
        shape_range: { fg: '#80deea' attr: 'b' }
        shape_raw_string: { fg: '#109cb0' attr: 'b' }
        shape_record: { fg: '#26c6da' attr: 'b' }
        shape_redirection: { fg: '#00acc1' attr: 'b' }
        shape_signature: { fg: '#4dd0e1' attr: 'b' }
        shape_string: '#4dd0e1'
        shape_string_interpolation: { fg: '#26c6da' attr: 'b' }
        shape_table: { fg: '#00bcd4' attr: 'b' }
        shape_vardecl: { fg: '#00bcd4' attr: 'u' }
        shape_variable: '#00acc1'

        foreground: '#095b67'
        background: '#021012'
        cursor: '#095b67'

        empty: '#00bcd4'
        header: { fg: '#4dd0e1' attr: 'b' }
        hints: '#052e34'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#4dd0e1' attr: 'b' }
        search_result: { fg: '#16c1d9' bg: '#095b67' }
        separator: '#095b67'
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