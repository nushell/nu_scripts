# Retrieve the theme settings
export def main [] {
    return {
        binary: '#641e73'
        block: '#2424f4'
        cell-path: '#d8d8d0'
        closure: '#378ca9'
        custom: '#e5e5e0'
        duration: '#62e456'
        float: '#8dff2a'
        glob: '#e5e5e0'
        int: '#641e73'
        list: '#378ca9'
        nothing: '#259d1a'
        range: '#62e456'
        record: '#378ca9'
        string: '#13ce2f'

        bool: {|| if $in { '#3f85a5' } else { '#62e456' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#259d1a' attr: 'b' }
            } else if $in < 6hr {
                '#259d1a'
            } else if $in < 1day {
                '#62e456'
            } else if $in < 3day {
                '#13ce2f'
            } else if $in < 1wk {
                { fg: '#13ce2f' attr: 'b' }
            } else if $in < 6wk {
                '#378ca9'
            } else if $in < 52wk {
                '#2424f4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d8d8d0'
            } else if $e < 1mb {
                '#378ca9'
            } else {{ fg: '#2424f4' }}
        }

        shape_and: { fg: '#641e73' attr: 'b' }
        shape_binary: { fg: '#641e73' attr: 'b' }
        shape_block: { fg: '#2424f4' attr: 'b' }
        shape_bool: '#3f85a5'
        shape_closure: { fg: '#378ca9' attr: 'b' }
        shape_custom: '#13ce2f'
        shape_datetime: { fg: '#378ca9' attr: 'b' }
        shape_directory: '#378ca9'
        shape_external: '#378ca9'
        shape_external_resolved: '#3f85a5'
        shape_externalarg: { fg: '#13ce2f' attr: 'b' }
        shape_filepath: '#378ca9'
        shape_flag: { fg: '#2424f4' attr: 'b' }
        shape_float: { fg: '#8dff2a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#378ca9' attr: 'b' }
        shape_globpattern: { fg: '#378ca9' attr: 'b' }
        shape_int: { fg: '#641e73' attr: 'b' }
        shape_internalcall: { fg: '#378ca9' attr: 'b' }
        shape_keyword: { fg: '#641e73' attr: 'b' }
        shape_list: { fg: '#378ca9' attr: 'b' }
        shape_literal: '#2424f4'
        shape_match_pattern: '#13ce2f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#259d1a'
        shape_operator: '#62e456'
        shape_or: { fg: '#641e73' attr: 'b' }
        shape_pipe: { fg: '#641e73' attr: 'b' }
        shape_range: { fg: '#62e456' attr: 'b' }
        shape_raw_string: { fg: '#e5e5e0' attr: 'b' }
        shape_record: { fg: '#378ca9' attr: 'b' }
        shape_redirection: { fg: '#641e73' attr: 'b' }
        shape_signature: { fg: '#13ce2f' attr: 'b' }
        shape_string: '#13ce2f'
        shape_string_interpolation: { fg: '#378ca9' attr: 'b' }
        shape_table: { fg: '#2424f4' attr: 'b' }
        shape_vardecl: { fg: '#2424f4' attr: 'u' }
        shape_variable: '#641e73'

        foreground: '#b4b4b4'
        background: '#1b1d1e'
        cursor: '#15b61a'

        empty: '#2424f4'
        header: { fg: '#13ce2f' attr: 'b' }
        hints: '#505354'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#13ce2f' attr: 'b' }
        search_result: { fg: '#259d1a' bg: '#d8d8d0' }
        separator: '#d8d8d0'
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