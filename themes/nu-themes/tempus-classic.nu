# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b58d88'
        block: '#6e9cb0'
        cell-path: '#949d9f'
        closure: '#6da280'
        custom: '#aeadaf'
        duration: '#b1942b'
        float: '#d0913d'
        glob: '#aeadaf'
        int: '#b58d88'
        list: '#6da280'
        nothing: '#d2813d'
        range: '#b1942b'
        record: '#6da280'
        string: '#8c9e3d'

        bool: {|| if $in { '#7aa880' } else { '#b1942b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d2813d' attr: 'b' }
            } else if $in < 6hr {
                '#d2813d'
            } else if $in < 1day {
                '#b1942b'
            } else if $in < 3day {
                '#8c9e3d'
            } else if $in < 1wk {
                { fg: '#8c9e3d' attr: 'b' }
            } else if $in < 6wk {
                '#6da280'
            } else if $in < 52wk {
                '#6e9cb0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#949d9f'
            } else if $e < 1mb {
                '#6da280'
            } else {{ fg: '#6e9cb0' }}
        }

        shape_and: { fg: '#b58d88' attr: 'b' }
        shape_binary: { fg: '#b58d88' attr: 'b' }
        shape_block: { fg: '#6e9cb0' attr: 'b' }
        shape_bool: '#7aa880'
        shape_closure: { fg: '#6da280' attr: 'b' }
        shape_custom: '#8c9e3d'
        shape_datetime: { fg: '#6da280' attr: 'b' }
        shape_directory: '#6da280'
        shape_external: '#6da280'
        shape_external_resolved: '#7aa880'
        shape_externalarg: { fg: '#8c9e3d' attr: 'b' }
        shape_filepath: '#6da280'
        shape_flag: { fg: '#6e9cb0' attr: 'b' }
        shape_float: { fg: '#d0913d' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#6da280' attr: 'b' }
        shape_globpattern: { fg: '#6da280' attr: 'b' }
        shape_int: { fg: '#b58d88' attr: 'b' }
        shape_internalcall: { fg: '#6da280' attr: 'b' }
        shape_keyword: { fg: '#b58d88' attr: 'b' }
        shape_list: { fg: '#6da280' attr: 'b' }
        shape_literal: '#6e9cb0'
        shape_match_pattern: '#8c9e3d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d2813d'
        shape_operator: '#b1942b'
        shape_or: { fg: '#b58d88' attr: 'b' }
        shape_pipe: { fg: '#b58d88' attr: 'b' }
        shape_range: { fg: '#b1942b' attr: 'b' }
        shape_raw_string: { fg: '#aeadaf' attr: 'b' }
        shape_record: { fg: '#6da280' attr: 'b' }
        shape_redirection: { fg: '#b58d88' attr: 'b' }
        shape_signature: { fg: '#8c9e3d' attr: 'b' }
        shape_string: '#8c9e3d'
        shape_string_interpolation: { fg: '#6da280' attr: 'b' }
        shape_table: { fg: '#6e9cb0' attr: 'b' }
        shape_vardecl: { fg: '#6e9cb0' attr: 'u' }
        shape_variable: '#b58d88'

        foreground: '#aeadaf'
        background: '#232323'
        cursor: '#aeadaf'

        empty: '#6e9cb0'
        header: { fg: '#8c9e3d' attr: 'b' }
        hints: '#312e30'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8c9e3d' attr: 'b' }
        search_result: { fg: '#d2813d' bg: '#949d9f' }
        separator: '#949d9f'
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