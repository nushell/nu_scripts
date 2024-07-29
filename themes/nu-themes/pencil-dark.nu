# Retrieve the theme settings
export def main [] {
    return {
        binary: '#523c79'
        block: '#008ec4'
        cell-path: '#d9d9d9'
        closure: '#20a5ba'
        custom: '#f1f1f1'
        duration: '#a89c14'
        float: '#fb007a'
        glob: '#f1f1f1'
        int: '#523c79'
        list: '#20a5ba'
        nothing: '#c30771'
        range: '#a89c14'
        record: '#20a5ba'
        string: '#10a778'

        bool: {|| if $in { '#4fb8cc' } else { '#a89c14' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c30771' attr: 'b' }
            } else if $in < 6hr {
                '#c30771'
            } else if $in < 1day {
                '#a89c14'
            } else if $in < 3day {
                '#10a778'
            } else if $in < 1wk {
                { fg: '#10a778' attr: 'b' }
            } else if $in < 6wk {
                '#20a5ba'
            } else if $in < 52wk {
                '#008ec4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d9d9d9'
            } else if $e < 1mb {
                '#20a5ba'
            } else {{ fg: '#008ec4' }}
        }

        shape_and: { fg: '#523c79' attr: 'b' }
        shape_binary: { fg: '#523c79' attr: 'b' }
        shape_block: { fg: '#008ec4' attr: 'b' }
        shape_bool: '#4fb8cc'
        shape_closure: { fg: '#20a5ba' attr: 'b' }
        shape_custom: '#10a778'
        shape_datetime: { fg: '#20a5ba' attr: 'b' }
        shape_directory: '#20a5ba'
        shape_external: '#20a5ba'
        shape_external_resolved: '#4fb8cc'
        shape_externalarg: { fg: '#10a778' attr: 'b' }
        shape_filepath: '#20a5ba'
        shape_flag: { fg: '#008ec4' attr: 'b' }
        shape_float: { fg: '#fb007a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#20a5ba' attr: 'b' }
        shape_globpattern: { fg: '#20a5ba' attr: 'b' }
        shape_int: { fg: '#523c79' attr: 'b' }
        shape_internalcall: { fg: '#20a5ba' attr: 'b' }
        shape_keyword: { fg: '#523c79' attr: 'b' }
        shape_list: { fg: '#20a5ba' attr: 'b' }
        shape_literal: '#008ec4'
        shape_match_pattern: '#10a778'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c30771'
        shape_operator: '#a89c14'
        shape_or: { fg: '#523c79' attr: 'b' }
        shape_pipe: { fg: '#523c79' attr: 'b' }
        shape_range: { fg: '#a89c14' attr: 'b' }
        shape_raw_string: { fg: '#f1f1f1' attr: 'b' }
        shape_record: { fg: '#20a5ba' attr: 'b' }
        shape_redirection: { fg: '#523c79' attr: 'b' }
        shape_signature: { fg: '#10a778' attr: 'b' }
        shape_string: '#10a778'
        shape_string_interpolation: { fg: '#20a5ba' attr: 'b' }
        shape_table: { fg: '#008ec4' attr: 'b' }
        shape_vardecl: { fg: '#008ec4' attr: 'u' }
        shape_variable: '#523c79'

        foreground: '#f1f1f1'
        background: '#212121'
        cursor: '#f1f1f1'

        empty: '#008ec4'
        header: { fg: '#10a778' attr: 'b' }
        hints: '#424242'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#10a778' attr: 'b' }
        search_result: { fg: '#c30771' bg: '#d9d9d9' }
        separator: '#d9d9d9'
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