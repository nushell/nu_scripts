# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ea5ce2'
        block: '#03aeff'
        cell-path: '#c1c3c4'
        closure: '#42fff9'
        custom: '#dddfe0'
        duration: '#c9d364'
        float: '#b53b50'
        glob: '#dddfe0'
        int: '#ea5ce2'
        list: '#42fff9'
        nothing: '#b53b50'
        range: '#c9d364'
        record: '#42fff9'
        string: '#06ea61'

        bool: {|| if $in { '#42fff9' } else { '#c9d364' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b53b50' attr: 'b' }
            } else if $in < 6hr {
                '#b53b50'
            } else if $in < 1day {
                '#c9d364'
            } else if $in < 3day {
                '#06ea61'
            } else if $in < 1wk {
                { fg: '#06ea61' attr: 'b' }
            } else if $in < 6wk {
                '#42fff9'
            } else if $in < 52wk {
                '#03aeff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c1c3c4'
            } else if $e < 1mb {
                '#42fff9'
            } else {{ fg: '#03aeff' }}
        }

        shape_and: { fg: '#ea5ce2' attr: 'b' }
        shape_binary: { fg: '#ea5ce2' attr: 'b' }
        shape_block: { fg: '#03aeff' attr: 'b' }
        shape_bool: '#42fff9'
        shape_closure: { fg: '#42fff9' attr: 'b' }
        shape_custom: '#06ea61'
        shape_datetime: { fg: '#42fff9' attr: 'b' }
        shape_directory: '#42fff9'
        shape_external: '#42fff9'
        shape_external_resolved: '#42fff9'
        shape_externalarg: { fg: '#06ea61' attr: 'b' }
        shape_filepath: '#42fff9'
        shape_flag: { fg: '#03aeff' attr: 'b' }
        shape_float: { fg: '#b53b50' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#42fff9' attr: 'b' }
        shape_globpattern: { fg: '#42fff9' attr: 'b' }
        shape_int: { fg: '#ea5ce2' attr: 'b' }
        shape_internalcall: { fg: '#42fff9' attr: 'b' }
        shape_keyword: { fg: '#ea5ce2' attr: 'b' }
        shape_list: { fg: '#42fff9' attr: 'b' }
        shape_literal: '#03aeff'
        shape_match_pattern: '#06ea61'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b53b50'
        shape_operator: '#c9d364'
        shape_or: { fg: '#ea5ce2' attr: 'b' }
        shape_pipe: { fg: '#ea5ce2' attr: 'b' }
        shape_range: { fg: '#c9d364' attr: 'b' }
        shape_raw_string: { fg: '#dddfe0' attr: 'b' }
        shape_record: { fg: '#42fff9' attr: 'b' }
        shape_redirection: { fg: '#ea5ce2' attr: 'b' }
        shape_signature: { fg: '#06ea61' attr: 'b' }
        shape_string: '#06ea61'
        shape_string_interpolation: { fg: '#42fff9' attr: 'b' }
        shape_table: { fg: '#03aeff' attr: 'b' }
        shape_vardecl: { fg: '#03aeff' attr: 'u' }
        shape_variable: '#ea5ce2'

        foreground: '#c1c3c4'
        background: '#050608'
        cursor: '#c1c3c4'

        empty: '#03aeff'
        header: { fg: '#06ea61' attr: 'b' }
        hints: '#474849'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#06ea61' attr: 'b' }
        search_result: { fg: '#b53b50' bg: '#c1c3c4' }
        separator: '#c1c3c4'
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