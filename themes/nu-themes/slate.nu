# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a481d3'
        block: '#264b49'
        cell-path: '#02c5e0'
        closure: '#15ab9c'
        custom: '#e0e0e0'
        duration: '#c4c9c0'
        float: '#ffcdd9'
        glob: '#e0e0e0'
        int: '#a481d3'
        list: '#15ab9c'
        nothing: '#e2a8bf'
        range: '#c4c9c0'
        record: '#15ab9c'
        string: '#81d778'

        bool: {|| if $in { '#8cdfe0' } else { '#c4c9c0' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e2a8bf' attr: 'b' }
            } else if $in < 6hr {
                '#e2a8bf'
            } else if $in < 1day {
                '#c4c9c0'
            } else if $in < 3day {
                '#81d778'
            } else if $in < 1wk {
                { fg: '#81d778' attr: 'b' }
            } else if $in < 6wk {
                '#15ab9c'
            } else if $in < 52wk {
                '#264b49'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#02c5e0'
            } else if $e < 1mb {
                '#15ab9c'
            } else {{ fg: '#264b49' }}
        }

        shape_and: { fg: '#a481d3' attr: 'b' }
        shape_binary: { fg: '#a481d3' attr: 'b' }
        shape_block: { fg: '#264b49' attr: 'b' }
        shape_bool: '#8cdfe0'
        shape_closure: { fg: '#15ab9c' attr: 'b' }
        shape_custom: '#81d778'
        shape_datetime: { fg: '#15ab9c' attr: 'b' }
        shape_directory: '#15ab9c'
        shape_external: '#15ab9c'
        shape_external_resolved: '#8cdfe0'
        shape_externalarg: { fg: '#81d778' attr: 'b' }
        shape_filepath: '#15ab9c'
        shape_flag: { fg: '#264b49' attr: 'b' }
        shape_float: { fg: '#ffcdd9' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#15ab9c' attr: 'b' }
        shape_globpattern: { fg: '#15ab9c' attr: 'b' }
        shape_int: { fg: '#a481d3' attr: 'b' }
        shape_internalcall: { fg: '#15ab9c' attr: 'b' }
        shape_keyword: { fg: '#a481d3' attr: 'b' }
        shape_list: { fg: '#15ab9c' attr: 'b' }
        shape_literal: '#264b49'
        shape_match_pattern: '#81d778'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e2a8bf'
        shape_operator: '#c4c9c0'
        shape_or: { fg: '#a481d3' attr: 'b' }
        shape_pipe: { fg: '#a481d3' attr: 'b' }
        shape_range: { fg: '#c4c9c0' attr: 'b' }
        shape_raw_string: { fg: '#e0e0e0' attr: 'b' }
        shape_record: { fg: '#15ab9c' attr: 'b' }
        shape_redirection: { fg: '#a481d3' attr: 'b' }
        shape_signature: { fg: '#81d778' attr: 'b' }
        shape_string: '#81d778'
        shape_string_interpolation: { fg: '#15ab9c' attr: 'b' }
        shape_table: { fg: '#264b49' attr: 'b' }
        shape_vardecl: { fg: '#264b49' attr: 'u' }
        shape_variable: '#a481d3'

        foreground: '#35b1d2'
        background: '#222222'
        cursor: '#35b1d2'

        empty: '#264b49'
        header: { fg: '#81d778' attr: 'b' }
        hints: '#ffffff'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#81d778' attr: 'b' }
        search_result: { fg: '#e2a8bf' bg: '#02c5e0' }
        separator: '#02c5e0'
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