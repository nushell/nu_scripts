# Retrieve the theme settings
export def main [] {
    return {
        binary: '#aa759f'
        block: '#6a9fb5'
        cell-path: '#303030'
        closure: '#75b5aa'
        custom: '#151515'
        duration: '#f4bf75'
        float: '#ac4142'
        glob: '#151515'
        int: '#aa759f'
        list: '#75b5aa'
        nothing: '#ac4142'
        range: '#f4bf75'
        record: '#75b5aa'
        string: '#90a959'

        bool: {|| if $in { '#75b5aa' } else { '#f4bf75' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ac4142' attr: 'b' }
            } else if $in < 6hr {
                '#ac4142'
            } else if $in < 1day {
                '#f4bf75'
            } else if $in < 3day {
                '#90a959'
            } else if $in < 1wk {
                { fg: '#90a959' attr: 'b' }
            } else if $in < 6wk {
                '#75b5aa'
            } else if $in < 52wk {
                '#6a9fb5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#303030'
            } else if $e < 1mb {
                '#75b5aa'
            } else {{ fg: '#6a9fb5' }}
        }

        shape_and: { fg: '#aa759f' attr: 'b' }
        shape_binary: { fg: '#aa759f' attr: 'b' }
        shape_block: { fg: '#6a9fb5' attr: 'b' }
        shape_bool: '#75b5aa'
        shape_closure: { fg: '#75b5aa' attr: 'b' }
        shape_custom: '#90a959'
        shape_datetime: { fg: '#75b5aa' attr: 'b' }
        shape_directory: '#75b5aa'
        shape_external: '#75b5aa'
        shape_external_resolved: '#75b5aa'
        shape_externalarg: { fg: '#90a959' attr: 'b' }
        shape_filepath: '#75b5aa'
        shape_flag: { fg: '#6a9fb5' attr: 'b' }
        shape_float: { fg: '#ac4142' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#75b5aa' attr: 'b' }
        shape_globpattern: { fg: '#75b5aa' attr: 'b' }
        shape_int: { fg: '#aa759f' attr: 'b' }
        shape_internalcall: { fg: '#75b5aa' attr: 'b' }
        shape_keyword: { fg: '#aa759f' attr: 'b' }
        shape_list: { fg: '#75b5aa' attr: 'b' }
        shape_literal: '#6a9fb5'
        shape_match_pattern: '#90a959'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ac4142'
        shape_operator: '#f4bf75'
        shape_or: { fg: '#aa759f' attr: 'b' }
        shape_pipe: { fg: '#aa759f' attr: 'b' }
        shape_range: { fg: '#f4bf75' attr: 'b' }
        shape_raw_string: { fg: '#151515' attr: 'b' }
        shape_record: { fg: '#75b5aa' attr: 'b' }
        shape_redirection: { fg: '#aa759f' attr: 'b' }
        shape_signature: { fg: '#90a959' attr: 'b' }
        shape_string: '#90a959'
        shape_string_interpolation: { fg: '#75b5aa' attr: 'b' }
        shape_table: { fg: '#6a9fb5' attr: 'b' }
        shape_vardecl: { fg: '#6a9fb5' attr: 'u' }
        shape_variable: '#aa759f'

        foreground: '#303030'
        background: '#f5f5f5'
        cursor: '#303030'

        empty: '#6a9fb5'
        header: { fg: '#90a959' attr: 'b' }
        hints: '#b0b0b0'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#90a959' attr: 'b' }
        search_result: { fg: '#ac4142' bg: '#303030' }
        separator: '#303030'
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