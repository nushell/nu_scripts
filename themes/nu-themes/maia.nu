# Retrieve the theme settings
export def main [] {
    return {
        binary: '#43746a'
        block: '#16a085'
        cell-path: '#e0e0e0'
        closure: '#00cccc'
        custom: '#e8e8e8'
        duration: '#4c4f4d'
        float: '#cc372c'
        glob: '#e8e8e8'
        int: '#43746a'
        list: '#00cccc'
        nothing: '#ba2922'
        range: '#4c4f4d'
        record: '#00cccc'
        string: '#7e807e'

        bool: {|| if $in { '#00d1d1' } else { '#4c4f4d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ba2922' attr: 'b' }
            } else if $in < 6hr {
                '#ba2922'
            } else if $in < 1day {
                '#4c4f4d'
            } else if $in < 3day {
                '#7e807e'
            } else if $in < 1wk {
                { fg: '#7e807e' attr: 'b' }
            } else if $in < 6wk {
                '#00cccc'
            } else if $in < 52wk {
                '#16a085'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e0e0e0'
            } else if $e < 1mb {
                '#00cccc'
            } else {{ fg: '#16a085' }}
        }

        shape_and: { fg: '#43746a' attr: 'b' }
        shape_binary: { fg: '#43746a' attr: 'b' }
        shape_block: { fg: '#16a085' attr: 'b' }
        shape_bool: '#00d1d1'
        shape_closure: { fg: '#00cccc' attr: 'b' }
        shape_custom: '#7e807e'
        shape_datetime: { fg: '#00cccc' attr: 'b' }
        shape_directory: '#00cccc'
        shape_external: '#00cccc'
        shape_external_resolved: '#00d1d1'
        shape_externalarg: { fg: '#7e807e' attr: 'b' }
        shape_filepath: '#00cccc'
        shape_flag: { fg: '#16a085' attr: 'b' }
        shape_float: { fg: '#cc372c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00cccc' attr: 'b' }
        shape_globpattern: { fg: '#00cccc' attr: 'b' }
        shape_int: { fg: '#43746a' attr: 'b' }
        shape_internalcall: { fg: '#00cccc' attr: 'b' }
        shape_keyword: { fg: '#43746a' attr: 'b' }
        shape_list: { fg: '#00cccc' attr: 'b' }
        shape_literal: '#16a085'
        shape_match_pattern: '#7e807e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ba2922'
        shape_operator: '#4c4f4d'
        shape_or: { fg: '#43746a' attr: 'b' }
        shape_pipe: { fg: '#43746a' attr: 'b' }
        shape_range: { fg: '#4c4f4d' attr: 'b' }
        shape_raw_string: { fg: '#e8e8e8' attr: 'b' }
        shape_record: { fg: '#00cccc' attr: 'b' }
        shape_redirection: { fg: '#43746a' attr: 'b' }
        shape_signature: { fg: '#7e807e' attr: 'b' }
        shape_string: '#7e807e'
        shape_string_interpolation: { fg: '#00cccc' attr: 'b' }
        shape_table: { fg: '#16a085' attr: 'b' }
        shape_vardecl: { fg: '#16a085' attr: 'u' }
        shape_variable: '#43746a'

        foreground: '#fdf6e3'
        background: '#272827'
        cursor: '#16a085'

        empty: '#16a085'
        header: { fg: '#7e807e' attr: 'b' }
        hints: '#282928'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7e807e' attr: 'b' }
        search_result: { fg: '#ba2922' bg: '#e0e0e0' }
        separator: '#e0e0e0'
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