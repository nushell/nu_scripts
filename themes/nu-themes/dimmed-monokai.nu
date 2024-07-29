# Retrieve the theme settings
export def main [] {
    return {
        binary: '#855c8d'
        block: '#4f76a1'
        cell-path: '#b9bcba'
        closure: '#578fa4'
        custom: '#fdffb9'
        duration: '#c5a635'
        float: '#fb001f'
        glob: '#fdffb9'
        int: '#855c8d'
        list: '#578fa4'
        nothing: '#be3f48'
        range: '#c5a635'
        record: '#578fa4'
        string: '#879a3b'

        bool: {|| if $in { '#2e706d' } else { '#c5a635' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#be3f48' attr: 'b' }
            } else if $in < 6hr {
                '#be3f48'
            } else if $in < 1day {
                '#c5a635'
            } else if $in < 3day {
                '#879a3b'
            } else if $in < 1wk {
                { fg: '#879a3b' attr: 'b' }
            } else if $in < 6wk {
                '#578fa4'
            } else if $in < 52wk {
                '#4f76a1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b9bcba'
            } else if $e < 1mb {
                '#578fa4'
            } else {{ fg: '#4f76a1' }}
        }

        shape_and: { fg: '#855c8d' attr: 'b' }
        shape_binary: { fg: '#855c8d' attr: 'b' }
        shape_block: { fg: '#4f76a1' attr: 'b' }
        shape_bool: '#2e706d'
        shape_closure: { fg: '#578fa4' attr: 'b' }
        shape_custom: '#879a3b'
        shape_datetime: { fg: '#578fa4' attr: 'b' }
        shape_directory: '#578fa4'
        shape_external: '#578fa4'
        shape_external_resolved: '#2e706d'
        shape_externalarg: { fg: '#879a3b' attr: 'b' }
        shape_filepath: '#578fa4'
        shape_flag: { fg: '#4f76a1' attr: 'b' }
        shape_float: { fg: '#fb001f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#578fa4' attr: 'b' }
        shape_globpattern: { fg: '#578fa4' attr: 'b' }
        shape_int: { fg: '#855c8d' attr: 'b' }
        shape_internalcall: { fg: '#578fa4' attr: 'b' }
        shape_keyword: { fg: '#855c8d' attr: 'b' }
        shape_list: { fg: '#578fa4' attr: 'b' }
        shape_literal: '#4f76a1'
        shape_match_pattern: '#879a3b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#be3f48'
        shape_operator: '#c5a635'
        shape_or: { fg: '#855c8d' attr: 'b' }
        shape_pipe: { fg: '#855c8d' attr: 'b' }
        shape_range: { fg: '#c5a635' attr: 'b' }
        shape_raw_string: { fg: '#fdffb9' attr: 'b' }
        shape_record: { fg: '#578fa4' attr: 'b' }
        shape_redirection: { fg: '#855c8d' attr: 'b' }
        shape_signature: { fg: '#879a3b' attr: 'b' }
        shape_string: '#879a3b'
        shape_string_interpolation: { fg: '#578fa4' attr: 'b' }
        shape_table: { fg: '#4f76a1' attr: 'b' }
        shape_vardecl: { fg: '#4f76a1' attr: 'u' }
        shape_variable: '#855c8d'

        foreground: '#b9bcba'
        background: '#1f1f1f'
        cursor: '#b9bcba'

        empty: '#4f76a1'
        header: { fg: '#879a3b' attr: 'b' }
        hints: '#888987'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#879a3b' attr: 'b' }
        search_result: { fg: '#be3f48' bg: '#b9bcba' }
        separator: '#b9bcba'
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