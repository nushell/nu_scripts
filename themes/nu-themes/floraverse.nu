# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b7077e'
        block: '#1d6da1'
        cell-path: '#f3e0b8'
        closure: '#42a38c'
        custom: '#fff5db'
        duration: '#cd751c'
        float: '#cf2062'
        glob: '#fff5db'
        int: '#b7077e'
        list: '#42a38c'
        nothing: '#64002c'
        range: '#cd751c'
        record: '#42a38c'
        string: '#5d731a'

        bool: {|| if $in { '#62caa8' } else { '#cd751c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#64002c' attr: 'b' }
            } else if $in < 6hr {
                '#64002c'
            } else if $in < 1day {
                '#cd751c'
            } else if $in < 3day {
                '#5d731a'
            } else if $in < 1wk {
                { fg: '#5d731a' attr: 'b' }
            } else if $in < 6wk {
                '#42a38c'
            } else if $in < 52wk {
                '#1d6da1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f3e0b8'
            } else if $e < 1mb {
                '#42a38c'
            } else {{ fg: '#1d6da1' }}
        }

        shape_and: { fg: '#b7077e' attr: 'b' }
        shape_binary: { fg: '#b7077e' attr: 'b' }
        shape_block: { fg: '#1d6da1' attr: 'b' }
        shape_bool: '#62caa8'
        shape_closure: { fg: '#42a38c' attr: 'b' }
        shape_custom: '#5d731a'
        shape_datetime: { fg: '#42a38c' attr: 'b' }
        shape_directory: '#42a38c'
        shape_external: '#42a38c'
        shape_external_resolved: '#62caa8'
        shape_externalarg: { fg: '#5d731a' attr: 'b' }
        shape_filepath: '#42a38c'
        shape_flag: { fg: '#1d6da1' attr: 'b' }
        shape_float: { fg: '#cf2062' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#42a38c' attr: 'b' }
        shape_globpattern: { fg: '#42a38c' attr: 'b' }
        shape_int: { fg: '#b7077e' attr: 'b' }
        shape_internalcall: { fg: '#42a38c' attr: 'b' }
        shape_keyword: { fg: '#b7077e' attr: 'b' }
        shape_list: { fg: '#42a38c' attr: 'b' }
        shape_literal: '#1d6da1'
        shape_match_pattern: '#5d731a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#64002c'
        shape_operator: '#cd751c'
        shape_or: { fg: '#b7077e' attr: 'b' }
        shape_pipe: { fg: '#b7077e' attr: 'b' }
        shape_range: { fg: '#cd751c' attr: 'b' }
        shape_raw_string: { fg: '#fff5db' attr: 'b' }
        shape_record: { fg: '#42a38c' attr: 'b' }
        shape_redirection: { fg: '#b7077e' attr: 'b' }
        shape_signature: { fg: '#5d731a' attr: 'b' }
        shape_string: '#5d731a'
        shape_string_interpolation: { fg: '#42a38c' attr: 'b' }
        shape_table: { fg: '#1d6da1' attr: 'b' }
        shape_vardecl: { fg: '#1d6da1' attr: 'u' }
        shape_variable: '#b7077e'

        foreground: '#dbd0b9'
        background: '#0e0c15'
        cursor: '#bbbbbb'

        empty: '#1d6da1'
        header: { fg: '#5d731a' attr: 'b' }
        hints: '#331d4c'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#5d731a' attr: 'b' }
        search_result: { fg: '#64002c' bg: '#f3e0b8' }
        separator: '#f3e0b8'
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