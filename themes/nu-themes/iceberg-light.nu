# Retrieve the theme settings
export def main [] {
    return {
        binary: '#7759b4'
        block: '#2d539e'
        cell-path: '#33374c'
        closure: '#3f83a6'
        custom: '#262a3f'
        duration: '#c57339'
        float: '#cc3768'
        glob: '#262a3f'
        int: '#7759b4'
        list: '#3f83a6'
        nothing: '#cc517a'
        range: '#c57339'
        record: '#3f83a6'
        string: '#668e3d'

        bool: {|| if $in { '#327698' } else { '#c57339' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cc517a' attr: 'b' }
            } else if $in < 6hr {
                '#cc517a'
            } else if $in < 1day {
                '#c57339'
            } else if $in < 3day {
                '#668e3d'
            } else if $in < 1wk {
                { fg: '#668e3d' attr: 'b' }
            } else if $in < 6wk {
                '#3f83a6'
            } else if $in < 52wk {
                '#2d539e'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#33374c'
            } else if $e < 1mb {
                '#3f83a6'
            } else {{ fg: '#2d539e' }}
        }

        shape_and: { fg: '#7759b4' attr: 'b' }
        shape_binary: { fg: '#7759b4' attr: 'b' }
        shape_block: { fg: '#2d539e' attr: 'b' }
        shape_bool: '#327698'
        shape_closure: { fg: '#3f83a6' attr: 'b' }
        shape_custom: '#668e3d'
        shape_datetime: { fg: '#3f83a6' attr: 'b' }
        shape_directory: '#3f83a6'
        shape_external: '#3f83a6'
        shape_external_resolved: '#327698'
        shape_externalarg: { fg: '#668e3d' attr: 'b' }
        shape_filepath: '#3f83a6'
        shape_flag: { fg: '#2d539e' attr: 'b' }
        shape_float: { fg: '#cc3768' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3f83a6' attr: 'b' }
        shape_globpattern: { fg: '#3f83a6' attr: 'b' }
        shape_int: { fg: '#7759b4' attr: 'b' }
        shape_internalcall: { fg: '#3f83a6' attr: 'b' }
        shape_keyword: { fg: '#7759b4' attr: 'b' }
        shape_list: { fg: '#3f83a6' attr: 'b' }
        shape_literal: '#2d539e'
        shape_match_pattern: '#668e3d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cc517a'
        shape_operator: '#c57339'
        shape_or: { fg: '#7759b4' attr: 'b' }
        shape_pipe: { fg: '#7759b4' attr: 'b' }
        shape_range: { fg: '#c57339' attr: 'b' }
        shape_raw_string: { fg: '#262a3f' attr: 'b' }
        shape_record: { fg: '#3f83a6' attr: 'b' }
        shape_redirection: { fg: '#7759b4' attr: 'b' }
        shape_signature: { fg: '#668e3d' attr: 'b' }
        shape_string: '#668e3d'
        shape_string_interpolation: { fg: '#3f83a6' attr: 'b' }
        shape_table: { fg: '#2d539e' attr: 'b' }
        shape_vardecl: { fg: '#2d539e' attr: 'u' }
        shape_variable: '#7759b4'

        foreground: '#33374c'
        background: '#e8e9ec'
        cursor: '#33374c'

        empty: '#2d539e'
        header: { fg: '#668e3d' attr: 'b' }
        hints: '#8389a3'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#668e3d' attr: 'b' }
        search_result: { fg: '#cc517a' bg: '#33374c' }
        separator: '#33374c'
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