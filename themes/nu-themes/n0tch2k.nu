# Retrieve the theme settings
export def main [] {
    return {
        binary: '#767676'
        block: '#657d3e'
        cell-path: '#d0b8a3'
        closure: '#c9c9c9'
        custom: '#d8c8bb'
        duration: '#a98051'
        float: '#a97775'
        glob: '#d8c8bb'
        int: '#767676'
        list: '#c9c9c9'
        nothing: '#a95551'
        range: '#a98051'
        record: '#c9c9c9'
        string: '#666666'

        bool: {|| if $in { '#dcdcdc' } else { '#a98051' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a95551' attr: 'b' }
            } else if $in < 6hr {
                '#a95551'
            } else if $in < 1day {
                '#a98051'
            } else if $in < 3day {
                '#666666'
            } else if $in < 1wk {
                { fg: '#666666' attr: 'b' }
            } else if $in < 6wk {
                '#c9c9c9'
            } else if $in < 52wk {
                '#657d3e'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0b8a3'
            } else if $e < 1mb {
                '#c9c9c9'
            } else {{ fg: '#657d3e' }}
        }

        shape_and: { fg: '#767676' attr: 'b' }
        shape_binary: { fg: '#767676' attr: 'b' }
        shape_block: { fg: '#657d3e' attr: 'b' }
        shape_bool: '#dcdcdc'
        shape_closure: { fg: '#c9c9c9' attr: 'b' }
        shape_custom: '#666666'
        shape_datetime: { fg: '#c9c9c9' attr: 'b' }
        shape_directory: '#c9c9c9'
        shape_external: '#c9c9c9'
        shape_external_resolved: '#dcdcdc'
        shape_externalarg: { fg: '#666666' attr: 'b' }
        shape_filepath: '#c9c9c9'
        shape_flag: { fg: '#657d3e' attr: 'b' }
        shape_float: { fg: '#a97775' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#c9c9c9' attr: 'b' }
        shape_globpattern: { fg: '#c9c9c9' attr: 'b' }
        shape_int: { fg: '#767676' attr: 'b' }
        shape_internalcall: { fg: '#c9c9c9' attr: 'b' }
        shape_keyword: { fg: '#767676' attr: 'b' }
        shape_list: { fg: '#c9c9c9' attr: 'b' }
        shape_literal: '#657d3e'
        shape_match_pattern: '#666666'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a95551'
        shape_operator: '#a98051'
        shape_or: { fg: '#767676' attr: 'b' }
        shape_pipe: { fg: '#767676' attr: 'b' }
        shape_range: { fg: '#a98051' attr: 'b' }
        shape_raw_string: { fg: '#d8c8bb' attr: 'b' }
        shape_record: { fg: '#c9c9c9' attr: 'b' }
        shape_redirection: { fg: '#767676' attr: 'b' }
        shape_signature: { fg: '#666666' attr: 'b' }
        shape_string: '#666666'
        shape_string_interpolation: { fg: '#c9c9c9' attr: 'b' }
        shape_table: { fg: '#657d3e' attr: 'b' }
        shape_vardecl: { fg: '#657d3e' attr: 'u' }
        shape_variable: '#767676'

        foreground: '#a0a0a0'
        background: '#222222'
        cursor: '#a0a0a0'

        empty: '#657d3e'
        header: { fg: '#666666' attr: 'b' }
        hints: '#474747'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#666666' attr: 'b' }
        search_result: { fg: '#a95551' bg: '#d0b8a3' }
        separator: '#d0b8a3'
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