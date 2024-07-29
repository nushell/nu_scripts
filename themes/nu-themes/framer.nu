# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ba8cfc'
        block: '#20bcfc'
        cell-path: '#d0d0d0'
        closure: '#acddfd'
        custom: '#eeeeee'
        duration: '#fecb6e'
        float: '#fd886b'
        glob: '#eeeeee'
        int: '#ba8cfc'
        list: '#acddfd'
        nothing: '#fd886b'
        range: '#fecb6e'
        record: '#acddfd'
        string: '#32ccdc'

        bool: {|| if $in { '#acddfd' } else { '#fecb6e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fd886b' attr: 'b' }
            } else if $in < 6hr {
                '#fd886b'
            } else if $in < 1day {
                '#fecb6e'
            } else if $in < 3day {
                '#32ccdc'
            } else if $in < 1wk {
                { fg: '#32ccdc' attr: 'b' }
            } else if $in < 6wk {
                '#acddfd'
            } else if $in < 52wk {
                '#20bcfc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0d0d0'
            } else if $e < 1mb {
                '#acddfd'
            } else {{ fg: '#20bcfc' }}
        }

        shape_and: { fg: '#ba8cfc' attr: 'b' }
        shape_binary: { fg: '#ba8cfc' attr: 'b' }
        shape_block: { fg: '#20bcfc' attr: 'b' }
        shape_bool: '#acddfd'
        shape_closure: { fg: '#acddfd' attr: 'b' }
        shape_custom: '#32ccdc'
        shape_datetime: { fg: '#acddfd' attr: 'b' }
        shape_directory: '#acddfd'
        shape_external: '#acddfd'
        shape_external_resolved: '#acddfd'
        shape_externalarg: { fg: '#32ccdc' attr: 'b' }
        shape_filepath: '#acddfd'
        shape_flag: { fg: '#20bcfc' attr: 'b' }
        shape_float: { fg: '#fd886b' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#acddfd' attr: 'b' }
        shape_globpattern: { fg: '#acddfd' attr: 'b' }
        shape_int: { fg: '#ba8cfc' attr: 'b' }
        shape_internalcall: { fg: '#acddfd' attr: 'b' }
        shape_keyword: { fg: '#ba8cfc' attr: 'b' }
        shape_list: { fg: '#acddfd' attr: 'b' }
        shape_literal: '#20bcfc'
        shape_match_pattern: '#32ccdc'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fd886b'
        shape_operator: '#fecb6e'
        shape_or: { fg: '#ba8cfc' attr: 'b' }
        shape_pipe: { fg: '#ba8cfc' attr: 'b' }
        shape_range: { fg: '#fecb6e' attr: 'b' }
        shape_raw_string: { fg: '#eeeeee' attr: 'b' }
        shape_record: { fg: '#acddfd' attr: 'b' }
        shape_redirection: { fg: '#ba8cfc' attr: 'b' }
        shape_signature: { fg: '#32ccdc' attr: 'b' }
        shape_string: '#32ccdc'
        shape_string_interpolation: { fg: '#acddfd' attr: 'b' }
        shape_table: { fg: '#20bcfc' attr: 'b' }
        shape_vardecl: { fg: '#20bcfc' attr: 'u' }
        shape_variable: '#ba8cfc'

        foreground: '#d0d0d0'
        background: '#181818'
        cursor: '#d0d0d0'

        empty: '#20bcfc'
        header: { fg: '#32ccdc' attr: 'b' }
        hints: '#747474'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#32ccdc' attr: 'b' }
        search_result: { fg: '#fd886b' bg: '#d0d0d0' }
        separator: '#d0d0d0'
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