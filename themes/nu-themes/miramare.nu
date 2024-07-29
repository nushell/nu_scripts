# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d3a0bc'
        block: '#89beba'
        cell-path: '#444444'
        closure: '#87c095'
        custom: '#444444'
        duration: '#d9bb80'
        float: '#e68183'
        glob: '#444444'
        int: '#d3a0bc'
        list: '#87c095'
        nothing: '#e68183'
        range: '#d9bb80'
        record: '#87c095'
        string: '#87af87'

        bool: {|| if $in { '#87c095' } else { '#d9bb80' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e68183' attr: 'b' }
            } else if $in < 6hr {
                '#e68183'
            } else if $in < 1day {
                '#d9bb80'
            } else if $in < 3day {
                '#87af87'
            } else if $in < 1wk {
                { fg: '#87af87' attr: 'b' }
            } else if $in < 6wk {
                '#87c095'
            } else if $in < 52wk {
                '#89beba'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#444444'
            } else if $e < 1mb {
                '#87c095'
            } else {{ fg: '#89beba' }}
        }

        shape_and: { fg: '#d3a0bc' attr: 'b' }
        shape_binary: { fg: '#d3a0bc' attr: 'b' }
        shape_block: { fg: '#89beba' attr: 'b' }
        shape_bool: '#87c095'
        shape_closure: { fg: '#87c095' attr: 'b' }
        shape_custom: '#87af87'
        shape_datetime: { fg: '#87c095' attr: 'b' }
        shape_directory: '#87c095'
        shape_external: '#87c095'
        shape_external_resolved: '#87c095'
        shape_externalarg: { fg: '#87af87' attr: 'b' }
        shape_filepath: '#87c095'
        shape_flag: { fg: '#89beba' attr: 'b' }
        shape_float: { fg: '#e68183' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#87c095' attr: 'b' }
        shape_globpattern: { fg: '#87c095' attr: 'b' }
        shape_int: { fg: '#d3a0bc' attr: 'b' }
        shape_internalcall: { fg: '#87c095' attr: 'b' }
        shape_keyword: { fg: '#d3a0bc' attr: 'b' }
        shape_list: { fg: '#87c095' attr: 'b' }
        shape_literal: '#89beba'
        shape_match_pattern: '#87af87'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e68183'
        shape_operator: '#d9bb80'
        shape_or: { fg: '#d3a0bc' attr: 'b' }
        shape_pipe: { fg: '#d3a0bc' attr: 'b' }
        shape_range: { fg: '#d9bb80' attr: 'b' }
        shape_raw_string: { fg: '#444444' attr: 'b' }
        shape_record: { fg: '#87c095' attr: 'b' }
        shape_redirection: { fg: '#d3a0bc' attr: 'b' }
        shape_signature: { fg: '#87af87' attr: 'b' }
        shape_string: '#87af87'
        shape_string_interpolation: { fg: '#87c095' attr: 'b' }
        shape_table: { fg: '#89beba' attr: 'b' }
        shape_vardecl: { fg: '#89beba' attr: 'u' }
        shape_variable: '#d3a0bc'

        foreground: '#e6d6ac'
        background: '#2a2426'
        cursor: '#d9bb80'

        empty: '#89beba'
        header: { fg: '#87af87' attr: 'b' }
        hints: '#e6d6ac'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#87af87' attr: 'b' }
        search_result: { fg: '#e68183' bg: '#444444' }
        separator: '#444444'
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