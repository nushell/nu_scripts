# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a957ec'
        block: '#5ea2ec'
        cell-path: '#918988'
        closure: '#5eeea0'
        custom: '#f5eeec'
        duration: '#f5a255'
        float: '#f579b2'
        glob: '#f5eeec'
        int: '#a957ec'
        list: '#5eeea0'
        nothing: '#f557a0'
        range: '#f5a255'
        record: '#5eeea0'
        string: '#a9ee55'

        bool: {|| if $in { '#81eeb2' } else { '#f5a255' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f557a0' attr: 'b' }
            } else if $in < 6hr {
                '#f557a0'
            } else if $in < 1day {
                '#f5a255'
            } else if $in < 3day {
                '#a9ee55'
            } else if $in < 1wk {
                { fg: '#a9ee55' attr: 'b' }
            } else if $in < 6wk {
                '#5eeea0'
            } else if $in < 52wk {
                '#5ea2ec'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#918988'
            } else if $e < 1mb {
                '#5eeea0'
            } else {{ fg: '#5ea2ec' }}
        }

        shape_and: { fg: '#a957ec' attr: 'b' }
        shape_binary: { fg: '#a957ec' attr: 'b' }
        shape_block: { fg: '#5ea2ec' attr: 'b' }
        shape_bool: '#81eeb2'
        shape_closure: { fg: '#5eeea0' attr: 'b' }
        shape_custom: '#a9ee55'
        shape_datetime: { fg: '#5eeea0' attr: 'b' }
        shape_directory: '#5eeea0'
        shape_external: '#5eeea0'
        shape_external_resolved: '#81eeb2'
        shape_externalarg: { fg: '#a9ee55' attr: 'b' }
        shape_filepath: '#5eeea0'
        shape_flag: { fg: '#5ea2ec' attr: 'b' }
        shape_float: { fg: '#f579b2' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5eeea0' attr: 'b' }
        shape_globpattern: { fg: '#5eeea0' attr: 'b' }
        shape_int: { fg: '#a957ec' attr: 'b' }
        shape_internalcall: { fg: '#5eeea0' attr: 'b' }
        shape_keyword: { fg: '#a957ec' attr: 'b' }
        shape_list: { fg: '#5eeea0' attr: 'b' }
        shape_literal: '#5ea2ec'
        shape_match_pattern: '#a9ee55'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f557a0'
        shape_operator: '#f5a255'
        shape_or: { fg: '#a957ec' attr: 'b' }
        shape_pipe: { fg: '#a957ec' attr: 'b' }
        shape_range: { fg: '#f5a255' attr: 'b' }
        shape_raw_string: { fg: '#f5eeec' attr: 'b' }
        shape_record: { fg: '#5eeea0' attr: 'b' }
        shape_redirection: { fg: '#a957ec' attr: 'b' }
        shape_signature: { fg: '#a9ee55' attr: 'b' }
        shape_string: '#a9ee55'
        shape_string_interpolation: { fg: '#5eeea0' attr: 'b' }
        shape_table: { fg: '#5ea2ec' attr: 'b' }
        shape_vardecl: { fg: '#5ea2ec' attr: 'u' }
        shape_variable: '#a957ec'

        foreground: '#a9bed8'
        background: '#012849'
        cursor: '#a9bed8'

        empty: '#5ea2ec'
        header: { fg: '#a9ee55' attr: 'b' }
        hints: '#918988'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a9ee55' attr: 'b' }
        search_result: { fg: '#f557a0' bg: '#918988' }
        separator: '#918988'
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