# Retrieve the theme settings
export def main [] {
    return {
        binary: '#4e66b6'
        block: '#0073b5'
        cell-path: '#43474e'
        closure: '#007a72'
        custom: '#181c22'
        duration: '#9d6f00'
        float: '#d02023'
        glob: '#181c22'
        int: '#4e66b6'
        list: '#007a72'
        nothing: '#d02023'
        range: '#9d6f00'
        record: '#007a72'
        string: '#637200'

        bool: {|| if $in { '#007a72' } else { '#9d6f00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d02023' attr: 'b' }
            } else if $in < 6hr {
                '#d02023'
            } else if $in < 1day {
                '#9d6f00'
            } else if $in < 3day {
                '#637200'
            } else if $in < 1wk {
                { fg: '#637200' attr: 'b' }
            } else if $in < 6wk {
                '#007a72'
            } else if $in < 52wk {
                '#0073b5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#43474e'
            } else if $e < 1mb {
                '#007a72'
            } else {{ fg: '#0073b5' }}
        }

        shape_and: { fg: '#4e66b6' attr: 'b' }
        shape_binary: { fg: '#4e66b6' attr: 'b' }
        shape_block: { fg: '#0073b5' attr: 'b' }
        shape_bool: '#007a72'
        shape_closure: { fg: '#007a72' attr: 'b' }
        shape_custom: '#637200'
        shape_datetime: { fg: '#007a72' attr: 'b' }
        shape_directory: '#007a72'
        shape_external: '#007a72'
        shape_external_resolved: '#007a72'
        shape_externalarg: { fg: '#637200' attr: 'b' }
        shape_filepath: '#007a72'
        shape_flag: { fg: '#0073b5' attr: 'b' }
        shape_float: { fg: '#d02023' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#007a72' attr: 'b' }
        shape_globpattern: { fg: '#007a72' attr: 'b' }
        shape_int: { fg: '#4e66b6' attr: 'b' }
        shape_internalcall: { fg: '#007a72' attr: 'b' }
        shape_keyword: { fg: '#4e66b6' attr: 'b' }
        shape_list: { fg: '#007a72' attr: 'b' }
        shape_literal: '#0073b5'
        shape_match_pattern: '#637200'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d02023'
        shape_operator: '#9d6f00'
        shape_or: { fg: '#4e66b6' attr: 'b' }
        shape_pipe: { fg: '#4e66b6' attr: 'b' }
        shape_range: { fg: '#9d6f00' attr: 'b' }
        shape_raw_string: { fg: '#181c22' attr: 'b' }
        shape_record: { fg: '#007a72' attr: 'b' }
        shape_redirection: { fg: '#4e66b6' attr: 'b' }
        shape_signature: { fg: '#637200' attr: 'b' }
        shape_string: '#637200'
        shape_string_interpolation: { fg: '#007a72' attr: 'b' }
        shape_table: { fg: '#0073b5' attr: 'b' }
        shape_vardecl: { fg: '#0073b5' attr: 'u' }
        shape_variable: '#4e66b6'

        foreground: '#43474e'
        background: '#f5f0e7'
        cursor: '#43474e'

        empty: '#0073b5'
        header: { fg: '#637200' attr: 'b' }
        hints: '#73777f'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#637200' attr: 'b' }
        search_result: { fg: '#d02023' bg: '#43474e' }
        separator: '#43474e'
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