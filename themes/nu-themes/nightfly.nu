# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c792ea'
        block: '#82aaff'
        cell-path: '#a1aab8'
        closure: '#7fdbca'
        custom: '#d6deeb'
        duration: '#e7d37a'
        float: '#ff5874'
        glob: '#d6deeb'
        int: '#c792ea'
        list: '#7fdbca'
        nothing: '#fc514e'
        range: '#e7d37a'
        record: '#7fdbca'
        string: '#a1cd5e'

        bool: {|| if $in { '#7fdbca' } else { '#e7d37a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fc514e' attr: 'b' }
            } else if $in < 6hr {
                '#fc514e'
            } else if $in < 1day {
                '#e7d37a'
            } else if $in < 3day {
                '#a1cd5e'
            } else if $in < 1wk {
                { fg: '#a1cd5e' attr: 'b' }
            } else if $in < 6wk {
                '#7fdbca'
            } else if $in < 52wk {
                '#82aaff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a1aab8'
            } else if $e < 1mb {
                '#7fdbca'
            } else {{ fg: '#82aaff' }}
        }

        shape_and: { fg: '#c792ea' attr: 'b' }
        shape_binary: { fg: '#c792ea' attr: 'b' }
        shape_block: { fg: '#82aaff' attr: 'b' }
        shape_bool: '#7fdbca'
        shape_closure: { fg: '#7fdbca' attr: 'b' }
        shape_custom: '#a1cd5e'
        shape_datetime: { fg: '#7fdbca' attr: 'b' }
        shape_directory: '#7fdbca'
        shape_external: '#7fdbca'
        shape_external_resolved: '#7fdbca'
        shape_externalarg: { fg: '#a1cd5e' attr: 'b' }
        shape_filepath: '#7fdbca'
        shape_flag: { fg: '#82aaff' attr: 'b' }
        shape_float: { fg: '#ff5874' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#7fdbca' attr: 'b' }
        shape_globpattern: { fg: '#7fdbca' attr: 'b' }
        shape_int: { fg: '#c792ea' attr: 'b' }
        shape_internalcall: { fg: '#7fdbca' attr: 'b' }
        shape_keyword: { fg: '#c792ea' attr: 'b' }
        shape_list: { fg: '#7fdbca' attr: 'b' }
        shape_literal: '#82aaff'
        shape_match_pattern: '#a1cd5e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fc514e'
        shape_operator: '#e7d37a'
        shape_or: { fg: '#c792ea' attr: 'b' }
        shape_pipe: { fg: '#c792ea' attr: 'b' }
        shape_range: { fg: '#e7d37a' attr: 'b' }
        shape_raw_string: { fg: '#d6deeb' attr: 'b' }
        shape_record: { fg: '#7fdbca' attr: 'b' }
        shape_redirection: { fg: '#c792ea' attr: 'b' }
        shape_signature: { fg: '#a1cd5e' attr: 'b' }
        shape_string: '#a1cd5e'
        shape_string_interpolation: { fg: '#7fdbca' attr: 'b' }
        shape_table: { fg: '#82aaff' attr: 'b' }
        shape_vardecl: { fg: '#82aaff' attr: 'u' }
        shape_variable: '#c792ea'

        foreground: '#c3ccdc'
        background: '#011627'
        cursor: '#82aaff'

        empty: '#82aaff'
        header: { fg: '#a1cd5e' attr: 'b' }
        hints: '#7c8f8f'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a1cd5e' attr: 'b' }
        search_result: { fg: '#fc514e' bg: '#a1aab8' }
        separator: '#a1aab8'
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