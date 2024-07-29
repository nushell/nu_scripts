# Retrieve the theme settings
export def main [] {
    return {
        binary: '#7c4dff'
        block: '#6182b8'
        cell-path: '#80cbc4'
        closure: '#39adb5'
        custom: '#ffffff'
        duration: '#ffb62c'
        float: '#ff5370'
        glob: '#ffffff'
        int: '#7c4dff'
        list: '#39adb5'
        nothing: '#ff5370'
        range: '#ffb62c'
        record: '#39adb5'
        string: '#91b859'

        bool: {|| if $in { '#39adb5' } else { '#ffb62c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff5370' attr: 'b' }
            } else if $in < 6hr {
                '#ff5370'
            } else if $in < 1day {
                '#ffb62c'
            } else if $in < 3day {
                '#91b859'
            } else if $in < 1wk {
                { fg: '#91b859' attr: 'b' }
            } else if $in < 6wk {
                '#39adb5'
            } else if $in < 52wk {
                '#6182b8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#80cbc4'
            } else if $e < 1mb {
                '#39adb5'
            } else {{ fg: '#6182b8' }}
        }

        shape_and: { fg: '#7c4dff' attr: 'b' }
        shape_binary: { fg: '#7c4dff' attr: 'b' }
        shape_block: { fg: '#6182b8' attr: 'b' }
        shape_bool: '#39adb5'
        shape_closure: { fg: '#39adb5' attr: 'b' }
        shape_custom: '#91b859'
        shape_datetime: { fg: '#39adb5' attr: 'b' }
        shape_directory: '#39adb5'
        shape_external: '#39adb5'
        shape_external_resolved: '#39adb5'
        shape_externalarg: { fg: '#91b859' attr: 'b' }
        shape_filepath: '#39adb5'
        shape_flag: { fg: '#6182b8' attr: 'b' }
        shape_float: { fg: '#ff5370' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#39adb5' attr: 'b' }
        shape_globpattern: { fg: '#39adb5' attr: 'b' }
        shape_int: { fg: '#7c4dff' attr: 'b' }
        shape_internalcall: { fg: '#39adb5' attr: 'b' }
        shape_keyword: { fg: '#7c4dff' attr: 'b' }
        shape_list: { fg: '#39adb5' attr: 'b' }
        shape_literal: '#6182b8'
        shape_match_pattern: '#91b859'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff5370'
        shape_operator: '#ffb62c'
        shape_or: { fg: '#7c4dff' attr: 'b' }
        shape_pipe: { fg: '#7c4dff' attr: 'b' }
        shape_range: { fg: '#ffb62c' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#39adb5' attr: 'b' }
        shape_redirection: { fg: '#7c4dff' attr: 'b' }
        shape_signature: { fg: '#91b859' attr: 'b' }
        shape_string: '#91b859'
        shape_string_interpolation: { fg: '#39adb5' attr: 'b' }
        shape_table: { fg: '#6182b8' attr: 'b' }
        shape_vardecl: { fg: '#6182b8' attr: 'u' }
        shape_variable: '#7c4dff'

        foreground: '#80cbc4'
        background: '#fafafa'
        cursor: '#80cbc4'

        empty: '#6182b8'
        header: { fg: '#91b859' attr: 'b' }
        hints: '#ccd7da'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#91b859' attr: 'b' }
        search_result: { fg: '#ff5370' bg: '#80cbc4' }
        separator: '#80cbc4'
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