# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6f1bc2'
        block: '#1b6fc2'
        cell-path: '#808080'
        closure: '#1bc26f'
        custom: '#e5e5e5'
        duration: '#c26f1b'
        float: '#ee84b9'
        glob: '#e5e5e5'
        int: '#6f1bc2'
        list: '#1bc26f'
        nothing: '#c21b6f'
        range: '#c26f1b'
        record: '#1bc26f'
        string: '#6fc21b'

        bool: {|| if $in { '#84eeb9' } else { '#c26f1b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c21b6f' attr: 'b' }
            } else if $in < 6hr {
                '#c21b6f'
            } else if $in < 1day {
                '#c26f1b'
            } else if $in < 3day {
                '#6fc21b'
            } else if $in < 1wk {
                { fg: '#6fc21b' attr: 'b' }
            } else if $in < 6wk {
                '#1bc26f'
            } else if $in < 52wk {
                '#1b6fc2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#808080'
            } else if $e < 1mb {
                '#1bc26f'
            } else {{ fg: '#1b6fc2' }}
        }

        shape_and: { fg: '#6f1bc2' attr: 'b' }
        shape_binary: { fg: '#6f1bc2' attr: 'b' }
        shape_block: { fg: '#1b6fc2' attr: 'b' }
        shape_bool: '#84eeb9'
        shape_closure: { fg: '#1bc26f' attr: 'b' }
        shape_custom: '#6fc21b'
        shape_datetime: { fg: '#1bc26f' attr: 'b' }
        shape_directory: '#1bc26f'
        shape_external: '#1bc26f'
        shape_external_resolved: '#84eeb9'
        shape_externalarg: { fg: '#6fc21b' attr: 'b' }
        shape_filepath: '#1bc26f'
        shape_flag: { fg: '#1b6fc2' attr: 'b' }
        shape_float: { fg: '#ee84b9' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1bc26f' attr: 'b' }
        shape_globpattern: { fg: '#1bc26f' attr: 'b' }
        shape_int: { fg: '#6f1bc2' attr: 'b' }
        shape_internalcall: { fg: '#1bc26f' attr: 'b' }
        shape_keyword: { fg: '#6f1bc2' attr: 'b' }
        shape_list: { fg: '#1bc26f' attr: 'b' }
        shape_literal: '#1b6fc2'
        shape_match_pattern: '#6fc21b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c21b6f'
        shape_operator: '#c26f1b'
        shape_or: { fg: '#6f1bc2' attr: 'b' }
        shape_pipe: { fg: '#6f1bc2' attr: 'b' }
        shape_range: { fg: '#c26f1b' attr: 'b' }
        shape_raw_string: { fg: '#e5e5e5' attr: 'b' }
        shape_record: { fg: '#1bc26f' attr: 'b' }
        shape_redirection: { fg: '#6f1bc2' attr: 'b' }
        shape_signature: { fg: '#6fc21b' attr: 'b' }
        shape_string: '#6fc21b'
        shape_string_interpolation: { fg: '#1bc26f' attr: 'b' }
        shape_table: { fg: '#1b6fc2' attr: 'b' }
        shape_vardecl: { fg: '#1b6fc2' attr: 'u' }
        shape_variable: '#6f1bc2'

        foreground: '#23476a'
        background: '#feffee'
        cursor: '#23476a'

        empty: '#1b6fc2'
        header: { fg: '#6fc21b' attr: 'b' }
        hints: '#808080'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6fc21b' attr: 'b' }
        search_result: { fg: '#c21b6f' bg: '#808080' }
        separator: '#808080'
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