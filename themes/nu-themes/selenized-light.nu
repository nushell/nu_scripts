# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ca4898'
        block: '#0072d4'
        cell-path: '#909995'
        closure: '#009c8f'
        custom: '#3a4d53'
        duration: '#ad8900'
        float: '#cc1729'
        glob: '#3a4d53'
        int: '#ca4898'
        list: '#009c8f'
        nothing: '#d2212d'
        range: '#ad8900'
        record: '#009c8f'
        string: '#489100'

        bool: {|| if $in { '#00978a' } else { '#ad8900' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d2212d' attr: 'b' }
            } else if $in < 6hr {
                '#d2212d'
            } else if $in < 1day {
                '#ad8900'
            } else if $in < 3day {
                '#489100'
            } else if $in < 1wk {
                { fg: '#489100' attr: 'b' }
            } else if $in < 6wk {
                '#009c8f'
            } else if $in < 52wk {
                '#0072d4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#909995'
            } else if $e < 1mb {
                '#009c8f'
            } else {{ fg: '#0072d4' }}
        }

        shape_and: { fg: '#ca4898' attr: 'b' }
        shape_binary: { fg: '#ca4898' attr: 'b' }
        shape_block: { fg: '#0072d4' attr: 'b' }
        shape_bool: '#00978a'
        shape_closure: { fg: '#009c8f' attr: 'b' }
        shape_custom: '#489100'
        shape_datetime: { fg: '#009c8f' attr: 'b' }
        shape_directory: '#009c8f'
        shape_external: '#009c8f'
        shape_external_resolved: '#00978a'
        shape_externalarg: { fg: '#489100' attr: 'b' }
        shape_filepath: '#009c8f'
        shape_flag: { fg: '#0072d4' attr: 'b' }
        shape_float: { fg: '#cc1729' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#009c8f' attr: 'b' }
        shape_globpattern: { fg: '#009c8f' attr: 'b' }
        shape_int: { fg: '#ca4898' attr: 'b' }
        shape_internalcall: { fg: '#009c8f' attr: 'b' }
        shape_keyword: { fg: '#ca4898' attr: 'b' }
        shape_list: { fg: '#009c8f' attr: 'b' }
        shape_literal: '#0072d4'
        shape_match_pattern: '#489100'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d2212d'
        shape_operator: '#ad8900'
        shape_or: { fg: '#ca4898' attr: 'b' }
        shape_pipe: { fg: '#ca4898' attr: 'b' }
        shape_range: { fg: '#ad8900' attr: 'b' }
        shape_raw_string: { fg: '#3a4d53' attr: 'b' }
        shape_record: { fg: '#009c8f' attr: 'b' }
        shape_redirection: { fg: '#ca4898' attr: 'b' }
        shape_signature: { fg: '#489100' attr: 'b' }
        shape_string: '#489100'
        shape_string_interpolation: { fg: '#009c8f' attr: 'b' }
        shape_table: { fg: '#0072d4' attr: 'b' }
        shape_vardecl: { fg: '#0072d4' attr: 'u' }
        shape_variable: '#ca4898'

        foreground: '#53676d'
        background: '#fbf3db'
        cursor: '#53676d'

        empty: '#0072d4'
        header: { fg: '#489100' attr: 'b' }
        hints: '#d5cdb6'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#489100' attr: 'b' }
        search_result: { fg: '#d2212d' bg: '#909995' }
        separator: '#909995'
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