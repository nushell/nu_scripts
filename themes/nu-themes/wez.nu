# Retrieve the theme settings
export def main [] {
    return {
        binary: '#cc55cc'
        block: '#5555cc'
        cell-path: '#cccccc'
        closure: '#7acaca'
        custom: '#ffffff'
        duration: '#cdcd55'
        float: '#ff5555'
        glob: '#ffffff'
        int: '#cc55cc'
        list: '#7acaca'
        nothing: '#cc5555'
        range: '#cdcd55'
        record: '#7acaca'
        string: '#55cc55'

        bool: {|| if $in { '#55ffff' } else { '#cdcd55' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cc5555' attr: 'b' }
            } else if $in < 6hr {
                '#cc5555'
            } else if $in < 1day {
                '#cdcd55'
            } else if $in < 3day {
                '#55cc55'
            } else if $in < 1wk {
                { fg: '#55cc55' attr: 'b' }
            } else if $in < 6wk {
                '#7acaca'
            } else if $in < 52wk {
                '#5555cc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cccccc'
            } else if $e < 1mb {
                '#7acaca'
            } else {{ fg: '#5555cc' }}
        }

        shape_and: { fg: '#cc55cc' attr: 'b' }
        shape_binary: { fg: '#cc55cc' attr: 'b' }
        shape_block: { fg: '#5555cc' attr: 'b' }
        shape_bool: '#55ffff'
        shape_closure: { fg: '#7acaca' attr: 'b' }
        shape_custom: '#55cc55'
        shape_datetime: { fg: '#7acaca' attr: 'b' }
        shape_directory: '#7acaca'
        shape_external: '#7acaca'
        shape_external_resolved: '#55ffff'
        shape_externalarg: { fg: '#55cc55' attr: 'b' }
        shape_filepath: '#7acaca'
        shape_flag: { fg: '#5555cc' attr: 'b' }
        shape_float: { fg: '#ff5555' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#7acaca' attr: 'b' }
        shape_globpattern: { fg: '#7acaca' attr: 'b' }
        shape_int: { fg: '#cc55cc' attr: 'b' }
        shape_internalcall: { fg: '#7acaca' attr: 'b' }
        shape_keyword: { fg: '#cc55cc' attr: 'b' }
        shape_list: { fg: '#7acaca' attr: 'b' }
        shape_literal: '#5555cc'
        shape_match_pattern: '#55cc55'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cc5555'
        shape_operator: '#cdcd55'
        shape_or: { fg: '#cc55cc' attr: 'b' }
        shape_pipe: { fg: '#cc55cc' attr: 'b' }
        shape_range: { fg: '#cdcd55' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#7acaca' attr: 'b' }
        shape_redirection: { fg: '#cc55cc' attr: 'b' }
        shape_signature: { fg: '#55cc55' attr: 'b' }
        shape_string: '#55cc55'
        shape_string_interpolation: { fg: '#7acaca' attr: 'b' }
        shape_table: { fg: '#5555cc' attr: 'b' }
        shape_vardecl: { fg: '#5555cc' attr: 'u' }
        shape_variable: '#cc55cc'

        foreground: '#b3b3b3'
        background: '#000000'
        cursor: '#b3b3b3'

        empty: '#5555cc'
        header: { fg: '#55cc55' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#55cc55' attr: 'b' }
        search_result: { fg: '#cc5555' bg: '#cccccc' }
        separator: '#cccccc'
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