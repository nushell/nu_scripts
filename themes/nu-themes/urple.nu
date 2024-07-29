# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6c3ca1'
        block: '#564d9b'
        cell-path: '#87799c'
        closure: '#808080'
        custom: '#bfa3ff'
        duration: '#ad5c42'
        float: '#ff6388'
        glob: '#bfa3ff'
        int: '#6c3ca1'
        list: '#808080'
        nothing: '#b0425b'
        range: '#ad5c42'
        record: '#808080'
        string: '#37a415'

        bool: {|| if $in { '#eaeaea' } else { '#ad5c42' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b0425b' attr: 'b' }
            } else if $in < 6hr {
                '#b0425b'
            } else if $in < 1day {
                '#ad5c42'
            } else if $in < 3day {
                '#37a415'
            } else if $in < 1wk {
                { fg: '#37a415' attr: 'b' }
            } else if $in < 6wk {
                '#808080'
            } else if $in < 52wk {
                '#564d9b'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#87799c'
            } else if $e < 1mb {
                '#808080'
            } else {{ fg: '#564d9b' }}
        }

        shape_and: { fg: '#6c3ca1' attr: 'b' }
        shape_binary: { fg: '#6c3ca1' attr: 'b' }
        shape_block: { fg: '#564d9b' attr: 'b' }
        shape_bool: '#eaeaea'
        shape_closure: { fg: '#808080' attr: 'b' }
        shape_custom: '#37a415'
        shape_datetime: { fg: '#808080' attr: 'b' }
        shape_directory: '#808080'
        shape_external: '#808080'
        shape_external_resolved: '#eaeaea'
        shape_externalarg: { fg: '#37a415' attr: 'b' }
        shape_filepath: '#808080'
        shape_flag: { fg: '#564d9b' attr: 'b' }
        shape_float: { fg: '#ff6388' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#808080' attr: 'b' }
        shape_globpattern: { fg: '#808080' attr: 'b' }
        shape_int: { fg: '#6c3ca1' attr: 'b' }
        shape_internalcall: { fg: '#808080' attr: 'b' }
        shape_keyword: { fg: '#6c3ca1' attr: 'b' }
        shape_list: { fg: '#808080' attr: 'b' }
        shape_literal: '#564d9b'
        shape_match_pattern: '#37a415'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b0425b'
        shape_operator: '#ad5c42'
        shape_or: { fg: '#6c3ca1' attr: 'b' }
        shape_pipe: { fg: '#6c3ca1' attr: 'b' }
        shape_range: { fg: '#ad5c42' attr: 'b' }
        shape_raw_string: { fg: '#bfa3ff' attr: 'b' }
        shape_record: { fg: '#808080' attr: 'b' }
        shape_redirection: { fg: '#6c3ca1' attr: 'b' }
        shape_signature: { fg: '#37a415' attr: 'b' }
        shape_string: '#37a415'
        shape_string_interpolation: { fg: '#808080' attr: 'b' }
        shape_table: { fg: '#564d9b' attr: 'b' }
        shape_vardecl: { fg: '#564d9b' attr: 'u' }
        shape_variable: '#6c3ca1'

        foreground: '#877a9b'
        background: '#1b1b23'
        cursor: '#877a9b'

        empty: '#564d9b'
        header: { fg: '#37a415' attr: 'b' }
        hints: '#5d3225'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#37a415' attr: 'b' }
        search_result: { fg: '#b0425b' bg: '#87799c' }
        separator: '#87799c'
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