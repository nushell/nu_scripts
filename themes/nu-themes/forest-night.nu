# Retrieve the theme settings
export def main [] {
    return {
        binary: '#daccf0'
        block: '#bdd0e5'
        cell-path: '#ffebc3'
        closure: '#a9dd9d'
        custom: '#ffebc3'
        duration: '#f0aa8a'
        float: '#fd8489'
        glob: '#ffebc3'
        int: '#daccf0'
        list: '#a9dd9d'
        nothing: '#fd8489'
        range: '#f0aa8a'
        record: '#a9dd9d'
        string: '#a9dd9d'

        bool: {|| if $in { '#a9dd9d' } else { '#f0aa8a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fd8489' attr: 'b' }
            } else if $in < 6hr {
                '#fd8489'
            } else if $in < 1day {
                '#f0aa8a'
            } else if $in < 3day {
                '#a9dd9d'
            } else if $in < 1wk {
                { fg: '#a9dd9d' attr: 'b' }
            } else if $in < 6wk {
                '#a9dd9d'
            } else if $in < 52wk {
                '#bdd0e5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffebc3'
            } else if $e < 1mb {
                '#a9dd9d'
            } else {{ fg: '#bdd0e5' }}
        }

        shape_and: { fg: '#daccf0' attr: 'b' }
        shape_binary: { fg: '#daccf0' attr: 'b' }
        shape_block: { fg: '#bdd0e5' attr: 'b' }
        shape_bool: '#a9dd9d'
        shape_closure: { fg: '#a9dd9d' attr: 'b' }
        shape_custom: '#a9dd9d'
        shape_datetime: { fg: '#a9dd9d' attr: 'b' }
        shape_directory: '#a9dd9d'
        shape_external: '#a9dd9d'
        shape_external_resolved: '#a9dd9d'
        shape_externalarg: { fg: '#a9dd9d' attr: 'b' }
        shape_filepath: '#a9dd9d'
        shape_flag: { fg: '#bdd0e5' attr: 'b' }
        shape_float: { fg: '#fd8489' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#a9dd9d' attr: 'b' }
        shape_globpattern: { fg: '#a9dd9d' attr: 'b' }
        shape_int: { fg: '#daccf0' attr: 'b' }
        shape_internalcall: { fg: '#a9dd9d' attr: 'b' }
        shape_keyword: { fg: '#daccf0' attr: 'b' }
        shape_list: { fg: '#a9dd9d' attr: 'b' }
        shape_literal: '#bdd0e5'
        shape_match_pattern: '#a9dd9d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fd8489'
        shape_operator: '#f0aa8a'
        shape_or: { fg: '#daccf0' attr: 'b' }
        shape_pipe: { fg: '#daccf0' attr: 'b' }
        shape_range: { fg: '#f0aa8a' attr: 'b' }
        shape_raw_string: { fg: '#ffebc3' attr: 'b' }
        shape_record: { fg: '#a9dd9d' attr: 'b' }
        shape_redirection: { fg: '#daccf0' attr: 'b' }
        shape_signature: { fg: '#a9dd9d' attr: 'b' }
        shape_string: '#a9dd9d'
        shape_string_interpolation: { fg: '#a9dd9d' attr: 'b' }
        shape_table: { fg: '#bdd0e5' attr: 'b' }
        shape_vardecl: { fg: '#bdd0e5' attr: 'u' }
        shape_variable: '#daccf0'

        foreground: '#ffebc3'
        background: '#3c4c55'
        cursor: '#ffebc3'

        empty: '#bdd0e5'
        header: { fg: '#a9dd9d' attr: 'b' }
        hints: '#7f8f9f'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a9dd9d' attr: 'b' }
        search_result: { fg: '#fd8489' bg: '#ffebc3' }
        separator: '#ffebc3'
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