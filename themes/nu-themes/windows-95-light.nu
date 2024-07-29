# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a800a8'
        block: '#0000a8'
        cell-path: '#545454'
        closure: '#00a8a8'
        custom: '#000000'
        duration: '#a85400'
        float: '#a80000'
        glob: '#000000'
        int: '#a800a8'
        list: '#00a8a8'
        nothing: '#a80000'
        range: '#a85400'
        record: '#00a8a8'
        string: '#00a800'

        bool: {|| if $in { '#00a8a8' } else { '#a85400' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a80000' attr: 'b' }
            } else if $in < 6hr {
                '#a80000'
            } else if $in < 1day {
                '#a85400'
            } else if $in < 3day {
                '#00a800'
            } else if $in < 1wk {
                { fg: '#00a800' attr: 'b' }
            } else if $in < 6wk {
                '#00a8a8'
            } else if $in < 52wk {
                '#0000a8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#545454'
            } else if $e < 1mb {
                '#00a8a8'
            } else {{ fg: '#0000a8' }}
        }

        shape_and: { fg: '#a800a8' attr: 'b' }
        shape_binary: { fg: '#a800a8' attr: 'b' }
        shape_block: { fg: '#0000a8' attr: 'b' }
        shape_bool: '#00a8a8'
        shape_closure: { fg: '#00a8a8' attr: 'b' }
        shape_custom: '#00a800'
        shape_datetime: { fg: '#00a8a8' attr: 'b' }
        shape_directory: '#00a8a8'
        shape_external: '#00a8a8'
        shape_external_resolved: '#00a8a8'
        shape_externalarg: { fg: '#00a800' attr: 'b' }
        shape_filepath: '#00a8a8'
        shape_flag: { fg: '#0000a8' attr: 'b' }
        shape_float: { fg: '#a80000' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00a8a8' attr: 'b' }
        shape_globpattern: { fg: '#00a8a8' attr: 'b' }
        shape_int: { fg: '#a800a8' attr: 'b' }
        shape_internalcall: { fg: '#00a8a8' attr: 'b' }
        shape_keyword: { fg: '#a800a8' attr: 'b' }
        shape_list: { fg: '#00a8a8' attr: 'b' }
        shape_literal: '#0000a8'
        shape_match_pattern: '#00a800'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a80000'
        shape_operator: '#a85400'
        shape_or: { fg: '#a800a8' attr: 'b' }
        shape_pipe: { fg: '#a800a8' attr: 'b' }
        shape_range: { fg: '#a85400' attr: 'b' }
        shape_raw_string: { fg: '#000000' attr: 'b' }
        shape_record: { fg: '#00a8a8' attr: 'b' }
        shape_redirection: { fg: '#a800a8' attr: 'b' }
        shape_signature: { fg: '#00a800' attr: 'b' }
        shape_string: '#00a800'
        shape_string_interpolation: { fg: '#00a8a8' attr: 'b' }
        shape_table: { fg: '#0000a8' attr: 'b' }
        shape_vardecl: { fg: '#0000a8' attr: 'u' }
        shape_variable: '#a800a8'

        foreground: '#545454'
        background: '#fcfcfc'
        cursor: '#545454'

        empty: '#0000a8'
        header: { fg: '#00a800' attr: 'b' }
        hints: '#a8a8a8'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00a800' attr: 'b' }
        search_result: { fg: '#a80000' bg: '#545454' }
        separator: '#545454'
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