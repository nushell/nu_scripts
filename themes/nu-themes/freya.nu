# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ec0048'
        block: '#268bd2'
        cell-path: '#94a3a5'
        closure: '#2aa198'
        custom: '#6c71c4'
        duration: '#b58900'
        float: '#cb4b16'
        glob: '#6c71c4'
        int: '#ec0048'
        list: '#2aa198'
        nothing: '#dc322f'
        range: '#b58900'
        record: '#2aa198'
        string: '#859900'

        bool: {|| if $in { '#2aa198' } else { '#b58900' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#dc322f' attr: 'b' }
            } else if $in < 6hr {
                '#dc322f'
            } else if $in < 1day {
                '#b58900'
            } else if $in < 3day {
                '#859900'
            } else if $in < 1wk {
                { fg: '#859900' attr: 'b' }
            } else if $in < 6wk {
                '#2aa198'
            } else if $in < 52wk {
                '#268bd2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#94a3a5'
            } else if $e < 1mb {
                '#2aa198'
            } else {{ fg: '#268bd2' }}
        }

        shape_and: { fg: '#ec0048' attr: 'b' }
        shape_binary: { fg: '#ec0048' attr: 'b' }
        shape_block: { fg: '#268bd2' attr: 'b' }
        shape_bool: '#2aa198'
        shape_closure: { fg: '#2aa198' attr: 'b' }
        shape_custom: '#859900'
        shape_datetime: { fg: '#2aa198' attr: 'b' }
        shape_directory: '#2aa198'
        shape_external: '#2aa198'
        shape_external_resolved: '#2aa198'
        shape_externalarg: { fg: '#859900' attr: 'b' }
        shape_filepath: '#2aa198'
        shape_flag: { fg: '#268bd2' attr: 'b' }
        shape_float: { fg: '#cb4b16' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#2aa198' attr: 'b' }
        shape_globpattern: { fg: '#2aa198' attr: 'b' }
        shape_int: { fg: '#ec0048' attr: 'b' }
        shape_internalcall: { fg: '#2aa198' attr: 'b' }
        shape_keyword: { fg: '#ec0048' attr: 'b' }
        shape_list: { fg: '#2aa198' attr: 'b' }
        shape_literal: '#268bd2'
        shape_match_pattern: '#859900'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#dc322f'
        shape_operator: '#b58900'
        shape_or: { fg: '#ec0048' attr: 'b' }
        shape_pipe: { fg: '#ec0048' attr: 'b' }
        shape_range: { fg: '#b58900' attr: 'b' }
        shape_raw_string: { fg: '#6c71c4' attr: 'b' }
        shape_record: { fg: '#2aa198' attr: 'b' }
        shape_redirection: { fg: '#ec0048' attr: 'b' }
        shape_signature: { fg: '#859900' attr: 'b' }
        shape_string: '#859900'
        shape_string_interpolation: { fg: '#2aa198' attr: 'b' }
        shape_table: { fg: '#268bd2' attr: 'b' }
        shape_vardecl: { fg: '#268bd2' attr: 'u' }
        shape_variable: '#ec0048'

        foreground: '#94a3a5'
        background: '#252e32'
        cursor: '#839496'

        empty: '#268bd2'
        header: { fg: '#859900' attr: 'b' }
        hints: '#586e75'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#859900' attr: 'b' }
        search_result: { fg: '#dc322f' bg: '#94a3a5' }
        separator: '#94a3a5'
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