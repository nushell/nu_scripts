# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a626a4'
        block: '#0184bc'
        cell-path: '#fafafa'
        closure: '#0997b3'
        custom: '#fafafa'
        duration: '#c18401'
        float: '#e45649'
        glob: '#fafafa'
        int: '#a626a4'
        list: '#0997b3'
        nothing: '#e45649'
        range: '#c18401'
        record: '#0997b3'
        string: '#40a14f'

        bool: {|| if $in { '#0997b3' } else { '#c18401' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e45649' attr: 'b' }
            } else if $in < 6hr {
                '#e45649'
            } else if $in < 1day {
                '#c18401'
            } else if $in < 3day {
                '#40a14f'
            } else if $in < 1wk {
                { fg: '#40a14f' attr: 'b' }
            } else if $in < 6wk {
                '#0997b3'
            } else if $in < 52wk {
                '#0184bc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#fafafa'
            } else if $e < 1mb {
                '#0997b3'
            } else {{ fg: '#0184bc' }}
        }

        shape_and: { fg: '#a626a4' attr: 'b' }
        shape_binary: { fg: '#a626a4' attr: 'b' }
        shape_block: { fg: '#0184bc' attr: 'b' }
        shape_bool: '#0997b3'
        shape_closure: { fg: '#0997b3' attr: 'b' }
        shape_custom: '#40a14f'
        shape_datetime: { fg: '#0997b3' attr: 'b' }
        shape_directory: '#0997b3'
        shape_external: '#0997b3'
        shape_external_resolved: '#0997b3'
        shape_externalarg: { fg: '#40a14f' attr: 'b' }
        shape_filepath: '#0997b3'
        shape_flag: { fg: '#0184bc' attr: 'b' }
        shape_float: { fg: '#e45649' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0997b3' attr: 'b' }
        shape_globpattern: { fg: '#0997b3' attr: 'b' }
        shape_int: { fg: '#a626a4' attr: 'b' }
        shape_internalcall: { fg: '#0997b3' attr: 'b' }
        shape_keyword: { fg: '#a626a4' attr: 'b' }
        shape_list: { fg: '#0997b3' attr: 'b' }
        shape_literal: '#0184bc'
        shape_match_pattern: '#40a14f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e45649'
        shape_operator: '#c18401'
        shape_or: { fg: '#a626a4' attr: 'b' }
        shape_pipe: { fg: '#a626a4' attr: 'b' }
        shape_range: { fg: '#c18401' attr: 'b' }
        shape_raw_string: { fg: '#fafafa' attr: 'b' }
        shape_record: { fg: '#0997b3' attr: 'b' }
        shape_redirection: { fg: '#a626a4' attr: 'b' }
        shape_signature: { fg: '#40a14f' attr: 'b' }
        shape_string: '#40a14f'
        shape_string_interpolation: { fg: '#0997b3' attr: 'b' }
        shape_table: { fg: '#0184bc' attr: 'b' }
        shape_vardecl: { fg: '#0184bc' attr: 'u' }
        shape_variable: '#a626a4'

        foreground: '#383a42'
        background: '#fafafa'
        cursor: '#383a42'

        empty: '#0184bc'
        header: { fg: '#40a14f' attr: 'b' }
        hints: '#383a42'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#40a14f' attr: 'b' }
        search_result: { fg: '#e45649' bg: '#fafafa' }
        separator: '#fafafa'
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