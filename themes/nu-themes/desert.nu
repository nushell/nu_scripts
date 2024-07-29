# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ffdead'
        block: '#cd853f'
        cell-path: '#f5deb3'
        closure: '#ffa0a0'
        custom: '#ffffff'
        duration: '#f0e68c'
        float: '#ff5555'
        glob: '#ffffff'
        int: '#ffdead'
        list: '#ffa0a0'
        nothing: '#ff2b2b'
        range: '#f0e68c'
        record: '#ffa0a0'
        string: '#98fb98'

        bool: {|| if $in { '#ffd700' } else { '#f0e68c' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff2b2b' attr: 'b' }
            } else if $in < 6hr {
                '#ff2b2b'
            } else if $in < 1day {
                '#f0e68c'
            } else if $in < 3day {
                '#98fb98'
            } else if $in < 1wk {
                { fg: '#98fb98' attr: 'b' }
            } else if $in < 6wk {
                '#ffa0a0'
            } else if $in < 52wk {
                '#cd853f'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f5deb3'
            } else if $e < 1mb {
                '#ffa0a0'
            } else {{ fg: '#cd853f' }}
        }

        shape_and: { fg: '#ffdead' attr: 'b' }
        shape_binary: { fg: '#ffdead' attr: 'b' }
        shape_block: { fg: '#cd853f' attr: 'b' }
        shape_bool: '#ffd700'
        shape_closure: { fg: '#ffa0a0' attr: 'b' }
        shape_custom: '#98fb98'
        shape_datetime: { fg: '#ffa0a0' attr: 'b' }
        shape_directory: '#ffa0a0'
        shape_external: '#ffa0a0'
        shape_external_resolved: '#ffd700'
        shape_externalarg: { fg: '#98fb98' attr: 'b' }
        shape_filepath: '#ffa0a0'
        shape_flag: { fg: '#cd853f' attr: 'b' }
        shape_float: { fg: '#ff5555' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#ffa0a0' attr: 'b' }
        shape_globpattern: { fg: '#ffa0a0' attr: 'b' }
        shape_int: { fg: '#ffdead' attr: 'b' }
        shape_internalcall: { fg: '#ffa0a0' attr: 'b' }
        shape_keyword: { fg: '#ffdead' attr: 'b' }
        shape_list: { fg: '#ffa0a0' attr: 'b' }
        shape_literal: '#cd853f'
        shape_match_pattern: '#98fb98'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff2b2b'
        shape_operator: '#f0e68c'
        shape_or: { fg: '#ffdead' attr: 'b' }
        shape_pipe: { fg: '#ffdead' attr: 'b' }
        shape_range: { fg: '#f0e68c' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#ffa0a0' attr: 'b' }
        shape_redirection: { fg: '#ffdead' attr: 'b' }
        shape_signature: { fg: '#98fb98' attr: 'b' }
        shape_string: '#98fb98'
        shape_string_interpolation: { fg: '#ffa0a0' attr: 'b' }
        shape_table: { fg: '#cd853f' attr: 'b' }
        shape_vardecl: { fg: '#cd853f' attr: 'u' }
        shape_variable: '#ffdead'

        foreground: '#ffffff'
        background: '#333333'
        cursor: '#ffffff'

        empty: '#cd853f'
        header: { fg: '#98fb98' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#98fb98' attr: 'b' }
        search_result: { fg: '#ff2b2b' bg: '#f5deb3' }
        separator: '#f5deb3'
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