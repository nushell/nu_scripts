# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a363d5'
        block: '#33b5e1'
        cell-path: '#a6afb8'
        closure: '#52cbb0'
        custom: '#f5f7fa'
        duration: '#e4b51c'
        float: '#ef5253'
        glob: '#f5f7fa'
        int: '#a363d5'
        list: '#52cbb0'
        nothing: '#ef5253'
        range: '#e4b51c'
        record: '#52cbb0'
        string: '#7cc844'

        bool: {|| if $in { '#52cbb0' } else { '#e4b51c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ef5253' attr: 'b' }
            } else if $in < 6hr {
                '#ef5253'
            } else if $in < 1day {
                '#e4b51c'
            } else if $in < 3day {
                '#7cc844'
            } else if $in < 1wk {
                { fg: '#7cc844' attr: 'b' }
            } else if $in < 6wk {
                '#52cbb0'
            } else if $in < 52wk {
                '#33b5e1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a6afb8'
            } else if $e < 1mb {
                '#52cbb0'
            } else {{ fg: '#33b5e1' }}
        }

        shape_and: { fg: '#a363d5' attr: 'b' }
        shape_binary: { fg: '#a363d5' attr: 'b' }
        shape_block: { fg: '#33b5e1' attr: 'b' }
        shape_bool: '#52cbb0'
        shape_closure: { fg: '#52cbb0' attr: 'b' }
        shape_custom: '#7cc844'
        shape_datetime: { fg: '#52cbb0' attr: 'b' }
        shape_directory: '#52cbb0'
        shape_external: '#52cbb0'
        shape_external_resolved: '#52cbb0'
        shape_externalarg: { fg: '#7cc844' attr: 'b' }
        shape_filepath: '#52cbb0'
        shape_flag: { fg: '#33b5e1' attr: 'b' }
        shape_float: { fg: '#ef5253' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#52cbb0' attr: 'b' }
        shape_globpattern: { fg: '#52cbb0' attr: 'b' }
        shape_int: { fg: '#a363d5' attr: 'b' }
        shape_internalcall: { fg: '#52cbb0' attr: 'b' }
        shape_keyword: { fg: '#a363d5' attr: 'b' }
        shape_list: { fg: '#52cbb0' attr: 'b' }
        shape_literal: '#33b5e1'
        shape_match_pattern: '#7cc844'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ef5253'
        shape_operator: '#e4b51c'
        shape_or: { fg: '#a363d5' attr: 'b' }
        shape_pipe: { fg: '#a363d5' attr: 'b' }
        shape_range: { fg: '#e4b51c' attr: 'b' }
        shape_raw_string: { fg: '#f5f7fa' attr: 'b' }
        shape_record: { fg: '#52cbb0' attr: 'b' }
        shape_redirection: { fg: '#a363d5' attr: 'b' }
        shape_signature: { fg: '#7cc844' attr: 'b' }
        shape_string: '#7cc844'
        shape_string_interpolation: { fg: '#52cbb0' attr: 'b' }
        shape_table: { fg: '#33b5e1' attr: 'b' }
        shape_vardecl: { fg: '#33b5e1' attr: 'u' }
        shape_variable: '#a363d5'

        foreground: '#a6afb8'
        background: '#18262f'
        cursor: '#a6afb8'

        empty: '#33b5e1'
        header: { fg: '#7cc844' attr: 'b' }
        hints: '#667581'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7cc844' attr: 'b' }
        search_result: { fg: '#ef5253' bg: '#a6afb8' }
        separator: '#a6afb8'
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