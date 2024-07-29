# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f10596'
        block: '#66b0ff'
        cell-path: '#d0d0fa'
        closure: '#0ef0f0'
        custom: '#f5f5ff'
        duration: '#f3e877'
        float: '#ff4242'
        glob: '#f5f5ff'
        int: '#f10596'
        list: '#0ef0f0'
        nothing: '#ff4242'
        range: '#f3e877'
        record: '#0ef0f0'
        string: '#59f176'

        bool: {|| if $in { '#0ef0f0' } else { '#f3e877' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff4242' attr: 'b' }
            } else if $in < 6hr {
                '#ff4242'
            } else if $in < 1day {
                '#f3e877'
            } else if $in < 3day {
                '#59f176'
            } else if $in < 1wk {
                { fg: '#59f176' attr: 'b' }
            } else if $in < 6wk {
                '#0ef0f0'
            } else if $in < 52wk {
                '#66b0ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0d0fa'
            } else if $e < 1mb {
                '#0ef0f0'
            } else {{ fg: '#66b0ff' }}
        }

        shape_and: { fg: '#f10596' attr: 'b' }
        shape_binary: { fg: '#f10596' attr: 'b' }
        shape_block: { fg: '#66b0ff' attr: 'b' }
        shape_bool: '#0ef0f0'
        shape_closure: { fg: '#0ef0f0' attr: 'b' }
        shape_custom: '#59f176'
        shape_datetime: { fg: '#0ef0f0' attr: 'b' }
        shape_directory: '#0ef0f0'
        shape_external: '#0ef0f0'
        shape_external_resolved: '#0ef0f0'
        shape_externalarg: { fg: '#59f176' attr: 'b' }
        shape_filepath: '#0ef0f0'
        shape_flag: { fg: '#66b0ff' attr: 'b' }
        shape_float: { fg: '#ff4242' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0ef0f0' attr: 'b' }
        shape_globpattern: { fg: '#0ef0f0' attr: 'b' }
        shape_int: { fg: '#f10596' attr: 'b' }
        shape_internalcall: { fg: '#0ef0f0' attr: 'b' }
        shape_keyword: { fg: '#f10596' attr: 'b' }
        shape_list: { fg: '#0ef0f0' attr: 'b' }
        shape_literal: '#66b0ff'
        shape_match_pattern: '#59f176'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff4242'
        shape_operator: '#f3e877'
        shape_or: { fg: '#f10596' attr: 'b' }
        shape_pipe: { fg: '#f10596' attr: 'b' }
        shape_range: { fg: '#f3e877' attr: 'b' }
        shape_raw_string: { fg: '#f5f5ff' attr: 'b' }
        shape_record: { fg: '#0ef0f0' attr: 'b' }
        shape_redirection: { fg: '#f10596' attr: 'b' }
        shape_signature: { fg: '#59f176' attr: 'b' }
        shape_string: '#59f176'
        shape_string_interpolation: { fg: '#0ef0f0' attr: 'b' }
        shape_table: { fg: '#66b0ff' attr: 'b' }
        shape_vardecl: { fg: '#66b0ff' attr: 'u' }
        shape_variable: '#f10596'

        foreground: '#d0d0fa'
        background: '#00002a'
        cursor: '#d0d0fa'

        empty: '#66b0ff'
        header: { fg: '#59f176' attr: 'b' }
        hints: '#50507a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#59f176' attr: 'b' }
        search_result: { fg: '#ff4242' bg: '#d0d0fa' }
        separator: '#d0d0fa'
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