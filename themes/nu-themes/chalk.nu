# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e1a3ee'
        block: '#6fc2ef'
        cell-path: '#d0d0d0'
        closure: '#12cfc0'
        custom: '#f5f5f5'
        duration: '#ddb26f'
        float: '#fb9fb1'
        glob: '#f5f5f5'
        int: '#e1a3ee'
        list: '#12cfc0'
        nothing: '#fb9fb1'
        range: '#ddb26f'
        record: '#12cfc0'
        string: '#acc267'

        bool: {|| if $in { '#12cfc0' } else { '#ddb26f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fb9fb1' attr: 'b' }
            } else if $in < 6hr {
                '#fb9fb1'
            } else if $in < 1day {
                '#ddb26f'
            } else if $in < 3day {
                '#acc267'
            } else if $in < 1wk {
                { fg: '#acc267' attr: 'b' }
            } else if $in < 6wk {
                '#12cfc0'
            } else if $in < 52wk {
                '#6fc2ef'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0d0d0'
            } else if $e < 1mb {
                '#12cfc0'
            } else {{ fg: '#6fc2ef' }}
        }

        shape_and: { fg: '#e1a3ee' attr: 'b' }
        shape_binary: { fg: '#e1a3ee' attr: 'b' }
        shape_block: { fg: '#6fc2ef' attr: 'b' }
        shape_bool: '#12cfc0'
        shape_closure: { fg: '#12cfc0' attr: 'b' }
        shape_custom: '#acc267'
        shape_datetime: { fg: '#12cfc0' attr: 'b' }
        shape_directory: '#12cfc0'
        shape_external: '#12cfc0'
        shape_external_resolved: '#12cfc0'
        shape_externalarg: { fg: '#acc267' attr: 'b' }
        shape_filepath: '#12cfc0'
        shape_flag: { fg: '#6fc2ef' attr: 'b' }
        shape_float: { fg: '#fb9fb1' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#12cfc0' attr: 'b' }
        shape_globpattern: { fg: '#12cfc0' attr: 'b' }
        shape_int: { fg: '#e1a3ee' attr: 'b' }
        shape_internalcall: { fg: '#12cfc0' attr: 'b' }
        shape_keyword: { fg: '#e1a3ee' attr: 'b' }
        shape_list: { fg: '#12cfc0' attr: 'b' }
        shape_literal: '#6fc2ef'
        shape_match_pattern: '#acc267'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fb9fb1'
        shape_operator: '#ddb26f'
        shape_or: { fg: '#e1a3ee' attr: 'b' }
        shape_pipe: { fg: '#e1a3ee' attr: 'b' }
        shape_range: { fg: '#ddb26f' attr: 'b' }
        shape_raw_string: { fg: '#f5f5f5' attr: 'b' }
        shape_record: { fg: '#12cfc0' attr: 'b' }
        shape_redirection: { fg: '#e1a3ee' attr: 'b' }
        shape_signature: { fg: '#acc267' attr: 'b' }
        shape_string: '#acc267'
        shape_string_interpolation: { fg: '#12cfc0' attr: 'b' }
        shape_table: { fg: '#6fc2ef' attr: 'b' }
        shape_vardecl: { fg: '#6fc2ef' attr: 'u' }
        shape_variable: '#e1a3ee'

        foreground: '#d0d0d0'
        background: '#151515'
        cursor: '#d0d0d0'

        empty: '#6fc2ef'
        header: { fg: '#acc267' attr: 'b' }
        hints: '#505050'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#acc267' attr: 'b' }
        search_result: { fg: '#fb9fb1' bg: '#d0d0d0' }
        separator: '#d0d0d0'
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