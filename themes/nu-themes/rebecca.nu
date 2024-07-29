# Retrieve the theme settings
export def main [] {
    return {
        binary: '#7aa5ff'
        block: '#2de0a7'
        cell-path: '#f1eff8'
        closure: '#8eaee0'
        custom: '#53495d'
        duration: '#ae81ff'
        float: '#a0a0c5'
        glob: '#53495d'
        int: '#7aa5ff'
        list: '#8eaee0'
        nothing: '#a0a0c5'
        range: '#ae81ff'
        record: '#8eaee0'
        string: '#6dfedf'

        bool: {|| if $in { '#8eaee0' } else { '#ae81ff' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a0a0c5' attr: 'b' }
            } else if $in < 6hr {
                '#a0a0c5'
            } else if $in < 1day {
                '#ae81ff'
            } else if $in < 3day {
                '#6dfedf'
            } else if $in < 1wk {
                { fg: '#6dfedf' attr: 'b' }
            } else if $in < 6wk {
                '#8eaee0'
            } else if $in < 52wk {
                '#2de0a7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f1eff8'
            } else if $e < 1mb {
                '#8eaee0'
            } else {{ fg: '#2de0a7' }}
        }

        shape_and: { fg: '#7aa5ff' attr: 'b' }
        shape_binary: { fg: '#7aa5ff' attr: 'b' }
        shape_block: { fg: '#2de0a7' attr: 'b' }
        shape_bool: '#8eaee0'
        shape_closure: { fg: '#8eaee0' attr: 'b' }
        shape_custom: '#6dfedf'
        shape_datetime: { fg: '#8eaee0' attr: 'b' }
        shape_directory: '#8eaee0'
        shape_external: '#8eaee0'
        shape_external_resolved: '#8eaee0'
        shape_externalarg: { fg: '#6dfedf' attr: 'b' }
        shape_filepath: '#8eaee0'
        shape_flag: { fg: '#2de0a7' attr: 'b' }
        shape_float: { fg: '#a0a0c5' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8eaee0' attr: 'b' }
        shape_globpattern: { fg: '#8eaee0' attr: 'b' }
        shape_int: { fg: '#7aa5ff' attr: 'b' }
        shape_internalcall: { fg: '#8eaee0' attr: 'b' }
        shape_keyword: { fg: '#7aa5ff' attr: 'b' }
        shape_list: { fg: '#8eaee0' attr: 'b' }
        shape_literal: '#2de0a7'
        shape_match_pattern: '#6dfedf'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a0a0c5'
        shape_operator: '#ae81ff'
        shape_or: { fg: '#7aa5ff' attr: 'b' }
        shape_pipe: { fg: '#7aa5ff' attr: 'b' }
        shape_range: { fg: '#ae81ff' attr: 'b' }
        shape_raw_string: { fg: '#53495d' attr: 'b' }
        shape_record: { fg: '#8eaee0' attr: 'b' }
        shape_redirection: { fg: '#7aa5ff' attr: 'b' }
        shape_signature: { fg: '#6dfedf' attr: 'b' }
        shape_string: '#6dfedf'
        shape_string_interpolation: { fg: '#8eaee0' attr: 'b' }
        shape_table: { fg: '#2de0a7' attr: 'b' }
        shape_vardecl: { fg: '#2de0a7' attr: 'u' }
        shape_variable: '#7aa5ff'

        foreground: '#f1eff8'
        background: '#292a44'
        cursor: '#f1eff8'

        empty: '#2de0a7'
        header: { fg: '#6dfedf' attr: 'b' }
        hints: '#666699'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6dfedf' attr: 'b' }
        search_result: { fg: '#a0a0c5' bg: '#f1eff8' }
        separator: '#f1eff8'
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