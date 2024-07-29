# Retrieve the theme settings
export def main [] {
    return {
        binary: '#695abc'
        block: '#5096be'
        cell-path: '#ffffff'
        closure: '#d63865'
        custom: '#ffffff'
        duration: '#f4ef6d'
        float: '#d22a24'
        glob: '#ffffff'
        int: '#695abc'
        list: '#d63865'
        nothing: '#f18339'
        range: '#f4ef6d'
        record: '#d63865'
        string: '#9fd364'

        bool: {|| if $in { '#d63865' } else { '#f4ef6d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f18339' attr: 'b' }
            } else if $in < 6hr {
                '#f18339'
            } else if $in < 1day {
                '#f4ef6d'
            } else if $in < 3day {
                '#9fd364'
            } else if $in < 1wk {
                { fg: '#9fd364' attr: 'b' }
            } else if $in < 6wk {
                '#d63865'
            } else if $in < 52wk {
                '#5096be'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#d63865'
            } else {{ fg: '#5096be' }}
        }

        shape_and: { fg: '#695abc' attr: 'b' }
        shape_binary: { fg: '#695abc' attr: 'b' }
        shape_block: { fg: '#5096be' attr: 'b' }
        shape_bool: '#d63865'
        shape_closure: { fg: '#d63865' attr: 'b' }
        shape_custom: '#9fd364'
        shape_datetime: { fg: '#d63865' attr: 'b' }
        shape_directory: '#d63865'
        shape_external: '#d63865'
        shape_external_resolved: '#d63865'
        shape_externalarg: { fg: '#9fd364' attr: 'b' }
        shape_filepath: '#d63865'
        shape_flag: { fg: '#5096be' attr: 'b' }
        shape_float: { fg: '#d22a24' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#d63865' attr: 'b' }
        shape_globpattern: { fg: '#d63865' attr: 'b' }
        shape_int: { fg: '#695abc' attr: 'b' }
        shape_internalcall: { fg: '#d63865' attr: 'b' }
        shape_keyword: { fg: '#695abc' attr: 'b' }
        shape_list: { fg: '#d63865' attr: 'b' }
        shape_literal: '#5096be'
        shape_match_pattern: '#9fd364'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f18339'
        shape_operator: '#f4ef6d'
        shape_or: { fg: '#695abc' attr: 'b' }
        shape_pipe: { fg: '#695abc' attr: 'b' }
        shape_range: { fg: '#f4ef6d' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#d63865' attr: 'b' }
        shape_redirection: { fg: '#695abc' attr: 'b' }
        shape_signature: { fg: '#9fd364' attr: 'b' }
        shape_string: '#9fd364'
        shape_string_interpolation: { fg: '#d63865' attr: 'b' }
        shape_table: { fg: '#5096be' attr: 'b' }
        shape_vardecl: { fg: '#5096be' attr: 'u' }
        shape_variable: '#695abc'

        foreground: '#b8dbef'
        background: '#1d1f21'
        cursor: '#b8dbef'

        empty: '#5096be'
        header: { fg: '#9fd364' attr: 'b' }
        hints: '#1d1d19'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#9fd364' attr: 'b' }
        search_result: { fg: '#f18339' bg: '#ffffff' }
        separator: '#ffffff'
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