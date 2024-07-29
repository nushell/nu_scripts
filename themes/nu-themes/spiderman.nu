# Retrieve the theme settings
export def main [] {
    return {
        binary: '#2435db'
        block: '#2b3fff'
        cell-path: '#fffef6'
        closure: '#3255ff'
        custom: '#fefff9'
        duration: '#e24655'
        float: '#ff0325'
        glob: '#fefff9'
        int: '#2435db'
        list: '#3255ff'
        nothing: '#e60712'
        range: '#e24655'
        record: '#3255ff'
        string: '#e22828'

        bool: {|| if $in { '#6083ff' } else { '#e24655' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e60712' attr: 'b' }
            } else if $in < 6hr {
                '#e60712'
            } else if $in < 1day {
                '#e24655'
            } else if $in < 3day {
                '#e22828'
            } else if $in < 1wk {
                { fg: '#e22828' attr: 'b' }
            } else if $in < 6wk {
                '#3255ff'
            } else if $in < 52wk {
                '#2b3fff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#fffef6'
            } else if $e < 1mb {
                '#3255ff'
            } else {{ fg: '#2b3fff' }}
        }

        shape_and: { fg: '#2435db' attr: 'b' }
        shape_binary: { fg: '#2435db' attr: 'b' }
        shape_block: { fg: '#2b3fff' attr: 'b' }
        shape_bool: '#6083ff'
        shape_closure: { fg: '#3255ff' attr: 'b' }
        shape_custom: '#e22828'
        shape_datetime: { fg: '#3255ff' attr: 'b' }
        shape_directory: '#3255ff'
        shape_external: '#3255ff'
        shape_external_resolved: '#6083ff'
        shape_externalarg: { fg: '#e22828' attr: 'b' }
        shape_filepath: '#3255ff'
        shape_flag: { fg: '#2b3fff' attr: 'b' }
        shape_float: { fg: '#ff0325' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3255ff' attr: 'b' }
        shape_globpattern: { fg: '#3255ff' attr: 'b' }
        shape_int: { fg: '#2435db' attr: 'b' }
        shape_internalcall: { fg: '#3255ff' attr: 'b' }
        shape_keyword: { fg: '#2435db' attr: 'b' }
        shape_list: { fg: '#3255ff' attr: 'b' }
        shape_literal: '#2b3fff'
        shape_match_pattern: '#e22828'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e60712'
        shape_operator: '#e24655'
        shape_or: { fg: '#2435db' attr: 'b' }
        shape_pipe: { fg: '#2435db' attr: 'b' }
        shape_range: { fg: '#e24655' attr: 'b' }
        shape_raw_string: { fg: '#fefff9' attr: 'b' }
        shape_record: { fg: '#3255ff' attr: 'b' }
        shape_redirection: { fg: '#2435db' attr: 'b' }
        shape_signature: { fg: '#e22828' attr: 'b' }
        shape_string: '#e22828'
        shape_string_interpolation: { fg: '#3255ff' attr: 'b' }
        shape_table: { fg: '#2b3fff' attr: 'b' }
        shape_vardecl: { fg: '#2b3fff' attr: 'u' }
        shape_variable: '#2435db'

        foreground: '#e2e2e2'
        background: '#1b1d1e'
        cursor: '#2b3fff'

        empty: '#2b3fff'
        header: { fg: '#e22828' attr: 'b' }
        hints: '#505354'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#e22828' attr: 'b' }
        search_result: { fg: '#e60712' bg: '#fffef6' }
        separator: '#fffef6'
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