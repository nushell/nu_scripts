# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c59820'
        block: '#484d79'
        cell-path: '#9ea7a6'
        closure: '#b02f30'
        custom: '#b5d8f6'
        duration: '#a03b1e'
        float: '#2a5491'
        glob: '#b5d8f6'
        int: '#c59820'
        list: '#b02f30'
        nothing: '#2a5491'
        range: '#a03b1e'
        record: '#b02f30'
        string: '#237986'

        bool: {|| if $in { '#b02f30' } else { '#a03b1e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#2a5491' attr: 'b' }
            } else if $in < 6hr {
                '#2a5491'
            } else if $in < 1day {
                '#a03b1e'
            } else if $in < 3day {
                '#237986'
            } else if $in < 1wk {
                { fg: '#237986' attr: 'b' }
            } else if $in < 6wk {
                '#b02f30'
            } else if $in < 52wk {
                '#484d79'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#9ea7a6'
            } else if $e < 1mb {
                '#b02f30'
            } else {{ fg: '#484d79' }}
        }

        shape_and: { fg: '#c59820' attr: 'b' }
        shape_binary: { fg: '#c59820' attr: 'b' }
        shape_block: { fg: '#484d79' attr: 'b' }
        shape_bool: '#b02f30'
        shape_closure: { fg: '#b02f30' attr: 'b' }
        shape_custom: '#237986'
        shape_datetime: { fg: '#b02f30' attr: 'b' }
        shape_directory: '#b02f30'
        shape_external: '#b02f30'
        shape_external_resolved: '#b02f30'
        shape_externalarg: { fg: '#237986' attr: 'b' }
        shape_filepath: '#b02f30'
        shape_flag: { fg: '#484d79' attr: 'b' }
        shape_float: { fg: '#2a5491' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#b02f30' attr: 'b' }
        shape_globpattern: { fg: '#b02f30' attr: 'b' }
        shape_int: { fg: '#c59820' attr: 'b' }
        shape_internalcall: { fg: '#b02f30' attr: 'b' }
        shape_keyword: { fg: '#c59820' attr: 'b' }
        shape_list: { fg: '#b02f30' attr: 'b' }
        shape_literal: '#484d79'
        shape_match_pattern: '#237986'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#2a5491'
        shape_operator: '#a03b1e'
        shape_or: { fg: '#c59820' attr: 'b' }
        shape_pipe: { fg: '#c59820' attr: 'b' }
        shape_range: { fg: '#a03b1e' attr: 'b' }
        shape_raw_string: { fg: '#b5d8f6' attr: 'b' }
        shape_record: { fg: '#b02f30' attr: 'b' }
        shape_redirection: { fg: '#c59820' attr: 'b' }
        shape_signature: { fg: '#237986' attr: 'b' }
        shape_string: '#237986'
        shape_string_interpolation: { fg: '#b02f30' attr: 'b' }
        shape_table: { fg: '#484d79' attr: 'b' }
        shape_vardecl: { fg: '#484d79' attr: 'u' }
        shape_variable: '#c59820'

        foreground: '#9ea7a6'
        background: '#232c31'
        cursor: '#9ea7a6'

        empty: '#484d79'
        header: { fg: '#237986' attr: 'b' }
        hints: '#3f4944'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#237986' attr: 'b' }
        search_result: { fg: '#2a5491' bg: '#9ea7a6' }
        separator: '#9ea7a6'
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