# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff3600'
        block: '#ff3600'
        cell-path: '#ff3600'
        closure: '#ff3600'
        custom: '#ff3600'
        duration: '#ff3600'
        float: '#ff3600'
        glob: '#ff3600'
        int: '#ff3600'
        list: '#ff3600'
        nothing: '#ff3600'
        range: '#ff3600'
        record: '#ff3600'
        string: '#ff3600'

        bool: {|| if $in { '#ff3600' } else { '#ff3600' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff3600' attr: 'b' }
            } else if $in < 6hr {
                '#ff3600'
            } else if $in < 1day {
                '#ff3600'
            } else if $in < 3day {
                '#ff3600'
            } else if $in < 1wk {
                { fg: '#ff3600' attr: 'b' }
            } else if $in < 6wk {
                '#ff3600'
            } else if $in < 52wk {
                '#ff3600'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ff3600'
            } else if $e < 1mb {
                '#ff3600'
            } else {{ fg: '#ff3600' }}
        }

        shape_and: { fg: '#ff3600' attr: 'b' }
        shape_binary: { fg: '#ff3600' attr: 'b' }
        shape_block: { fg: '#ff3600' attr: 'b' }
        shape_bool: '#ff3600'
        shape_closure: { fg: '#ff3600' attr: 'b' }
        shape_custom: '#ff3600'
        shape_datetime: { fg: '#ff3600' attr: 'b' }
        shape_directory: '#ff3600'
        shape_external: '#ff3600'
        shape_external_resolved: '#ff3600'
        shape_externalarg: { fg: '#ff3600' attr: 'b' }
        shape_filepath: '#ff3600'
        shape_flag: { fg: '#ff3600' attr: 'b' }
        shape_float: { fg: '#ff3600' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#ff3600' attr: 'b' }
        shape_globpattern: { fg: '#ff3600' attr: 'b' }
        shape_int: { fg: '#ff3600' attr: 'b' }
        shape_internalcall: { fg: '#ff3600' attr: 'b' }
        shape_keyword: { fg: '#ff3600' attr: 'b' }
        shape_list: { fg: '#ff3600' attr: 'b' }
        shape_literal: '#ff3600'
        shape_match_pattern: '#ff3600'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff3600'
        shape_operator: '#ff3600'
        shape_or: { fg: '#ff3600' attr: 'b' }
        shape_pipe: { fg: '#ff3600' attr: 'b' }
        shape_range: { fg: '#ff3600' attr: 'b' }
        shape_raw_string: { fg: '#ff3600' attr: 'b' }
        shape_record: { fg: '#ff3600' attr: 'b' }
        shape_redirection: { fg: '#ff3600' attr: 'b' }
        shape_signature: { fg: '#ff3600' attr: 'b' }
        shape_string: '#ff3600'
        shape_string_interpolation: { fg: '#ff3600' attr: 'b' }
        shape_table: { fg: '#ff3600' attr: 'b' }
        shape_vardecl: { fg: '#ff3600' attr: 'u' }
        shape_variable: '#ff3600'

        foreground: '#ff3600'
        background: '#2b0c00'
        cursor: '#ff3600'

        empty: '#ff3600'
        header: { fg: '#ff3600' attr: 'b' }
        hints: '#ff3600'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#ff3600' attr: 'b' }
        search_result: { fg: '#ff3600' bg: '#ff3600' }
        separator: '#ff3600'
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