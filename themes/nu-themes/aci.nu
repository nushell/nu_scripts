# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8308ff'
        block: '#0883ff'
        cell-path: '#b6b6b6'
        closure: '#08ff83'
        custom: '#c2c2c2'
        duration: '#ff8308'
        float: '#ff1e8e'
        glob: '#c2c2c2'
        int: '#8308ff'
        list: '#08ff83'
        nothing: '#ff0883'
        range: '#ff8308'
        record: '#08ff83'
        string: '#83ff08'

        bool: {|| if $in { '#1eff8e' } else { '#ff8308' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff0883' attr: 'b' }
            } else if $in < 6hr {
                '#ff0883'
            } else if $in < 1day {
                '#ff8308'
            } else if $in < 3day {
                '#83ff08'
            } else if $in < 1wk {
                { fg: '#83ff08' attr: 'b' }
            } else if $in < 6wk {
                '#08ff83'
            } else if $in < 52wk {
                '#0883ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b6b6b6'
            } else if $e < 1mb {
                '#08ff83'
            } else {{ fg: '#0883ff' }}
        }

        shape_and: { fg: '#8308ff' attr: 'b' }
        shape_binary: { fg: '#8308ff' attr: 'b' }
        shape_block: { fg: '#0883ff' attr: 'b' }
        shape_bool: '#1eff8e'
        shape_closure: { fg: '#08ff83' attr: 'b' }
        shape_custom: '#83ff08'
        shape_datetime: { fg: '#08ff83' attr: 'b' }
        shape_directory: '#08ff83'
        shape_external: '#08ff83'
        shape_external_resolved: '#1eff8e'
        shape_externalarg: { fg: '#83ff08' attr: 'b' }
        shape_filepath: '#08ff83'
        shape_flag: { fg: '#0883ff' attr: 'b' }
        shape_float: { fg: '#ff1e8e' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#08ff83' attr: 'b' }
        shape_globpattern: { fg: '#08ff83' attr: 'b' }
        shape_int: { fg: '#8308ff' attr: 'b' }
        shape_internalcall: { fg: '#08ff83' attr: 'b' }
        shape_keyword: { fg: '#8308ff' attr: 'b' }
        shape_list: { fg: '#08ff83' attr: 'b' }
        shape_literal: '#0883ff'
        shape_match_pattern: '#83ff08'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff0883'
        shape_operator: '#ff8308'
        shape_or: { fg: '#8308ff' attr: 'b' }
        shape_pipe: { fg: '#8308ff' attr: 'b' }
        shape_range: { fg: '#ff8308' attr: 'b' }
        shape_raw_string: { fg: '#c2c2c2' attr: 'b' }
        shape_record: { fg: '#08ff83' attr: 'b' }
        shape_redirection: { fg: '#8308ff' attr: 'b' }
        shape_signature: { fg: '#83ff08' attr: 'b' }
        shape_string: '#83ff08'
        shape_string_interpolation: { fg: '#08ff83' attr: 'b' }
        shape_table: { fg: '#0883ff' attr: 'b' }
        shape_vardecl: { fg: '#0883ff' attr: 'u' }
        shape_variable: '#8308ff'

        foreground: '#b4e1fd'
        background: '#0d1926'
        cursor: '#b4e1fd'

        empty: '#0883ff'
        header: { fg: '#83ff08' attr: 'b' }
        hints: '#424242'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#83ff08' attr: 'b' }
        search_result: { fg: '#ff0883' bg: '#b6b6b6' }
        separator: '#b6b6b6'
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