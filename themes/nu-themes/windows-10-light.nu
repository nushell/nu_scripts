# Retrieve the theme settings
export def main [] {
    return {
        binary: '#881798'
        block: '#0037da'
        cell-path: '#767676'
        closure: '#3a96dd'
        custom: '#0c0c0c'
        duration: '#c19c00'
        float: '#c50f1f'
        glob: '#0c0c0c'
        int: '#881798'
        list: '#3a96dd'
        nothing: '#c50f1f'
        range: '#c19c00'
        record: '#3a96dd'
        string: '#13a10e'

        bool: {|| if $in { '#3a96dd' } else { '#c19c00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c50f1f' attr: 'b' }
            } else if $in < 6hr {
                '#c50f1f'
            } else if $in < 1day {
                '#c19c00'
            } else if $in < 3day {
                '#13a10e'
            } else if $in < 1wk {
                { fg: '#13a10e' attr: 'b' }
            } else if $in < 6wk {
                '#3a96dd'
            } else if $in < 52wk {
                '#0037da'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#767676'
            } else if $e < 1mb {
                '#3a96dd'
            } else {{ fg: '#0037da' }}
        }

        shape_and: { fg: '#881798' attr: 'b' }
        shape_binary: { fg: '#881798' attr: 'b' }
        shape_block: { fg: '#0037da' attr: 'b' }
        shape_bool: '#3a96dd'
        shape_closure: { fg: '#3a96dd' attr: 'b' }
        shape_custom: '#13a10e'
        shape_datetime: { fg: '#3a96dd' attr: 'b' }
        shape_directory: '#3a96dd'
        shape_external: '#3a96dd'
        shape_external_resolved: '#3a96dd'
        shape_externalarg: { fg: '#13a10e' attr: 'b' }
        shape_filepath: '#3a96dd'
        shape_flag: { fg: '#0037da' attr: 'b' }
        shape_float: { fg: '#c50f1f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3a96dd' attr: 'b' }
        shape_globpattern: { fg: '#3a96dd' attr: 'b' }
        shape_int: { fg: '#881798' attr: 'b' }
        shape_internalcall: { fg: '#3a96dd' attr: 'b' }
        shape_keyword: { fg: '#881798' attr: 'b' }
        shape_list: { fg: '#3a96dd' attr: 'b' }
        shape_literal: '#0037da'
        shape_match_pattern: '#13a10e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c50f1f'
        shape_operator: '#c19c00'
        shape_or: { fg: '#881798' attr: 'b' }
        shape_pipe: { fg: '#881798' attr: 'b' }
        shape_range: { fg: '#c19c00' attr: 'b' }
        shape_raw_string: { fg: '#0c0c0c' attr: 'b' }
        shape_record: { fg: '#3a96dd' attr: 'b' }
        shape_redirection: { fg: '#881798' attr: 'b' }
        shape_signature: { fg: '#13a10e' attr: 'b' }
        shape_string: '#13a10e'
        shape_string_interpolation: { fg: '#3a96dd' attr: 'b' }
        shape_table: { fg: '#0037da' attr: 'b' }
        shape_vardecl: { fg: '#0037da' attr: 'u' }
        shape_variable: '#881798'

        foreground: '#767676'
        background: '#f2f2f2'
        cursor: '#767676'

        empty: '#0037da'
        header: { fg: '#13a10e' attr: 'b' }
        hints: '#cccccc'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#13a10e' attr: 'b' }
        search_result: { fg: '#c50f1f' bg: '#767676' }
        separator: '#767676'
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