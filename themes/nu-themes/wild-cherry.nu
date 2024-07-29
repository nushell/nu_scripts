# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ececec'
        block: '#883cdc'
        cell-path: '#fff8de'
        closure: '#c1b8b7'
        custom: '#e4838d'
        duration: '#ffd16f'
        float: '#da6bac'
        glob: '#e4838d'
        int: '#ececec'
        list: '#c1b8b7'
        nothing: '#d94085'
        range: '#ffd16f'
        record: '#c1b8b7'
        string: '#2ab250'

        bool: {|| if $in { '#ff919d' } else { '#ffd16f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d94085' attr: 'b' }
            } else if $in < 6hr {
                '#d94085'
            } else if $in < 1day {
                '#ffd16f'
            } else if $in < 3day {
                '#2ab250'
            } else if $in < 1wk {
                { fg: '#2ab250' attr: 'b' }
            } else if $in < 6wk {
                '#c1b8b7'
            } else if $in < 52wk {
                '#883cdc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#fff8de'
            } else if $e < 1mb {
                '#c1b8b7'
            } else {{ fg: '#883cdc' }}
        }

        shape_and: { fg: '#ececec' attr: 'b' }
        shape_binary: { fg: '#ececec' attr: 'b' }
        shape_block: { fg: '#883cdc' attr: 'b' }
        shape_bool: '#ff919d'
        shape_closure: { fg: '#c1b8b7' attr: 'b' }
        shape_custom: '#2ab250'
        shape_datetime: { fg: '#c1b8b7' attr: 'b' }
        shape_directory: '#c1b8b7'
        shape_external: '#c1b8b7'
        shape_external_resolved: '#ff919d'
        shape_externalarg: { fg: '#2ab250' attr: 'b' }
        shape_filepath: '#c1b8b7'
        shape_flag: { fg: '#883cdc' attr: 'b' }
        shape_float: { fg: '#da6bac' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#c1b8b7' attr: 'b' }
        shape_globpattern: { fg: '#c1b8b7' attr: 'b' }
        shape_int: { fg: '#ececec' attr: 'b' }
        shape_internalcall: { fg: '#c1b8b7' attr: 'b' }
        shape_keyword: { fg: '#ececec' attr: 'b' }
        shape_list: { fg: '#c1b8b7' attr: 'b' }
        shape_literal: '#883cdc'
        shape_match_pattern: '#2ab250'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d94085'
        shape_operator: '#ffd16f'
        shape_or: { fg: '#ececec' attr: 'b' }
        shape_pipe: { fg: '#ececec' attr: 'b' }
        shape_range: { fg: '#ffd16f' attr: 'b' }
        shape_raw_string: { fg: '#e4838d' attr: 'b' }
        shape_record: { fg: '#c1b8b7' attr: 'b' }
        shape_redirection: { fg: '#ececec' attr: 'b' }
        shape_signature: { fg: '#2ab250' attr: 'b' }
        shape_string: '#2ab250'
        shape_string_interpolation: { fg: '#c1b8b7' attr: 'b' }
        shape_table: { fg: '#883cdc' attr: 'b' }
        shape_vardecl: { fg: '#883cdc' attr: 'u' }
        shape_variable: '#ececec'

        foreground: '#dafaff'
        background: '#1f1726'
        cursor: '#dafaff'

        empty: '#883cdc'
        header: { fg: '#2ab250' attr: 'b' }
        hints: '#009cc9'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#2ab250' attr: 'b' }
        search_result: { fg: '#d94085' bg: '#fff8de' }
        separator: '#fff8de'
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