# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d699b6'
        block: '#7fbbb3'
        cell-path: '#d3c6aa'
        closure: '#83c092'
        custom: '#d3c6aa'
        duration: '#dbbc7f'
        float: '#e67e80'
        glob: '#d3c6aa'
        int: '#d699b6'
        list: '#83c092'
        nothing: '#e67e80'
        range: '#dbbc7f'
        record: '#83c092'
        string: '#a7c080'

        bool: {|| if $in { '#83c092' } else { '#dbbc7f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e67e80' attr: 'b' }
            } else if $in < 6hr {
                '#e67e80'
            } else if $in < 1day {
                '#dbbc7f'
            } else if $in < 3day {
                '#a7c080'
            } else if $in < 1wk {
                { fg: '#a7c080' attr: 'b' }
            } else if $in < 6wk {
                '#83c092'
            } else if $in < 52wk {
                '#7fbbb3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d3c6aa'
            } else if $e < 1mb {
                '#83c092'
            } else {{ fg: '#7fbbb3' }}
        }

        shape_and: { fg: '#d699b6' attr: 'b' }
        shape_binary: { fg: '#d699b6' attr: 'b' }
        shape_block: { fg: '#7fbbb3' attr: 'b' }
        shape_bool: '#83c092'
        shape_closure: { fg: '#83c092' attr: 'b' }
        shape_custom: '#a7c080'
        shape_datetime: { fg: '#83c092' attr: 'b' }
        shape_directory: '#83c092'
        shape_external: '#83c092'
        shape_external_resolved: '#83c092'
        shape_externalarg: { fg: '#a7c080' attr: 'b' }
        shape_filepath: '#83c092'
        shape_flag: { fg: '#7fbbb3' attr: 'b' }
        shape_float: { fg: '#e67e80' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#83c092' attr: 'b' }
        shape_globpattern: { fg: '#83c092' attr: 'b' }
        shape_int: { fg: '#d699b6' attr: 'b' }
        shape_internalcall: { fg: '#83c092' attr: 'b' }
        shape_keyword: { fg: '#d699b6' attr: 'b' }
        shape_list: { fg: '#83c092' attr: 'b' }
        shape_literal: '#7fbbb3'
        shape_match_pattern: '#a7c080'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e67e80'
        shape_operator: '#dbbc7f'
        shape_or: { fg: '#d699b6' attr: 'b' }
        shape_pipe: { fg: '#d699b6' attr: 'b' }
        shape_range: { fg: '#dbbc7f' attr: 'b' }
        shape_raw_string: { fg: '#d3c6aa' attr: 'b' }
        shape_record: { fg: '#83c092' attr: 'b' }
        shape_redirection: { fg: '#d699b6' attr: 'b' }
        shape_signature: { fg: '#a7c080' attr: 'b' }
        shape_string: '#a7c080'
        shape_string_interpolation: { fg: '#83c092' attr: 'b' }
        shape_table: { fg: '#7fbbb3' attr: 'b' }
        shape_vardecl: { fg: '#7fbbb3' attr: 'u' }
        shape_variable: '#d699b6'

        foreground: '#d3c6aa'
        background: '#2f383e'
        cursor: '#d3c6aa'

        empty: '#7fbbb3'
        header: { fg: '#a7c080' attr: 'b' }
        hints: '#4b565c'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a7c080' attr: 'b' }
        search_result: { fg: '#e67e80' bg: '#d3c6aa' }
        separator: '#d3c6aa'
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