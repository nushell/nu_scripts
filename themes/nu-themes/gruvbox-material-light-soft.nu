# Retrieve the theme settings
export def main [] {
    return {
        binary: '#945e80'
        block: '#45707a'
        cell-path: '#654735'
        closure: '#4c7a5d'
        custom: '#654735'
        duration: '#b47109'
        float: '#c14a4a'
        glob: '#654735'
        int: '#945e80'
        list: '#4c7a5d'
        nothing: '#c14a4a'
        range: '#b47109'
        record: '#4c7a5d'
        string: '#6c782e'

        bool: {|| if $in { '#4c7a5d' } else { '#b47109' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c14a4a' attr: 'b' }
            } else if $in < 6hr {
                '#c14a4a'
            } else if $in < 1day {
                '#b47109'
            } else if $in < 3day {
                '#6c782e'
            } else if $in < 1wk {
                { fg: '#6c782e' attr: 'b' }
            } else if $in < 6wk {
                '#4c7a5d'
            } else if $in < 52wk {
                '#45707a'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#654735'
            } else if $e < 1mb {
                '#4c7a5d'
            } else {{ fg: '#45707a' }}
        }

        shape_and: { fg: '#945e80' attr: 'b' }
        shape_binary: { fg: '#945e80' attr: 'b' }
        shape_block: { fg: '#45707a' attr: 'b' }
        shape_bool: '#4c7a5d'
        shape_closure: { fg: '#4c7a5d' attr: 'b' }
        shape_custom: '#6c782e'
        shape_datetime: { fg: '#4c7a5d' attr: 'b' }
        shape_directory: '#4c7a5d'
        shape_external: '#4c7a5d'
        shape_external_resolved: '#4c7a5d'
        shape_externalarg: { fg: '#6c782e' attr: 'b' }
        shape_filepath: '#4c7a5d'
        shape_flag: { fg: '#45707a' attr: 'b' }
        shape_float: { fg: '#c14a4a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#4c7a5d' attr: 'b' }
        shape_globpattern: { fg: '#4c7a5d' attr: 'b' }
        shape_int: { fg: '#945e80' attr: 'b' }
        shape_internalcall: { fg: '#4c7a5d' attr: 'b' }
        shape_keyword: { fg: '#945e80' attr: 'b' }
        shape_list: { fg: '#4c7a5d' attr: 'b' }
        shape_literal: '#45707a'
        shape_match_pattern: '#6c782e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c14a4a'
        shape_operator: '#b47109'
        shape_or: { fg: '#945e80' attr: 'b' }
        shape_pipe: { fg: '#945e80' attr: 'b' }
        shape_range: { fg: '#b47109' attr: 'b' }
        shape_raw_string: { fg: '#654735' attr: 'b' }
        shape_record: { fg: '#4c7a5d' attr: 'b' }
        shape_redirection: { fg: '#945e80' attr: 'b' }
        shape_signature: { fg: '#6c782e' attr: 'b' }
        shape_string: '#6c782e'
        shape_string_interpolation: { fg: '#4c7a5d' attr: 'b' }
        shape_table: { fg: '#45707a' attr: 'b' }
        shape_vardecl: { fg: '#45707a' attr: 'u' }
        shape_variable: '#945e80'

        foreground: '#654735'
        background: '#f2e5bc'
        cursor: '#654735'

        empty: '#45707a'
        header: { fg: '#6c782e' attr: 'b' }
        hints: '#f2e5bc'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6c782e' attr: 'b' }
        search_result: { fg: '#c14a4a' bg: '#654735' }
        separator: '#654735'
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