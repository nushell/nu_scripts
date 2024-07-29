# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b48ead'
        block: '#81a1c1'
        cell-path: '#e5e9f0'
        closure: '#88c0d0'
        custom: '#8fbcbb'
        duration: '#ebcb8b'
        float: '#bf616a'
        glob: '#8fbcbb'
        int: '#b48ead'
        list: '#88c0d0'
        nothing: '#bf616a'
        range: '#ebcb8b'
        record: '#88c0d0'
        string: '#a3be8c'

        bool: {|| if $in { '#88c0d0' } else { '#ebcb8b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#bf616a' attr: 'b' }
            } else if $in < 6hr {
                '#bf616a'
            } else if $in < 1day {
                '#ebcb8b'
            } else if $in < 3day {
                '#a3be8c'
            } else if $in < 1wk {
                { fg: '#a3be8c' attr: 'b' }
            } else if $in < 6wk {
                '#88c0d0'
            } else if $in < 52wk {
                '#81a1c1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e5e9f0'
            } else if $e < 1mb {
                '#88c0d0'
            } else {{ fg: '#81a1c1' }}
        }

        shape_and: { fg: '#b48ead' attr: 'b' }
        shape_binary: { fg: '#b48ead' attr: 'b' }
        shape_block: { fg: '#81a1c1' attr: 'b' }
        shape_bool: '#88c0d0'
        shape_closure: { fg: '#88c0d0' attr: 'b' }
        shape_custom: '#a3be8c'
        shape_datetime: { fg: '#88c0d0' attr: 'b' }
        shape_directory: '#88c0d0'
        shape_external: '#88c0d0'
        shape_external_resolved: '#88c0d0'
        shape_externalarg: { fg: '#a3be8c' attr: 'b' }
        shape_filepath: '#88c0d0'
        shape_flag: { fg: '#81a1c1' attr: 'b' }
        shape_float: { fg: '#bf616a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#88c0d0' attr: 'b' }
        shape_globpattern: { fg: '#88c0d0' attr: 'b' }
        shape_int: { fg: '#b48ead' attr: 'b' }
        shape_internalcall: { fg: '#88c0d0' attr: 'b' }
        shape_keyword: { fg: '#b48ead' attr: 'b' }
        shape_list: { fg: '#88c0d0' attr: 'b' }
        shape_literal: '#81a1c1'
        shape_match_pattern: '#a3be8c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#bf616a'
        shape_operator: '#ebcb8b'
        shape_or: { fg: '#b48ead' attr: 'b' }
        shape_pipe: { fg: '#b48ead' attr: 'b' }
        shape_range: { fg: '#ebcb8b' attr: 'b' }
        shape_raw_string: { fg: '#8fbcbb' attr: 'b' }
        shape_record: { fg: '#88c0d0' attr: 'b' }
        shape_redirection: { fg: '#b48ead' attr: 'b' }
        shape_signature: { fg: '#a3be8c' attr: 'b' }
        shape_string: '#a3be8c'
        shape_string_interpolation: { fg: '#88c0d0' attr: 'b' }
        shape_table: { fg: '#81a1c1' attr: 'b' }
        shape_vardecl: { fg: '#81a1c1' attr: 'u' }
        shape_variable: '#b48ead'

        foreground: '#e5e9f0'
        background: '#2e3440'
        cursor: '#e5e9f0'

        empty: '#81a1c1'
        header: { fg: '#a3be8c' attr: 'b' }
        hints: '#4c566a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a3be8c' attr: 'b' }
        search_result: { fg: '#bf616a' bg: '#e5e9f0' }
        separator: '#e5e9f0'
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