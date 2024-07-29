# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d3869b'
        block: '#83a598'
        cell-path: '#d5c4a1'
        closure: '#8ec07c'
        custom: '#fbf1c7'
        duration: '#fabd2f'
        float: '#fb4934'
        glob: '#fbf1c7'
        int: '#d3869b'
        list: '#8ec07c'
        nothing: '#fb4934'
        range: '#fabd2f'
        record: '#8ec07c'
        string: '#b8bb26'

        bool: {|| if $in { '#8ec07c' } else { '#fabd2f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fb4934' attr: 'b' }
            } else if $in < 6hr {
                '#fb4934'
            } else if $in < 1day {
                '#fabd2f'
            } else if $in < 3day {
                '#b8bb26'
            } else if $in < 1wk {
                { fg: '#b8bb26' attr: 'b' }
            } else if $in < 6wk {
                '#8ec07c'
            } else if $in < 52wk {
                '#83a598'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d5c4a1'
            } else if $e < 1mb {
                '#8ec07c'
            } else {{ fg: '#83a598' }}
        }

        shape_and: { fg: '#d3869b' attr: 'b' }
        shape_binary: { fg: '#d3869b' attr: 'b' }
        shape_block: { fg: '#83a598' attr: 'b' }
        shape_bool: '#8ec07c'
        shape_closure: { fg: '#8ec07c' attr: 'b' }
        shape_custom: '#b8bb26'
        shape_datetime: { fg: '#8ec07c' attr: 'b' }
        shape_directory: '#8ec07c'
        shape_external: '#8ec07c'
        shape_external_resolved: '#8ec07c'
        shape_externalarg: { fg: '#b8bb26' attr: 'b' }
        shape_filepath: '#8ec07c'
        shape_flag: { fg: '#83a598' attr: 'b' }
        shape_float: { fg: '#fb4934' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8ec07c' attr: 'b' }
        shape_globpattern: { fg: '#8ec07c' attr: 'b' }
        shape_int: { fg: '#d3869b' attr: 'b' }
        shape_internalcall: { fg: '#8ec07c' attr: 'b' }
        shape_keyword: { fg: '#d3869b' attr: 'b' }
        shape_list: { fg: '#8ec07c' attr: 'b' }
        shape_literal: '#83a598'
        shape_match_pattern: '#b8bb26'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fb4934'
        shape_operator: '#fabd2f'
        shape_or: { fg: '#d3869b' attr: 'b' }
        shape_pipe: { fg: '#d3869b' attr: 'b' }
        shape_range: { fg: '#fabd2f' attr: 'b' }
        shape_raw_string: { fg: '#fbf1c7' attr: 'b' }
        shape_record: { fg: '#8ec07c' attr: 'b' }
        shape_redirection: { fg: '#d3869b' attr: 'b' }
        shape_signature: { fg: '#b8bb26' attr: 'b' }
        shape_string: '#b8bb26'
        shape_string_interpolation: { fg: '#8ec07c' attr: 'b' }
        shape_table: { fg: '#83a598' attr: 'b' }
        shape_vardecl: { fg: '#83a598' attr: 'u' }
        shape_variable: '#d3869b'

        foreground: '#d5c4a1'
        background: '#32302f'
        cursor: '#d5c4a1'

        empty: '#83a598'
        header: { fg: '#b8bb26' attr: 'b' }
        hints: '#665c54'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b8bb26' attr: 'b' }
        search_result: { fg: '#fb4934' bg: '#d5c4a1' }
        separator: '#d5c4a1'
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