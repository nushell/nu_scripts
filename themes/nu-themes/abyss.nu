# Retrieve the theme settings
export def main [] {
    return {
        binary: '#4595bd'
        block: '#277bb1'
        cell-path: '#a0cce2'
        closure: '#2592d3'
        custom: '#a0cce2'
        duration: '#1f6ca1'
        float: '#48697e'
        glob: '#a0cce2'
        int: '#4595bd'
        list: '#2592d3'
        nothing: '#48697e'
        range: '#1f6ca1'
        record: '#2592d3'
        string: '#10598b'

        bool: {|| if $in { '#2592d3' } else { '#1f6ca1' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#48697e' attr: 'b' }
            } else if $in < 6hr {
                '#48697e'
            } else if $in < 1day {
                '#1f6ca1'
            } else if $in < 3day {
                '#10598b'
            } else if $in < 1wk {
                { fg: '#10598b' attr: 'b' }
            } else if $in < 6wk {
                '#2592d3'
            } else if $in < 52wk {
                '#277bb1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a0cce2'
            } else if $e < 1mb {
                '#2592d3'
            } else {{ fg: '#277bb1' }}
        }

        shape_and: { fg: '#4595bd' attr: 'b' }
        shape_binary: { fg: '#4595bd' attr: 'b' }
        shape_block: { fg: '#277bb1' attr: 'b' }
        shape_bool: '#2592d3'
        shape_closure: { fg: '#2592d3' attr: 'b' }
        shape_custom: '#10598b'
        shape_datetime: { fg: '#2592d3' attr: 'b' }
        shape_directory: '#2592d3'
        shape_external: '#2592d3'
        shape_external_resolved: '#2592d3'
        shape_externalarg: { fg: '#10598b' attr: 'b' }
        shape_filepath: '#2592d3'
        shape_flag: { fg: '#277bb1' attr: 'b' }
        shape_float: { fg: '#48697e' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#2592d3' attr: 'b' }
        shape_globpattern: { fg: '#2592d3' attr: 'b' }
        shape_int: { fg: '#4595bd' attr: 'b' }
        shape_internalcall: { fg: '#2592d3' attr: 'b' }
        shape_keyword: { fg: '#4595bd' attr: 'b' }
        shape_list: { fg: '#2592d3' attr: 'b' }
        shape_literal: '#277bb1'
        shape_match_pattern: '#10598b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#48697e'
        shape_operator: '#1f6ca1'
        shape_or: { fg: '#4595bd' attr: 'b' }
        shape_pipe: { fg: '#4595bd' attr: 'b' }
        shape_range: { fg: '#1f6ca1' attr: 'b' }
        shape_raw_string: { fg: '#a0cce2' attr: 'b' }
        shape_record: { fg: '#2592d3' attr: 'b' }
        shape_redirection: { fg: '#4595bd' attr: 'b' }
        shape_signature: { fg: '#10598b' attr: 'b' }
        shape_string: '#10598b'
        shape_string_interpolation: { fg: '#2592d3' attr: 'b' }
        shape_table: { fg: '#277bb1' attr: 'b' }
        shape_vardecl: { fg: '#277bb1' attr: 'u' }
        shape_variable: '#4595bd'

        foreground: '#c0c7ca'
        background: '#040f18'
        cursor: '#10598b'

        empty: '#277bb1'
        header: { fg: '#10598b' attr: 'b' }
        hints: '#708e9e'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#10598b' attr: 'b' }
        search_result: { fg: '#48697e' bg: '#a0cce2' }
        separator: '#a0cce2'
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