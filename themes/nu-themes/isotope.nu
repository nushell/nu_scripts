# Retrieve the theme settings
export def main [] {
    return {
        binary: '#cc00ff'
        block: '#0066ff'
        cell-path: '#d0d0d0'
        closure: '#00ffff'
        custom: '#ffffff'
        duration: '#ff0099'
        float: '#ff0000'
        glob: '#ffffff'
        int: '#cc00ff'
        list: '#00ffff'
        nothing: '#ff0000'
        range: '#ff0099'
        record: '#00ffff'
        string: '#33ff00'

        bool: {|| if $in { '#00ffff' } else { '#ff0099' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff0000' attr: 'b' }
            } else if $in < 6hr {
                '#ff0000'
            } else if $in < 1day {
                '#ff0099'
            } else if $in < 3day {
                '#33ff00'
            } else if $in < 1wk {
                { fg: '#33ff00' attr: 'b' }
            } else if $in < 6wk {
                '#00ffff'
            } else if $in < 52wk {
                '#0066ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0d0d0'
            } else if $e < 1mb {
                '#00ffff'
            } else {{ fg: '#0066ff' }}
        }

        shape_and: { fg: '#cc00ff' attr: 'b' }
        shape_binary: { fg: '#cc00ff' attr: 'b' }
        shape_block: { fg: '#0066ff' attr: 'b' }
        shape_bool: '#00ffff'
        shape_closure: { fg: '#00ffff' attr: 'b' }
        shape_custom: '#33ff00'
        shape_datetime: { fg: '#00ffff' attr: 'b' }
        shape_directory: '#00ffff'
        shape_external: '#00ffff'
        shape_external_resolved: '#00ffff'
        shape_externalarg: { fg: '#33ff00' attr: 'b' }
        shape_filepath: '#00ffff'
        shape_flag: { fg: '#0066ff' attr: 'b' }
        shape_float: { fg: '#ff0000' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00ffff' attr: 'b' }
        shape_globpattern: { fg: '#00ffff' attr: 'b' }
        shape_int: { fg: '#cc00ff' attr: 'b' }
        shape_internalcall: { fg: '#00ffff' attr: 'b' }
        shape_keyword: { fg: '#cc00ff' attr: 'b' }
        shape_list: { fg: '#00ffff' attr: 'b' }
        shape_literal: '#0066ff'
        shape_match_pattern: '#33ff00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff0000'
        shape_operator: '#ff0099'
        shape_or: { fg: '#cc00ff' attr: 'b' }
        shape_pipe: { fg: '#cc00ff' attr: 'b' }
        shape_range: { fg: '#ff0099' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00ffff' attr: 'b' }
        shape_redirection: { fg: '#cc00ff' attr: 'b' }
        shape_signature: { fg: '#33ff00' attr: 'b' }
        shape_string: '#33ff00'
        shape_string_interpolation: { fg: '#00ffff' attr: 'b' }
        shape_table: { fg: '#0066ff' attr: 'b' }
        shape_vardecl: { fg: '#0066ff' attr: 'u' }
        shape_variable: '#cc00ff'

        foreground: '#d0d0d0'
        background: '#000000'
        cursor: '#d0d0d0'

        empty: '#0066ff'
        header: { fg: '#33ff00' attr: 'b' }
        hints: '#808080'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#33ff00' attr: 'b' }
        search_result: { fg: '#ff0000' bg: '#d0d0d0' }
        separator: '#d0d0d0'
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