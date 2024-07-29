# Retrieve the theme settings
export def main [] {
    return {
        binary: '#924f79'
        block: '#266b79'
        cell-path: '#514036'
        closure: '#477a5b'
        custom: '#514036'
        duration: '#b4730e'
        float: '#af2528'
        glob: '#514036'
        int: '#924f79'
        list: '#477a5b'
        nothing: '#af2528'
        range: '#b4730e'
        record: '#477a5b'
        string: '#72761e'

        bool: {|| if $in { '#477a5b' } else { '#b4730e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#af2528' attr: 'b' }
            } else if $in < 6hr {
                '#af2528'
            } else if $in < 1day {
                '#b4730e'
            } else if $in < 3day {
                '#72761e'
            } else if $in < 1wk {
                { fg: '#72761e' attr: 'b' }
            } else if $in < 6wk {
                '#477a5b'
            } else if $in < 52wk {
                '#266b79'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#514036'
            } else if $e < 1mb {
                '#477a5b'
            } else {{ fg: '#266b79' }}
        }

        shape_and: { fg: '#924f79' attr: 'b' }
        shape_binary: { fg: '#924f79' attr: 'b' }
        shape_block: { fg: '#266b79' attr: 'b' }
        shape_bool: '#477a5b'
        shape_closure: { fg: '#477a5b' attr: 'b' }
        shape_custom: '#72761e'
        shape_datetime: { fg: '#477a5b' attr: 'b' }
        shape_directory: '#477a5b'
        shape_external: '#477a5b'
        shape_external_resolved: '#477a5b'
        shape_externalarg: { fg: '#72761e' attr: 'b' }
        shape_filepath: '#477a5b'
        shape_flag: { fg: '#266b79' attr: 'b' }
        shape_float: { fg: '#af2528' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#477a5b' attr: 'b' }
        shape_globpattern: { fg: '#477a5b' attr: 'b' }
        shape_int: { fg: '#924f79' attr: 'b' }
        shape_internalcall: { fg: '#477a5b' attr: 'b' }
        shape_keyword: { fg: '#924f79' attr: 'b' }
        shape_list: { fg: '#477a5b' attr: 'b' }
        shape_literal: '#266b79'
        shape_match_pattern: '#72761e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#af2528'
        shape_operator: '#b4730e'
        shape_or: { fg: '#924f79' attr: 'b' }
        shape_pipe: { fg: '#924f79' attr: 'b' }
        shape_range: { fg: '#b4730e' attr: 'b' }
        shape_raw_string: { fg: '#514036' attr: 'b' }
        shape_record: { fg: '#477a5b' attr: 'b' }
        shape_redirection: { fg: '#924f79' attr: 'b' }
        shape_signature: { fg: '#72761e' attr: 'b' }
        shape_string: '#72761e'
        shape_string_interpolation: { fg: '#477a5b' attr: 'b' }
        shape_table: { fg: '#266b79' attr: 'b' }
        shape_vardecl: { fg: '#266b79' attr: 'u' }
        shape_variable: '#924f79'

        foreground: '#514036'
        background: '#f2e5bc'
        cursor: '#514036'

        empty: '#266b79'
        header: { fg: '#72761e' attr: 'b' }
        hints: '#f2e5bc'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#72761e' attr: 'b' }
        search_result: { fg: '#af2528' bg: '#514036' }
        separator: '#514036'
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