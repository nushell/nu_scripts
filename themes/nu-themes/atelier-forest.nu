# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6666ea'
        block: '#407ee7'
        cell-path: '#a8a19f'
        closure: '#3d97b8'
        custom: '#f1efee'
        duration: '#c38418'
        float: '#f22c40'
        glob: '#f1efee'
        int: '#6666ea'
        list: '#3d97b8'
        nothing: '#f22c40'
        range: '#c38418'
        record: '#3d97b8'
        string: '#7b9726'

        bool: {|| if $in { '#3d97b8' } else { '#c38418' } }

        datetime: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f22c40' attr: 'b' }
            } else if $in < 6hr {
                '#f22c40'
            } else if $in < 1day {
                '#c38418'
            } else if $in < 3day {
                '#7b9726'
            } else if $in < 1wk {
                { fg: '#7b9726' attr: 'b' }
            } else if $in < 6wk {
                '#3d97b8'
            } else if $in < 52wk {
                '#407ee7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a8a19f'
            } else if $e < 1mb {
                '#3d97b8'
            } else {{ fg: '#407ee7' }}
        }

        shape_and: { fg: '#6666ea' attr: 'b' }
        shape_binary: { fg: '#6666ea' attr: 'b' }
        shape_block: { fg: '#407ee7' attr: 'b' }
        shape_bool: '#3d97b8'
        shape_closure: { fg: '#3d97b8' attr: 'b' }
        shape_custom: '#7b9726'
        shape_datetime: { fg: '#3d97b8' attr: 'b' }
        shape_directory: '#3d97b8'
        shape_external: '#3d97b8'
        shape_external_resolved: '#3d97b8'
        shape_externalarg: { fg: '#7b9726' attr: 'b' }
        shape_filepath: '#3d97b8'
        shape_flag: { fg: '#407ee7' attr: 'b' }
        shape_float: { fg: '#f22c40' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3d97b8' attr: 'b' }
        shape_globpattern: { fg: '#3d97b8' attr: 'b' }
        shape_int: { fg: '#6666ea' attr: 'b' }
        shape_internalcall: { fg: '#3d97b8' attr: 'b' }
        shape_keyword: { fg: '#6666ea' attr: 'b' }
        shape_list: { fg: '#3d97b8' attr: 'b' }
        shape_literal: '#407ee7'
        shape_match_pattern: '#7b9726'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f22c40'
        shape_operator: '#c38418'
        shape_or: { fg: '#6666ea' attr: 'b' }
        shape_pipe: { fg: '#6666ea' attr: 'b' }
        shape_range: { fg: '#c38418' attr: 'b' }
        shape_raw_string: { fg: '#f1efee' attr: 'b' }
        shape_record: { fg: '#3d97b8' attr: 'b' }
        shape_redirection: { fg: '#6666ea' attr: 'b' }
        shape_signature: { fg: '#7b9726' attr: 'b' }
        shape_string: '#7b9726'
        shape_string_interpolation: { fg: '#3d97b8' attr: 'b' }
        shape_table: { fg: '#407ee7' attr: 'b' }
        shape_vardecl: { fg: '#407ee7' attr: 'u' }
        shape_variable: '#6666ea'

        foreground: '#a8a19f'
        background: '#1b1918'
        cursor: '#a8a19f'

        empty: '#407ee7'
        header: { fg: '#7b9726' attr: 'b' }
        hints: '#766e6b'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7b9726' attr: 'b' }
        search_result: { fg: '#f22c40' bg: '#a8a19f' }
        separator: '#a8a19f'
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