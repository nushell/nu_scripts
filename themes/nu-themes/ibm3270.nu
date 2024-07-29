# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f078d8'
        block: '#7890f0'
        cell-path: '#a5a5a5'
        closure: '#54e4e4'
        custom: '#ffffff'
        duration: '#f0d824'
        float: '#ef8383'
        glob: '#ffffff'
        int: '#f078d8'
        list: '#54e4e4'
        nothing: '#f01818'
        range: '#f0d824'
        record: '#54e4e4'
        string: '#24d830'

        bool: {|| if $in { '#9ce2e2' } else { '#f0d824' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f01818' attr: 'b' }
            } else if $in < 6hr {
                '#f01818'
            } else if $in < 1day {
                '#f0d824'
            } else if $in < 3day {
                '#24d830'
            } else if $in < 1wk {
                { fg: '#24d830' attr: 'b' }
            } else if $in < 6wk {
                '#54e4e4'
            } else if $in < 52wk {
                '#7890f0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a5a5a5'
            } else if $e < 1mb {
                '#54e4e4'
            } else {{ fg: '#7890f0' }}
        }

        shape_and: { fg: '#f078d8' attr: 'b' }
        shape_binary: { fg: '#f078d8' attr: 'b' }
        shape_block: { fg: '#7890f0' attr: 'b' }
        shape_bool: '#9ce2e2'
        shape_closure: { fg: '#54e4e4' attr: 'b' }
        shape_custom: '#24d830'
        shape_datetime: { fg: '#54e4e4' attr: 'b' }
        shape_directory: '#54e4e4'
        shape_external: '#54e4e4'
        shape_external_resolved: '#9ce2e2'
        shape_externalarg: { fg: '#24d830' attr: 'b' }
        shape_filepath: '#54e4e4'
        shape_flag: { fg: '#7890f0' attr: 'b' }
        shape_float: { fg: '#ef8383' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#54e4e4' attr: 'b' }
        shape_globpattern: { fg: '#54e4e4' attr: 'b' }
        shape_int: { fg: '#f078d8' attr: 'b' }
        shape_internalcall: { fg: '#54e4e4' attr: 'b' }
        shape_keyword: { fg: '#f078d8' attr: 'b' }
        shape_list: { fg: '#54e4e4' attr: 'b' }
        shape_literal: '#7890f0'
        shape_match_pattern: '#24d830'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f01818'
        shape_operator: '#f0d824'
        shape_or: { fg: '#f078d8' attr: 'b' }
        shape_pipe: { fg: '#f078d8' attr: 'b' }
        shape_range: { fg: '#f0d824' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#54e4e4' attr: 'b' }
        shape_redirection: { fg: '#f078d8' attr: 'b' }
        shape_signature: { fg: '#24d830' attr: 'b' }
        shape_string: '#24d830'
        shape_string_interpolation: { fg: '#54e4e4' attr: 'b' }
        shape_table: { fg: '#7890f0' attr: 'b' }
        shape_vardecl: { fg: '#7890f0' attr: 'u' }
        shape_variable: '#f078d8'

        foreground: '#fdfdfd'
        background: '#000000'
        cursor: '#fdfdfd'

        empty: '#7890f0'
        header: { fg: '#24d830' attr: 'b' }
        hints: '#888888'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#24d830' attr: 'b' }
        search_result: { fg: '#f01818' bg: '#a5a5a5' }
        separator: '#a5a5a5'
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