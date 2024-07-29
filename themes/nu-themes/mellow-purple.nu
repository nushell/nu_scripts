# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8991bb'
        block: '#550068'
        cell-path: '#ffeeff'
        closure: '#b900b1'
        custom: '#f8c0ff'
        duration: '#955ae7'
        float: '#00d9e9'
        glob: '#f8c0ff'
        int: '#8991bb'
        list: '#b900b1'
        nothing: '#00d9e9'
        range: '#955ae7'
        record: '#b900b1'
        string: '#05cb0d'

        bool: {|| if $in { '#b900b1' } else { '#955ae7' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#00d9e9' attr: 'b' }
            } else if $in < 6hr {
                '#00d9e9'
            } else if $in < 1day {
                '#955ae7'
            } else if $in < 3day {
                '#05cb0d'
            } else if $in < 1wk {
                { fg: '#05cb0d' attr: 'b' }
            } else if $in < 6wk {
                '#b900b1'
            } else if $in < 52wk {
                '#550068'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffeeff'
            } else if $e < 1mb {
                '#b900b1'
            } else {{ fg: '#550068' }}
        }

        shape_and: { fg: '#8991bb' attr: 'b' }
        shape_binary: { fg: '#8991bb' attr: 'b' }
        shape_block: { fg: '#550068' attr: 'b' }
        shape_bool: '#b900b1'
        shape_closure: { fg: '#b900b1' attr: 'b' }
        shape_custom: '#05cb0d'
        shape_datetime: { fg: '#b900b1' attr: 'b' }
        shape_directory: '#b900b1'
        shape_external: '#b900b1'
        shape_external_resolved: '#b900b1'
        shape_externalarg: { fg: '#05cb0d' attr: 'b' }
        shape_filepath: '#b900b1'
        shape_flag: { fg: '#550068' attr: 'b' }
        shape_float: { fg: '#00d9e9' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#b900b1' attr: 'b' }
        shape_globpattern: { fg: '#b900b1' attr: 'b' }
        shape_int: { fg: '#8991bb' attr: 'b' }
        shape_internalcall: { fg: '#b900b1' attr: 'b' }
        shape_keyword: { fg: '#8991bb' attr: 'b' }
        shape_list: { fg: '#b900b1' attr: 'b' }
        shape_literal: '#550068'
        shape_match_pattern: '#05cb0d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#00d9e9'
        shape_operator: '#955ae7'
        shape_or: { fg: '#8991bb' attr: 'b' }
        shape_pipe: { fg: '#8991bb' attr: 'b' }
        shape_range: { fg: '#955ae7' attr: 'b' }
        shape_raw_string: { fg: '#f8c0ff' attr: 'b' }
        shape_record: { fg: '#b900b1' attr: 'b' }
        shape_redirection: { fg: '#8991bb' attr: 'b' }
        shape_signature: { fg: '#05cb0d' attr: 'b' }
        shape_string: '#05cb0d'
        shape_string_interpolation: { fg: '#b900b1' attr: 'b' }
        shape_table: { fg: '#550068' attr: 'b' }
        shape_vardecl: { fg: '#550068' attr: 'u' }
        shape_variable: '#8991bb'

        foreground: '#ffeeff'
        background: '#1e0528'
        cursor: '#ffeeff'

        empty: '#550068'
        header: { fg: '#05cb0d' attr: 'b' }
        hints: '#320f55'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#05cb0d' attr: 'b' }
        search_result: { fg: '#00d9e9' bg: '#ffeeff' }
        separator: '#ffeeff'
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