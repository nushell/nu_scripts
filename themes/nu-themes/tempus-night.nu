# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ee80c0'
        block: '#5aaaf2'
        cell-path: '#c4bdaf'
        closure: '#1db5c3'
        custom: '#e0e0e0'
        duration: '#b0a800'
        float: '#f69d6a'
        glob: '#e0e0e0'
        int: '#ee80c0'
        list: '#1db5c3'
        nothing: '#fb7e8e'
        range: '#b0a800'
        record: '#1db5c3'
        string: '#52ba40'

        bool: {|| if $in { '#00ca9a' } else { '#b0a800' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fb7e8e' attr: 'b' }
            } else if $in < 6hr {
                '#fb7e8e'
            } else if $in < 1day {
                '#b0a800'
            } else if $in < 3day {
                '#52ba40'
            } else if $in < 1wk {
                { fg: '#52ba40' attr: 'b' }
            } else if $in < 6wk {
                '#1db5c3'
            } else if $in < 52wk {
                '#5aaaf2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c4bdaf'
            } else if $e < 1mb {
                '#1db5c3'
            } else {{ fg: '#5aaaf2' }}
        }

        shape_and: { fg: '#ee80c0' attr: 'b' }
        shape_binary: { fg: '#ee80c0' attr: 'b' }
        shape_block: { fg: '#5aaaf2' attr: 'b' }
        shape_bool: '#00ca9a'
        shape_closure: { fg: '#1db5c3' attr: 'b' }
        shape_custom: '#52ba40'
        shape_datetime: { fg: '#1db5c3' attr: 'b' }
        shape_directory: '#1db5c3'
        shape_external: '#1db5c3'
        shape_external_resolved: '#00ca9a'
        shape_externalarg: { fg: '#52ba40' attr: 'b' }
        shape_filepath: '#1db5c3'
        shape_flag: { fg: '#5aaaf2' attr: 'b' }
        shape_float: { fg: '#f69d6a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1db5c3' attr: 'b' }
        shape_globpattern: { fg: '#1db5c3' attr: 'b' }
        shape_int: { fg: '#ee80c0' attr: 'b' }
        shape_internalcall: { fg: '#1db5c3' attr: 'b' }
        shape_keyword: { fg: '#ee80c0' attr: 'b' }
        shape_list: { fg: '#1db5c3' attr: 'b' }
        shape_literal: '#5aaaf2'
        shape_match_pattern: '#52ba40'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fb7e8e'
        shape_operator: '#b0a800'
        shape_or: { fg: '#ee80c0' attr: 'b' }
        shape_pipe: { fg: '#ee80c0' attr: 'b' }
        shape_range: { fg: '#b0a800' attr: 'b' }
        shape_raw_string: { fg: '#e0e0e0' attr: 'b' }
        shape_record: { fg: '#1db5c3' attr: 'b' }
        shape_redirection: { fg: '#ee80c0' attr: 'b' }
        shape_signature: { fg: '#52ba40' attr: 'b' }
        shape_string: '#52ba40'
        shape_string_interpolation: { fg: '#1db5c3' attr: 'b' }
        shape_table: { fg: '#5aaaf2' attr: 'b' }
        shape_vardecl: { fg: '#5aaaf2' attr: 'u' }
        shape_variable: '#ee80c0'

        foreground: '#e0e0e0'
        background: '#1a1a1a'
        cursor: '#e0e0e0'

        empty: '#5aaaf2'
        header: { fg: '#52ba40' attr: 'b' }
        hints: '#18143d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#52ba40' attr: 'b' }
        search_result: { fg: '#fb7e8e' bg: '#c4bdaf' }
        separator: '#c4bdaf'
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