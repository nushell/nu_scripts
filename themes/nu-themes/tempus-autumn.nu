# Retrieve the theme settings
export def main [] {
    return {
        binary: '#dd758e'
        block: '#7897c2'
        cell-path: '#a5918a'
        closure: '#52a485'
        custom: '#a9a2a6'
        duration: '#ac9440'
        float: '#e07a3d'
        glob: '#a9a2a6'
        int: '#dd758e'
        list: '#52a485'
        nothing: '#f16c50'
        range: '#ac9440'
        record: '#52a485'
        string: '#80a100'

        bool: {|| if $in { '#2aa4ad' } else { '#ac9440' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f16c50' attr: 'b' }
            } else if $in < 6hr {
                '#f16c50'
            } else if $in < 1day {
                '#ac9440'
            } else if $in < 3day {
                '#80a100'
            } else if $in < 1wk {
                { fg: '#80a100' attr: 'b' }
            } else if $in < 6wk {
                '#52a485'
            } else if $in < 52wk {
                '#7897c2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a5918a'
            } else if $e < 1mb {
                '#52a485'
            } else {{ fg: '#7897c2' }}
        }

        shape_and: { fg: '#dd758e' attr: 'b' }
        shape_binary: { fg: '#dd758e' attr: 'b' }
        shape_block: { fg: '#7897c2' attr: 'b' }
        shape_bool: '#2aa4ad'
        shape_closure: { fg: '#52a485' attr: 'b' }
        shape_custom: '#80a100'
        shape_datetime: { fg: '#52a485' attr: 'b' }
        shape_directory: '#52a485'
        shape_external: '#52a485'
        shape_external_resolved: '#2aa4ad'
        shape_externalarg: { fg: '#80a100' attr: 'b' }
        shape_filepath: '#52a485'
        shape_flag: { fg: '#7897c2' attr: 'b' }
        shape_float: { fg: '#e07a3d' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#52a485' attr: 'b' }
        shape_globpattern: { fg: '#52a485' attr: 'b' }
        shape_int: { fg: '#dd758e' attr: 'b' }
        shape_internalcall: { fg: '#52a485' attr: 'b' }
        shape_keyword: { fg: '#dd758e' attr: 'b' }
        shape_list: { fg: '#52a485' attr: 'b' }
        shape_literal: '#7897c2'
        shape_match_pattern: '#80a100'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f16c50'
        shape_operator: '#ac9440'
        shape_or: { fg: '#dd758e' attr: 'b' }
        shape_pipe: { fg: '#dd758e' attr: 'b' }
        shape_range: { fg: '#ac9440' attr: 'b' }
        shape_raw_string: { fg: '#a9a2a6' attr: 'b' }
        shape_record: { fg: '#52a485' attr: 'b' }
        shape_redirection: { fg: '#dd758e' attr: 'b' }
        shape_signature: { fg: '#80a100' attr: 'b' }
        shape_string: '#80a100'
        shape_string_interpolation: { fg: '#52a485' attr: 'b' }
        shape_table: { fg: '#7897c2' attr: 'b' }
        shape_vardecl: { fg: '#7897c2' attr: 'u' }
        shape_variable: '#dd758e'

        foreground: '#a9a2a6'
        background: '#302420'
        cursor: '#a9a2a6'

        empty: '#7897c2'
        header: { fg: '#80a100' attr: 'b' }
        hints: '#312e2a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#80a100' attr: 'b' }
        search_result: { fg: '#f16c50' bg: '#a5918a' }
        separator: '#a5918a'
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