# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff005d'
        block: '#1460d2'
        cell-path: '#bbbbbb'
        closure: '#00bbbb'
        custom: '#ffffff'
        duration: '#ffe50a'
        float: '#f40e17'
        glob: '#ffffff'
        int: '#ff005d'
        list: '#00bbbb'
        nothing: '#ff0000'
        range: '#ffe50a'
        record: '#00bbbb'
        string: '#38de21'

        bool: {|| if $in { '#6ae3fa' } else { '#ffe50a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff0000' attr: 'b' }
            } else if $in < 6hr {
                '#ff0000'
            } else if $in < 1day {
                '#ffe50a'
            } else if $in < 3day {
                '#38de21'
            } else if $in < 1wk {
                { fg: '#38de21' attr: 'b' }
            } else if $in < 6wk {
                '#00bbbb'
            } else if $in < 52wk {
                '#1460d2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#00bbbb'
            } else {{ fg: '#1460d2' }}
        }

        shape_and: { fg: '#ff005d' attr: 'b' }
        shape_binary: { fg: '#ff005d' attr: 'b' }
        shape_block: { fg: '#1460d2' attr: 'b' }
        shape_bool: '#6ae3fa'
        shape_closure: { fg: '#00bbbb' attr: 'b' }
        shape_custom: '#38de21'
        shape_datetime: { fg: '#00bbbb' attr: 'b' }
        shape_directory: '#00bbbb'
        shape_external: '#00bbbb'
        shape_external_resolved: '#6ae3fa'
        shape_externalarg: { fg: '#38de21' attr: 'b' }
        shape_filepath: '#00bbbb'
        shape_flag: { fg: '#1460d2' attr: 'b' }
        shape_float: { fg: '#f40e17' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00bbbb' attr: 'b' }
        shape_globpattern: { fg: '#00bbbb' attr: 'b' }
        shape_int: { fg: '#ff005d' attr: 'b' }
        shape_internalcall: { fg: '#00bbbb' attr: 'b' }
        shape_keyword: { fg: '#ff005d' attr: 'b' }
        shape_list: { fg: '#00bbbb' attr: 'b' }
        shape_literal: '#1460d2'
        shape_match_pattern: '#38de21'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff0000'
        shape_operator: '#ffe50a'
        shape_or: { fg: '#ff005d' attr: 'b' }
        shape_pipe: { fg: '#ff005d' attr: 'b' }
        shape_range: { fg: '#ffe50a' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00bbbb' attr: 'b' }
        shape_redirection: { fg: '#ff005d' attr: 'b' }
        shape_signature: { fg: '#38de21' attr: 'b' }
        shape_string: '#38de21'
        shape_string_interpolation: { fg: '#00bbbb' attr: 'b' }
        shape_table: { fg: '#1460d2' attr: 'b' }
        shape_vardecl: { fg: '#1460d2' attr: 'u' }
        shape_variable: '#ff005d'

        foreground: '#ffffff'
        background: '#132738'
        cursor: '#ffffff'

        empty: '#1460d2'
        header: { fg: '#38de21' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#38de21' attr: 'b' }
        search_result: { fg: '#ff0000' bg: '#bbbbbb' }
        separator: '#bbbbbb'
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