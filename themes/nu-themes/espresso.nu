# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d197d9'
        block: '#6c99bb'
        cell-path: '#cccccc'
        closure: '#bed6ff'
        custom: '#ffffff'
        duration: '#ffc66d'
        float: '#d25252'
        glob: '#ffffff'
        int: '#d197d9'
        list: '#bed6ff'
        nothing: '#d25252'
        range: '#ffc66d'
        record: '#bed6ff'
        string: '#a5c261'

        bool: {|| if $in { '#bed6ff' } else { '#ffc66d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d25252' attr: 'b' }
            } else if $in < 6hr {
                '#d25252'
            } else if $in < 1day {
                '#ffc66d'
            } else if $in < 3day {
                '#a5c261'
            } else if $in < 1wk {
                { fg: '#a5c261' attr: 'b' }
            } else if $in < 6wk {
                '#bed6ff'
            } else if $in < 52wk {
                '#6c99bb'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cccccc'
            } else if $e < 1mb {
                '#bed6ff'
            } else {{ fg: '#6c99bb' }}
        }

        shape_and: { fg: '#d197d9' attr: 'b' }
        shape_binary: { fg: '#d197d9' attr: 'b' }
        shape_block: { fg: '#6c99bb' attr: 'b' }
        shape_bool: '#bed6ff'
        shape_closure: { fg: '#bed6ff' attr: 'b' }
        shape_custom: '#a5c261'
        shape_datetime: { fg: '#bed6ff' attr: 'b' }
        shape_directory: '#bed6ff'
        shape_external: '#bed6ff'
        shape_external_resolved: '#bed6ff'
        shape_externalarg: { fg: '#a5c261' attr: 'b' }
        shape_filepath: '#bed6ff'
        shape_flag: { fg: '#6c99bb' attr: 'b' }
        shape_float: { fg: '#d25252' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#bed6ff' attr: 'b' }
        shape_globpattern: { fg: '#bed6ff' attr: 'b' }
        shape_int: { fg: '#d197d9' attr: 'b' }
        shape_internalcall: { fg: '#bed6ff' attr: 'b' }
        shape_keyword: { fg: '#d197d9' attr: 'b' }
        shape_list: { fg: '#bed6ff' attr: 'b' }
        shape_literal: '#6c99bb'
        shape_match_pattern: '#a5c261'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d25252'
        shape_operator: '#ffc66d'
        shape_or: { fg: '#d197d9' attr: 'b' }
        shape_pipe: { fg: '#d197d9' attr: 'b' }
        shape_range: { fg: '#ffc66d' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#bed6ff' attr: 'b' }
        shape_redirection: { fg: '#d197d9' attr: 'b' }
        shape_signature: { fg: '#a5c261' attr: 'b' }
        shape_string: '#a5c261'
        shape_string_interpolation: { fg: '#bed6ff' attr: 'b' }
        shape_table: { fg: '#6c99bb' attr: 'b' }
        shape_vardecl: { fg: '#6c99bb' attr: 'u' }
        shape_variable: '#d197d9'

        foreground: '#cccccc'
        background: '#2d2d2d'
        cursor: '#cccccc'

        empty: '#6c99bb'
        header: { fg: '#a5c261' attr: 'b' }
        hints: '#777777'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a5c261' attr: 'b' }
        search_result: { fg: '#d25252' bg: '#cccccc' }
        separator: '#cccccc'
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