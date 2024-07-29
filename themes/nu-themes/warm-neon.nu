# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f920fb'
        block: '#4261c5'
        cell-path: '#d0b8a3'
        closure: '#2abbd4'
        custom: '#d8c8bb'
        duration: '#dae145'
        float: '#e97071'
        glob: '#d8c8bb'
        int: '#f920fb'
        list: '#2abbd4'
        nothing: '#e24346'
        range: '#dae145'
        record: '#2abbd4'
        string: '#39b13a'

        bool: {|| if $in { '#5ed1e5' } else { '#dae145' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e24346' attr: 'b' }
            } else if $in < 6hr {
                '#e24346'
            } else if $in < 1day {
                '#dae145'
            } else if $in < 3day {
                '#39b13a'
            } else if $in < 1wk {
                { fg: '#39b13a' attr: 'b' }
            } else if $in < 6wk {
                '#2abbd4'
            } else if $in < 52wk {
                '#4261c5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0b8a3'
            } else if $e < 1mb {
                '#2abbd4'
            } else {{ fg: '#4261c5' }}
        }

        shape_and: { fg: '#f920fb' attr: 'b' }
        shape_binary: { fg: '#f920fb' attr: 'b' }
        shape_block: { fg: '#4261c5' attr: 'b' }
        shape_bool: '#5ed1e5'
        shape_closure: { fg: '#2abbd4' attr: 'b' }
        shape_custom: '#39b13a'
        shape_datetime: { fg: '#2abbd4' attr: 'b' }
        shape_directory: '#2abbd4'
        shape_external: '#2abbd4'
        shape_external_resolved: '#5ed1e5'
        shape_externalarg: { fg: '#39b13a' attr: 'b' }
        shape_filepath: '#2abbd4'
        shape_flag: { fg: '#4261c5' attr: 'b' }
        shape_float: { fg: '#e97071' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#2abbd4' attr: 'b' }
        shape_globpattern: { fg: '#2abbd4' attr: 'b' }
        shape_int: { fg: '#f920fb' attr: 'b' }
        shape_internalcall: { fg: '#2abbd4' attr: 'b' }
        shape_keyword: { fg: '#f920fb' attr: 'b' }
        shape_list: { fg: '#2abbd4' attr: 'b' }
        shape_literal: '#4261c5'
        shape_match_pattern: '#39b13a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e24346'
        shape_operator: '#dae145'
        shape_or: { fg: '#f920fb' attr: 'b' }
        shape_pipe: { fg: '#f920fb' attr: 'b' }
        shape_range: { fg: '#dae145' attr: 'b' }
        shape_raw_string: { fg: '#d8c8bb' attr: 'b' }
        shape_record: { fg: '#2abbd4' attr: 'b' }
        shape_redirection: { fg: '#f920fb' attr: 'b' }
        shape_signature: { fg: '#39b13a' attr: 'b' }
        shape_string: '#39b13a'
        shape_string_interpolation: { fg: '#2abbd4' attr: 'b' }
        shape_table: { fg: '#4261c5' attr: 'b' }
        shape_vardecl: { fg: '#4261c5' attr: 'u' }
        shape_variable: '#f920fb'

        foreground: '#afdab6'
        background: '#404040'
        cursor: '#afdab6'

        empty: '#4261c5'
        header: { fg: '#39b13a' attr: 'b' }
        hints: '#fefcfc'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#39b13a' attr: 'b' }
        search_result: { fg: '#e24346' bg: '#d0b8a3' }
        separator: '#d0b8a3'
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