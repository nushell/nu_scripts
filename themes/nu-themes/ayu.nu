# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f07078'
        block: '#36a3d9'
        cell-path: '#ffffff'
        closure: '#95e5cb'
        custom: '#ffffff'
        duration: '#e6c446'
        float: '#ff6565'
        glob: '#ffffff'
        int: '#f07078'
        list: '#95e5cb'
        nothing: '#ff3333'
        range: '#e6c446'
        record: '#95e5cb'
        string: '#b8cc52'

        bool: {|| if $in { '#c7fffc' } else { '#e6c446' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff3333' attr: 'b' }
            } else if $in < 6hr {
                '#ff3333'
            } else if $in < 1day {
                '#e6c446'
            } else if $in < 3day {
                '#b8cc52'
            } else if $in < 1wk {
                { fg: '#b8cc52' attr: 'b' }
            } else if $in < 6wk {
                '#95e5cb'
            } else if $in < 52wk {
                '#36a3d9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#95e5cb'
            } else {{ fg: '#36a3d9' }}
        }

        shape_and: { fg: '#f07078' attr: 'b' }
        shape_binary: { fg: '#f07078' attr: 'b' }
        shape_block: { fg: '#36a3d9' attr: 'b' }
        shape_bool: '#c7fffc'
        shape_closure: { fg: '#95e5cb' attr: 'b' }
        shape_custom: '#b8cc52'
        shape_datetime: { fg: '#95e5cb' attr: 'b' }
        shape_directory: '#95e5cb'
        shape_external: '#95e5cb'
        shape_external_resolved: '#c7fffc'
        shape_externalarg: { fg: '#b8cc52' attr: 'b' }
        shape_filepath: '#95e5cb'
        shape_flag: { fg: '#36a3d9' attr: 'b' }
        shape_float: { fg: '#ff6565' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#95e5cb' attr: 'b' }
        shape_globpattern: { fg: '#95e5cb' attr: 'b' }
        shape_int: { fg: '#f07078' attr: 'b' }
        shape_internalcall: { fg: '#95e5cb' attr: 'b' }
        shape_keyword: { fg: '#f07078' attr: 'b' }
        shape_list: { fg: '#95e5cb' attr: 'b' }
        shape_literal: '#36a3d9'
        shape_match_pattern: '#b8cc52'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff3333'
        shape_operator: '#e6c446'
        shape_or: { fg: '#f07078' attr: 'b' }
        shape_pipe: { fg: '#f07078' attr: 'b' }
        shape_range: { fg: '#e6c446' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#95e5cb' attr: 'b' }
        shape_redirection: { fg: '#f07078' attr: 'b' }
        shape_signature: { fg: '#b8cc52' attr: 'b' }
        shape_string: '#b8cc52'
        shape_string_interpolation: { fg: '#95e5cb' attr: 'b' }
        shape_table: { fg: '#36a3d9' attr: 'b' }
        shape_vardecl: { fg: '#36a3d9' attr: 'u' }
        shape_variable: '#f07078'

        foreground: '#e5e1cf'
        background: '#0e1419'
        cursor: '#f19618'

        empty: '#36a3d9'
        header: { fg: '#b8cc52' attr: 'b' }
        hints: '#323232'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b8cc52' attr: 'b' }
        search_result: { fg: '#ff3333' bg: '#ffffff' }
        separator: '#ffffff'
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