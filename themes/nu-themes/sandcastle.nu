# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d75f5f'
        block: '#83a598'
        cell-path: '#a89984'
        closure: '#83a598'
        custom: '#fdf4c1'
        duration: '#a07e3b'
        float: '#83a598'
        glob: '#fdf4c1'
        int: '#d75f5f'
        list: '#83a598'
        nothing: '#83a598'
        range: '#a07e3b'
        record: '#83a598'
        string: '#528b8b'

        bool: {|| if $in { '#83a598' } else { '#a07e3b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#83a598' attr: 'b' }
            } else if $in < 6hr {
                '#83a598'
            } else if $in < 1day {
                '#a07e3b'
            } else if $in < 3day {
                '#528b8b'
            } else if $in < 1wk {
                { fg: '#528b8b' attr: 'b' }
            } else if $in < 6wk {
                '#83a598'
            } else if $in < 52wk {
                '#83a598'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a89984'
            } else if $e < 1mb {
                '#83a598'
            } else {{ fg: '#83a598' }}
        }

        shape_and: { fg: '#d75f5f' attr: 'b' }
        shape_binary: { fg: '#d75f5f' attr: 'b' }
        shape_block: { fg: '#83a598' attr: 'b' }
        shape_bool: '#83a598'
        shape_closure: { fg: '#83a598' attr: 'b' }
        shape_custom: '#528b8b'
        shape_datetime: { fg: '#83a598' attr: 'b' }
        shape_directory: '#83a598'
        shape_external: '#83a598'
        shape_external_resolved: '#83a598'
        shape_externalarg: { fg: '#528b8b' attr: 'b' }
        shape_filepath: '#83a598'
        shape_flag: { fg: '#83a598' attr: 'b' }
        shape_float: { fg: '#83a598' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#83a598' attr: 'b' }
        shape_globpattern: { fg: '#83a598' attr: 'b' }
        shape_int: { fg: '#d75f5f' attr: 'b' }
        shape_internalcall: { fg: '#83a598' attr: 'b' }
        shape_keyword: { fg: '#d75f5f' attr: 'b' }
        shape_list: { fg: '#83a598' attr: 'b' }
        shape_literal: '#83a598'
        shape_match_pattern: '#528b8b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#83a598'
        shape_operator: '#a07e3b'
        shape_or: { fg: '#d75f5f' attr: 'b' }
        shape_pipe: { fg: '#d75f5f' attr: 'b' }
        shape_range: { fg: '#a07e3b' attr: 'b' }
        shape_raw_string: { fg: '#fdf4c1' attr: 'b' }
        shape_record: { fg: '#83a598' attr: 'b' }
        shape_redirection: { fg: '#d75f5f' attr: 'b' }
        shape_signature: { fg: '#528b8b' attr: 'b' }
        shape_string: '#528b8b'
        shape_string_interpolation: { fg: '#83a598' attr: 'b' }
        shape_table: { fg: '#83a598' attr: 'b' }
        shape_vardecl: { fg: '#83a598' attr: 'u' }
        shape_variable: '#d75f5f'

        foreground: '#a89984'
        background: '#282c34'
        cursor: '#a89984'

        empty: '#83a598'
        header: { fg: '#528b8b' attr: 'b' }
        hints: '#665c54'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#528b8b' attr: 'b' }
        search_result: { fg: '#83a598' bg: '#a89984' }
        separator: '#a89984'
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