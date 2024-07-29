# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b45bcf'
        block: '#62d6e8'
        cell-path: '#e9e9f4'
        closure: '#a1efe4'
        custom: '#f7f7fb'
        duration: '#00f769'
        float: '#ea51b2'
        glob: '#f7f7fb'
        int: '#b45bcf'
        list: '#a1efe4'
        nothing: '#ea51b2'
        range: '#00f769'
        record: '#a1efe4'
        string: '#ebff87'

        bool: {|| if $in { '#a1efe4' } else { '#00f769' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ea51b2' attr: 'b' }
            } else if $in < 6hr {
                '#ea51b2'
            } else if $in < 1day {
                '#00f769'
            } else if $in < 3day {
                '#ebff87'
            } else if $in < 1wk {
                { fg: '#ebff87' attr: 'b' }
            } else if $in < 6wk {
                '#a1efe4'
            } else if $in < 52wk {
                '#62d6e8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e9e9f4'
            } else if $e < 1mb {
                '#a1efe4'
            } else {{ fg: '#62d6e8' }}
        }

        shape_and: { fg: '#b45bcf' attr: 'b' }
        shape_binary: { fg: '#b45bcf' attr: 'b' }
        shape_block: { fg: '#62d6e8' attr: 'b' }
        shape_bool: '#a1efe4'
        shape_closure: { fg: '#a1efe4' attr: 'b' }
        shape_custom: '#ebff87'
        shape_datetime: { fg: '#a1efe4' attr: 'b' }
        shape_directory: '#a1efe4'
        shape_external: '#a1efe4'
        shape_external_resolved: '#a1efe4'
        shape_externalarg: { fg: '#ebff87' attr: 'b' }
        shape_filepath: '#a1efe4'
        shape_flag: { fg: '#62d6e8' attr: 'b' }
        shape_float: { fg: '#ea51b2' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#a1efe4' attr: 'b' }
        shape_globpattern: { fg: '#a1efe4' attr: 'b' }
        shape_int: { fg: '#b45bcf' attr: 'b' }
        shape_internalcall: { fg: '#a1efe4' attr: 'b' }
        shape_keyword: { fg: '#b45bcf' attr: 'b' }
        shape_list: { fg: '#a1efe4' attr: 'b' }
        shape_literal: '#62d6e8'
        shape_match_pattern: '#ebff87'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ea51b2'
        shape_operator: '#00f769'
        shape_or: { fg: '#b45bcf' attr: 'b' }
        shape_pipe: { fg: '#b45bcf' attr: 'b' }
        shape_range: { fg: '#00f769' attr: 'b' }
        shape_raw_string: { fg: '#f7f7fb' attr: 'b' }
        shape_record: { fg: '#a1efe4' attr: 'b' }
        shape_redirection: { fg: '#b45bcf' attr: 'b' }
        shape_signature: { fg: '#ebff87' attr: 'b' }
        shape_string: '#ebff87'
        shape_string_interpolation: { fg: '#a1efe4' attr: 'b' }
        shape_table: { fg: '#62d6e8' attr: 'b' }
        shape_vardecl: { fg: '#62d6e8' attr: 'u' }
        shape_variable: '#b45bcf'

        foreground: '#e9e9f4'
        background: '#282936'
        cursor: '#e9e9f4'

        empty: '#62d6e8'
        header: { fg: '#ebff87' attr: 'b' }
        hints: '#626483'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#ebff87' attr: 'b' }
        search_result: { fg: '#ea51b2' bg: '#e9e9f4' }
        separator: '#e9e9f4'
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