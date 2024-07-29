# Retrieve the theme settings
export def main [] {
    return {
        binary: '#98005d'
        block: '#009ddc'
        cell-path: '#d9d8d8'
        closure: '#85cebc'
        custom: '#ffffff'
        duration: '#ffd204'
        float: '#ee2e24'
        glob: '#ffffff'
        int: '#98005d'
        list: '#85cebc'
        nothing: '#ee2e24'
        range: '#ffd204'
        record: '#85cebc'
        string: '#00853e'

        bool: {|| if $in { '#85cebc' } else { '#ffd204' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ee2e24' attr: 'b' }
            } else if $in < 6hr {
                '#ee2e24'
            } else if $in < 1day {
                '#ffd204'
            } else if $in < 3day {
                '#00853e'
            } else if $in < 1wk {
                { fg: '#00853e' attr: 'b' }
            } else if $in < 6wk {
                '#85cebc'
            } else if $in < 52wk {
                '#009ddc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d9d8d8'
            } else if $e < 1mb {
                '#85cebc'
            } else {{ fg: '#009ddc' }}
        }

        shape_and: { fg: '#98005d' attr: 'b' }
        shape_binary: { fg: '#98005d' attr: 'b' }
        shape_block: { fg: '#009ddc' attr: 'b' }
        shape_bool: '#85cebc'
        shape_closure: { fg: '#85cebc' attr: 'b' }
        shape_custom: '#00853e'
        shape_datetime: { fg: '#85cebc' attr: 'b' }
        shape_directory: '#85cebc'
        shape_external: '#85cebc'
        shape_external_resolved: '#85cebc'
        shape_externalarg: { fg: '#00853e' attr: 'b' }
        shape_filepath: '#85cebc'
        shape_flag: { fg: '#009ddc' attr: 'b' }
        shape_float: { fg: '#ee2e24' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#85cebc' attr: 'b' }
        shape_globpattern: { fg: '#85cebc' attr: 'b' }
        shape_int: { fg: '#98005d' attr: 'b' }
        shape_internalcall: { fg: '#85cebc' attr: 'b' }
        shape_keyword: { fg: '#98005d' attr: 'b' }
        shape_list: { fg: '#85cebc' attr: 'b' }
        shape_literal: '#009ddc'
        shape_match_pattern: '#00853e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ee2e24'
        shape_operator: '#ffd204'
        shape_or: { fg: '#98005d' attr: 'b' }
        shape_pipe: { fg: '#98005d' attr: 'b' }
        shape_range: { fg: '#ffd204' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#85cebc' attr: 'b' }
        shape_redirection: { fg: '#98005d' attr: 'b' }
        shape_signature: { fg: '#00853e' attr: 'b' }
        shape_string: '#00853e'
        shape_string_interpolation: { fg: '#85cebc' attr: 'b' }
        shape_table: { fg: '#009ddc' attr: 'b' }
        shape_vardecl: { fg: '#009ddc' attr: 'u' }
        shape_variable: '#98005d'

        foreground: '#d9d8d8'
        background: '#231f20'
        cursor: '#d9d8d8'

        empty: '#009ddc'
        header: { fg: '#00853e' attr: 'b' }
        hints: '#737171'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00853e' attr: 'b' }
        search_result: { fg: '#ee2e24' bg: '#d9d8d8' }
        separator: '#d9d8d8'
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