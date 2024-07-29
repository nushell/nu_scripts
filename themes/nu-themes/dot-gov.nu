# Retrieve the theme settings
export def main [] {
    return {
        binary: '#772fb0'
        block: '#16b1df'
        cell-path: '#ffffff'
        closure: '#8bd1ed'
        custom: '#ffffff'
        duration: '#f6bb33'
        float: '#bf081d'
        glob: '#ffffff'
        int: '#772fb0'
        list: '#8bd1ed'
        nothing: '#bf081d'
        range: '#f6bb33'
        record: '#8bd1ed'
        string: '#3d9751'

        bool: {|| if $in { '#8bd1ed' } else { '#f6bb33' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#bf081d' attr: 'b' }
            } else if $in < 6hr {
                '#bf081d'
            } else if $in < 1day {
                '#f6bb33'
            } else if $in < 3day {
                '#3d9751'
            } else if $in < 1wk {
                { fg: '#3d9751' attr: 'b' }
            } else if $in < 6wk {
                '#8bd1ed'
            } else if $in < 52wk {
                '#16b1df'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#8bd1ed'
            } else {{ fg: '#16b1df' }}
        }

        shape_and: { fg: '#772fb0' attr: 'b' }
        shape_binary: { fg: '#772fb0' attr: 'b' }
        shape_block: { fg: '#16b1df' attr: 'b' }
        shape_bool: '#8bd1ed'
        shape_closure: { fg: '#8bd1ed' attr: 'b' }
        shape_custom: '#3d9751'
        shape_datetime: { fg: '#8bd1ed' attr: 'b' }
        shape_directory: '#8bd1ed'
        shape_external: '#8bd1ed'
        shape_external_resolved: '#8bd1ed'
        shape_externalarg: { fg: '#3d9751' attr: 'b' }
        shape_filepath: '#8bd1ed'
        shape_flag: { fg: '#16b1df' attr: 'b' }
        shape_float: { fg: '#bf081d' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8bd1ed' attr: 'b' }
        shape_globpattern: { fg: '#8bd1ed' attr: 'b' }
        shape_int: { fg: '#772fb0' attr: 'b' }
        shape_internalcall: { fg: '#8bd1ed' attr: 'b' }
        shape_keyword: { fg: '#772fb0' attr: 'b' }
        shape_list: { fg: '#8bd1ed' attr: 'b' }
        shape_literal: '#16b1df'
        shape_match_pattern: '#3d9751'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#bf081d'
        shape_operator: '#f6bb33'
        shape_or: { fg: '#772fb0' attr: 'b' }
        shape_pipe: { fg: '#772fb0' attr: 'b' }
        shape_range: { fg: '#f6bb33' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#8bd1ed' attr: 'b' }
        shape_redirection: { fg: '#772fb0' attr: 'b' }
        shape_signature: { fg: '#3d9751' attr: 'b' }
        shape_string: '#3d9751'
        shape_string_interpolation: { fg: '#8bd1ed' attr: 'b' }
        shape_table: { fg: '#16b1df' attr: 'b' }
        shape_vardecl: { fg: '#16b1df' attr: 'u' }
        shape_variable: '#772fb0'

        foreground: '#eaeaea'
        background: '#252b35'
        cursor: '#d9002f'

        empty: '#16b1df'
        header: { fg: '#3d9751' attr: 'b' }
        hints: '#181818'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#3d9751' attr: 'b' }
        search_result: { fg: '#bf081d' bg: '#ffffff' }
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