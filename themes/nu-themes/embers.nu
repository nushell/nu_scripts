# Retrieve the theme settings
export def main [] {
    return {
        binary: '#82576d'
        block: '#6d5782'
        cell-path: '#a39a90'
        closure: '#576d82'
        custom: '#dbd6d1'
        duration: '#6d8257'
        float: '#826d57'
        glob: '#dbd6d1'
        int: '#82576d'
        list: '#576d82'
        nothing: '#826d57'
        range: '#6d8257'
        record: '#576d82'
        string: '#57826d'

        bool: {|| if $in { '#576d82' } else { '#6d8257' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#826d57' attr: 'b' }
            } else if $in < 6hr {
                '#826d57'
            } else if $in < 1day {
                '#6d8257'
            } else if $in < 3day {
                '#57826d'
            } else if $in < 1wk {
                { fg: '#57826d' attr: 'b' }
            } else if $in < 6wk {
                '#576d82'
            } else if $in < 52wk {
                '#6d5782'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a39a90'
            } else if $e < 1mb {
                '#576d82'
            } else {{ fg: '#6d5782' }}
        }

        shape_and: { fg: '#82576d' attr: 'b' }
        shape_binary: { fg: '#82576d' attr: 'b' }
        shape_block: { fg: '#6d5782' attr: 'b' }
        shape_bool: '#576d82'
        shape_closure: { fg: '#576d82' attr: 'b' }
        shape_custom: '#57826d'
        shape_datetime: { fg: '#576d82' attr: 'b' }
        shape_directory: '#576d82'
        shape_external: '#576d82'
        shape_external_resolved: '#576d82'
        shape_externalarg: { fg: '#57826d' attr: 'b' }
        shape_filepath: '#576d82'
        shape_flag: { fg: '#6d5782' attr: 'b' }
        shape_float: { fg: '#826d57' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#576d82' attr: 'b' }
        shape_globpattern: { fg: '#576d82' attr: 'b' }
        shape_int: { fg: '#82576d' attr: 'b' }
        shape_internalcall: { fg: '#576d82' attr: 'b' }
        shape_keyword: { fg: '#82576d' attr: 'b' }
        shape_list: { fg: '#576d82' attr: 'b' }
        shape_literal: '#6d5782'
        shape_match_pattern: '#57826d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#826d57'
        shape_operator: '#6d8257'
        shape_or: { fg: '#82576d' attr: 'b' }
        shape_pipe: { fg: '#82576d' attr: 'b' }
        shape_range: { fg: '#6d8257' attr: 'b' }
        shape_raw_string: { fg: '#dbd6d1' attr: 'b' }
        shape_record: { fg: '#576d82' attr: 'b' }
        shape_redirection: { fg: '#82576d' attr: 'b' }
        shape_signature: { fg: '#57826d' attr: 'b' }
        shape_string: '#57826d'
        shape_string_interpolation: { fg: '#576d82' attr: 'b' }
        shape_table: { fg: '#6d5782' attr: 'b' }
        shape_vardecl: { fg: '#6d5782' attr: 'u' }
        shape_variable: '#82576d'

        foreground: '#a39a90'
        background: '#16130f'
        cursor: '#a39a90'

        empty: '#6d5782'
        header: { fg: '#57826d' attr: 'b' }
        hints: '#5a5047'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#57826d' attr: 'b' }
        search_result: { fg: '#826d57' bg: '#a39a90' }
        separator: '#a39a90'
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