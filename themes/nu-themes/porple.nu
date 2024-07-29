# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b74989'
        block: '#8485ce'
        cell-path: '#d8d8d8'
        closure: '#64878f'
        custom: '#f8f8f8'
        duration: '#efa16b'
        float: '#f84547'
        glob: '#f8f8f8'
        int: '#b74989'
        list: '#64878f'
        nothing: '#f84547'
        range: '#efa16b'
        record: '#64878f'
        string: '#95c76f'

        bool: {|| if $in { '#64878f' } else { '#efa16b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f84547' attr: 'b' }
            } else if $in < 6hr {
                '#f84547'
            } else if $in < 1day {
                '#efa16b'
            } else if $in < 3day {
                '#95c76f'
            } else if $in < 1wk {
                { fg: '#95c76f' attr: 'b' }
            } else if $in < 6wk {
                '#64878f'
            } else if $in < 52wk {
                '#8485ce'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d8d8d8'
            } else if $e < 1mb {
                '#64878f'
            } else {{ fg: '#8485ce' }}
        }

        shape_and: { fg: '#b74989' attr: 'b' }
        shape_binary: { fg: '#b74989' attr: 'b' }
        shape_block: { fg: '#8485ce' attr: 'b' }
        shape_bool: '#64878f'
        shape_closure: { fg: '#64878f' attr: 'b' }
        shape_custom: '#95c76f'
        shape_datetime: { fg: '#64878f' attr: 'b' }
        shape_directory: '#64878f'
        shape_external: '#64878f'
        shape_external_resolved: '#64878f'
        shape_externalarg: { fg: '#95c76f' attr: 'b' }
        shape_filepath: '#64878f'
        shape_flag: { fg: '#8485ce' attr: 'b' }
        shape_float: { fg: '#f84547' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#64878f' attr: 'b' }
        shape_globpattern: { fg: '#64878f' attr: 'b' }
        shape_int: { fg: '#b74989' attr: 'b' }
        shape_internalcall: { fg: '#64878f' attr: 'b' }
        shape_keyword: { fg: '#b74989' attr: 'b' }
        shape_list: { fg: '#64878f' attr: 'b' }
        shape_literal: '#8485ce'
        shape_match_pattern: '#95c76f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f84547'
        shape_operator: '#efa16b'
        shape_or: { fg: '#b74989' attr: 'b' }
        shape_pipe: { fg: '#b74989' attr: 'b' }
        shape_range: { fg: '#efa16b' attr: 'b' }
        shape_raw_string: { fg: '#f8f8f8' attr: 'b' }
        shape_record: { fg: '#64878f' attr: 'b' }
        shape_redirection: { fg: '#b74989' attr: 'b' }
        shape_signature: { fg: '#95c76f' attr: 'b' }
        shape_string: '#95c76f'
        shape_string_interpolation: { fg: '#64878f' attr: 'b' }
        shape_table: { fg: '#8485ce' attr: 'b' }
        shape_vardecl: { fg: '#8485ce' attr: 'u' }
        shape_variable: '#b74989'

        foreground: '#d8d8d8'
        background: '#292c36'
        cursor: '#d8d8d8'

        empty: '#8485ce'
        header: { fg: '#95c76f' attr: 'b' }
        hints: '#65568a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#95c76f' attr: 'b' }
        search_result: { fg: '#f84547' bg: '#d8d8d8' }
        separator: '#d8d8d8'
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