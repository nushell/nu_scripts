# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c85e7c'
        block: '#1290bf'
        cell-path: '#b9b5b8'
        closure: '#149b93'
        custom: '#ffffff'
        duration: '#fdcc59'
        float: '#dd464c'
        glob: '#ffffff'
        int: '#c85e7c'
        list: '#149b93'
        nothing: '#dd464c'
        range: '#fdcc59'
        record: '#149b93'
        string: '#8fc13e'

        bool: {|| if $in { '#149b93' } else { '#fdcc59' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#dd464c' attr: 'b' }
            } else if $in < 6hr {
                '#dd464c'
            } else if $in < 1day {
                '#fdcc59'
            } else if $in < 3day {
                '#8fc13e'
            } else if $in < 1wk {
                { fg: '#8fc13e' attr: 'b' }
            } else if $in < 6wk {
                '#149b93'
            } else if $in < 52wk {
                '#1290bf'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b9b5b8'
            } else if $e < 1mb {
                '#149b93'
            } else {{ fg: '#1290bf' }}
        }

        shape_and: { fg: '#c85e7c' attr: 'b' }
        shape_binary: { fg: '#c85e7c' attr: 'b' }
        shape_block: { fg: '#1290bf' attr: 'b' }
        shape_bool: '#149b93'
        shape_closure: { fg: '#149b93' attr: 'b' }
        shape_custom: '#8fc13e'
        shape_datetime: { fg: '#149b93' attr: 'b' }
        shape_directory: '#149b93'
        shape_external: '#149b93'
        shape_external_resolved: '#149b93'
        shape_externalarg: { fg: '#8fc13e' attr: 'b' }
        shape_filepath: '#149b93'
        shape_flag: { fg: '#1290bf' attr: 'b' }
        shape_float: { fg: '#dd464c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#149b93' attr: 'b' }
        shape_globpattern: { fg: '#149b93' attr: 'b' }
        shape_int: { fg: '#c85e7c' attr: 'b' }
        shape_internalcall: { fg: '#149b93' attr: 'b' }
        shape_keyword: { fg: '#c85e7c' attr: 'b' }
        shape_list: { fg: '#149b93' attr: 'b' }
        shape_literal: '#1290bf'
        shape_match_pattern: '#8fc13e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#dd464c'
        shape_operator: '#fdcc59'
        shape_or: { fg: '#c85e7c' attr: 'b' }
        shape_pipe: { fg: '#c85e7c' attr: 'b' }
        shape_range: { fg: '#fdcc59' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#149b93' attr: 'b' }
        shape_redirection: { fg: '#c85e7c' attr: 'b' }
        shape_signature: { fg: '#8fc13e' attr: 'b' }
        shape_string: '#8fc13e'
        shape_string_interpolation: { fg: '#149b93' attr: 'b' }
        shape_table: { fg: '#1290bf' attr: 'b' }
        shape_vardecl: { fg: '#1290bf' attr: 'u' }
        shape_variable: '#c85e7c'

        foreground: '#b9b5b8'
        background: '#322931'
        cursor: '#b9b5b8'

        empty: '#1290bf'
        header: { fg: '#8fc13e' attr: 'b' }
        hints: '#797379'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8fc13e' attr: 'b' }
        search_result: { fg: '#dd464c' bg: '#b9b5b8' }
        separator: '#b9b5b8'
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