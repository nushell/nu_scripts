# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a46dac'
        block: '#6d74ac'
        cell-path: '#e6e6e6'
        closure: '#6daca4'
        custom: '#ffffff'
        duration: '#aca46d'
        float: '#d6b8bc'
        glob: '#ffffff'
        int: '#a46dac'
        list: '#6daca4'
        nothing: '#ac6d74'
        range: '#aca46d'
        record: '#6daca4'
        string: '#74ac6d'

        bool: {|| if $in { '#b8d6d3' } else { '#aca46d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ac6d74' attr: 'b' }
            } else if $in < 6hr {
                '#ac6d74'
            } else if $in < 1day {
                '#aca46d'
            } else if $in < 3day {
                '#74ac6d'
            } else if $in < 1wk {
                { fg: '#74ac6d' attr: 'b' }
            } else if $in < 6wk {
                '#6daca4'
            } else if $in < 52wk {
                '#6d74ac'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e6e6e6'
            } else if $e < 1mb {
                '#6daca4'
            } else {{ fg: '#6d74ac' }}
        }

        shape_and: { fg: '#a46dac' attr: 'b' }
        shape_binary: { fg: '#a46dac' attr: 'b' }
        shape_block: { fg: '#6d74ac' attr: 'b' }
        shape_bool: '#b8d6d3'
        shape_closure: { fg: '#6daca4' attr: 'b' }
        shape_custom: '#74ac6d'
        shape_datetime: { fg: '#6daca4' attr: 'b' }
        shape_directory: '#6daca4'
        shape_external: '#6daca4'
        shape_external_resolved: '#b8d6d3'
        shape_externalarg: { fg: '#74ac6d' attr: 'b' }
        shape_filepath: '#6daca4'
        shape_flag: { fg: '#6d74ac' attr: 'b' }
        shape_float: { fg: '#d6b8bc' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#6daca4' attr: 'b' }
        shape_globpattern: { fg: '#6daca4' attr: 'b' }
        shape_int: { fg: '#a46dac' attr: 'b' }
        shape_internalcall: { fg: '#6daca4' attr: 'b' }
        shape_keyword: { fg: '#a46dac' attr: 'b' }
        shape_list: { fg: '#6daca4' attr: 'b' }
        shape_literal: '#6d74ac'
        shape_match_pattern: '#74ac6d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ac6d74'
        shape_operator: '#aca46d'
        shape_or: { fg: '#a46dac' attr: 'b' }
        shape_pipe: { fg: '#a46dac' attr: 'b' }
        shape_range: { fg: '#aca46d' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#6daca4' attr: 'b' }
        shape_redirection: { fg: '#a46dac' attr: 'b' }
        shape_signature: { fg: '#74ac6d' attr: 'b' }
        shape_string: '#74ac6d'
        shape_string_interpolation: { fg: '#6daca4' attr: 'b' }
        shape_table: { fg: '#6d74ac' attr: 'b' }
        shape_vardecl: { fg: '#6d74ac' attr: 'u' }
        shape_variable: '#a46dac'

        foreground: '#d9e6f2'
        background: '#09111a'
        cursor: '#d9e6f2'

        empty: '#6d74ac'
        header: { fg: '#74ac6d' attr: 'b' }
        hints: '#262626'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#74ac6d' attr: 'b' }
        search_result: { fg: '#ac6d74' bg: '#e6e6e6' }
        separator: '#e6e6e6'
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