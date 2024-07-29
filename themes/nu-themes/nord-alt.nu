# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e5e9f0'
        block: '#d8dee9'
        cell-path: '#8fbcbb'
        closure: '#eceff4'
        custom: '#5e81ac'
        duration: '#4c566a'
        float: '#d08770'
        glob: '#5e81ac'
        int: '#e5e9f0'
        list: '#eceff4'
        nothing: '#3b4252'
        range: '#4c566a'
        record: '#eceff4'
        string: '#434c5e'

        bool: {|| if $in { '#b48ead' } else { '#4c566a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#3b4252' attr: 'b' }
            } else if $in < 6hr {
                '#3b4252'
            } else if $in < 1day {
                '#4c566a'
            } else if $in < 3day {
                '#434c5e'
            } else if $in < 1wk {
                { fg: '#434c5e' attr: 'b' }
            } else if $in < 6wk {
                '#eceff4'
            } else if $in < 52wk {
                '#d8dee9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#8fbcbb'
            } else if $e < 1mb {
                '#eceff4'
            } else {{ fg: '#d8dee9' }}
        }

        shape_and: { fg: '#e5e9f0' attr: 'b' }
        shape_binary: { fg: '#e5e9f0' attr: 'b' }
        shape_block: { fg: '#d8dee9' attr: 'b' }
        shape_bool: '#b48ead'
        shape_closure: { fg: '#eceff4' attr: 'b' }
        shape_custom: '#434c5e'
        shape_datetime: { fg: '#eceff4' attr: 'b' }
        shape_directory: '#eceff4'
        shape_external: '#eceff4'
        shape_external_resolved: '#b48ead'
        shape_externalarg: { fg: '#434c5e' attr: 'b' }
        shape_filepath: '#eceff4'
        shape_flag: { fg: '#d8dee9' attr: 'b' }
        shape_float: { fg: '#d08770' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#eceff4' attr: 'b' }
        shape_globpattern: { fg: '#eceff4' attr: 'b' }
        shape_int: { fg: '#e5e9f0' attr: 'b' }
        shape_internalcall: { fg: '#eceff4' attr: 'b' }
        shape_keyword: { fg: '#e5e9f0' attr: 'b' }
        shape_list: { fg: '#eceff4' attr: 'b' }
        shape_literal: '#d8dee9'
        shape_match_pattern: '#434c5e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#3b4252'
        shape_operator: '#4c566a'
        shape_or: { fg: '#e5e9f0' attr: 'b' }
        shape_pipe: { fg: '#e5e9f0' attr: 'b' }
        shape_range: { fg: '#4c566a' attr: 'b' }
        shape_raw_string: { fg: '#5e81ac' attr: 'b' }
        shape_record: { fg: '#eceff4' attr: 'b' }
        shape_redirection: { fg: '#e5e9f0' attr: 'b' }
        shape_signature: { fg: '#434c5e' attr: 'b' }
        shape_string: '#434c5e'
        shape_string_interpolation: { fg: '#eceff4' attr: 'b' }
        shape_table: { fg: '#d8dee9' attr: 'b' }
        shape_vardecl: { fg: '#d8dee9' attr: 'u' }
        shape_variable: '#e5e9f0'

        foreground: '#8fbcbb'
        background: '#2e3440'
        cursor: '#8fbcbb'

        empty: '#d8dee9'
        header: { fg: '#434c5e' attr: 'b' }
        hints: '#bf616a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#434c5e' attr: 'b' }
        search_result: { fg: '#3b4252' bg: '#8fbcbb' }
        separator: '#8fbcbb'
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