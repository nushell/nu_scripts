# Retrieve the theme settings
export def main [] {
    return {
        binary: '#dc8cc3'
        block: '#7cb8bb'
        cell-path: '#dcdccc'
        closure: '#93e0e3'
        custom: '#ffffff'
        duration: '#e0cf9f'
        float: '#dca3a3'
        glob: '#ffffff'
        int: '#dc8cc3'
        list: '#93e0e3'
        nothing: '#dca3a3'
        range: '#e0cf9f'
        record: '#93e0e3'
        string: '#5f7f5f'

        bool: {|| if $in { '#93e0e3' } else { '#e0cf9f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#dca3a3' attr: 'b' }
            } else if $in < 6hr {
                '#dca3a3'
            } else if $in < 1day {
                '#e0cf9f'
            } else if $in < 3day {
                '#5f7f5f'
            } else if $in < 1wk {
                { fg: '#5f7f5f' attr: 'b' }
            } else if $in < 6wk {
                '#93e0e3'
            } else if $in < 52wk {
                '#7cb8bb'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#dcdccc'
            } else if $e < 1mb {
                '#93e0e3'
            } else {{ fg: '#7cb8bb' }}
        }

        shape_and: { fg: '#dc8cc3' attr: 'b' }
        shape_binary: { fg: '#dc8cc3' attr: 'b' }
        shape_block: { fg: '#7cb8bb' attr: 'b' }
        shape_bool: '#93e0e3'
        shape_closure: { fg: '#93e0e3' attr: 'b' }
        shape_custom: '#5f7f5f'
        shape_datetime: { fg: '#93e0e3' attr: 'b' }
        shape_directory: '#93e0e3'
        shape_external: '#93e0e3'
        shape_external_resolved: '#93e0e3'
        shape_externalarg: { fg: '#5f7f5f' attr: 'b' }
        shape_filepath: '#93e0e3'
        shape_flag: { fg: '#7cb8bb' attr: 'b' }
        shape_float: { fg: '#dca3a3' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#93e0e3' attr: 'b' }
        shape_globpattern: { fg: '#93e0e3' attr: 'b' }
        shape_int: { fg: '#dc8cc3' attr: 'b' }
        shape_internalcall: { fg: '#93e0e3' attr: 'b' }
        shape_keyword: { fg: '#dc8cc3' attr: 'b' }
        shape_list: { fg: '#93e0e3' attr: 'b' }
        shape_literal: '#7cb8bb'
        shape_match_pattern: '#5f7f5f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#dca3a3'
        shape_operator: '#e0cf9f'
        shape_or: { fg: '#dc8cc3' attr: 'b' }
        shape_pipe: { fg: '#dc8cc3' attr: 'b' }
        shape_range: { fg: '#e0cf9f' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#93e0e3' attr: 'b' }
        shape_redirection: { fg: '#dc8cc3' attr: 'b' }
        shape_signature: { fg: '#5f7f5f' attr: 'b' }
        shape_string: '#5f7f5f'
        shape_string_interpolation: { fg: '#93e0e3' attr: 'b' }
        shape_table: { fg: '#7cb8bb' attr: 'b' }
        shape_vardecl: { fg: '#7cb8bb' attr: 'u' }
        shape_variable: '#dc8cc3'

        foreground: '#dcdccc'
        background: '#383838'
        cursor: '#dcdccc'

        empty: '#7cb8bb'
        header: { fg: '#5f7f5f' attr: 'b' }
        hints: '#6f6f6f'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#5f7f5f' attr: 'b' }
        search_result: { fg: '#dca3a3' bg: '#dcdccc' }
        separator: '#dcdccc'
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