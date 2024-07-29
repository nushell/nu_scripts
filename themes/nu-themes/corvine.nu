# Retrieve the theme settings
export def main [] {
    return {
        binary: '#afafd7'
        block: '#87afd7'
        cell-path: '#c6c6c6'
        closure: '#87d7d7'
        custom: '#eeeeee'
        duration: '#d7d7af'
        float: '#ffafaf'
        glob: '#eeeeee'
        int: '#afafd7'
        list: '#87d7d7'
        nothing: '#d78787'
        range: '#d7d7af'
        record: '#87d7d7'
        string: '#87af5f'

        bool: {|| if $in { '#5fd7d7' } else { '#d7d7af' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d78787' attr: 'b' }
            } else if $in < 6hr {
                '#d78787'
            } else if $in < 1day {
                '#d7d7af'
            } else if $in < 3day {
                '#87af5f'
            } else if $in < 1wk {
                { fg: '#87af5f' attr: 'b' }
            } else if $in < 6wk {
                '#87d7d7'
            } else if $in < 52wk {
                '#87afd7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c6c6c6'
            } else if $e < 1mb {
                '#87d7d7'
            } else {{ fg: '#87afd7' }}
        }

        shape_and: { fg: '#afafd7' attr: 'b' }
        shape_binary: { fg: '#afafd7' attr: 'b' }
        shape_block: { fg: '#87afd7' attr: 'b' }
        shape_bool: '#5fd7d7'
        shape_closure: { fg: '#87d7d7' attr: 'b' }
        shape_custom: '#87af5f'
        shape_datetime: { fg: '#87d7d7' attr: 'b' }
        shape_directory: '#87d7d7'
        shape_external: '#87d7d7'
        shape_external_resolved: '#5fd7d7'
        shape_externalarg: { fg: '#87af5f' attr: 'b' }
        shape_filepath: '#87d7d7'
        shape_flag: { fg: '#87afd7' attr: 'b' }
        shape_float: { fg: '#ffafaf' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#87d7d7' attr: 'b' }
        shape_globpattern: { fg: '#87d7d7' attr: 'b' }
        shape_int: { fg: '#afafd7' attr: 'b' }
        shape_internalcall: { fg: '#87d7d7' attr: 'b' }
        shape_keyword: { fg: '#afafd7' attr: 'b' }
        shape_list: { fg: '#87d7d7' attr: 'b' }
        shape_literal: '#87afd7'
        shape_match_pattern: '#87af5f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d78787'
        shape_operator: '#d7d7af'
        shape_or: { fg: '#afafd7' attr: 'b' }
        shape_pipe: { fg: '#afafd7' attr: 'b' }
        shape_range: { fg: '#d7d7af' attr: 'b' }
        shape_raw_string: { fg: '#eeeeee' attr: 'b' }
        shape_record: { fg: '#87d7d7' attr: 'b' }
        shape_redirection: { fg: '#afafd7' attr: 'b' }
        shape_signature: { fg: '#87af5f' attr: 'b' }
        shape_string: '#87af5f'
        shape_string_interpolation: { fg: '#87d7d7' attr: 'b' }
        shape_table: { fg: '#87afd7' attr: 'b' }
        shape_vardecl: { fg: '#87afd7' attr: 'u' }
        shape_variable: '#afafd7'

        foreground: '#c6c6c6'
        background: '#262626'
        cursor: '#c6c6c6'

        empty: '#87afd7'
        header: { fg: '#87af5f' attr: 'b' }
        hints: '#626262'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#87af5f' attr: 'b' }
        search_result: { fg: '#d78787' bg: '#c6c6c6' }
        separator: '#c6c6c6'
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