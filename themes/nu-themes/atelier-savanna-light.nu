# Retrieve the theme settings
export def main [] {
    return {
        binary: '#55859b'
        block: '#478c90'
        cell-path: '#526057'
        closure: '#1c9aa0'
        custom: '#171c19'
        duration: '#a07e3b'
        float: '#b16139'
        glob: '#171c19'
        int: '#55859b'
        list: '#1c9aa0'
        nothing: '#b16139'
        range: '#a07e3b'
        record: '#1c9aa0'
        string: '#489963'

        bool: {|| if $in { '#1c9aa0' } else { '#a07e3b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b16139' attr: 'b' }
            } else if $in < 6hr {
                '#b16139'
            } else if $in < 1day {
                '#a07e3b'
            } else if $in < 3day {
                '#489963'
            } else if $in < 1wk {
                { fg: '#489963' attr: 'b' }
            } else if $in < 6wk {
                '#1c9aa0'
            } else if $in < 52wk {
                '#478c90'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#526057'
            } else if $e < 1mb {
                '#1c9aa0'
            } else {{ fg: '#478c90' }}
        }

        shape_and: { fg: '#55859b' attr: 'b' }
        shape_binary: { fg: '#55859b' attr: 'b' }
        shape_block: { fg: '#478c90' attr: 'b' }
        shape_bool: '#1c9aa0'
        shape_closure: { fg: '#1c9aa0' attr: 'b' }
        shape_custom: '#489963'
        shape_datetime: { fg: '#1c9aa0' attr: 'b' }
        shape_directory: '#1c9aa0'
        shape_external: '#1c9aa0'
        shape_external_resolved: '#1c9aa0'
        shape_externalarg: { fg: '#489963' attr: 'b' }
        shape_filepath: '#1c9aa0'
        shape_flag: { fg: '#478c90' attr: 'b' }
        shape_float: { fg: '#b16139' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1c9aa0' attr: 'b' }
        shape_globpattern: { fg: '#1c9aa0' attr: 'b' }
        shape_int: { fg: '#55859b' attr: 'b' }
        shape_internalcall: { fg: '#1c9aa0' attr: 'b' }
        shape_keyword: { fg: '#55859b' attr: 'b' }
        shape_list: { fg: '#1c9aa0' attr: 'b' }
        shape_literal: '#478c90'
        shape_match_pattern: '#489963'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b16139'
        shape_operator: '#a07e3b'
        shape_or: { fg: '#55859b' attr: 'b' }
        shape_pipe: { fg: '#55859b' attr: 'b' }
        shape_range: { fg: '#a07e3b' attr: 'b' }
        shape_raw_string: { fg: '#171c19' attr: 'b' }
        shape_record: { fg: '#1c9aa0' attr: 'b' }
        shape_redirection: { fg: '#55859b' attr: 'b' }
        shape_signature: { fg: '#489963' attr: 'b' }
        shape_string: '#489963'
        shape_string_interpolation: { fg: '#1c9aa0' attr: 'b' }
        shape_table: { fg: '#478c90' attr: 'b' }
        shape_vardecl: { fg: '#478c90' attr: 'u' }
        shape_variable: '#55859b'

        foreground: '#526057'
        background: '#ecf4ee'
        cursor: '#526057'

        empty: '#478c90'
        header: { fg: '#489963' attr: 'b' }
        hints: '#78877d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#489963' attr: 'b' }
        search_result: { fg: '#b16139' bg: '#526057' }
        separator: '#526057'
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