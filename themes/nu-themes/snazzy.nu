# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff6ac1'
        block: '#57c7ff'
        cell-path: '#e2e4e5'
        closure: '#9aedfe'
        custom: '#f1f1f0'
        duration: '#f3f99d'
        float: '#ff5c57'
        glob: '#f1f1f0'
        int: '#ff6ac1'
        list: '#9aedfe'
        nothing: '#ff5c57'
        range: '#f3f99d'
        record: '#9aedfe'
        string: '#5af78e'

        bool: {|| if $in { '#9aedfe' } else { '#f3f99d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff5c57' attr: 'b' }
            } else if $in < 6hr {
                '#ff5c57'
            } else if $in < 1day {
                '#f3f99d'
            } else if $in < 3day {
                '#5af78e'
            } else if $in < 1wk {
                { fg: '#5af78e' attr: 'b' }
            } else if $in < 6wk {
                '#9aedfe'
            } else if $in < 52wk {
                '#57c7ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e2e4e5'
            } else if $e < 1mb {
                '#9aedfe'
            } else {{ fg: '#57c7ff' }}
        }

        shape_and: { fg: '#ff6ac1' attr: 'b' }
        shape_binary: { fg: '#ff6ac1' attr: 'b' }
        shape_block: { fg: '#57c7ff' attr: 'b' }
        shape_bool: '#9aedfe'
        shape_closure: { fg: '#9aedfe' attr: 'b' }
        shape_custom: '#5af78e'
        shape_datetime: { fg: '#9aedfe' attr: 'b' }
        shape_directory: '#9aedfe'
        shape_external: '#9aedfe'
        shape_external_resolved: '#9aedfe'
        shape_externalarg: { fg: '#5af78e' attr: 'b' }
        shape_filepath: '#9aedfe'
        shape_flag: { fg: '#57c7ff' attr: 'b' }
        shape_float: { fg: '#ff5c57' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#9aedfe' attr: 'b' }
        shape_globpattern: { fg: '#9aedfe' attr: 'b' }
        shape_int: { fg: '#ff6ac1' attr: 'b' }
        shape_internalcall: { fg: '#9aedfe' attr: 'b' }
        shape_keyword: { fg: '#ff6ac1' attr: 'b' }
        shape_list: { fg: '#9aedfe' attr: 'b' }
        shape_literal: '#57c7ff'
        shape_match_pattern: '#5af78e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff5c57'
        shape_operator: '#f3f99d'
        shape_or: { fg: '#ff6ac1' attr: 'b' }
        shape_pipe: { fg: '#ff6ac1' attr: 'b' }
        shape_range: { fg: '#f3f99d' attr: 'b' }
        shape_raw_string: { fg: '#f1f1f0' attr: 'b' }
        shape_record: { fg: '#9aedfe' attr: 'b' }
        shape_redirection: { fg: '#ff6ac1' attr: 'b' }
        shape_signature: { fg: '#5af78e' attr: 'b' }
        shape_string: '#5af78e'
        shape_string_interpolation: { fg: '#9aedfe' attr: 'b' }
        shape_table: { fg: '#57c7ff' attr: 'b' }
        shape_vardecl: { fg: '#57c7ff' attr: 'u' }
        shape_variable: '#ff6ac1'

        foreground: '#e2e4e5'
        background: '#282a36'
        cursor: '#e2e4e5'

        empty: '#57c7ff'
        header: { fg: '#5af78e' attr: 'b' }
        hints: '#78787e'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#5af78e' attr: 'b' }
        search_result: { fg: '#ff5c57' bg: '#e2e4e5' }
        separator: '#e2e4e5'
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