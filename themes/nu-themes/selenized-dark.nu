# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f275be'
        block: '#4695f7'
        cell-path: '#72898f'
        closure: '#41c7b9'
        custom: '#cad8d9'
        duration: '#dbb32d'
        float: '#ff665c'
        glob: '#cad8d9'
        int: '#f275be'
        list: '#41c7b9'
        nothing: '#fa5750'
        range: '#dbb32d'
        record: '#41c7b9'
        string: '#75b938'

        bool: {|| if $in { '#53d6c7' } else { '#dbb32d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fa5750' attr: 'b' }
            } else if $in < 6hr {
                '#fa5750'
            } else if $in < 1day {
                '#dbb32d'
            } else if $in < 3day {
                '#75b938'
            } else if $in < 1wk {
                { fg: '#75b938' attr: 'b' }
            } else if $in < 6wk {
                '#41c7b9'
            } else if $in < 52wk {
                '#4695f7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#72898f'
            } else if $e < 1mb {
                '#41c7b9'
            } else {{ fg: '#4695f7' }}
        }

        shape_and: { fg: '#f275be' attr: 'b' }
        shape_binary: { fg: '#f275be' attr: 'b' }
        shape_block: { fg: '#4695f7' attr: 'b' }
        shape_bool: '#53d6c7'
        shape_closure: { fg: '#41c7b9' attr: 'b' }
        shape_custom: '#75b938'
        shape_datetime: { fg: '#41c7b9' attr: 'b' }
        shape_directory: '#41c7b9'
        shape_external: '#41c7b9'
        shape_external_resolved: '#53d6c7'
        shape_externalarg: { fg: '#75b938' attr: 'b' }
        shape_filepath: '#41c7b9'
        shape_flag: { fg: '#4695f7' attr: 'b' }
        shape_float: { fg: '#ff665c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#41c7b9' attr: 'b' }
        shape_globpattern: { fg: '#41c7b9' attr: 'b' }
        shape_int: { fg: '#f275be' attr: 'b' }
        shape_internalcall: { fg: '#41c7b9' attr: 'b' }
        shape_keyword: { fg: '#f275be' attr: 'b' }
        shape_list: { fg: '#41c7b9' attr: 'b' }
        shape_literal: '#4695f7'
        shape_match_pattern: '#75b938'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fa5750'
        shape_operator: '#dbb32d'
        shape_or: { fg: '#f275be' attr: 'b' }
        shape_pipe: { fg: '#f275be' attr: 'b' }
        shape_range: { fg: '#dbb32d' attr: 'b' }
        shape_raw_string: { fg: '#cad8d9' attr: 'b' }
        shape_record: { fg: '#41c7b9' attr: 'b' }
        shape_redirection: { fg: '#f275be' attr: 'b' }
        shape_signature: { fg: '#75b938' attr: 'b' }
        shape_string: '#75b938'
        shape_string_interpolation: { fg: '#41c7b9' attr: 'b' }
        shape_table: { fg: '#4695f7' attr: 'b' }
        shape_vardecl: { fg: '#4695f7' attr: 'u' }
        shape_variable: '#f275be'

        foreground: '#adbcbc'
        background: '#103c48'
        cursor: '#adbcbc'

        empty: '#4695f7'
        header: { fg: '#75b938' attr: 'b' }
        hints: '#2d5b69'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#75b938' attr: 'b' }
        search_result: { fg: '#fa5750' bg: '#72898f' }
        separator: '#72898f'
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