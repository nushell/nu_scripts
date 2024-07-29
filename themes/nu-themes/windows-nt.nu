# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff00ff'
        block: '#0000ff'
        cell-path: '#c0c0c0'
        closure: '#00ffff'
        custom: '#ffffff'
        duration: '#ffff00'
        float: '#ff0000'
        glob: '#ffffff'
        int: '#ff00ff'
        list: '#00ffff'
        nothing: '#ff0000'
        range: '#ffff00'
        record: '#00ffff'
        string: '#00ff00'

        bool: {|| if $in { '#00ffff' } else { '#ffff00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff0000' attr: 'b' }
            } else if $in < 6hr {
                '#ff0000'
            } else if $in < 1day {
                '#ffff00'
            } else if $in < 3day {
                '#00ff00'
            } else if $in < 1wk {
                { fg: '#00ff00' attr: 'b' }
            } else if $in < 6wk {
                '#00ffff'
            } else if $in < 52wk {
                '#0000ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c0c0c0'
            } else if $e < 1mb {
                '#00ffff'
            } else {{ fg: '#0000ff' }}
        }

        shape_and: { fg: '#ff00ff' attr: 'b' }
        shape_binary: { fg: '#ff00ff' attr: 'b' }
        shape_block: { fg: '#0000ff' attr: 'b' }
        shape_bool: '#00ffff'
        shape_closure: { fg: '#00ffff' attr: 'b' }
        shape_custom: '#00ff00'
        shape_datetime: { fg: '#00ffff' attr: 'b' }
        shape_directory: '#00ffff'
        shape_external: '#00ffff'
        shape_external_resolved: '#00ffff'
        shape_externalarg: { fg: '#00ff00' attr: 'b' }
        shape_filepath: '#00ffff'
        shape_flag: { fg: '#0000ff' attr: 'b' }
        shape_float: { fg: '#ff0000' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00ffff' attr: 'b' }
        shape_globpattern: { fg: '#00ffff' attr: 'b' }
        shape_int: { fg: '#ff00ff' attr: 'b' }
        shape_internalcall: { fg: '#00ffff' attr: 'b' }
        shape_keyword: { fg: '#ff00ff' attr: 'b' }
        shape_list: { fg: '#00ffff' attr: 'b' }
        shape_literal: '#0000ff'
        shape_match_pattern: '#00ff00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff0000'
        shape_operator: '#ffff00'
        shape_or: { fg: '#ff00ff' attr: 'b' }
        shape_pipe: { fg: '#ff00ff' attr: 'b' }
        shape_range: { fg: '#ffff00' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00ffff' attr: 'b' }
        shape_redirection: { fg: '#ff00ff' attr: 'b' }
        shape_signature: { fg: '#00ff00' attr: 'b' }
        shape_string: '#00ff00'
        shape_string_interpolation: { fg: '#00ffff' attr: 'b' }
        shape_table: { fg: '#0000ff' attr: 'b' }
        shape_vardecl: { fg: '#0000ff' attr: 'u' }
        shape_variable: '#ff00ff'

        foreground: '#c0c0c0'
        background: '#000000'
        cursor: '#c0c0c0'

        empty: '#0000ff'
        header: { fg: '#00ff00' attr: 'b' }
        hints: '#808080'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00ff00' attr: 'b' }
        search_result: { fg: '#ff0000' bg: '#c0c0c0' }
        separator: '#c0c0c0'
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