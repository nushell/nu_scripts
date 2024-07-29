# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8f3f71'
        block: '#076678'
        cell-path: '#3c3836'
        closure: '#427b58'
        custom: '#3c3836'
        duration: '#b57614'
        float: '#9d0006'
        glob: '#3c3836'
        int: '#8f3f71'
        list: '#427b58'
        nothing: '#9d0006'
        range: '#b57614'
        record: '#427b58'
        string: '#79740e'

        bool: {|| if $in { '#427b58' } else { '#b57614' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#9d0006' attr: 'b' }
            } else if $in < 6hr {
                '#9d0006'
            } else if $in < 1day {
                '#b57614'
            } else if $in < 3day {
                '#79740e'
            } else if $in < 1wk {
                { fg: '#79740e' attr: 'b' }
            } else if $in < 6wk {
                '#427b58'
            } else if $in < 52wk {
                '#076678'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#3c3836'
            } else if $e < 1mb {
                '#427b58'
            } else {{ fg: '#076678' }}
        }

        shape_and: { fg: '#8f3f71' attr: 'b' }
        shape_binary: { fg: '#8f3f71' attr: 'b' }
        shape_block: { fg: '#076678' attr: 'b' }
        shape_bool: '#427b58'
        shape_closure: { fg: '#427b58' attr: 'b' }
        shape_custom: '#79740e'
        shape_datetime: { fg: '#427b58' attr: 'b' }
        shape_directory: '#427b58'
        shape_external: '#427b58'
        shape_external_resolved: '#427b58'
        shape_externalarg: { fg: '#79740e' attr: 'b' }
        shape_filepath: '#427b58'
        shape_flag: { fg: '#076678' attr: 'b' }
        shape_float: { fg: '#9d0006' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#427b58' attr: 'b' }
        shape_globpattern: { fg: '#427b58' attr: 'b' }
        shape_int: { fg: '#8f3f71' attr: 'b' }
        shape_internalcall: { fg: '#427b58' attr: 'b' }
        shape_keyword: { fg: '#8f3f71' attr: 'b' }
        shape_list: { fg: '#427b58' attr: 'b' }
        shape_literal: '#076678'
        shape_match_pattern: '#79740e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#9d0006'
        shape_operator: '#b57614'
        shape_or: { fg: '#8f3f71' attr: 'b' }
        shape_pipe: { fg: '#8f3f71' attr: 'b' }
        shape_range: { fg: '#b57614' attr: 'b' }
        shape_raw_string: { fg: '#3c3836' attr: 'b' }
        shape_record: { fg: '#427b58' attr: 'b' }
        shape_redirection: { fg: '#8f3f71' attr: 'b' }
        shape_signature: { fg: '#79740e' attr: 'b' }
        shape_string: '#79740e'
        shape_string_interpolation: { fg: '#427b58' attr: 'b' }
        shape_table: { fg: '#076678' attr: 'b' }
        shape_vardecl: { fg: '#076678' attr: 'u' }
        shape_variable: '#8f3f71'

        foreground: '#3c3836'
        background: '#f2e5bc'
        cursor: '#3c3836'

        empty: '#076678'
        header: { fg: '#79740e' attr: 'b' }
        hints: '#f2e5bc'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#79740e' attr: 'b' }
        search_result: { fg: '#9d0006' bg: '#3c3836' }
        separator: '#3c3836'
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