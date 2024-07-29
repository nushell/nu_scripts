# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a16a94'
        block: '#01a0e4'
        cell-path: '#a5a2a2'
        closure: '#b5e4f4'
        custom: '#f7f7f7'
        duration: '#fded02'
        float: '#e8bbd0'
        glob: '#f7f7f7'
        int: '#a16a94'
        list: '#b5e4f4'
        nothing: '#db2d20'
        range: '#fded02'
        record: '#b5e4f4'
        string: '#01a252'

        bool: {|| if $in { '#cdab53' } else { '#fded02' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#db2d20' attr: 'b' }
            } else if $in < 6hr {
                '#db2d20'
            } else if $in < 1day {
                '#fded02'
            } else if $in < 3day {
                '#01a252'
            } else if $in < 1wk {
                { fg: '#01a252' attr: 'b' }
            } else if $in < 6wk {
                '#b5e4f4'
            } else if $in < 52wk {
                '#01a0e4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a5a2a2'
            } else if $e < 1mb {
                '#b5e4f4'
            } else {{ fg: '#01a0e4' }}
        }

        shape_and: { fg: '#a16a94' attr: 'b' }
        shape_binary: { fg: '#a16a94' attr: 'b' }
        shape_block: { fg: '#01a0e4' attr: 'b' }
        shape_bool: '#cdab53'
        shape_closure: { fg: '#b5e4f4' attr: 'b' }
        shape_custom: '#01a252'
        shape_datetime: { fg: '#b5e4f4' attr: 'b' }
        shape_directory: '#b5e4f4'
        shape_external: '#b5e4f4'
        shape_external_resolved: '#cdab53'
        shape_externalarg: { fg: '#01a252' attr: 'b' }
        shape_filepath: '#b5e4f4'
        shape_flag: { fg: '#01a0e4' attr: 'b' }
        shape_float: { fg: '#e8bbd0' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#b5e4f4' attr: 'b' }
        shape_globpattern: { fg: '#b5e4f4' attr: 'b' }
        shape_int: { fg: '#a16a94' attr: 'b' }
        shape_internalcall: { fg: '#b5e4f4' attr: 'b' }
        shape_keyword: { fg: '#a16a94' attr: 'b' }
        shape_list: { fg: '#b5e4f4' attr: 'b' }
        shape_literal: '#01a0e4'
        shape_match_pattern: '#01a252'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#db2d20'
        shape_operator: '#fded02'
        shape_or: { fg: '#a16a94' attr: 'b' }
        shape_pipe: { fg: '#a16a94' attr: 'b' }
        shape_range: { fg: '#fded02' attr: 'b' }
        shape_raw_string: { fg: '#f7f7f7' attr: 'b' }
        shape_record: { fg: '#b5e4f4' attr: 'b' }
        shape_redirection: { fg: '#a16a94' attr: 'b' }
        shape_signature: { fg: '#01a252' attr: 'b' }
        shape_string: '#01a252'
        shape_string_interpolation: { fg: '#b5e4f4' attr: 'b' }
        shape_table: { fg: '#01a0e4' attr: 'b' }
        shape_vardecl: { fg: '#01a0e4' attr: 'u' }
        shape_variable: '#a16a94'

        foreground: '#a5a2a2'
        background: '#090300'
        cursor: '#a5a2a2'

        empty: '#01a0e4'
        header: { fg: '#01a252' attr: 'b' }
        hints: '#5c5855'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#01a252' attr: 'b' }
        search_result: { fg: '#db2d20' bg: '#a5a2a2' }
        separator: '#a5a2a2'
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