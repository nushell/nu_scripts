# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d54cbf'
        block: '#557feb'
        cell-path: '#928080'
        closure: '#009580'
        custom: '#a29fa0'
        duration: '#9e8100'
        float: '#f0681a'
        glob: '#a29fa0'
        int: '#d54cbf'
        list: '#009580'
        nothing: '#fa3333'
        range: '#9e8100'
        record: '#009580'
        string: '#139913'

        bool: {|| if $in { '#1da1af' } else { '#9e8100' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fa3333' attr: 'b' }
            } else if $in < 6hr {
                '#fa3333'
            } else if $in < 1day {
                '#9e8100'
            } else if $in < 3day {
                '#139913'
            } else if $in < 1wk {
                { fg: '#139913' attr: 'b' }
            } else if $in < 6wk {
                '#009580'
            } else if $in < 52wk {
                '#557feb'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#928080'
            } else if $e < 1mb {
                '#009580'
            } else {{ fg: '#557feb' }}
        }

        shape_and: { fg: '#d54cbf' attr: 'b' }
        shape_binary: { fg: '#d54cbf' attr: 'b' }
        shape_block: { fg: '#557feb' attr: 'b' }
        shape_bool: '#1da1af'
        shape_closure: { fg: '#009580' attr: 'b' }
        shape_custom: '#139913'
        shape_datetime: { fg: '#009580' attr: 'b' }
        shape_directory: '#009580'
        shape_external: '#009580'
        shape_external_resolved: '#1da1af'
        shape_externalarg: { fg: '#139913' attr: 'b' }
        shape_filepath: '#009580'
        shape_flag: { fg: '#557feb' attr: 'b' }
        shape_float: { fg: '#f0681a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#009580' attr: 'b' }
        shape_globpattern: { fg: '#009580' attr: 'b' }
        shape_int: { fg: '#d54cbf' attr: 'b' }
        shape_internalcall: { fg: '#009580' attr: 'b' }
        shape_keyword: { fg: '#d54cbf' attr: 'b' }
        shape_list: { fg: '#009580' attr: 'b' }
        shape_literal: '#557feb'
        shape_match_pattern: '#139913'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fa3333'
        shape_operator: '#9e8100'
        shape_or: { fg: '#d54cbf' attr: 'b' }
        shape_pipe: { fg: '#d54cbf' attr: 'b' }
        shape_range: { fg: '#9e8100' attr: 'b' }
        shape_raw_string: { fg: '#a29fa0' attr: 'b' }
        shape_record: { fg: '#009580' attr: 'b' }
        shape_redirection: { fg: '#d54cbf' attr: 'b' }
        shape_signature: { fg: '#139913' attr: 'b' }
        shape_string: '#139913'
        shape_string_interpolation: { fg: '#009580' attr: 'b' }
        shape_table: { fg: '#557feb' attr: 'b' }
        shape_vardecl: { fg: '#557feb' attr: 'u' }
        shape_variable: '#d54cbf'

        foreground: '#a29fa0'
        background: '#001514'
        cursor: '#a29fa0'

        empty: '#557feb'
        header: { fg: '#139913' attr: 'b' }
        hints: '#241828'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#139913' attr: 'b' }
        search_result: { fg: '#fa3333' bg: '#928080' }
        separator: '#928080'
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