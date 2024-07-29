# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ba5aba'
        block: '#408aca'
        cell-path: '#606060'
        closure: '#a070e0'
        custom: '#e0e0e0'
        duration: '#ffb060'
        float: '#d06080'
        glob: '#e0e0e0'
        int: '#ba5aba'
        list: '#a070e0'
        nothing: '#b04060'
        range: '#ffb060'
        record: '#a070e0'
        string: '#70d0a0'

        bool: {|| if $in { '#caa0f0' } else { '#ffb060' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b04060' attr: 'b' }
            } else if $in < 6hr {
                '#b04060'
            } else if $in < 1day {
                '#ffb060'
            } else if $in < 3day {
                '#70d0a0'
            } else if $in < 1wk {
                { fg: '#70d0a0' attr: 'b' }
            } else if $in < 6wk {
                '#a070e0'
            } else if $in < 52wk {
                '#408aca'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#606060'
            } else if $e < 1mb {
                '#a070e0'
            } else {{ fg: '#408aca' }}
        }

        shape_and: { fg: '#ba5aba' attr: 'b' }
        shape_binary: { fg: '#ba5aba' attr: 'b' }
        shape_block: { fg: '#408aca' attr: 'b' }
        shape_bool: '#caa0f0'
        shape_closure: { fg: '#a070e0' attr: 'b' }
        shape_custom: '#70d0a0'
        shape_datetime: { fg: '#a070e0' attr: 'b' }
        shape_directory: '#a070e0'
        shape_external: '#a070e0'
        shape_external_resolved: '#caa0f0'
        shape_externalarg: { fg: '#70d0a0' attr: 'b' }
        shape_filepath: '#a070e0'
        shape_flag: { fg: '#408aca' attr: 'b' }
        shape_float: { fg: '#d06080' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#a070e0' attr: 'b' }
        shape_globpattern: { fg: '#a070e0' attr: 'b' }
        shape_int: { fg: '#ba5aba' attr: 'b' }
        shape_internalcall: { fg: '#a070e0' attr: 'b' }
        shape_keyword: { fg: '#ba5aba' attr: 'b' }
        shape_list: { fg: '#a070e0' attr: 'b' }
        shape_literal: '#408aca'
        shape_match_pattern: '#70d0a0'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b04060'
        shape_operator: '#ffb060'
        shape_or: { fg: '#ba5aba' attr: 'b' }
        shape_pipe: { fg: '#ba5aba' attr: 'b' }
        shape_range: { fg: '#ffb060' attr: 'b' }
        shape_raw_string: { fg: '#e0e0e0' attr: 'b' }
        shape_record: { fg: '#a070e0' attr: 'b' }
        shape_redirection: { fg: '#ba5aba' attr: 'b' }
        shape_signature: { fg: '#70d0a0' attr: 'b' }
        shape_string: '#70d0a0'
        shape_string_interpolation: { fg: '#a070e0' attr: 'b' }
        shape_table: { fg: '#408aca' attr: 'b' }
        shape_vardecl: { fg: '#408aca' attr: 'u' }
        shape_variable: '#ba5aba'

        foreground: '#ffcada'
        background: '#200a28'
        cursor: '#ffa0a0'

        empty: '#408aca'
        header: { fg: '#70d0a0' attr: 'b' }
        hints: '#b0b0b0'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#70d0a0' attr: 'b' }
        search_result: { fg: '#b04060' bg: '#606060' }
        separator: '#606060'
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