# Retrieve the theme settings
export def main [] {
    return {
        binary: '#eb6eb7'
        block: '#368aeb'
        cell-path: '#777777'
        closure: '#3fc5b7'
        custom: '#dedede'
        duration: '#dbb32d'
        float: '#ff5e56'
        glob: '#dedede'
        int: '#eb6eb7'
        list: '#3fc5b7'
        nothing: '#ed4a46'
        range: '#dbb32d'
        record: '#3fc5b7'
        string: '#70b433'

        bool: {|| if $in { '#56d8c9' } else { '#dbb32d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ed4a46' attr: 'b' }
            } else if $in < 6hr {
                '#ed4a46'
            } else if $in < 1day {
                '#dbb32d'
            } else if $in < 3day {
                '#70b433'
            } else if $in < 1wk {
                { fg: '#70b433' attr: 'b' }
            } else if $in < 6wk {
                '#3fc5b7'
            } else if $in < 52wk {
                '#368aeb'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#777777'
            } else if $e < 1mb {
                '#3fc5b7'
            } else {{ fg: '#368aeb' }}
        }

        shape_and: { fg: '#eb6eb7' attr: 'b' }
        shape_binary: { fg: '#eb6eb7' attr: 'b' }
        shape_block: { fg: '#368aeb' attr: 'b' }
        shape_bool: '#56d8c9'
        shape_closure: { fg: '#3fc5b7' attr: 'b' }
        shape_custom: '#70b433'
        shape_datetime: { fg: '#3fc5b7' attr: 'b' }
        shape_directory: '#3fc5b7'
        shape_external: '#3fc5b7'
        shape_external_resolved: '#56d8c9'
        shape_externalarg: { fg: '#70b433' attr: 'b' }
        shape_filepath: '#3fc5b7'
        shape_flag: { fg: '#368aeb' attr: 'b' }
        shape_float: { fg: '#ff5e56' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3fc5b7' attr: 'b' }
        shape_globpattern: { fg: '#3fc5b7' attr: 'b' }
        shape_int: { fg: '#eb6eb7' attr: 'b' }
        shape_internalcall: { fg: '#3fc5b7' attr: 'b' }
        shape_keyword: { fg: '#eb6eb7' attr: 'b' }
        shape_list: { fg: '#3fc5b7' attr: 'b' }
        shape_literal: '#368aeb'
        shape_match_pattern: '#70b433'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ed4a46'
        shape_operator: '#dbb32d'
        shape_or: { fg: '#eb6eb7' attr: 'b' }
        shape_pipe: { fg: '#eb6eb7' attr: 'b' }
        shape_range: { fg: '#dbb32d' attr: 'b' }
        shape_raw_string: { fg: '#dedede' attr: 'b' }
        shape_record: { fg: '#3fc5b7' attr: 'b' }
        shape_redirection: { fg: '#eb6eb7' attr: 'b' }
        shape_signature: { fg: '#70b433' attr: 'b' }
        shape_string: '#70b433'
        shape_string_interpolation: { fg: '#3fc5b7' attr: 'b' }
        shape_table: { fg: '#368aeb' attr: 'b' }
        shape_vardecl: { fg: '#368aeb' attr: 'u' }
        shape_variable: '#eb6eb7'

        foreground: '#b9b9b9'
        background: '#181818'
        cursor: '#b9b9b9'

        empty: '#368aeb'
        header: { fg: '#70b433' attr: 'b' }
        hints: '#3b3b3b'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#70b433' attr: 'b' }
        search_result: { fg: '#ed4a46' bg: '#777777' }
        separator: '#777777'
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