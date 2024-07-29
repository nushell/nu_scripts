# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9b859d'
        block: '#5ea6ea'
        cell-path: '#8a8986'
        closure: '#afc4db'
        custom: '#baae9e'
        duration: '#f9ee98'
        float: '#cf6a4c'
        glob: '#baae9e'
        int: '#9b859d'
        list: '#afc4db'
        nothing: '#cf6a4c'
        range: '#f9ee98'
        record: '#afc4db'
        string: '#54be0d'

        bool: {|| if $in { '#afc4db' } else { '#f9ee98' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cf6a4c' attr: 'b' }
            } else if $in < 6hr {
                '#cf6a4c'
            } else if $in < 1day {
                '#f9ee98'
            } else if $in < 3day {
                '#54be0d'
            } else if $in < 1wk {
                { fg: '#54be0d' attr: 'b' }
            } else if $in < 6wk {
                '#afc4db'
            } else if $in < 52wk {
                '#5ea6ea'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#8a8986'
            } else if $e < 1mb {
                '#afc4db'
            } else {{ fg: '#5ea6ea' }}
        }

        shape_and: { fg: '#9b859d' attr: 'b' }
        shape_binary: { fg: '#9b859d' attr: 'b' }
        shape_block: { fg: '#5ea6ea' attr: 'b' }
        shape_bool: '#afc4db'
        shape_closure: { fg: '#afc4db' attr: 'b' }
        shape_custom: '#54be0d'
        shape_datetime: { fg: '#afc4db' attr: 'b' }
        shape_directory: '#afc4db'
        shape_external: '#afc4db'
        shape_external_resolved: '#afc4db'
        shape_externalarg: { fg: '#54be0d' attr: 'b' }
        shape_filepath: '#afc4db'
        shape_flag: { fg: '#5ea6ea' attr: 'b' }
        shape_float: { fg: '#cf6a4c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#afc4db' attr: 'b' }
        shape_globpattern: { fg: '#afc4db' attr: 'b' }
        shape_int: { fg: '#9b859d' attr: 'b' }
        shape_internalcall: { fg: '#afc4db' attr: 'b' }
        shape_keyword: { fg: '#9b859d' attr: 'b' }
        shape_list: { fg: '#afc4db' attr: 'b' }
        shape_literal: '#5ea6ea'
        shape_match_pattern: '#54be0d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cf6a4c'
        shape_operator: '#f9ee98'
        shape_or: { fg: '#9b859d' attr: 'b' }
        shape_pipe: { fg: '#9b859d' attr: 'b' }
        shape_range: { fg: '#f9ee98' attr: 'b' }
        shape_raw_string: { fg: '#baae9e' attr: 'b' }
        shape_record: { fg: '#afc4db' attr: 'b' }
        shape_redirection: { fg: '#9b859d' attr: 'b' }
        shape_signature: { fg: '#54be0d' attr: 'b' }
        shape_string: '#54be0d'
        shape_string_interpolation: { fg: '#afc4db' attr: 'b' }
        shape_table: { fg: '#5ea6ea' attr: 'b' }
        shape_vardecl: { fg: '#5ea6ea' attr: 'u' }
        shape_variable: '#9b859d'

        foreground: '#8a8986'
        background: '#28211c'
        cursor: '#8a8986'

        empty: '#5ea6ea'
        header: { fg: '#54be0d' attr: 'b' }
        hints: '#666666'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#54be0d' attr: 'b' }
        search_result: { fg: '#cf6a4c' bg: '#8a8986' }
        separator: '#8a8986'
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