# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a074c4'
        block: '#55b5db'
        cell-path: '#d6d6d6'
        closure: '#55dbbe'
        custom: '#ffffff'
        duration: '#e6cd69'
        float: '#cd3f45'
        glob: '#ffffff'
        int: '#a074c4'
        list: '#55dbbe'
        nothing: '#cd3f45'
        range: '#e6cd69'
        record: '#55dbbe'
        string: '#9fca56'

        bool: {|| if $in { '#55dbbe' } else { '#e6cd69' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cd3f45' attr: 'b' }
            } else if $in < 6hr {
                '#cd3f45'
            } else if $in < 1day {
                '#e6cd69'
            } else if $in < 3day {
                '#9fca56'
            } else if $in < 1wk {
                { fg: '#9fca56' attr: 'b' }
            } else if $in < 6wk {
                '#55dbbe'
            } else if $in < 52wk {
                '#55b5db'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d6d6d6'
            } else if $e < 1mb {
                '#55dbbe'
            } else {{ fg: '#55b5db' }}
        }

        shape_and: { fg: '#a074c4' attr: 'b' }
        shape_binary: { fg: '#a074c4' attr: 'b' }
        shape_block: { fg: '#55b5db' attr: 'b' }
        shape_bool: '#55dbbe'
        shape_closure: { fg: '#55dbbe' attr: 'b' }
        shape_custom: '#9fca56'
        shape_datetime: { fg: '#55dbbe' attr: 'b' }
        shape_directory: '#55dbbe'
        shape_external: '#55dbbe'
        shape_external_resolved: '#55dbbe'
        shape_externalarg: { fg: '#9fca56' attr: 'b' }
        shape_filepath: '#55dbbe'
        shape_flag: { fg: '#55b5db' attr: 'b' }
        shape_float: { fg: '#cd3f45' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#55dbbe' attr: 'b' }
        shape_globpattern: { fg: '#55dbbe' attr: 'b' }
        shape_int: { fg: '#a074c4' attr: 'b' }
        shape_internalcall: { fg: '#55dbbe' attr: 'b' }
        shape_keyword: { fg: '#a074c4' attr: 'b' }
        shape_list: { fg: '#55dbbe' attr: 'b' }
        shape_literal: '#55b5db'
        shape_match_pattern: '#9fca56'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cd3f45'
        shape_operator: '#e6cd69'
        shape_or: { fg: '#a074c4' attr: 'b' }
        shape_pipe: { fg: '#a074c4' attr: 'b' }
        shape_range: { fg: '#e6cd69' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#55dbbe' attr: 'b' }
        shape_redirection: { fg: '#a074c4' attr: 'b' }
        shape_signature: { fg: '#9fca56' attr: 'b' }
        shape_string: '#9fca56'
        shape_string_interpolation: { fg: '#55dbbe' attr: 'b' }
        shape_table: { fg: '#55b5db' attr: 'b' }
        shape_vardecl: { fg: '#55b5db' attr: 'u' }
        shape_variable: '#a074c4'

        foreground: '#d6d6d6'
        background: '#151718'
        cursor: '#d6d6d6'

        empty: '#55b5db'
        header: { fg: '#9fca56' attr: 'b' }
        hints: '#41535b'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#9fca56' attr: 'b' }
        search_result: { fg: '#cd3f45' bg: '#d6d6d6' }
        separator: '#d6d6d6'
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