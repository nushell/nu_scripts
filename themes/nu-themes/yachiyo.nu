# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9298e7'
        block: '#ada883'
        cell-path: '#a0be99'
        closure: '#ff9c9c'
        custom: '#a0be99'
        duration: '#d4b34e'
        float: '#86b79b'
        glob: '#a0be99'
        int: '#9298e7'
        list: '#ff9c9c'
        nothing: '#86b79b'
        range: '#d4b34e'
        record: '#ff9c9c'
        string: '#b9a9d7'

        bool: {|| if $in { '#ff9c9c' } else { '#d4b34e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#86b79b' attr: 'b' }
            } else if $in < 6hr {
                '#86b79b'
            } else if $in < 1day {
                '#d4b34e'
            } else if $in < 3day {
                '#b9a9d7'
            } else if $in < 1wk {
                { fg: '#b9a9d7' attr: 'b' }
            } else if $in < 6wk {
                '#ff9c9c'
            } else if $in < 52wk {
                '#ada883'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a0be99'
            } else if $e < 1mb {
                '#ff9c9c'
            } else {{ fg: '#ada883' }}
        }

        shape_and: { fg: '#9298e7' attr: 'b' }
        shape_binary: { fg: '#9298e7' attr: 'b' }
        shape_block: { fg: '#ada883' attr: 'b' }
        shape_bool: '#ff9c9c'
        shape_closure: { fg: '#ff9c9c' attr: 'b' }
        shape_custom: '#b9a9d7'
        shape_datetime: { fg: '#ff9c9c' attr: 'b' }
        shape_directory: '#ff9c9c'
        shape_external: '#ff9c9c'
        shape_external_resolved: '#ff9c9c'
        shape_externalarg: { fg: '#b9a9d7' attr: 'b' }
        shape_filepath: '#ff9c9c'
        shape_flag: { fg: '#ada883' attr: 'b' }
        shape_float: { fg: '#86b79b' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#ff9c9c' attr: 'b' }
        shape_globpattern: { fg: '#ff9c9c' attr: 'b' }
        shape_int: { fg: '#9298e7' attr: 'b' }
        shape_internalcall: { fg: '#ff9c9c' attr: 'b' }
        shape_keyword: { fg: '#9298e7' attr: 'b' }
        shape_list: { fg: '#ff9c9c' attr: 'b' }
        shape_literal: '#ada883'
        shape_match_pattern: '#b9a9d7'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#86b79b'
        shape_operator: '#d4b34e'
        shape_or: { fg: '#9298e7' attr: 'b' }
        shape_pipe: { fg: '#9298e7' attr: 'b' }
        shape_range: { fg: '#d4b34e' attr: 'b' }
        shape_raw_string: { fg: '#a0be99' attr: 'b' }
        shape_record: { fg: '#ff9c9c' attr: 'b' }
        shape_redirection: { fg: '#9298e7' attr: 'b' }
        shape_signature: { fg: '#b9a9d7' attr: 'b' }
        shape_string: '#b9a9d7'
        shape_string_interpolation: { fg: '#ff9c9c' attr: 'b' }
        shape_table: { fg: '#ada883' attr: 'b' }
        shape_vardecl: { fg: '#ada883' attr: 'u' }
        shape_variable: '#9298e7'

        foreground: '#ffb692'
        background: '#44515d'
        cursor: '#ffb692'

        empty: '#ada883'
        header: { fg: '#b9a9d7' attr: 'b' }
        hints: '#ff509c'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b9a9d7' attr: 'b' }
        search_result: { fg: '#86b79b' bg: '#a0be99' }
        separator: '#a0be99'
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