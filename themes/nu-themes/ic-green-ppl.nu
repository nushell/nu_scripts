# Retrieve the theme settings
export def main [] {
    return {
        binary: '#53b82c'
        block: '#149b45'
        cell-path: '#e0ffef'
        closure: '#2cb868'
        custom: '#daefd0'
        duration: '#659b25'
        float: '#a7ff3f'
        glob: '#daefd0'
        int: '#53b82c'
        list: '#2cb868'
        nothing: '#fb002a'
        range: '#659b25'
        record: '#2cb868'
        string: '#339c24'

        bool: {|| if $in { '#22ff71' } else { '#659b25' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fb002a' attr: 'b' }
            } else if $in < 6hr {
                '#fb002a'
            } else if $in < 1day {
                '#659b25'
            } else if $in < 3day {
                '#339c24'
            } else if $in < 1wk {
                { fg: '#339c24' attr: 'b' }
            } else if $in < 6wk {
                '#2cb868'
            } else if $in < 52wk {
                '#149b45'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e0ffef'
            } else if $e < 1mb {
                '#2cb868'
            } else {{ fg: '#149b45' }}
        }

        shape_and: { fg: '#53b82c' attr: 'b' }
        shape_binary: { fg: '#53b82c' attr: 'b' }
        shape_block: { fg: '#149b45' attr: 'b' }
        shape_bool: '#22ff71'
        shape_closure: { fg: '#2cb868' attr: 'b' }
        shape_custom: '#339c24'
        shape_datetime: { fg: '#2cb868' attr: 'b' }
        shape_directory: '#2cb868'
        shape_external: '#2cb868'
        shape_external_resolved: '#22ff71'
        shape_externalarg: { fg: '#339c24' attr: 'b' }
        shape_filepath: '#2cb868'
        shape_flag: { fg: '#149b45' attr: 'b' }
        shape_float: { fg: '#a7ff3f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#2cb868' attr: 'b' }
        shape_globpattern: { fg: '#2cb868' attr: 'b' }
        shape_int: { fg: '#53b82c' attr: 'b' }
        shape_internalcall: { fg: '#2cb868' attr: 'b' }
        shape_keyword: { fg: '#53b82c' attr: 'b' }
        shape_list: { fg: '#2cb868' attr: 'b' }
        shape_literal: '#149b45'
        shape_match_pattern: '#339c24'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fb002a'
        shape_operator: '#659b25'
        shape_or: { fg: '#53b82c' attr: 'b' }
        shape_pipe: { fg: '#53b82c' attr: 'b' }
        shape_range: { fg: '#659b25' attr: 'b' }
        shape_raw_string: { fg: '#daefd0' attr: 'b' }
        shape_record: { fg: '#2cb868' attr: 'b' }
        shape_redirection: { fg: '#53b82c' attr: 'b' }
        shape_signature: { fg: '#339c24' attr: 'b' }
        shape_string: '#339c24'
        shape_string_interpolation: { fg: '#2cb868' attr: 'b' }
        shape_table: { fg: '#149b45' attr: 'b' }
        shape_vardecl: { fg: '#149b45' attr: 'u' }
        shape_variable: '#53b82c'

        foreground: '#d9efd3'
        background: '#3a3d3f'
        cursor: '#d9efd3'

        empty: '#149b45'
        header: { fg: '#339c24' attr: 'b' }
        hints: '#032710'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#339c24' attr: 'b' }
        search_result: { fg: '#fb002a' bg: '#e0ffef' }
        separator: '#e0ffef'
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