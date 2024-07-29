# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9854f1'
        block: '#2e7de9'
        cell-path: '#6172b0'
        closure: '#007197'
        custom: '#3760bf'
        duration: '#8c6c3e'
        float: '#f52a65'
        glob: '#3760bf'
        int: '#9854f1'
        list: '#007197'
        nothing: '#f52a65'
        range: '#8c6c3e'
        record: '#007197'
        string: '#587539'

        bool: {|| if $in { '#007197' } else { '#8c6c3e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f52a65' attr: 'b' }
            } else if $in < 6hr {
                '#f52a65'
            } else if $in < 1day {
                '#8c6c3e'
            } else if $in < 3day {
                '#587539'
            } else if $in < 1wk {
                { fg: '#587539' attr: 'b' }
            } else if $in < 6wk {
                '#007197'
            } else if $in < 52wk {
                '#2e7de9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#6172b0'
            } else if $e < 1mb {
                '#007197'
            } else {{ fg: '#2e7de9' }}
        }

        shape_and: { fg: '#9854f1' attr: 'b' }
        shape_binary: { fg: '#9854f1' attr: 'b' }
        shape_block: { fg: '#2e7de9' attr: 'b' }
        shape_bool: '#007197'
        shape_closure: { fg: '#007197' attr: 'b' }
        shape_custom: '#587539'
        shape_datetime: { fg: '#007197' attr: 'b' }
        shape_directory: '#007197'
        shape_external: '#007197'
        shape_external_resolved: '#007197'
        shape_externalarg: { fg: '#587539' attr: 'b' }
        shape_filepath: '#007197'
        shape_flag: { fg: '#2e7de9' attr: 'b' }
        shape_float: { fg: '#f52a65' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#007197' attr: 'b' }
        shape_globpattern: { fg: '#007197' attr: 'b' }
        shape_int: { fg: '#9854f1' attr: 'b' }
        shape_internalcall: { fg: '#007197' attr: 'b' }
        shape_keyword: { fg: '#9854f1' attr: 'b' }
        shape_list: { fg: '#007197' attr: 'b' }
        shape_literal: '#2e7de9'
        shape_match_pattern: '#587539'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f52a65'
        shape_operator: '#8c6c3e'
        shape_or: { fg: '#9854f1' attr: 'b' }
        shape_pipe: { fg: '#9854f1' attr: 'b' }
        shape_range: { fg: '#8c6c3e' attr: 'b' }
        shape_raw_string: { fg: '#3760bf' attr: 'b' }
        shape_record: { fg: '#007197' attr: 'b' }
        shape_redirection: { fg: '#9854f1' attr: 'b' }
        shape_signature: { fg: '#587539' attr: 'b' }
        shape_string: '#587539'
        shape_string_interpolation: { fg: '#007197' attr: 'b' }
        shape_table: { fg: '#2e7de9' attr: 'b' }
        shape_vardecl: { fg: '#2e7de9' attr: 'u' }
        shape_variable: '#9854f1'

        foreground: '#3760bf'
        background: '#e1e2e7'
        cursor: '#3760bf'

        empty: '#2e7de9'
        header: { fg: '#587539' attr: 'b' }
        hints: '#a1a6c5'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#587539' attr: 'b' }
        search_result: { fg: '#f52a65' bg: '#6172b0' }
        separator: '#6172b0'
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