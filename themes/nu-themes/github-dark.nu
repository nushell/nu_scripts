# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b392f0'
        block: '#2188ff'
        cell-path: '#d1d5da'
        closure: '#39c5cf'
        custom: '#fafbfc'
        duration: '#ffea7f'
        float: '#f97583'
        glob: '#fafbfc'
        int: '#b392f0'
        list: '#39c5cf'
        nothing: '#ea4a5a'
        range: '#ffea7f'
        record: '#39c5cf'
        string: '#34d058'

        bool: {|| if $in { '#56d4dd' } else { '#ffea7f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ea4a5a' attr: 'b' }
            } else if $in < 6hr {
                '#ea4a5a'
            } else if $in < 1day {
                '#ffea7f'
            } else if $in < 3day {
                '#34d058'
            } else if $in < 1wk {
                { fg: '#34d058' attr: 'b' }
            } else if $in < 6wk {
                '#39c5cf'
            } else if $in < 52wk {
                '#2188ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d1d5da'
            } else if $e < 1mb {
                '#39c5cf'
            } else {{ fg: '#2188ff' }}
        }

        shape_and: { fg: '#b392f0' attr: 'b' }
        shape_binary: { fg: '#b392f0' attr: 'b' }
        shape_block: { fg: '#2188ff' attr: 'b' }
        shape_bool: '#56d4dd'
        shape_closure: { fg: '#39c5cf' attr: 'b' }
        shape_custom: '#34d058'
        shape_datetime: { fg: '#39c5cf' attr: 'b' }
        shape_directory: '#39c5cf'
        shape_external: '#39c5cf'
        shape_external_resolved: '#56d4dd'
        shape_externalarg: { fg: '#34d058' attr: 'b' }
        shape_filepath: '#39c5cf'
        shape_flag: { fg: '#2188ff' attr: 'b' }
        shape_float: { fg: '#f97583' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#39c5cf' attr: 'b' }
        shape_globpattern: { fg: '#39c5cf' attr: 'b' }
        shape_int: { fg: '#b392f0' attr: 'b' }
        shape_internalcall: { fg: '#39c5cf' attr: 'b' }
        shape_keyword: { fg: '#b392f0' attr: 'b' }
        shape_list: { fg: '#39c5cf' attr: 'b' }
        shape_literal: '#2188ff'
        shape_match_pattern: '#34d058'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ea4a5a'
        shape_operator: '#ffea7f'
        shape_or: { fg: '#b392f0' attr: 'b' }
        shape_pipe: { fg: '#b392f0' attr: 'b' }
        shape_range: { fg: '#ffea7f' attr: 'b' }
        shape_raw_string: { fg: '#fafbfc' attr: 'b' }
        shape_record: { fg: '#39c5cf' attr: 'b' }
        shape_redirection: { fg: '#b392f0' attr: 'b' }
        shape_signature: { fg: '#34d058' attr: 'b' }
        shape_string: '#34d058'
        shape_string_interpolation: { fg: '#39c5cf' attr: 'b' }
        shape_table: { fg: '#2188ff' attr: 'b' }
        shape_vardecl: { fg: '#2188ff' attr: 'u' }
        shape_variable: '#b392f0'

        foreground: '#d1d5da'
        background: '#24292e'
        cursor: '#c8e1ff'

        empty: '#2188ff'
        header: { fg: '#34d058' attr: 'b' }
        hints: '#959da5'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#34d058' attr: 'b' }
        search_result: { fg: '#ea4a5a' bg: '#d1d5da' }
        separator: '#d1d5da'
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