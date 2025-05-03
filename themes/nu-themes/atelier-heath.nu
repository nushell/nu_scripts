# Retrieve the theme settings
export def main [] {
    return {
        binary: '#7b59c0'
        block: '#516aec'
        cell-path: '#ab9bab'
        closure: '#159393'
        custom: '#f7f3f7'
        duration: '#bb8a35'
        float: '#ca402b'
        glob: '#f7f3f7'
        int: '#7b59c0'
        list: '#159393'
        nothing: '#ca402b'
        range: '#bb8a35'
        record: '#159393'
        string: '#918b3b'

        bool: {|| if $in { '#159393' } else { '#bb8a35' } }

        datetime: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ca402b' attr: 'b' }
            } else if $in < 6hr {
                '#ca402b'
            } else if $in < 1day {
                '#bb8a35'
            } else if $in < 3day {
                '#918b3b'
            } else if $in < 1wk {
                { fg: '#918b3b' attr: 'b' }
            } else if $in < 6wk {
                '#159393'
            } else if $in < 52wk {
                '#516aec'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ab9bab'
            } else if $e < 1mb {
                '#159393'
            } else {{ fg: '#516aec' }}
        }

        shape_and: { fg: '#7b59c0' attr: 'b' }
        shape_binary: { fg: '#7b59c0' attr: 'b' }
        shape_block: { fg: '#516aec' attr: 'b' }
        shape_bool: '#159393'
        shape_closure: { fg: '#159393' attr: 'b' }
        shape_custom: '#918b3b'
        shape_datetime: { fg: '#159393' attr: 'b' }
        shape_directory: '#159393'
        shape_external: '#159393'
        shape_external_resolved: '#159393'
        shape_externalarg: { fg: '#918b3b' attr: 'b' }
        shape_filepath: '#159393'
        shape_flag: { fg: '#516aec' attr: 'b' }
        shape_float: { fg: '#ca402b' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#159393' attr: 'b' }
        shape_globpattern: { fg: '#159393' attr: 'b' }
        shape_int: { fg: '#7b59c0' attr: 'b' }
        shape_internalcall: { fg: '#159393' attr: 'b' }
        shape_keyword: { fg: '#7b59c0' attr: 'b' }
        shape_list: { fg: '#159393' attr: 'b' }
        shape_literal: '#516aec'
        shape_match_pattern: '#918b3b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ca402b'
        shape_operator: '#bb8a35'
        shape_or: { fg: '#7b59c0' attr: 'b' }
        shape_pipe: { fg: '#7b59c0' attr: 'b' }
        shape_range: { fg: '#bb8a35' attr: 'b' }
        shape_raw_string: { fg: '#f7f3f7' attr: 'b' }
        shape_record: { fg: '#159393' attr: 'b' }
        shape_redirection: { fg: '#7b59c0' attr: 'b' }
        shape_signature: { fg: '#918b3b' attr: 'b' }
        shape_string: '#918b3b'
        shape_string_interpolation: { fg: '#159393' attr: 'b' }
        shape_table: { fg: '#516aec' attr: 'b' }
        shape_vardecl: { fg: '#516aec' attr: 'u' }
        shape_variable: '#7b59c0'

        foreground: '#ab9bab'
        background: '#1b181b'
        cursor: '#ab9bab'

        empty: '#516aec'
        header: { fg: '#918b3b' attr: 'b' }
        hints: '#776977'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#918b3b' attr: 'b' }
        search_result: { fg: '#ca402b' bg: '#ab9bab' }
        separator: '#ab9bab'
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