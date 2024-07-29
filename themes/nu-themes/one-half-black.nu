# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c678dd'
        block: '#61afef'
        cell-path: '#dcdfe4'
        closure: '#56b6c2'
        custom: '#dcdfe4'
        duration: '#e5c07b'
        float: '#e06c75'
        glob: '#dcdfe4'
        int: '#c678dd'
        list: '#56b6c2'
        nothing: '#e06c75'
        range: '#e5c07b'
        record: '#56b6c2'
        string: '#98c379'

        bool: {|| if $in { '#56b6c2' } else { '#e5c07b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e06c75' attr: 'b' }
            } else if $in < 6hr {
                '#e06c75'
            } else if $in < 1day {
                '#e5c07b'
            } else if $in < 3day {
                '#98c379'
            } else if $in < 1wk {
                { fg: '#98c379' attr: 'b' }
            } else if $in < 6wk {
                '#56b6c2'
            } else if $in < 52wk {
                '#61afef'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#dcdfe4'
            } else if $e < 1mb {
                '#56b6c2'
            } else {{ fg: '#61afef' }}
        }

        shape_and: { fg: '#c678dd' attr: 'b' }
        shape_binary: { fg: '#c678dd' attr: 'b' }
        shape_block: { fg: '#61afef' attr: 'b' }
        shape_bool: '#56b6c2'
        shape_closure: { fg: '#56b6c2' attr: 'b' }
        shape_custom: '#98c379'
        shape_datetime: { fg: '#56b6c2' attr: 'b' }
        shape_directory: '#56b6c2'
        shape_external: '#56b6c2'
        shape_external_resolved: '#56b6c2'
        shape_externalarg: { fg: '#98c379' attr: 'b' }
        shape_filepath: '#56b6c2'
        shape_flag: { fg: '#61afef' attr: 'b' }
        shape_float: { fg: '#e06c75' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#56b6c2' attr: 'b' }
        shape_globpattern: { fg: '#56b6c2' attr: 'b' }
        shape_int: { fg: '#c678dd' attr: 'b' }
        shape_internalcall: { fg: '#56b6c2' attr: 'b' }
        shape_keyword: { fg: '#c678dd' attr: 'b' }
        shape_list: { fg: '#56b6c2' attr: 'b' }
        shape_literal: '#61afef'
        shape_match_pattern: '#98c379'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e06c75'
        shape_operator: '#e5c07b'
        shape_or: { fg: '#c678dd' attr: 'b' }
        shape_pipe: { fg: '#c678dd' attr: 'b' }
        shape_range: { fg: '#e5c07b' attr: 'b' }
        shape_raw_string: { fg: '#dcdfe4' attr: 'b' }
        shape_record: { fg: '#56b6c2' attr: 'b' }
        shape_redirection: { fg: '#c678dd' attr: 'b' }
        shape_signature: { fg: '#98c379' attr: 'b' }
        shape_string: '#98c379'
        shape_string_interpolation: { fg: '#56b6c2' attr: 'b' }
        shape_table: { fg: '#61afef' attr: 'b' }
        shape_vardecl: { fg: '#61afef' attr: 'u' }
        shape_variable: '#c678dd'

        foreground: '#dcdfe4'
        background: '#000000'
        cursor: '#dcdfe4'

        empty: '#61afef'
        header: { fg: '#98c379' attr: 'b' }
        hints: '#282c34'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#98c379' attr: 'b' }
        search_result: { fg: '#e06c75' bg: '#dcdfe4' }
        separator: '#dcdfe4'
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