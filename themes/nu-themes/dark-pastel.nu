# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff55ff'
        block: '#5555ff'
        cell-path: '#bbbbbb'
        closure: '#55ffff'
        custom: '#ffffff'
        duration: '#ffff55'
        float: '#ff5555'
        glob: '#ffffff'
        int: '#ff55ff'
        list: '#55ffff'
        nothing: '#ff5555'
        range: '#ffff55'
        record: '#55ffff'
        string: '#55ff55'

        bool: {|| if $in { '#55ffff' } else { '#ffff55' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff5555' attr: 'b' }
            } else if $in < 6hr {
                '#ff5555'
            } else if $in < 1day {
                '#ffff55'
            } else if $in < 3day {
                '#55ff55'
            } else if $in < 1wk {
                { fg: '#55ff55' attr: 'b' }
            } else if $in < 6wk {
                '#55ffff'
            } else if $in < 52wk {
                '#5555ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#55ffff'
            } else {{ fg: '#5555ff' }}
        }

        shape_and: { fg: '#ff55ff' attr: 'b' }
        shape_binary: { fg: '#ff55ff' attr: 'b' }
        shape_block: { fg: '#5555ff' attr: 'b' }
        shape_bool: '#55ffff'
        shape_closure: { fg: '#55ffff' attr: 'b' }
        shape_custom: '#55ff55'
        shape_datetime: { fg: '#55ffff' attr: 'b' }
        shape_directory: '#55ffff'
        shape_external: '#55ffff'
        shape_external_resolved: '#55ffff'
        shape_externalarg: { fg: '#55ff55' attr: 'b' }
        shape_filepath: '#55ffff'
        shape_flag: { fg: '#5555ff' attr: 'b' }
        shape_float: { fg: '#ff5555' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#55ffff' attr: 'b' }
        shape_globpattern: { fg: '#55ffff' attr: 'b' }
        shape_int: { fg: '#ff55ff' attr: 'b' }
        shape_internalcall: { fg: '#55ffff' attr: 'b' }
        shape_keyword: { fg: '#ff55ff' attr: 'b' }
        shape_list: { fg: '#55ffff' attr: 'b' }
        shape_literal: '#5555ff'
        shape_match_pattern: '#55ff55'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff5555'
        shape_operator: '#ffff55'
        shape_or: { fg: '#ff55ff' attr: 'b' }
        shape_pipe: { fg: '#ff55ff' attr: 'b' }
        shape_range: { fg: '#ffff55' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#55ffff' attr: 'b' }
        shape_redirection: { fg: '#ff55ff' attr: 'b' }
        shape_signature: { fg: '#55ff55' attr: 'b' }
        shape_string: '#55ff55'
        shape_string_interpolation: { fg: '#55ffff' attr: 'b' }
        shape_table: { fg: '#5555ff' attr: 'b' }
        shape_vardecl: { fg: '#5555ff' attr: 'u' }
        shape_variable: '#ff55ff'

        foreground: '#ffffff'
        background: '#000000'
        cursor: '#ffffff'

        empty: '#5555ff'
        header: { fg: '#55ff55' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#55ff55' attr: 'b' }
        search_result: { fg: '#ff5555' bg: '#bbbbbb' }
        separator: '#bbbbbb'
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