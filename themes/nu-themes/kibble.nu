# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8400ff'
        block: '#3449d1'
        cell-path: '#e2d1e3'
        closure: '#0798ab'
        custom: '#ffffff'
        duration: '#d8e30e'
        float: '#f01578'
        glob: '#ffffff'
        int: '#8400ff'
        list: '#0798ab'
        nothing: '#c70031'
        range: '#d8e30e'
        record: '#0798ab'
        string: '#29cf13'

        bool: {|| if $in { '#68f2e0' } else { '#d8e30e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c70031' attr: 'b' }
            } else if $in < 6hr {
                '#c70031'
            } else if $in < 1day {
                '#d8e30e'
            } else if $in < 3day {
                '#29cf13'
            } else if $in < 1wk {
                { fg: '#29cf13' attr: 'b' }
            } else if $in < 6wk {
                '#0798ab'
            } else if $in < 52wk {
                '#3449d1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e2d1e3'
            } else if $e < 1mb {
                '#0798ab'
            } else {{ fg: '#3449d1' }}
        }

        shape_and: { fg: '#8400ff' attr: 'b' }
        shape_binary: { fg: '#8400ff' attr: 'b' }
        shape_block: { fg: '#3449d1' attr: 'b' }
        shape_bool: '#68f2e0'
        shape_closure: { fg: '#0798ab' attr: 'b' }
        shape_custom: '#29cf13'
        shape_datetime: { fg: '#0798ab' attr: 'b' }
        shape_directory: '#0798ab'
        shape_external: '#0798ab'
        shape_external_resolved: '#68f2e0'
        shape_externalarg: { fg: '#29cf13' attr: 'b' }
        shape_filepath: '#0798ab'
        shape_flag: { fg: '#3449d1' attr: 'b' }
        shape_float: { fg: '#f01578' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0798ab' attr: 'b' }
        shape_globpattern: { fg: '#0798ab' attr: 'b' }
        shape_int: { fg: '#8400ff' attr: 'b' }
        shape_internalcall: { fg: '#0798ab' attr: 'b' }
        shape_keyword: { fg: '#8400ff' attr: 'b' }
        shape_list: { fg: '#0798ab' attr: 'b' }
        shape_literal: '#3449d1'
        shape_match_pattern: '#29cf13'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c70031'
        shape_operator: '#d8e30e'
        shape_or: { fg: '#8400ff' attr: 'b' }
        shape_pipe: { fg: '#8400ff' attr: 'b' }
        shape_range: { fg: '#d8e30e' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#0798ab' attr: 'b' }
        shape_redirection: { fg: '#8400ff' attr: 'b' }
        shape_signature: { fg: '#29cf13' attr: 'b' }
        shape_string: '#29cf13'
        shape_string_interpolation: { fg: '#0798ab' attr: 'b' }
        shape_table: { fg: '#3449d1' attr: 'b' }
        shape_vardecl: { fg: '#3449d1' attr: 'u' }
        shape_variable: '#8400ff'

        foreground: '#f7f7f7'
        background: '#0e100a'
        cursor: '#f7f7f7'

        empty: '#3449d1'
        header: { fg: '#29cf13' attr: 'b' }
        hints: '#5a5a5a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#29cf13' attr: 'b' }
        search_result: { fg: '#c70031' bg: '#e2d1e3' }
        separator: '#e2d1e3'
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