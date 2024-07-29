# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b16286'
        block: '#458588'
        cell-path: '#a89984'
        closure: '#689d6a'
        custom: '#ebdbb2'
        duration: '#d79921'
        float: '#fb4934'
        glob: '#ebdbb2'
        int: '#b16286'
        list: '#689d6a'
        nothing: '#cc241d'
        range: '#d79921'
        record: '#689d6a'
        string: '#98971a'

        bool: {|| if $in { '#8ec07c' } else { '#d79921' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cc241d' attr: 'b' }
            } else if $in < 6hr {
                '#cc241d'
            } else if $in < 1day {
                '#d79921'
            } else if $in < 3day {
                '#98971a'
            } else if $in < 1wk {
                { fg: '#98971a' attr: 'b' }
            } else if $in < 6wk {
                '#689d6a'
            } else if $in < 52wk {
                '#458588'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a89984'
            } else if $e < 1mb {
                '#689d6a'
            } else {{ fg: '#458588' }}
        }

        shape_and: { fg: '#b16286' attr: 'b' }
        shape_binary: { fg: '#b16286' attr: 'b' }
        shape_block: { fg: '#458588' attr: 'b' }
        shape_bool: '#8ec07c'
        shape_closure: { fg: '#689d6a' attr: 'b' }
        shape_custom: '#98971a'
        shape_datetime: { fg: '#689d6a' attr: 'b' }
        shape_directory: '#689d6a'
        shape_external: '#689d6a'
        shape_external_resolved: '#8ec07c'
        shape_externalarg: { fg: '#98971a' attr: 'b' }
        shape_filepath: '#689d6a'
        shape_flag: { fg: '#458588' attr: 'b' }
        shape_float: { fg: '#fb4934' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#689d6a' attr: 'b' }
        shape_globpattern: { fg: '#689d6a' attr: 'b' }
        shape_int: { fg: '#b16286' attr: 'b' }
        shape_internalcall: { fg: '#689d6a' attr: 'b' }
        shape_keyword: { fg: '#b16286' attr: 'b' }
        shape_list: { fg: '#689d6a' attr: 'b' }
        shape_literal: '#458588'
        shape_match_pattern: '#98971a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cc241d'
        shape_operator: '#d79921'
        shape_or: { fg: '#b16286' attr: 'b' }
        shape_pipe: { fg: '#b16286' attr: 'b' }
        shape_range: { fg: '#d79921' attr: 'b' }
        shape_raw_string: { fg: '#ebdbb2' attr: 'b' }
        shape_record: { fg: '#689d6a' attr: 'b' }
        shape_redirection: { fg: '#b16286' attr: 'b' }
        shape_signature: { fg: '#98971a' attr: 'b' }
        shape_string: '#98971a'
        shape_string_interpolation: { fg: '#689d6a' attr: 'b' }
        shape_table: { fg: '#458588' attr: 'b' }
        shape_vardecl: { fg: '#458588' attr: 'u' }
        shape_variable: '#b16286'

        foreground: '#ebdbb2'
        background: '#282828'
        cursor: '#ebdbb2'

        empty: '#458588'
        header: { fg: '#98971a' attr: 'b' }
        hints: '#928374'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#98971a' attr: 'b' }
        search_result: { fg: '#cc241d' bg: '#a89984' }
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