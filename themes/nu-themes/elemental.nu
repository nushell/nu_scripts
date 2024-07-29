# Retrieve the theme settings
export def main [] {
    return {
        binary: '#7f4e2f'
        block: '#497f7d'
        cell-path: '#807974'
        closure: '#387f58'
        custom: '#fff1e9'
        duration: '#7f7111'
        float: '#e0502a'
        glob: '#fff1e9'
        int: '#7f4e2f'
        list: '#387f58'
        nothing: '#98290f'
        range: '#7f7111'
        record: '#387f58'
        string: '#479a43'

        bool: {|| if $in { '#59d599' } else { '#7f7111' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#98290f' attr: 'b' }
            } else if $in < 6hr {
                '#98290f'
            } else if $in < 1day {
                '#7f7111'
            } else if $in < 3day {
                '#479a43'
            } else if $in < 1wk {
                { fg: '#479a43' attr: 'b' }
            } else if $in < 6wk {
                '#387f58'
            } else if $in < 52wk {
                '#497f7d'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#807974'
            } else if $e < 1mb {
                '#387f58'
            } else {{ fg: '#497f7d' }}
        }

        shape_and: { fg: '#7f4e2f' attr: 'b' }
        shape_binary: { fg: '#7f4e2f' attr: 'b' }
        shape_block: { fg: '#497f7d' attr: 'b' }
        shape_bool: '#59d599'
        shape_closure: { fg: '#387f58' attr: 'b' }
        shape_custom: '#479a43'
        shape_datetime: { fg: '#387f58' attr: 'b' }
        shape_directory: '#387f58'
        shape_external: '#387f58'
        shape_external_resolved: '#59d599'
        shape_externalarg: { fg: '#479a43' attr: 'b' }
        shape_filepath: '#387f58'
        shape_flag: { fg: '#497f7d' attr: 'b' }
        shape_float: { fg: '#e0502a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#387f58' attr: 'b' }
        shape_globpattern: { fg: '#387f58' attr: 'b' }
        shape_int: { fg: '#7f4e2f' attr: 'b' }
        shape_internalcall: { fg: '#387f58' attr: 'b' }
        shape_keyword: { fg: '#7f4e2f' attr: 'b' }
        shape_list: { fg: '#387f58' attr: 'b' }
        shape_literal: '#497f7d'
        shape_match_pattern: '#479a43'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#98290f'
        shape_operator: '#7f7111'
        shape_or: { fg: '#7f4e2f' attr: 'b' }
        shape_pipe: { fg: '#7f4e2f' attr: 'b' }
        shape_range: { fg: '#7f7111' attr: 'b' }
        shape_raw_string: { fg: '#fff1e9' attr: 'b' }
        shape_record: { fg: '#387f58' attr: 'b' }
        shape_redirection: { fg: '#7f4e2f' attr: 'b' }
        shape_signature: { fg: '#479a43' attr: 'b' }
        shape_string: '#479a43'
        shape_string_interpolation: { fg: '#387f58' attr: 'b' }
        shape_table: { fg: '#497f7d' attr: 'b' }
        shape_vardecl: { fg: '#497f7d' attr: 'u' }
        shape_variable: '#7f4e2f'

        foreground: '#807a74'
        background: '#22211d'
        cursor: '#807a74'

        empty: '#497f7d'
        header: { fg: '#479a43' attr: 'b' }
        hints: '#555445'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#479a43' attr: 'b' }
        search_result: { fg: '#98290f' bg: '#807974' }
        separator: '#807974'
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