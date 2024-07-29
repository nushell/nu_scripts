# Retrieve the theme settings
export def main [] {
    return {
        binary: '#cc99cc'
        block: '#6699cc'
        cell-path: '#d3d0c8'
        closure: '#66cccc'
        custom: '#f2f0ec'
        duration: '#ffcc66'
        float: '#f2777a'
        glob: '#f2f0ec'
        int: '#cc99cc'
        list: '#66cccc'
        nothing: '#f2777a'
        range: '#ffcc66'
        record: '#66cccc'
        string: '#99cc99'

        bool: {|| if $in { '#66cccc' } else { '#ffcc66' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f2777a' attr: 'b' }
            } else if $in < 6hr {
                '#f2777a'
            } else if $in < 1day {
                '#ffcc66'
            } else if $in < 3day {
                '#99cc99'
            } else if $in < 1wk {
                { fg: '#99cc99' attr: 'b' }
            } else if $in < 6wk {
                '#66cccc'
            } else if $in < 52wk {
                '#6699cc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d3d0c8'
            } else if $e < 1mb {
                '#66cccc'
            } else {{ fg: '#6699cc' }}
        }

        shape_and: { fg: '#cc99cc' attr: 'b' }
        shape_binary: { fg: '#cc99cc' attr: 'b' }
        shape_block: { fg: '#6699cc' attr: 'b' }
        shape_bool: '#66cccc'
        shape_closure: { fg: '#66cccc' attr: 'b' }
        shape_custom: '#99cc99'
        shape_datetime: { fg: '#66cccc' attr: 'b' }
        shape_directory: '#66cccc'
        shape_external: '#66cccc'
        shape_external_resolved: '#66cccc'
        shape_externalarg: { fg: '#99cc99' attr: 'b' }
        shape_filepath: '#66cccc'
        shape_flag: { fg: '#6699cc' attr: 'b' }
        shape_float: { fg: '#f2777a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#66cccc' attr: 'b' }
        shape_globpattern: { fg: '#66cccc' attr: 'b' }
        shape_int: { fg: '#cc99cc' attr: 'b' }
        shape_internalcall: { fg: '#66cccc' attr: 'b' }
        shape_keyword: { fg: '#cc99cc' attr: 'b' }
        shape_list: { fg: '#66cccc' attr: 'b' }
        shape_literal: '#6699cc'
        shape_match_pattern: '#99cc99'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f2777a'
        shape_operator: '#ffcc66'
        shape_or: { fg: '#cc99cc' attr: 'b' }
        shape_pipe: { fg: '#cc99cc' attr: 'b' }
        shape_range: { fg: '#ffcc66' attr: 'b' }
        shape_raw_string: { fg: '#f2f0ec' attr: 'b' }
        shape_record: { fg: '#66cccc' attr: 'b' }
        shape_redirection: { fg: '#cc99cc' attr: 'b' }
        shape_signature: { fg: '#99cc99' attr: 'b' }
        shape_string: '#99cc99'
        shape_string_interpolation: { fg: '#66cccc' attr: 'b' }
        shape_table: { fg: '#6699cc' attr: 'b' }
        shape_vardecl: { fg: '#6699cc' attr: 'u' }
        shape_variable: '#cc99cc'

        foreground: '#d3d0c8'
        background: '#2d2d2d'
        cursor: '#d3d0c8'

        empty: '#6699cc'
        header: { fg: '#99cc99' attr: 'b' }
        hints: '#747369'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#99cc99' attr: 'b' }
        search_result: { fg: '#f2777a' bg: '#d3d0c8' }
        separator: '#d3d0c8'
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