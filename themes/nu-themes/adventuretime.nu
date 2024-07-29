# Retrieve the theme settings
export def main [] {
    return {
        binary: '#665993'
        block: '#0f4ac6'
        cell-path: '#f8dcc0'
        closure: '#70a598'
        custom: '#f6f5fb'
        duration: '#e7741e'
        float: '#fc5f5a'
        glob: '#f6f5fb'
        int: '#665993'
        list: '#70a598'
        nothing: '#bd0013'
        range: '#e7741e'
        record: '#70a598'
        string: '#4ab118'

        bool: {|| if $in { '#c8faf4' } else { '#e7741e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#bd0013' attr: 'b' }
            } else if $in < 6hr {
                '#bd0013'
            } else if $in < 1day {
                '#e7741e'
            } else if $in < 3day {
                '#4ab118'
            } else if $in < 1wk {
                { fg: '#4ab118' attr: 'b' }
            } else if $in < 6wk {
                '#70a598'
            } else if $in < 52wk {
                '#0f4ac6'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f8dcc0'
            } else if $e < 1mb {
                '#70a598'
            } else {{ fg: '#0f4ac6' }}
        }

        shape_and: { fg: '#665993' attr: 'b' }
        shape_binary: { fg: '#665993' attr: 'b' }
        shape_block: { fg: '#0f4ac6' attr: 'b' }
        shape_bool: '#c8faf4'
        shape_closure: { fg: '#70a598' attr: 'b' }
        shape_custom: '#4ab118'
        shape_datetime: { fg: '#70a598' attr: 'b' }
        shape_directory: '#70a598'
        shape_external: '#70a598'
        shape_external_resolved: '#c8faf4'
        shape_externalarg: { fg: '#4ab118' attr: 'b' }
        shape_filepath: '#70a598'
        shape_flag: { fg: '#0f4ac6' attr: 'b' }
        shape_float: { fg: '#fc5f5a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#70a598' attr: 'b' }
        shape_globpattern: { fg: '#70a598' attr: 'b' }
        shape_int: { fg: '#665993' attr: 'b' }
        shape_internalcall: { fg: '#70a598' attr: 'b' }
        shape_keyword: { fg: '#665993' attr: 'b' }
        shape_list: { fg: '#70a598' attr: 'b' }
        shape_literal: '#0f4ac6'
        shape_match_pattern: '#4ab118'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#bd0013'
        shape_operator: '#e7741e'
        shape_or: { fg: '#665993' attr: 'b' }
        shape_pipe: { fg: '#665993' attr: 'b' }
        shape_range: { fg: '#e7741e' attr: 'b' }
        shape_raw_string: { fg: '#f6f5fb' attr: 'b' }
        shape_record: { fg: '#70a598' attr: 'b' }
        shape_redirection: { fg: '#665993' attr: 'b' }
        shape_signature: { fg: '#4ab118' attr: 'b' }
        shape_string: '#4ab118'
        shape_string_interpolation: { fg: '#70a598' attr: 'b' }
        shape_table: { fg: '#0f4ac6' attr: 'b' }
        shape_vardecl: { fg: '#0f4ac6' attr: 'u' }
        shape_variable: '#665993'

        foreground: '#f8dcc0'
        background: '#1f1d45'
        cursor: '#f8dcc0'

        empty: '#0f4ac6'
        header: { fg: '#4ab118' attr: 'b' }
        hints: '#4e7cbf'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#4ab118' attr: 'b' }
        search_result: { fg: '#bd0013' bg: '#f8dcc0' }
        separator: '#f8dcc0'
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