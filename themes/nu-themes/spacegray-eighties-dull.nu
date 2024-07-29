# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a5789e'
        block: '#7c8fa5'
        cell-path: '#b3b8c3'
        closure: '#80cdcb'
        custom: '#ffffff'
        duration: '#c6735a'
        float: '#ec5f67'
        glob: '#ffffff'
        int: '#a5789e'
        list: '#80cdcb'
        nothing: '#b24a56'
        range: '#c6735a'
        record: '#80cdcb'
        string: '#92b477'

        bool: {|| if $in { '#58c2c1' } else { '#c6735a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b24a56' attr: 'b' }
            } else if $in < 6hr {
                '#b24a56'
            } else if $in < 1day {
                '#c6735a'
            } else if $in < 3day {
                '#92b477'
            } else if $in < 1wk {
                { fg: '#92b477' attr: 'b' }
            } else if $in < 6wk {
                '#80cdcb'
            } else if $in < 52wk {
                '#7c8fa5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b3b8c3'
            } else if $e < 1mb {
                '#80cdcb'
            } else {{ fg: '#7c8fa5' }}
        }

        shape_and: { fg: '#a5789e' attr: 'b' }
        shape_binary: { fg: '#a5789e' attr: 'b' }
        shape_block: { fg: '#7c8fa5' attr: 'b' }
        shape_bool: '#58c2c1'
        shape_closure: { fg: '#80cdcb' attr: 'b' }
        shape_custom: '#92b477'
        shape_datetime: { fg: '#80cdcb' attr: 'b' }
        shape_directory: '#80cdcb'
        shape_external: '#80cdcb'
        shape_external_resolved: '#58c2c1'
        shape_externalarg: { fg: '#92b477' attr: 'b' }
        shape_filepath: '#80cdcb'
        shape_flag: { fg: '#7c8fa5' attr: 'b' }
        shape_float: { fg: '#ec5f67' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#80cdcb' attr: 'b' }
        shape_globpattern: { fg: '#80cdcb' attr: 'b' }
        shape_int: { fg: '#a5789e' attr: 'b' }
        shape_internalcall: { fg: '#80cdcb' attr: 'b' }
        shape_keyword: { fg: '#a5789e' attr: 'b' }
        shape_list: { fg: '#80cdcb' attr: 'b' }
        shape_literal: '#7c8fa5'
        shape_match_pattern: '#92b477'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b24a56'
        shape_operator: '#c6735a'
        shape_or: { fg: '#a5789e' attr: 'b' }
        shape_pipe: { fg: '#a5789e' attr: 'b' }
        shape_range: { fg: '#c6735a' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#80cdcb' attr: 'b' }
        shape_redirection: { fg: '#a5789e' attr: 'b' }
        shape_signature: { fg: '#92b477' attr: 'b' }
        shape_string: '#92b477'
        shape_string_interpolation: { fg: '#80cdcb' attr: 'b' }
        shape_table: { fg: '#7c8fa5' attr: 'b' }
        shape_vardecl: { fg: '#7c8fa5' attr: 'u' }
        shape_variable: '#a5789e'

        foreground: '#c9c6bc'
        background: '#222222'
        cursor: '#c9c6bc'

        empty: '#7c8fa5'
        header: { fg: '#92b477' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#92b477' attr: 'b' }
        search_result: { fg: '#b24a56' bg: '#b3b8c3' }
        separator: '#b3b8c3'
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