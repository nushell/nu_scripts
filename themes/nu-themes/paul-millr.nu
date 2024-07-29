# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b449be'
        block: '#396bd7'
        cell-path: '#bbbbbb'
        closure: '#66ccff'
        custom: '#ffffff'
        duration: '#d3bf00'
        float: '#ff0080'
        glob: '#ffffff'
        int: '#b449be'
        list: '#66ccff'
        nothing: '#ff0000'
        range: '#d3bf00'
        record: '#66ccff'
        string: '#79ff0f'

        bool: {|| if $in { '#7adff2' } else { '#d3bf00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff0000' attr: 'b' }
            } else if $in < 6hr {
                '#ff0000'
            } else if $in < 1day {
                '#d3bf00'
            } else if $in < 3day {
                '#79ff0f'
            } else if $in < 1wk {
                { fg: '#79ff0f' attr: 'b' }
            } else if $in < 6wk {
                '#66ccff'
            } else if $in < 52wk {
                '#396bd7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#66ccff'
            } else {{ fg: '#396bd7' }}
        }

        shape_and: { fg: '#b449be' attr: 'b' }
        shape_binary: { fg: '#b449be' attr: 'b' }
        shape_block: { fg: '#396bd7' attr: 'b' }
        shape_bool: '#7adff2'
        shape_closure: { fg: '#66ccff' attr: 'b' }
        shape_custom: '#79ff0f'
        shape_datetime: { fg: '#66ccff' attr: 'b' }
        shape_directory: '#66ccff'
        shape_external: '#66ccff'
        shape_external_resolved: '#7adff2'
        shape_externalarg: { fg: '#79ff0f' attr: 'b' }
        shape_filepath: '#66ccff'
        shape_flag: { fg: '#396bd7' attr: 'b' }
        shape_float: { fg: '#ff0080' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#66ccff' attr: 'b' }
        shape_globpattern: { fg: '#66ccff' attr: 'b' }
        shape_int: { fg: '#b449be' attr: 'b' }
        shape_internalcall: { fg: '#66ccff' attr: 'b' }
        shape_keyword: { fg: '#b449be' attr: 'b' }
        shape_list: { fg: '#66ccff' attr: 'b' }
        shape_literal: '#396bd7'
        shape_match_pattern: '#79ff0f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff0000'
        shape_operator: '#d3bf00'
        shape_or: { fg: '#b449be' attr: 'b' }
        shape_pipe: { fg: '#b449be' attr: 'b' }
        shape_range: { fg: '#d3bf00' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#66ccff' attr: 'b' }
        shape_redirection: { fg: '#b449be' attr: 'b' }
        shape_signature: { fg: '#79ff0f' attr: 'b' }
        shape_string: '#79ff0f'
        shape_string_interpolation: { fg: '#66ccff' attr: 'b' }
        shape_table: { fg: '#396bd7' attr: 'b' }
        shape_vardecl: { fg: '#396bd7' attr: 'u' }
        shape_variable: '#b449be'

        foreground: '#f2f2f2'
        background: '#000000'
        cursor: '#f2f2f2'

        empty: '#396bd7'
        header: { fg: '#79ff0f' attr: 'b' }
        hints: '#666666'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#79ff0f' attr: 'b' }
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