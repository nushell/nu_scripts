# Retrieve the theme settings
export def main [] {
    return {
        binary: '#7b40b5'
        block: '#407bb5'
        cell-path: '#f8f8f8'
        closure: '#40b57b'
        custom: '#ffffff'
        duration: '#b57b40'
        float: '#cd73a0'
        glob: '#ffffff'
        int: '#7b40b5'
        list: '#40b57b'
        nothing: '#b5407b'
        range: '#b57b40'
        record: '#40b57b'
        string: '#7bb540'

        bool: {|| if $in { '#73cda0' } else { '#b57b40' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b5407b' attr: 'b' }
            } else if $in < 6hr {
                '#b5407b'
            } else if $in < 1day {
                '#b57b40'
            } else if $in < 3day {
                '#7bb540'
            } else if $in < 1wk {
                { fg: '#7bb540' attr: 'b' }
            } else if $in < 6wk {
                '#40b57b'
            } else if $in < 52wk {
                '#407bb5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f8f8f8'
            } else if $e < 1mb {
                '#40b57b'
            } else {{ fg: '#407bb5' }}
        }

        shape_and: { fg: '#7b40b5' attr: 'b' }
        shape_binary: { fg: '#7b40b5' attr: 'b' }
        shape_block: { fg: '#407bb5' attr: 'b' }
        shape_bool: '#73cda0'
        shape_closure: { fg: '#40b57b' attr: 'b' }
        shape_custom: '#7bb540'
        shape_datetime: { fg: '#40b57b' attr: 'b' }
        shape_directory: '#40b57b'
        shape_external: '#40b57b'
        shape_external_resolved: '#73cda0'
        shape_externalarg: { fg: '#7bb540' attr: 'b' }
        shape_filepath: '#40b57b'
        shape_flag: { fg: '#407bb5' attr: 'b' }
        shape_float: { fg: '#cd73a0' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#40b57b' attr: 'b' }
        shape_globpattern: { fg: '#40b57b' attr: 'b' }
        shape_int: { fg: '#7b40b5' attr: 'b' }
        shape_internalcall: { fg: '#40b57b' attr: 'b' }
        shape_keyword: { fg: '#7b40b5' attr: 'b' }
        shape_list: { fg: '#40b57b' attr: 'b' }
        shape_literal: '#407bb5'
        shape_match_pattern: '#7bb540'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b5407b'
        shape_operator: '#b57b40'
        shape_or: { fg: '#7b40b5' attr: 'b' }
        shape_pipe: { fg: '#7b40b5' attr: 'b' }
        shape_range: { fg: '#b57b40' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#40b57b' attr: 'b' }
        shape_redirection: { fg: '#7b40b5' attr: 'b' }
        shape_signature: { fg: '#7bb540' attr: 'b' }
        shape_string: '#7bb540'
        shape_string_interpolation: { fg: '#40b57b' attr: 'b' }
        shape_table: { fg: '#407bb5' attr: 'b' }
        shape_vardecl: { fg: '#407bb5' attr: 'u' }
        shape_variable: '#7b40b5'

        foreground: '#23476a'
        background: '#ffffff'
        cursor: '#23476a'

        empty: '#407bb5'
        header: { fg: '#7bb540' attr: 'b' }
        hints: '#737373'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7bb540' attr: 'b' }
        search_result: { fg: '#b5407b' bg: '#f8f8f8' }
        separator: '#f8f8f8'
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