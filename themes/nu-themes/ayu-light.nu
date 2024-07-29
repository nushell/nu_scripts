# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f07078'
        block: '#41a6d9'
        cell-path: '#ffffff'
        closure: '#4cbe99'
        custom: '#ffffff'
        duration: '#f19618'
        float: '#ff6565'
        glob: '#ffffff'
        int: '#f07078'
        list: '#4cbe99'
        nothing: '#ff3333'
        range: '#f19618'
        record: '#4cbe99'
        string: '#86b200'

        bool: {|| if $in { '#7ff0cb' } else { '#f19618' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff3333' attr: 'b' }
            } else if $in < 6hr {
                '#ff3333'
            } else if $in < 1day {
                '#f19618'
            } else if $in < 3day {
                '#86b200'
            } else if $in < 1wk {
                { fg: '#86b200' attr: 'b' }
            } else if $in < 6wk {
                '#4cbe99'
            } else if $in < 52wk {
                '#41a6d9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#4cbe99'
            } else {{ fg: '#41a6d9' }}
        }

        shape_and: { fg: '#f07078' attr: 'b' }
        shape_binary: { fg: '#f07078' attr: 'b' }
        shape_block: { fg: '#41a6d9' attr: 'b' }
        shape_bool: '#7ff0cb'
        shape_closure: { fg: '#4cbe99' attr: 'b' }
        shape_custom: '#86b200'
        shape_datetime: { fg: '#4cbe99' attr: 'b' }
        shape_directory: '#4cbe99'
        shape_external: '#4cbe99'
        shape_external_resolved: '#7ff0cb'
        shape_externalarg: { fg: '#86b200' attr: 'b' }
        shape_filepath: '#4cbe99'
        shape_flag: { fg: '#41a6d9' attr: 'b' }
        shape_float: { fg: '#ff6565' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#4cbe99' attr: 'b' }
        shape_globpattern: { fg: '#4cbe99' attr: 'b' }
        shape_int: { fg: '#f07078' attr: 'b' }
        shape_internalcall: { fg: '#4cbe99' attr: 'b' }
        shape_keyword: { fg: '#f07078' attr: 'b' }
        shape_list: { fg: '#4cbe99' attr: 'b' }
        shape_literal: '#41a6d9'
        shape_match_pattern: '#86b200'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff3333'
        shape_operator: '#f19618'
        shape_or: { fg: '#f07078' attr: 'b' }
        shape_pipe: { fg: '#f07078' attr: 'b' }
        shape_range: { fg: '#f19618' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#4cbe99' attr: 'b' }
        shape_redirection: { fg: '#f07078' attr: 'b' }
        shape_signature: { fg: '#86b200' attr: 'b' }
        shape_string: '#86b200'
        shape_string_interpolation: { fg: '#4cbe99' attr: 'b' }
        shape_table: { fg: '#41a6d9' attr: 'b' }
        shape_vardecl: { fg: '#41a6d9' attr: 'u' }
        shape_variable: '#f07078'

        foreground: '#5b6673'
        background: '#fafafa'
        cursor: '#ff6900'

        empty: '#41a6d9'
        header: { fg: '#86b200' attr: 'b' }
        hints: '#323232'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#86b200' attr: 'b' }
        search_result: { fg: '#ff3333' bg: '#ffffff' }
        separator: '#ffffff'
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