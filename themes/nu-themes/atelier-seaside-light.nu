# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ad2bee'
        block: '#3d62f5'
        cell-path: '#5e6e5e'
        closure: '#1999b3'
        custom: '#131513'
        duration: '#98981b'
        float: '#e6193c'
        glob: '#131513'
        int: '#ad2bee'
        list: '#1999b3'
        nothing: '#e6193c'
        range: '#98981b'
        record: '#1999b3'
        string: '#29a329'

        bool: {|| if $in { '#1999b3' } else { '#98981b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e6193c' attr: 'b' }
            } else if $in < 6hr {
                '#e6193c'
            } else if $in < 1day {
                '#98981b'
            } else if $in < 3day {
                '#29a329'
            } else if $in < 1wk {
                { fg: '#29a329' attr: 'b' }
            } else if $in < 6wk {
                '#1999b3'
            } else if $in < 52wk {
                '#3d62f5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#5e6e5e'
            } else if $e < 1mb {
                '#1999b3'
            } else {{ fg: '#3d62f5' }}
        }

        shape_and: { fg: '#ad2bee' attr: 'b' }
        shape_binary: { fg: '#ad2bee' attr: 'b' }
        shape_block: { fg: '#3d62f5' attr: 'b' }
        shape_bool: '#1999b3'
        shape_closure: { fg: '#1999b3' attr: 'b' }
        shape_custom: '#29a329'
        shape_datetime: { fg: '#1999b3' attr: 'b' }
        shape_directory: '#1999b3'
        shape_external: '#1999b3'
        shape_external_resolved: '#1999b3'
        shape_externalarg: { fg: '#29a329' attr: 'b' }
        shape_filepath: '#1999b3'
        shape_flag: { fg: '#3d62f5' attr: 'b' }
        shape_float: { fg: '#e6193c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1999b3' attr: 'b' }
        shape_globpattern: { fg: '#1999b3' attr: 'b' }
        shape_int: { fg: '#ad2bee' attr: 'b' }
        shape_internalcall: { fg: '#1999b3' attr: 'b' }
        shape_keyword: { fg: '#ad2bee' attr: 'b' }
        shape_list: { fg: '#1999b3' attr: 'b' }
        shape_literal: '#3d62f5'
        shape_match_pattern: '#29a329'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e6193c'
        shape_operator: '#98981b'
        shape_or: { fg: '#ad2bee' attr: 'b' }
        shape_pipe: { fg: '#ad2bee' attr: 'b' }
        shape_range: { fg: '#98981b' attr: 'b' }
        shape_raw_string: { fg: '#131513' attr: 'b' }
        shape_record: { fg: '#1999b3' attr: 'b' }
        shape_redirection: { fg: '#ad2bee' attr: 'b' }
        shape_signature: { fg: '#29a329' attr: 'b' }
        shape_string: '#29a329'
        shape_string_interpolation: { fg: '#1999b3' attr: 'b' }
        shape_table: { fg: '#3d62f5' attr: 'b' }
        shape_vardecl: { fg: '#3d62f5' attr: 'u' }
        shape_variable: '#ad2bee'

        foreground: '#5e6e5e'
        background: '#f4fbf4'
        cursor: '#5e6e5e'

        empty: '#3d62f5'
        header: { fg: '#29a329' attr: 'b' }
        hints: '#809980'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#29a329' attr: 'b' }
        search_result: { fg: '#e6193c' bg: '#5e6e5e' }
        separator: '#5e6e5e'
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