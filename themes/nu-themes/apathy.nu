# Retrieve the theme settings
export def main [] {
    return {
        binary: '#4c963e'
        block: '#96883e'
        cell-path: '#81b5ac'
        closure: '#963e4c'
        custom: '#d2e7e4'
        duration: '#3e4c96'
        float: '#3e9688'
        glob: '#d2e7e4'
        int: '#4c963e'
        list: '#963e4c'
        nothing: '#3e9688'
        range: '#3e4c96'
        record: '#963e4c'
        string: '#883e96'

        bool: {|| if $in { '#963e4c' } else { '#3e4c96' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#3e9688' attr: 'b' }
            } else if $in < 6hr {
                '#3e9688'
            } else if $in < 1day {
                '#3e4c96'
            } else if $in < 3day {
                '#883e96'
            } else if $in < 1wk {
                { fg: '#883e96' attr: 'b' }
            } else if $in < 6wk {
                '#963e4c'
            } else if $in < 52wk {
                '#96883e'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#81b5ac'
            } else if $e < 1mb {
                '#963e4c'
            } else {{ fg: '#96883e' }}
        }

        shape_and: { fg: '#4c963e' attr: 'b' }
        shape_binary: { fg: '#4c963e' attr: 'b' }
        shape_block: { fg: '#96883e' attr: 'b' }
        shape_bool: '#963e4c'
        shape_closure: { fg: '#963e4c' attr: 'b' }
        shape_custom: '#883e96'
        shape_datetime: { fg: '#963e4c' attr: 'b' }
        shape_directory: '#963e4c'
        shape_external: '#963e4c'
        shape_external_resolved: '#963e4c'
        shape_externalarg: { fg: '#883e96' attr: 'b' }
        shape_filepath: '#963e4c'
        shape_flag: { fg: '#96883e' attr: 'b' }
        shape_float: { fg: '#3e9688' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#963e4c' attr: 'b' }
        shape_globpattern: { fg: '#963e4c' attr: 'b' }
        shape_int: { fg: '#4c963e' attr: 'b' }
        shape_internalcall: { fg: '#963e4c' attr: 'b' }
        shape_keyword: { fg: '#4c963e' attr: 'b' }
        shape_list: { fg: '#963e4c' attr: 'b' }
        shape_literal: '#96883e'
        shape_match_pattern: '#883e96'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#3e9688'
        shape_operator: '#3e4c96'
        shape_or: { fg: '#4c963e' attr: 'b' }
        shape_pipe: { fg: '#4c963e' attr: 'b' }
        shape_range: { fg: '#3e4c96' attr: 'b' }
        shape_raw_string: { fg: '#d2e7e4' attr: 'b' }
        shape_record: { fg: '#963e4c' attr: 'b' }
        shape_redirection: { fg: '#4c963e' attr: 'b' }
        shape_signature: { fg: '#883e96' attr: 'b' }
        shape_string: '#883e96'
        shape_string_interpolation: { fg: '#963e4c' attr: 'b' }
        shape_table: { fg: '#96883e' attr: 'b' }
        shape_vardecl: { fg: '#96883e' attr: 'u' }
        shape_variable: '#4c963e'

        foreground: '#81b5ac'
        background: '#031a16'
        cursor: '#81b5ac'

        empty: '#96883e'
        header: { fg: '#883e96' attr: 'b' }
        hints: '#2b685e'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#883e96' attr: 'b' }
        search_result: { fg: '#3e9688' bg: '#81b5ac' }
        separator: '#81b5ac'
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