# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b06698'
        block: '#6a8799'
        cell-path: '#d9d9d9'
        closure: '#c9dfff'
        custom: '#f7f7f7'
        duration: '#ebc17a'
        float: '#bc5653'
        glob: '#f7f7f7'
        int: '#b06698'
        list: '#c9dfff'
        nothing: '#bc5653'
        range: '#ebc17a'
        record: '#c9dfff'
        string: '#909d63'

        bool: {|| if $in { '#acbbd0' } else { '#ebc17a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#bc5653' attr: 'b' }
            } else if $in < 6hr {
                '#bc5653'
            } else if $in < 1day {
                '#ebc17a'
            } else if $in < 3day {
                '#909d63'
            } else if $in < 1wk {
                { fg: '#909d63' attr: 'b' }
            } else if $in < 6wk {
                '#c9dfff'
            } else if $in < 52wk {
                '#6a8799'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d9d9d9'
            } else if $e < 1mb {
                '#c9dfff'
            } else {{ fg: '#6a8799' }}
        }

        shape_and: { fg: '#b06698' attr: 'b' }
        shape_binary: { fg: '#b06698' attr: 'b' }
        shape_block: { fg: '#6a8799' attr: 'b' }
        shape_bool: '#acbbd0'
        shape_closure: { fg: '#c9dfff' attr: 'b' }
        shape_custom: '#909d63'
        shape_datetime: { fg: '#c9dfff' attr: 'b' }
        shape_directory: '#c9dfff'
        shape_external: '#c9dfff'
        shape_external_resolved: '#acbbd0'
        shape_externalarg: { fg: '#909d63' attr: 'b' }
        shape_filepath: '#c9dfff'
        shape_flag: { fg: '#6a8799' attr: 'b' }
        shape_float: { fg: '#bc5653' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#c9dfff' attr: 'b' }
        shape_globpattern: { fg: '#c9dfff' attr: 'b' }
        shape_int: { fg: '#b06698' attr: 'b' }
        shape_internalcall: { fg: '#c9dfff' attr: 'b' }
        shape_keyword: { fg: '#b06698' attr: 'b' }
        shape_list: { fg: '#c9dfff' attr: 'b' }
        shape_literal: '#6a8799'
        shape_match_pattern: '#909d63'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#bc5653'
        shape_operator: '#ebc17a'
        shape_or: { fg: '#b06698' attr: 'b' }
        shape_pipe: { fg: '#b06698' attr: 'b' }
        shape_range: { fg: '#ebc17a' attr: 'b' }
        shape_raw_string: { fg: '#f7f7f7' attr: 'b' }
        shape_record: { fg: '#c9dfff' attr: 'b' }
        shape_redirection: { fg: '#b06698' attr: 'b' }
        shape_signature: { fg: '#909d63' attr: 'b' }
        shape_string: '#909d63'
        shape_string_interpolation: { fg: '#c9dfff' attr: 'b' }
        shape_table: { fg: '#6a8799' attr: 'b' }
        shape_vardecl: { fg: '#6a8799' attr: 'u' }
        shape_variable: '#b06698'

        foreground: '#d9d9d9'
        background: '#353a44'
        cursor: '#d9d9d9'

        empty: '#6a8799'
        header: { fg: '#909d63' attr: 'b' }
        hints: '#636363'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#909d63' attr: 'b' }
        search_result: { fg: '#bc5653' bg: '#d9d9d9' }
        separator: '#d9d9d9'
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