# Retrieve the theme settings
export def main [] {
    return {
        binary: '#550087'
        block: '#134eb2'
        cell-path: '#eeeeee'
        closure: '#0e707c'
        custom: '#d8d8d8'
        duration: '#f5971d'
        float: '#e83a3f'
        glob: '#d8d8d8'
        int: '#550087'
        list: '#0e707c'
        nothing: '#b7141e'
        range: '#f5971d'
        record: '#0e707c'
        string: '#457b23'

        bool: {|| if $in { '#26bad1' } else { '#f5971d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b7141e' attr: 'b' }
            } else if $in < 6hr {
                '#b7141e'
            } else if $in < 1day {
                '#f5971d'
            } else if $in < 3day {
                '#457b23'
            } else if $in < 1wk {
                { fg: '#457b23' attr: 'b' }
            } else if $in < 6wk {
                '#0e707c'
            } else if $in < 52wk {
                '#134eb2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#eeeeee'
            } else if $e < 1mb {
                '#0e707c'
            } else {{ fg: '#134eb2' }}
        }

        shape_and: { fg: '#550087' attr: 'b' }
        shape_binary: { fg: '#550087' attr: 'b' }
        shape_block: { fg: '#134eb2' attr: 'b' }
        shape_bool: '#26bad1'
        shape_closure: { fg: '#0e707c' attr: 'b' }
        shape_custom: '#457b23'
        shape_datetime: { fg: '#0e707c' attr: 'b' }
        shape_directory: '#0e707c'
        shape_external: '#0e707c'
        shape_external_resolved: '#26bad1'
        shape_externalarg: { fg: '#457b23' attr: 'b' }
        shape_filepath: '#0e707c'
        shape_flag: { fg: '#134eb2' attr: 'b' }
        shape_float: { fg: '#e83a3f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0e707c' attr: 'b' }
        shape_globpattern: { fg: '#0e707c' attr: 'b' }
        shape_int: { fg: '#550087' attr: 'b' }
        shape_internalcall: { fg: '#0e707c' attr: 'b' }
        shape_keyword: { fg: '#550087' attr: 'b' }
        shape_list: { fg: '#0e707c' attr: 'b' }
        shape_literal: '#134eb2'
        shape_match_pattern: '#457b23'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b7141e'
        shape_operator: '#f5971d'
        shape_or: { fg: '#550087' attr: 'b' }
        shape_pipe: { fg: '#550087' attr: 'b' }
        shape_range: { fg: '#f5971d' attr: 'b' }
        shape_raw_string: { fg: '#d8d8d8' attr: 'b' }
        shape_record: { fg: '#0e707c' attr: 'b' }
        shape_redirection: { fg: '#550087' attr: 'b' }
        shape_signature: { fg: '#457b23' attr: 'b' }
        shape_string: '#457b23'
        shape_string_interpolation: { fg: '#0e707c' attr: 'b' }
        shape_table: { fg: '#134eb2' attr: 'b' }
        shape_vardecl: { fg: '#134eb2' attr: 'u' }
        shape_variable: '#550087'

        foreground: '#e4e4e4'
        background: '#222221'
        cursor: '#16aec9'

        empty: '#134eb2'
        header: { fg: '#457b23' attr: 'b' }
        hints: '#424242'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#457b23' attr: 'b' }
        search_result: { fg: '#b7141e' bg: '#eeeeee' }
        separator: '#eeeeee'
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