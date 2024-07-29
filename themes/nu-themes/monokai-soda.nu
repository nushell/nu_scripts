# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f4005f'
        block: '#9d65ff'
        cell-path: '#c4c5b5'
        closure: '#58d1eb'
        custom: '#f6f6ef'
        duration: '#fa8419'
        float: '#f4005f'
        glob: '#f6f6ef'
        int: '#f4005f'
        list: '#58d1eb'
        nothing: '#f4005f'
        range: '#fa8419'
        record: '#58d1eb'
        string: '#98e024'

        bool: {|| if $in { '#58d1eb' } else { '#fa8419' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f4005f' attr: 'b' }
            } else if $in < 6hr {
                '#f4005f'
            } else if $in < 1day {
                '#fa8419'
            } else if $in < 3day {
                '#98e024'
            } else if $in < 1wk {
                { fg: '#98e024' attr: 'b' }
            } else if $in < 6wk {
                '#58d1eb'
            } else if $in < 52wk {
                '#9d65ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c4c5b5'
            } else if $e < 1mb {
                '#58d1eb'
            } else {{ fg: '#9d65ff' }}
        }

        shape_and: { fg: '#f4005f' attr: 'b' }
        shape_binary: { fg: '#f4005f' attr: 'b' }
        shape_block: { fg: '#9d65ff' attr: 'b' }
        shape_bool: '#58d1eb'
        shape_closure: { fg: '#58d1eb' attr: 'b' }
        shape_custom: '#98e024'
        shape_datetime: { fg: '#58d1eb' attr: 'b' }
        shape_directory: '#58d1eb'
        shape_external: '#58d1eb'
        shape_external_resolved: '#58d1eb'
        shape_externalarg: { fg: '#98e024' attr: 'b' }
        shape_filepath: '#58d1eb'
        shape_flag: { fg: '#9d65ff' attr: 'b' }
        shape_float: { fg: '#f4005f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#58d1eb' attr: 'b' }
        shape_globpattern: { fg: '#58d1eb' attr: 'b' }
        shape_int: { fg: '#f4005f' attr: 'b' }
        shape_internalcall: { fg: '#58d1eb' attr: 'b' }
        shape_keyword: { fg: '#f4005f' attr: 'b' }
        shape_list: { fg: '#58d1eb' attr: 'b' }
        shape_literal: '#9d65ff'
        shape_match_pattern: '#98e024'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f4005f'
        shape_operator: '#fa8419'
        shape_or: { fg: '#f4005f' attr: 'b' }
        shape_pipe: { fg: '#f4005f' attr: 'b' }
        shape_range: { fg: '#fa8419' attr: 'b' }
        shape_raw_string: { fg: '#f6f6ef' attr: 'b' }
        shape_record: { fg: '#58d1eb' attr: 'b' }
        shape_redirection: { fg: '#f4005f' attr: 'b' }
        shape_signature: { fg: '#98e024' attr: 'b' }
        shape_string: '#98e024'
        shape_string_interpolation: { fg: '#58d1eb' attr: 'b' }
        shape_table: { fg: '#9d65ff' attr: 'b' }
        shape_vardecl: { fg: '#9d65ff' attr: 'u' }
        shape_variable: '#f4005f'

        foreground: '#c4c5b5'
        background: '#1a1a1a'
        cursor: '#c4c5b5'

        empty: '#9d65ff'
        header: { fg: '#98e024' attr: 'b' }
        hints: '#625e4c'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#98e024' attr: 'b' }
        search_result: { fg: '#f4005f' bg: '#c4c5b5' }
        separator: '#c4c5b5'
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