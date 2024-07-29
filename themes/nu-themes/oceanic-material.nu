# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8800a0'
        block: '#1d80ef'
        cell-path: '#a4a4a4'
        closure: '#16aec9'
        custom: '#fffefe'
        duration: '#fee92e'
        float: '#dc5b60'
        glob: '#fffefe'
        int: '#8800a0'
        list: '#16aec9'
        nothing: '#ee2a29'
        range: '#fee92e'
        record: '#16aec9'
        string: '#3fa33f'

        bool: {|| if $in { '#42c6d9' } else { '#fee92e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ee2a29' attr: 'b' }
            } else if $in < 6hr {
                '#ee2a29'
            } else if $in < 1day {
                '#fee92e'
            } else if $in < 3day {
                '#3fa33f'
            } else if $in < 1wk {
                { fg: '#3fa33f' attr: 'b' }
            } else if $in < 6wk {
                '#16aec9'
            } else if $in < 52wk {
                '#1d80ef'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a4a4a4'
            } else if $e < 1mb {
                '#16aec9'
            } else {{ fg: '#1d80ef' }}
        }

        shape_and: { fg: '#8800a0' attr: 'b' }
        shape_binary: { fg: '#8800a0' attr: 'b' }
        shape_block: { fg: '#1d80ef' attr: 'b' }
        shape_bool: '#42c6d9'
        shape_closure: { fg: '#16aec9' attr: 'b' }
        shape_custom: '#3fa33f'
        shape_datetime: { fg: '#16aec9' attr: 'b' }
        shape_directory: '#16aec9'
        shape_external: '#16aec9'
        shape_external_resolved: '#42c6d9'
        shape_externalarg: { fg: '#3fa33f' attr: 'b' }
        shape_filepath: '#16aec9'
        shape_flag: { fg: '#1d80ef' attr: 'b' }
        shape_float: { fg: '#dc5b60' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#16aec9' attr: 'b' }
        shape_globpattern: { fg: '#16aec9' attr: 'b' }
        shape_int: { fg: '#8800a0' attr: 'b' }
        shape_internalcall: { fg: '#16aec9' attr: 'b' }
        shape_keyword: { fg: '#8800a0' attr: 'b' }
        shape_list: { fg: '#16aec9' attr: 'b' }
        shape_literal: '#1d80ef'
        shape_match_pattern: '#3fa33f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ee2a29'
        shape_operator: '#fee92e'
        shape_or: { fg: '#8800a0' attr: 'b' }
        shape_pipe: { fg: '#8800a0' attr: 'b' }
        shape_range: { fg: '#fee92e' attr: 'b' }
        shape_raw_string: { fg: '#fffefe' attr: 'b' }
        shape_record: { fg: '#16aec9' attr: 'b' }
        shape_redirection: { fg: '#8800a0' attr: 'b' }
        shape_signature: { fg: '#3fa33f' attr: 'b' }
        shape_string: '#3fa33f'
        shape_string_interpolation: { fg: '#16aec9' attr: 'b' }
        shape_table: { fg: '#1d80ef' attr: 'b' }
        shape_vardecl: { fg: '#1d80ef' attr: 'u' }
        shape_variable: '#8800a0'

        foreground: '#c1c8d6'
        background: '#1c262b'
        cursor: '#b2b8c3'

        empty: '#1d80ef'
        header: { fg: '#3fa33f' attr: 'b' }
        hints: '#767676'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#3fa33f' attr: 'b' }
        search_result: { fg: '#ee2a29' bg: '#a4a4a4' }
        separator: '#a4a4a4'
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