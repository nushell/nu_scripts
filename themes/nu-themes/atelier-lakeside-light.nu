# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6b6bb8'
        block: '#257fad'
        cell-path: '#516d7b'
        closure: '#2d8f6f'
        custom: '#161b1d'
        duration: '#8a8a0f'
        float: '#d22d72'
        glob: '#161b1d'
        int: '#6b6bb8'
        list: '#2d8f6f'
        nothing: '#d22d72'
        range: '#8a8a0f'
        record: '#2d8f6f'
        string: '#568c3b'

        bool: {|| if $in { '#2d8f6f' } else { '#8a8a0f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d22d72' attr: 'b' }
            } else if $in < 6hr {
                '#d22d72'
            } else if $in < 1day {
                '#8a8a0f'
            } else if $in < 3day {
                '#568c3b'
            } else if $in < 1wk {
                { fg: '#568c3b' attr: 'b' }
            } else if $in < 6wk {
                '#2d8f6f'
            } else if $in < 52wk {
                '#257fad'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#516d7b'
            } else if $e < 1mb {
                '#2d8f6f'
            } else {{ fg: '#257fad' }}
        }

        shape_and: { fg: '#6b6bb8' attr: 'b' }
        shape_binary: { fg: '#6b6bb8' attr: 'b' }
        shape_block: { fg: '#257fad' attr: 'b' }
        shape_bool: '#2d8f6f'
        shape_closure: { fg: '#2d8f6f' attr: 'b' }
        shape_custom: '#568c3b'
        shape_datetime: { fg: '#2d8f6f' attr: 'b' }
        shape_directory: '#2d8f6f'
        shape_external: '#2d8f6f'
        shape_external_resolved: '#2d8f6f'
        shape_externalarg: { fg: '#568c3b' attr: 'b' }
        shape_filepath: '#2d8f6f'
        shape_flag: { fg: '#257fad' attr: 'b' }
        shape_float: { fg: '#d22d72' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#2d8f6f' attr: 'b' }
        shape_globpattern: { fg: '#2d8f6f' attr: 'b' }
        shape_int: { fg: '#6b6bb8' attr: 'b' }
        shape_internalcall: { fg: '#2d8f6f' attr: 'b' }
        shape_keyword: { fg: '#6b6bb8' attr: 'b' }
        shape_list: { fg: '#2d8f6f' attr: 'b' }
        shape_literal: '#257fad'
        shape_match_pattern: '#568c3b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d22d72'
        shape_operator: '#8a8a0f'
        shape_or: { fg: '#6b6bb8' attr: 'b' }
        shape_pipe: { fg: '#6b6bb8' attr: 'b' }
        shape_range: { fg: '#8a8a0f' attr: 'b' }
        shape_raw_string: { fg: '#161b1d' attr: 'b' }
        shape_record: { fg: '#2d8f6f' attr: 'b' }
        shape_redirection: { fg: '#6b6bb8' attr: 'b' }
        shape_signature: { fg: '#568c3b' attr: 'b' }
        shape_string: '#568c3b'
        shape_string_interpolation: { fg: '#2d8f6f' attr: 'b' }
        shape_table: { fg: '#257fad' attr: 'b' }
        shape_vardecl: { fg: '#257fad' attr: 'u' }
        shape_variable: '#6b6bb8'

        foreground: '#516d7b'
        background: '#ebf8ff'
        cursor: '#516d7b'

        empty: '#257fad'
        header: { fg: '#568c3b' attr: 'b' }
        hints: '#7195a8'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#568c3b' attr: 'b' }
        search_result: { fg: '#d22d72' bg: '#516d7b' }
        separator: '#516d7b'
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