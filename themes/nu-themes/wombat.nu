# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e86aff'
        block: '#5da9f6'
        cell-path: '#dedacf'
        closure: '#82fff7'
        custom: '#ffffff'
        duration: '#ebd99c'
        float: '#f58c80'
        glob: '#ffffff'
        int: '#e86aff'
        list: '#82fff7'
        nothing: '#ff615a'
        range: '#ebd99c'
        record: '#82fff7'
        string: '#b1e969'

        bool: {|| if $in { '#b7fff9' } else { '#ebd99c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff615a' attr: 'b' }
            } else if $in < 6hr {
                '#ff615a'
            } else if $in < 1day {
                '#ebd99c'
            } else if $in < 3day {
                '#b1e969'
            } else if $in < 1wk {
                { fg: '#b1e969' attr: 'b' }
            } else if $in < 6wk {
                '#82fff7'
            } else if $in < 52wk {
                '#5da9f6'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#dedacf'
            } else if $e < 1mb {
                '#82fff7'
            } else {{ fg: '#5da9f6' }}
        }

        shape_and: { fg: '#e86aff' attr: 'b' }
        shape_binary: { fg: '#e86aff' attr: 'b' }
        shape_block: { fg: '#5da9f6' attr: 'b' }
        shape_bool: '#b7fff9'
        shape_closure: { fg: '#82fff7' attr: 'b' }
        shape_custom: '#b1e969'
        shape_datetime: { fg: '#82fff7' attr: 'b' }
        shape_directory: '#82fff7'
        shape_external: '#82fff7'
        shape_external_resolved: '#b7fff9'
        shape_externalarg: { fg: '#b1e969' attr: 'b' }
        shape_filepath: '#82fff7'
        shape_flag: { fg: '#5da9f6' attr: 'b' }
        shape_float: { fg: '#f58c80' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#82fff7' attr: 'b' }
        shape_globpattern: { fg: '#82fff7' attr: 'b' }
        shape_int: { fg: '#e86aff' attr: 'b' }
        shape_internalcall: { fg: '#82fff7' attr: 'b' }
        shape_keyword: { fg: '#e86aff' attr: 'b' }
        shape_list: { fg: '#82fff7' attr: 'b' }
        shape_literal: '#5da9f6'
        shape_match_pattern: '#b1e969'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff615a'
        shape_operator: '#ebd99c'
        shape_or: { fg: '#e86aff' attr: 'b' }
        shape_pipe: { fg: '#e86aff' attr: 'b' }
        shape_range: { fg: '#ebd99c' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#82fff7' attr: 'b' }
        shape_redirection: { fg: '#e86aff' attr: 'b' }
        shape_signature: { fg: '#b1e969' attr: 'b' }
        shape_string: '#b1e969'
        shape_string_interpolation: { fg: '#82fff7' attr: 'b' }
        shape_table: { fg: '#5da9f6' attr: 'b' }
        shape_vardecl: { fg: '#5da9f6' attr: 'u' }
        shape_variable: '#e86aff'

        foreground: '#dedacf'
        background: '#171717'
        cursor: '#dedacf'

        empty: '#5da9f6'
        header: { fg: '#b1e969' attr: 'b' }
        hints: '#313131'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b1e969' attr: 'b' }
        search_result: { fg: '#ff615a' bg: '#dedacf' }
        separator: '#dedacf'
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