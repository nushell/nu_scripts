# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a83884'
        block: '#1666b0'
        cell-path: '#f2ebe9'
        closure: '#007072'
        custom: '#fff5f3'
        duration: '#825e00'
        float: '#bd401a'
        glob: '#fff5f3'
        int: '#a83884'
        list: '#007072'
        nothing: '#c61a14'
        range: '#825e00'
        record: '#007072'
        string: '#357200'

        bool: {|| if $in { '#00786a' } else { '#825e00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c61a14' attr: 'b' }
            } else if $in < 6hr {
                '#c61a14'
            } else if $in < 1day {
                '#825e00'
            } else if $in < 3day {
                '#357200'
            } else if $in < 1wk {
                { fg: '#357200' attr: 'b' }
            } else if $in < 6wk {
                '#007072'
            } else if $in < 52wk {
                '#1666b0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f2ebe9'
            } else if $e < 1mb {
                '#007072'
            } else {{ fg: '#1666b0' }}
        }

        shape_and: { fg: '#a83884' attr: 'b' }
        shape_binary: { fg: '#a83884' attr: 'b' }
        shape_block: { fg: '#1666b0' attr: 'b' }
        shape_bool: '#00786a'
        shape_closure: { fg: '#007072' attr: 'b' }
        shape_custom: '#357200'
        shape_datetime: { fg: '#007072' attr: 'b' }
        shape_directory: '#007072'
        shape_external: '#007072'
        shape_external_resolved: '#00786a'
        shape_externalarg: { fg: '#357200' attr: 'b' }
        shape_filepath: '#007072'
        shape_flag: { fg: '#1666b0' attr: 'b' }
        shape_float: { fg: '#bd401a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#007072' attr: 'b' }
        shape_globpattern: { fg: '#007072' attr: 'b' }
        shape_int: { fg: '#a83884' attr: 'b' }
        shape_internalcall: { fg: '#007072' attr: 'b' }
        shape_keyword: { fg: '#a83884' attr: 'b' }
        shape_list: { fg: '#007072' attr: 'b' }
        shape_literal: '#1666b0'
        shape_match_pattern: '#357200'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c61a14'
        shape_operator: '#825e00'
        shape_or: { fg: '#a83884' attr: 'b' }
        shape_pipe: { fg: '#a83884' attr: 'b' }
        shape_range: { fg: '#825e00' attr: 'b' }
        shape_raw_string: { fg: '#fff5f3' attr: 'b' }
        shape_record: { fg: '#007072' attr: 'b' }
        shape_redirection: { fg: '#a83884' attr: 'b' }
        shape_signature: { fg: '#357200' attr: 'b' }
        shape_string: '#357200'
        shape_string_interpolation: { fg: '#007072' attr: 'b' }
        shape_table: { fg: '#1666b0' attr: 'b' }
        shape_vardecl: { fg: '#1666b0' attr: 'u' }
        shape_variable: '#a83884'

        foreground: '#4d595f'
        background: '#fff5f3'
        cursor: '#4d595f'

        empty: '#1666b0'
        header: { fg: '#357200' attr: 'b' }
        hints: '#7b6471'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#357200' attr: 'b' }
        search_result: { fg: '#c61a14' bg: '#f2ebe9' }
        separator: '#f2ebe9'
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