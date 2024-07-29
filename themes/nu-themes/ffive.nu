# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b035c0'
        block: '#356abf'
        cell-path: '#dadadb'
        closure: '#54cece'
        custom: '#ffffff'
        duration: '#f8f800'
        float: '#ee5463'
        glob: '#ffffff'
        int: '#b035c0'
        list: '#54cece'
        nothing: '#ea2639'
        range: '#f8f800'
        record: '#54cece'
        string: '#32bf46'

        bool: {|| if $in { '#6dd8d8' } else { '#f8f800' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ea2639' attr: 'b' }
            } else if $in < 6hr {
                '#ea2639'
            } else if $in < 1day {
                '#f8f800'
            } else if $in < 3day {
                '#32bf46'
            } else if $in < 1wk {
                { fg: '#32bf46' attr: 'b' }
            } else if $in < 6wk {
                '#54cece'
            } else if $in < 52wk {
                '#356abf'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#dadadb'
            } else if $e < 1mb {
                '#54cece'
            } else {{ fg: '#356abf' }}
        }

        shape_and: { fg: '#b035c0' attr: 'b' }
        shape_binary: { fg: '#b035c0' attr: 'b' }
        shape_block: { fg: '#356abf' attr: 'b' }
        shape_bool: '#6dd8d8'
        shape_closure: { fg: '#54cece' attr: 'b' }
        shape_custom: '#32bf46'
        shape_datetime: { fg: '#54cece' attr: 'b' }
        shape_directory: '#54cece'
        shape_external: '#54cece'
        shape_external_resolved: '#6dd8d8'
        shape_externalarg: { fg: '#32bf46' attr: 'b' }
        shape_filepath: '#54cece'
        shape_flag: { fg: '#356abf' attr: 'b' }
        shape_float: { fg: '#ee5463' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#54cece' attr: 'b' }
        shape_globpattern: { fg: '#54cece' attr: 'b' }
        shape_int: { fg: '#b035c0' attr: 'b' }
        shape_internalcall: { fg: '#54cece' attr: 'b' }
        shape_keyword: { fg: '#b035c0' attr: 'b' }
        shape_list: { fg: '#54cece' attr: 'b' }
        shape_literal: '#356abf'
        shape_match_pattern: '#32bf46'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ea2639'
        shape_operator: '#f8f800'
        shape_or: { fg: '#b035c0' attr: 'b' }
        shape_pipe: { fg: '#b035c0' attr: 'b' }
        shape_range: { fg: '#f8f800' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#54cece' attr: 'b' }
        shape_redirection: { fg: '#b035c0' attr: 'b' }
        shape_signature: { fg: '#32bf46' attr: 'b' }
        shape_string: '#32bf46'
        shape_string_interpolation: { fg: '#54cece' attr: 'b' }
        shape_table: { fg: '#356abf' attr: 'b' }
        shape_vardecl: { fg: '#356abf' attr: 'u' }
        shape_variable: '#b035c0'

        foreground: '#dadadb'
        background: '#1d1e20'
        cursor: '#dadadb'

        empty: '#356abf'
        header: { fg: '#32bf46' attr: 'b' }
        hints: '#565656'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#32bf46' attr: 'b' }
        search_result: { fg: '#ea2639' bg: '#dadadb' }
        separator: '#dadadb'
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