# Retrieve the theme settings
export def main [] {
    return {
        binary: '#87afd7'
        block: '#ffffaf'
        cell-path: '#bcbcbc'
        closure: '#5f875f'
        custom: '#ffffff'
        duration: '#5f8787'
        float: '#5f8787'
        glob: '#ffffff'
        int: '#87afd7'
        list: '#5f875f'
        nothing: '#5f8787'
        range: '#5f8787'
        record: '#5f875f'
        string: '#87af87'

        bool: {|| if $in { '#5f875f' } else { '#5f8787' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#5f8787' attr: 'b' }
            } else if $in < 6hr {
                '#5f8787'
            } else if $in < 1day {
                '#5f8787'
            } else if $in < 3day {
                '#87af87'
            } else if $in < 1wk {
                { fg: '#87af87' attr: 'b' }
            } else if $in < 6wk {
                '#5f875f'
            } else if $in < 52wk {
                '#ffffaf'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bcbcbc'
            } else if $e < 1mb {
                '#5f875f'
            } else {{ fg: '#ffffaf' }}
        }

        shape_and: { fg: '#87afd7' attr: 'b' }
        shape_binary: { fg: '#87afd7' attr: 'b' }
        shape_block: { fg: '#ffffaf' attr: 'b' }
        shape_bool: '#5f875f'
        shape_closure: { fg: '#5f875f' attr: 'b' }
        shape_custom: '#87af87'
        shape_datetime: { fg: '#5f875f' attr: 'b' }
        shape_directory: '#5f875f'
        shape_external: '#5f875f'
        shape_external_resolved: '#5f875f'
        shape_externalarg: { fg: '#87af87' attr: 'b' }
        shape_filepath: '#5f875f'
        shape_flag: { fg: '#ffffaf' attr: 'b' }
        shape_float: { fg: '#5f8787' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5f875f' attr: 'b' }
        shape_globpattern: { fg: '#5f875f' attr: 'b' }
        shape_int: { fg: '#87afd7' attr: 'b' }
        shape_internalcall: { fg: '#5f875f' attr: 'b' }
        shape_keyword: { fg: '#87afd7' attr: 'b' }
        shape_list: { fg: '#5f875f' attr: 'b' }
        shape_literal: '#ffffaf'
        shape_match_pattern: '#87af87'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#5f8787'
        shape_operator: '#5f8787'
        shape_or: { fg: '#87afd7' attr: 'b' }
        shape_pipe: { fg: '#87afd7' attr: 'b' }
        shape_range: { fg: '#5f8787' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#5f875f' attr: 'b' }
        shape_redirection: { fg: '#87afd7' attr: 'b' }
        shape_signature: { fg: '#87af87' attr: 'b' }
        shape_string: '#87af87'
        shape_string_interpolation: { fg: '#5f875f' attr: 'b' }
        shape_table: { fg: '#ffffaf' attr: 'b' }
        shape_vardecl: { fg: '#ffffaf' attr: 'u' }
        shape_variable: '#87afd7'

        foreground: '#bcbcbc'
        background: '#262626'
        cursor: '#bcbcbc'

        empty: '#ffffaf'
        header: { fg: '#87af87' attr: 'b' }
        hints: '#6c6c6c'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#87af87' attr: 'b' }
        search_result: { fg: '#5f8787' bg: '#bcbcbc' }
        separator: '#bcbcbc'
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