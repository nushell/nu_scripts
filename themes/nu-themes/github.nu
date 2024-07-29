# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a71d5d'
        block: '#795da3'
        cell-path: '#333333'
        closure: '#183691'
        custom: '#ffffff'
        duration: '#795da3'
        float: '#ed6a43'
        glob: '#ffffff'
        int: '#a71d5d'
        list: '#183691'
        nothing: '#ed6a43'
        range: '#795da3'
        record: '#183691'
        string: '#183691'

        bool: {|| if $in { '#183691' } else { '#795da3' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ed6a43' attr: 'b' }
            } else if $in < 6hr {
                '#ed6a43'
            } else if $in < 1day {
                '#795da3'
            } else if $in < 3day {
                '#183691'
            } else if $in < 1wk {
                { fg: '#183691' attr: 'b' }
            } else if $in < 6wk {
                '#183691'
            } else if $in < 52wk {
                '#795da3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#333333'
            } else if $e < 1mb {
                '#183691'
            } else {{ fg: '#795da3' }}
        }

        shape_and: { fg: '#a71d5d' attr: 'b' }
        shape_binary: { fg: '#a71d5d' attr: 'b' }
        shape_block: { fg: '#795da3' attr: 'b' }
        shape_bool: '#183691'
        shape_closure: { fg: '#183691' attr: 'b' }
        shape_custom: '#183691'
        shape_datetime: { fg: '#183691' attr: 'b' }
        shape_directory: '#183691'
        shape_external: '#183691'
        shape_external_resolved: '#183691'
        shape_externalarg: { fg: '#183691' attr: 'b' }
        shape_filepath: '#183691'
        shape_flag: { fg: '#795da3' attr: 'b' }
        shape_float: { fg: '#ed6a43' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#183691' attr: 'b' }
        shape_globpattern: { fg: '#183691' attr: 'b' }
        shape_int: { fg: '#a71d5d' attr: 'b' }
        shape_internalcall: { fg: '#183691' attr: 'b' }
        shape_keyword: { fg: '#a71d5d' attr: 'b' }
        shape_list: { fg: '#183691' attr: 'b' }
        shape_literal: '#795da3'
        shape_match_pattern: '#183691'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ed6a43'
        shape_operator: '#795da3'
        shape_or: { fg: '#a71d5d' attr: 'b' }
        shape_pipe: { fg: '#a71d5d' attr: 'b' }
        shape_range: { fg: '#795da3' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#183691' attr: 'b' }
        shape_redirection: { fg: '#a71d5d' attr: 'b' }
        shape_signature: { fg: '#183691' attr: 'b' }
        shape_string: '#183691'
        shape_string_interpolation: { fg: '#183691' attr: 'b' }
        shape_table: { fg: '#795da3' attr: 'b' }
        shape_vardecl: { fg: '#795da3' attr: 'u' }
        shape_variable: '#a71d5d'

        foreground: '#333333'
        background: '#ffffff'
        cursor: '#333333'

        empty: '#795da3'
        header: { fg: '#183691' attr: 'b' }
        hints: '#969896'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#183691' attr: 'b' }
        search_result: { fg: '#ed6a43' bg: '#333333' }
        separator: '#333333'
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