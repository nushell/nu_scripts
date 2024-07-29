# Retrieve the theme settings
export def main [] {
    return {
        binary: '#747474'
        block: '#686868'
        cell-path: '#b9b9b9'
        closure: '#868686'
        custom: '#f7f7f7'
        duration: '#a0a0a0'
        float: '#7c7c7c'
        glob: '#f7f7f7'
        int: '#747474'
        list: '#868686'
        nothing: '#7c7c7c'
        range: '#a0a0a0'
        record: '#868686'
        string: '#8e8e8e'

        bool: {|| if $in { '#868686' } else { '#a0a0a0' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#7c7c7c' attr: 'b' }
            } else if $in < 6hr {
                '#7c7c7c'
            } else if $in < 1day {
                '#a0a0a0'
            } else if $in < 3day {
                '#8e8e8e'
            } else if $in < 1wk {
                { fg: '#8e8e8e' attr: 'b' }
            } else if $in < 6wk {
                '#868686'
            } else if $in < 52wk {
                '#686868'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b9b9b9'
            } else if $e < 1mb {
                '#868686'
            } else {{ fg: '#686868' }}
        }

        shape_and: { fg: '#747474' attr: 'b' }
        shape_binary: { fg: '#747474' attr: 'b' }
        shape_block: { fg: '#686868' attr: 'b' }
        shape_bool: '#868686'
        shape_closure: { fg: '#868686' attr: 'b' }
        shape_custom: '#8e8e8e'
        shape_datetime: { fg: '#868686' attr: 'b' }
        shape_directory: '#868686'
        shape_external: '#868686'
        shape_external_resolved: '#868686'
        shape_externalarg: { fg: '#8e8e8e' attr: 'b' }
        shape_filepath: '#868686'
        shape_flag: { fg: '#686868' attr: 'b' }
        shape_float: { fg: '#7c7c7c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#868686' attr: 'b' }
        shape_globpattern: { fg: '#868686' attr: 'b' }
        shape_int: { fg: '#747474' attr: 'b' }
        shape_internalcall: { fg: '#868686' attr: 'b' }
        shape_keyword: { fg: '#747474' attr: 'b' }
        shape_list: { fg: '#868686' attr: 'b' }
        shape_literal: '#686868'
        shape_match_pattern: '#8e8e8e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#7c7c7c'
        shape_operator: '#a0a0a0'
        shape_or: { fg: '#747474' attr: 'b' }
        shape_pipe: { fg: '#747474' attr: 'b' }
        shape_range: { fg: '#a0a0a0' attr: 'b' }
        shape_raw_string: { fg: '#f7f7f7' attr: 'b' }
        shape_record: { fg: '#868686' attr: 'b' }
        shape_redirection: { fg: '#747474' attr: 'b' }
        shape_signature: { fg: '#8e8e8e' attr: 'b' }
        shape_string: '#8e8e8e'
        shape_string_interpolation: { fg: '#868686' attr: 'b' }
        shape_table: { fg: '#686868' attr: 'b' }
        shape_vardecl: { fg: '#686868' attr: 'u' }
        shape_variable: '#747474'

        foreground: '#b9b9b9'
        background: '#101010'
        cursor: '#b9b9b9'

        empty: '#686868'
        header: { fg: '#8e8e8e' attr: 'b' }
        hints: '#525252'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8e8e8e' attr: 'b' }
        search_result: { fg: '#7c7c7c' bg: '#b9b9b9' }
        separator: '#b9b9b9'
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