# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a47996'
        block: '#7d8fa4'
        cell-path: '#b3b8c3'
        closure: '#85a7a5'
        custom: '#ffffff'
        duration: '#e5c179'
        float: '#b04b57'
        glob: '#ffffff'
        int: '#a47996'
        list: '#85a7a5'
        nothing: '#b04b57'
        range: '#e5c179'
        record: '#85a7a5'
        string: '#87b379'

        bool: {|| if $in { '#85a7a5' } else { '#e5c179' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b04b57' attr: 'b' }
            } else if $in < 6hr {
                '#b04b57'
            } else if $in < 1day {
                '#e5c179'
            } else if $in < 3day {
                '#87b379'
            } else if $in < 1wk {
                { fg: '#87b379' attr: 'b' }
            } else if $in < 6wk {
                '#85a7a5'
            } else if $in < 52wk {
                '#7d8fa4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b3b8c3'
            } else if $e < 1mb {
                '#85a7a5'
            } else {{ fg: '#7d8fa4' }}
        }

        shape_and: { fg: '#a47996' attr: 'b' }
        shape_binary: { fg: '#a47996' attr: 'b' }
        shape_block: { fg: '#7d8fa4' attr: 'b' }
        shape_bool: '#85a7a5'
        shape_closure: { fg: '#85a7a5' attr: 'b' }
        shape_custom: '#87b379'
        shape_datetime: { fg: '#85a7a5' attr: 'b' }
        shape_directory: '#85a7a5'
        shape_external: '#85a7a5'
        shape_external_resolved: '#85a7a5'
        shape_externalarg: { fg: '#87b379' attr: 'b' }
        shape_filepath: '#85a7a5'
        shape_flag: { fg: '#7d8fa4' attr: 'b' }
        shape_float: { fg: '#b04b57' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#85a7a5' attr: 'b' }
        shape_globpattern: { fg: '#85a7a5' attr: 'b' }
        shape_int: { fg: '#a47996' attr: 'b' }
        shape_internalcall: { fg: '#85a7a5' attr: 'b' }
        shape_keyword: { fg: '#a47996' attr: 'b' }
        shape_list: { fg: '#85a7a5' attr: 'b' }
        shape_literal: '#7d8fa4'
        shape_match_pattern: '#87b379'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b04b57'
        shape_operator: '#e5c179'
        shape_or: { fg: '#a47996' attr: 'b' }
        shape_pipe: { fg: '#a47996' attr: 'b' }
        shape_range: { fg: '#e5c179' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#85a7a5' attr: 'b' }
        shape_redirection: { fg: '#a47996' attr: 'b' }
        shape_signature: { fg: '#87b379' attr: 'b' }
        shape_string: '#87b379'
        shape_string_interpolation: { fg: '#85a7a5' attr: 'b' }
        shape_table: { fg: '#7d8fa4' attr: 'b' }
        shape_vardecl: { fg: '#7d8fa4' attr: 'u' }
        shape_variable: '#a47996'

        foreground: '#b3b8c3'
        background: '#20242d'
        cursor: '#b3b8c3'

        empty: '#7d8fa4'
        header: { fg: '#87b379' attr: 'b' }
        hints: '#000000'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#87b379' attr: 'b' }
        search_result: { fg: '#b04b57' bg: '#b3b8c3' }
        separator: '#b3b8c3'
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