# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e02c6d'
        block: '#2c78bf'
        cell-path: '#baa67f'
        closure: '#0aaeb3'
        custom: '#fce8c3'
        duration: '#fbb829'
        float: '#f75341'
        glob: '#fce8c3'
        int: '#e02c6d'
        list: '#0aaeb3'
        nothing: '#ef2f27'
        range: '#fbb829'
        record: '#0aaeb3'
        string: '#519f50'

        bool: {|| if $in { '#2be4d0' } else { '#fbb829' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ef2f27' attr: 'b' }
            } else if $in < 6hr {
                '#ef2f27'
            } else if $in < 1day {
                '#fbb829'
            } else if $in < 3day {
                '#519f50'
            } else if $in < 1wk {
                { fg: '#519f50' attr: 'b' }
            } else if $in < 6wk {
                '#0aaeb3'
            } else if $in < 52wk {
                '#2c78bf'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#baa67f'
            } else if $e < 1mb {
                '#0aaeb3'
            } else {{ fg: '#2c78bf' }}
        }

        shape_and: { fg: '#e02c6d' attr: 'b' }
        shape_binary: { fg: '#e02c6d' attr: 'b' }
        shape_block: { fg: '#2c78bf' attr: 'b' }
        shape_bool: '#2be4d0'
        shape_closure: { fg: '#0aaeb3' attr: 'b' }
        shape_custom: '#519f50'
        shape_datetime: { fg: '#0aaeb3' attr: 'b' }
        shape_directory: '#0aaeb3'
        shape_external: '#0aaeb3'
        shape_external_resolved: '#2be4d0'
        shape_externalarg: { fg: '#519f50' attr: 'b' }
        shape_filepath: '#0aaeb3'
        shape_flag: { fg: '#2c78bf' attr: 'b' }
        shape_float: { fg: '#f75341' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0aaeb3' attr: 'b' }
        shape_globpattern: { fg: '#0aaeb3' attr: 'b' }
        shape_int: { fg: '#e02c6d' attr: 'b' }
        shape_internalcall: { fg: '#0aaeb3' attr: 'b' }
        shape_keyword: { fg: '#e02c6d' attr: 'b' }
        shape_list: { fg: '#0aaeb3' attr: 'b' }
        shape_literal: '#2c78bf'
        shape_match_pattern: '#519f50'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ef2f27'
        shape_operator: '#fbb829'
        shape_or: { fg: '#e02c6d' attr: 'b' }
        shape_pipe: { fg: '#e02c6d' attr: 'b' }
        shape_range: { fg: '#fbb829' attr: 'b' }
        shape_raw_string: { fg: '#fce8c3' attr: 'b' }
        shape_record: { fg: '#0aaeb3' attr: 'b' }
        shape_redirection: { fg: '#e02c6d' attr: 'b' }
        shape_signature: { fg: '#519f50' attr: 'b' }
        shape_string: '#519f50'
        shape_string_interpolation: { fg: '#0aaeb3' attr: 'b' }
        shape_table: { fg: '#2c78bf' attr: 'b' }
        shape_vardecl: { fg: '#2c78bf' attr: 'u' }
        shape_variable: '#e02c6d'

        foreground: '#fce8c3'
        background: '#1c1b19'
        cursor: '#fbb829'

        empty: '#2c78bf'
        header: { fg: '#519f50' attr: 'b' }
        hints: '#918175'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#519f50' attr: 'b' }
        search_result: { fg: '#ef2f27' bg: '#baa67f' }
        separator: '#baa67f'
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