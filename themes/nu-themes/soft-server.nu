# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6a71a3'
        block: '#6b8fa3'
        cell-path: '#99a3a2'
        closure: '#6ba58f'
        custom: '#d2e0de'
        duration: '#a3906a'
        float: '#dd5c60'
        glob: '#d2e0de'
        int: '#6a71a3'
        list: '#6ba58f'
        nothing: '#a2686a'
        range: '#a3906a'
        record: '#6ba58f'
        string: '#9aa56a'

        bool: {|| if $in { '#64e39c' } else { '#a3906a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a2686a' attr: 'b' }
            } else if $in < 6hr {
                '#a2686a'
            } else if $in < 1day {
                '#a3906a'
            } else if $in < 3day {
                '#9aa56a'
            } else if $in < 1wk {
                { fg: '#9aa56a' attr: 'b' }
            } else if $in < 6wk {
                '#6ba58f'
            } else if $in < 52wk {
                '#6b8fa3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#99a3a2'
            } else if $e < 1mb {
                '#6ba58f'
            } else {{ fg: '#6b8fa3' }}
        }

        shape_and: { fg: '#6a71a3' attr: 'b' }
        shape_binary: { fg: '#6a71a3' attr: 'b' }
        shape_block: { fg: '#6b8fa3' attr: 'b' }
        shape_bool: '#64e39c'
        shape_closure: { fg: '#6ba58f' attr: 'b' }
        shape_custom: '#9aa56a'
        shape_datetime: { fg: '#6ba58f' attr: 'b' }
        shape_directory: '#6ba58f'
        shape_external: '#6ba58f'
        shape_external_resolved: '#64e39c'
        shape_externalarg: { fg: '#9aa56a' attr: 'b' }
        shape_filepath: '#6ba58f'
        shape_flag: { fg: '#6b8fa3' attr: 'b' }
        shape_float: { fg: '#dd5c60' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#6ba58f' attr: 'b' }
        shape_globpattern: { fg: '#6ba58f' attr: 'b' }
        shape_int: { fg: '#6a71a3' attr: 'b' }
        shape_internalcall: { fg: '#6ba58f' attr: 'b' }
        shape_keyword: { fg: '#6a71a3' attr: 'b' }
        shape_list: { fg: '#6ba58f' attr: 'b' }
        shape_literal: '#6b8fa3'
        shape_match_pattern: '#9aa56a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a2686a'
        shape_operator: '#a3906a'
        shape_or: { fg: '#6a71a3' attr: 'b' }
        shape_pipe: { fg: '#6a71a3' attr: 'b' }
        shape_range: { fg: '#a3906a' attr: 'b' }
        shape_raw_string: { fg: '#d2e0de' attr: 'b' }
        shape_record: { fg: '#6ba58f' attr: 'b' }
        shape_redirection: { fg: '#6a71a3' attr: 'b' }
        shape_signature: { fg: '#9aa56a' attr: 'b' }
        shape_string: '#9aa56a'
        shape_string_interpolation: { fg: '#6ba58f' attr: 'b' }
        shape_table: { fg: '#6b8fa3' attr: 'b' }
        shape_vardecl: { fg: '#6b8fa3' attr: 'u' }
        shape_variable: '#6a71a3'

        foreground: '#99a3a2'
        background: '#242626'
        cursor: '#99a3a2'

        empty: '#6b8fa3'
        header: { fg: '#9aa56a' attr: 'b' }
        hints: '#666c6c'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#9aa56a' attr: 'b' }
        search_result: { fg: '#a2686a' bg: '#99a3a2' }
        separator: '#99a3a2'
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