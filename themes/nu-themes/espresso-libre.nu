# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c5656b'
        block: '#0066ff'
        cell-path: '#d3d7cf'
        closure: '#06989a'
        custom: '#eeeeec'
        duration: '#f0e53a'
        float: '#ef2929'
        glob: '#eeeeec'
        int: '#c5656b'
        list: '#06989a'
        nothing: '#cc0000'
        range: '#f0e53a'
        record: '#06989a'
        string: '#1a921c'

        bool: {|| if $in { '#34e2e2' } else { '#f0e53a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cc0000' attr: 'b' }
            } else if $in < 6hr {
                '#cc0000'
            } else if $in < 1day {
                '#f0e53a'
            } else if $in < 3day {
                '#1a921c'
            } else if $in < 1wk {
                { fg: '#1a921c' attr: 'b' }
            } else if $in < 6wk {
                '#06989a'
            } else if $in < 52wk {
                '#0066ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d3d7cf'
            } else if $e < 1mb {
                '#06989a'
            } else {{ fg: '#0066ff' }}
        }

        shape_and: { fg: '#c5656b' attr: 'b' }
        shape_binary: { fg: '#c5656b' attr: 'b' }
        shape_block: { fg: '#0066ff' attr: 'b' }
        shape_bool: '#34e2e2'
        shape_closure: { fg: '#06989a' attr: 'b' }
        shape_custom: '#1a921c'
        shape_datetime: { fg: '#06989a' attr: 'b' }
        shape_directory: '#06989a'
        shape_external: '#06989a'
        shape_external_resolved: '#34e2e2'
        shape_externalarg: { fg: '#1a921c' attr: 'b' }
        shape_filepath: '#06989a'
        shape_flag: { fg: '#0066ff' attr: 'b' }
        shape_float: { fg: '#ef2929' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#06989a' attr: 'b' }
        shape_globpattern: { fg: '#06989a' attr: 'b' }
        shape_int: { fg: '#c5656b' attr: 'b' }
        shape_internalcall: { fg: '#06989a' attr: 'b' }
        shape_keyword: { fg: '#c5656b' attr: 'b' }
        shape_list: { fg: '#06989a' attr: 'b' }
        shape_literal: '#0066ff'
        shape_match_pattern: '#1a921c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cc0000'
        shape_operator: '#f0e53a'
        shape_or: { fg: '#c5656b' attr: 'b' }
        shape_pipe: { fg: '#c5656b' attr: 'b' }
        shape_range: { fg: '#f0e53a' attr: 'b' }
        shape_raw_string: { fg: '#eeeeec' attr: 'b' }
        shape_record: { fg: '#06989a' attr: 'b' }
        shape_redirection: { fg: '#c5656b' attr: 'b' }
        shape_signature: { fg: '#1a921c' attr: 'b' }
        shape_string: '#1a921c'
        shape_string_interpolation: { fg: '#06989a' attr: 'b' }
        shape_table: { fg: '#0066ff' attr: 'b' }
        shape_vardecl: { fg: '#0066ff' attr: 'u' }
        shape_variable: '#c5656b'

        foreground: '#b8a898'
        background: '#2a211c'
        cursor: '#b8a898'

        empty: '#0066ff'
        header: { fg: '#1a921c' attr: 'b' }
        hints: '#555753'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#1a921c' attr: 'b' }
        search_result: { fg: '#cc0000' bg: '#d3d7cf' }
        separator: '#d3d7cf'
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