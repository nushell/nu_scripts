# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8d4e88'
        block: '#534e8d'
        cell-path: '#ffffff'
        closure: '#4e888d'
        custom: '#ffffff'
        duration: '#888d4e'
        float: '#b57d78'
        glob: '#ffffff'
        int: '#8d4e88'
        list: '#4e888d'
        nothing: '#8d534e'
        range: '#888d4e'
        record: '#4e888d'
        string: '#4e8d53'

        bool: {|| if $in { '#78b0b5' } else { '#888d4e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#8d534e' attr: 'b' }
            } else if $in < 6hr {
                '#8d534e'
            } else if $in < 1day {
                '#888d4e'
            } else if $in < 3day {
                '#4e8d53'
            } else if $in < 1wk {
                { fg: '#4e8d53' attr: 'b' }
            } else if $in < 6wk {
                '#4e888d'
            } else if $in < 52wk {
                '#534e8d'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#4e888d'
            } else {{ fg: '#534e8d' }}
        }

        shape_and: { fg: '#8d4e88' attr: 'b' }
        shape_binary: { fg: '#8d4e88' attr: 'b' }
        shape_block: { fg: '#534e8d' attr: 'b' }
        shape_bool: '#78b0b5'
        shape_closure: { fg: '#4e888d' attr: 'b' }
        shape_custom: '#4e8d53'
        shape_datetime: { fg: '#4e888d' attr: 'b' }
        shape_directory: '#4e888d'
        shape_external: '#4e888d'
        shape_external_resolved: '#78b0b5'
        shape_externalarg: { fg: '#4e8d53' attr: 'b' }
        shape_filepath: '#4e888d'
        shape_flag: { fg: '#534e8d' attr: 'b' }
        shape_float: { fg: '#b57d78' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#4e888d' attr: 'b' }
        shape_globpattern: { fg: '#4e888d' attr: 'b' }
        shape_int: { fg: '#8d4e88' attr: 'b' }
        shape_internalcall: { fg: '#4e888d' attr: 'b' }
        shape_keyword: { fg: '#8d4e88' attr: 'b' }
        shape_list: { fg: '#4e888d' attr: 'b' }
        shape_literal: '#534e8d'
        shape_match_pattern: '#4e8d53'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#8d534e'
        shape_operator: '#888d4e'
        shape_or: { fg: '#8d4e88' attr: 'b' }
        shape_pipe: { fg: '#8d4e88' attr: 'b' }
        shape_range: { fg: '#888d4e' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#4e888d' attr: 'b' }
        shape_redirection: { fg: '#8d4e88' attr: 'b' }
        shape_signature: { fg: '#4e8d53' attr: 'b' }
        shape_string: '#4e8d53'
        shape_string_interpolation: { fg: '#4e888d' attr: 'b' }
        shape_table: { fg: '#534e8d' attr: 'b' }
        shape_vardecl: { fg: '#534e8d' attr: 'u' }
        shape_variable: '#8d4e88'

        foreground: '#ffffff'
        background: '#2e2e35'
        cursor: '#ffffff'

        empty: '#534e8d'
        header: { fg: '#4e8d53' attr: 'b' }
        hints: '#000000'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#4e8d53' attr: 'b' }
        search_result: { fg: '#8d534e' bg: '#ffffff' }
        separator: '#ffffff'
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