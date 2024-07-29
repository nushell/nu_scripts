# Retrieve the theme settings
export def main [] {
    return {
        binary: '#85678f'
        block: '#5f819d'
        cell-path: '#969896'
        closure: '#5e8d87'
        custom: '#c5c8c6'
        duration: '#de935f'
        float: '#cc6666'
        glob: '#c5c8c6'
        int: '#85678f'
        list: '#5e8d87'
        nothing: '#a54242'
        range: '#de935f'
        record: '#5e8d87'
        string: '#8c9440'

        bool: {|| if $in { '#8abeb7' } else { '#de935f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a54242' attr: 'b' }
            } else if $in < 6hr {
                '#a54242'
            } else if $in < 1day {
                '#de935f'
            } else if $in < 3day {
                '#8c9440'
            } else if $in < 1wk {
                { fg: '#8c9440' attr: 'b' }
            } else if $in < 6wk {
                '#5e8d87'
            } else if $in < 52wk {
                '#5f819d'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#969896'
            } else if $e < 1mb {
                '#5e8d87'
            } else {{ fg: '#5f819d' }}
        }

        shape_and: { fg: '#85678f' attr: 'b' }
        shape_binary: { fg: '#85678f' attr: 'b' }
        shape_block: { fg: '#5f819d' attr: 'b' }
        shape_bool: '#8abeb7'
        shape_closure: { fg: '#5e8d87' attr: 'b' }
        shape_custom: '#8c9440'
        shape_datetime: { fg: '#5e8d87' attr: 'b' }
        shape_directory: '#5e8d87'
        shape_external: '#5e8d87'
        shape_external_resolved: '#8abeb7'
        shape_externalarg: { fg: '#8c9440' attr: 'b' }
        shape_filepath: '#5e8d87'
        shape_flag: { fg: '#5f819d' attr: 'b' }
        shape_float: { fg: '#cc6666' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5e8d87' attr: 'b' }
        shape_globpattern: { fg: '#5e8d87' attr: 'b' }
        shape_int: { fg: '#85678f' attr: 'b' }
        shape_internalcall: { fg: '#5e8d87' attr: 'b' }
        shape_keyword: { fg: '#85678f' attr: 'b' }
        shape_list: { fg: '#5e8d87' attr: 'b' }
        shape_literal: '#5f819d'
        shape_match_pattern: '#8c9440'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a54242'
        shape_operator: '#de935f'
        shape_or: { fg: '#85678f' attr: 'b' }
        shape_pipe: { fg: '#85678f' attr: 'b' }
        shape_range: { fg: '#de935f' attr: 'b' }
        shape_raw_string: { fg: '#c5c8c6' attr: 'b' }
        shape_record: { fg: '#5e8d87' attr: 'b' }
        shape_redirection: { fg: '#85678f' attr: 'b' }
        shape_signature: { fg: '#8c9440' attr: 'b' }
        shape_string: '#8c9440'
        shape_string_interpolation: { fg: '#5e8d87' attr: 'b' }
        shape_table: { fg: '#5f819d' attr: 'b' }
        shape_vardecl: { fg: '#5f819d' attr: 'u' }
        shape_variable: '#85678f'

        foreground: '#94a3a5'
        background: '#141414'
        cursor: '#94a3a5'

        empty: '#5f819d'
        header: { fg: '#8c9440' attr: 'b' }
        hints: '#373b41'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8c9440' attr: 'b' }
        search_result: { fg: '#a54242' bg: '#969896' }
        separator: '#969896'
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