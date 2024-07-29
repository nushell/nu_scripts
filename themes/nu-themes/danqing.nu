# Retrieve the theme settings
export def main [] {
    return {
        binary: '#cca4e3'
        block: '#b0a4e3'
        cell-path: '#e0f0ef'
        closure: '#30dff3'
        custom: '#fcfefd'
        duration: '#f0c239'
        float: '#f9906f'
        glob: '#fcfefd'
        int: '#cca4e3'
        list: '#30dff3'
        nothing: '#f9906f'
        range: '#f0c239'
        record: '#30dff3'
        string: '#8ab361'

        bool: {|| if $in { '#30dff3' } else { '#f0c239' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f9906f' attr: 'b' }
            } else if $in < 6hr {
                '#f9906f'
            } else if $in < 1day {
                '#f0c239'
            } else if $in < 3day {
                '#8ab361'
            } else if $in < 1wk {
                { fg: '#8ab361' attr: 'b' }
            } else if $in < 6wk {
                '#30dff3'
            } else if $in < 52wk {
                '#b0a4e3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e0f0ef'
            } else if $e < 1mb {
                '#30dff3'
            } else {{ fg: '#b0a4e3' }}
        }

        shape_and: { fg: '#cca4e3' attr: 'b' }
        shape_binary: { fg: '#cca4e3' attr: 'b' }
        shape_block: { fg: '#b0a4e3' attr: 'b' }
        shape_bool: '#30dff3'
        shape_closure: { fg: '#30dff3' attr: 'b' }
        shape_custom: '#8ab361'
        shape_datetime: { fg: '#30dff3' attr: 'b' }
        shape_directory: '#30dff3'
        shape_external: '#30dff3'
        shape_external_resolved: '#30dff3'
        shape_externalarg: { fg: '#8ab361' attr: 'b' }
        shape_filepath: '#30dff3'
        shape_flag: { fg: '#b0a4e3' attr: 'b' }
        shape_float: { fg: '#f9906f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#30dff3' attr: 'b' }
        shape_globpattern: { fg: '#30dff3' attr: 'b' }
        shape_int: { fg: '#cca4e3' attr: 'b' }
        shape_internalcall: { fg: '#30dff3' attr: 'b' }
        shape_keyword: { fg: '#cca4e3' attr: 'b' }
        shape_list: { fg: '#30dff3' attr: 'b' }
        shape_literal: '#b0a4e3'
        shape_match_pattern: '#8ab361'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f9906f'
        shape_operator: '#f0c239'
        shape_or: { fg: '#cca4e3' attr: 'b' }
        shape_pipe: { fg: '#cca4e3' attr: 'b' }
        shape_range: { fg: '#f0c239' attr: 'b' }
        shape_raw_string: { fg: '#fcfefd' attr: 'b' }
        shape_record: { fg: '#30dff3' attr: 'b' }
        shape_redirection: { fg: '#cca4e3' attr: 'b' }
        shape_signature: { fg: '#8ab361' attr: 'b' }
        shape_string: '#8ab361'
        shape_string_interpolation: { fg: '#30dff3' attr: 'b' }
        shape_table: { fg: '#b0a4e3' attr: 'b' }
        shape_vardecl: { fg: '#b0a4e3' attr: 'u' }
        shape_variable: '#cca4e3'

        foreground: '#e0f0ef'
        background: '#2d302f'
        cursor: '#e0f0ef'

        empty: '#b0a4e3'
        header: { fg: '#8ab361' attr: 'b' }
        hints: '#9da8a3'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8ab361' attr: 'b' }
        search_result: { fg: '#f9906f' bg: '#e0f0ef' }
        separator: '#e0f0ef'
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