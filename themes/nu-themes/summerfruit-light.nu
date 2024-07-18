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
    # to one line
    | str replace --all "\n" ''
    | print $in
}

# Update the Nushell configuration
export def --env "set color_config" [] {
    $env.config.color_config = (main)
}

# Retrieve the theme settings
export def main [] {
    return {
        separator: '#101010'
        leading_trailing_space_bg: { attr: 'n' }
        header: { fg: '#00c918' attr: 'b' }
        empty: '#3777e6'
        bool: {|| if $in { '#1faaaa' } else { 'light_gray' } }
        int: '#101010'
        filesize: {|e|
            if $e == 0b {
                '#101010'
            } else if $e < 1mb {
                '#1faaaa'
            } else {{ fg: '#3777e6' }}
        }
        duration: '#101010'
        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff0086' attr: 'b' }
            } else if $in < 6hr {
                '#ff0086'
            } else if $in < 1day {
                '#aba800'
            } else if $in < 3day {
                '#00c918'
            } else if $in < 1wk {
                { fg: '#00c918' attr: 'b' }
            } else if $in < 6wk {
                '#1faaaa'
            } else if $in < 52wk {
                '#3777e6'
            } else { 'dark_gray' }
        }
        range: '#101010'
        float: '#101010'
        string: '#101010'
        nothing: '#101010'
        binary: '#101010'
        cellpath: '#101010'
        row_index: { fg: '#00c918' attr: 'b' }
        record: '#101010'
        list: '#101010'
        block: '#101010'
        hints: 'dark_gray'
        search_result: { fg: '#ff0086' bg: '#101010' }

        shape_and: { fg: '#ad00a1' attr: 'b' }
        shape_binary: { fg: '#ad00a1' attr: 'b' }
        shape_block: { fg: '#3777e6' attr: 'b' }
        shape_bool: '#1faaaa'
        shape_custom: '#00c918'
        shape_datetime: { fg: '#1faaaa' attr: 'b' }
        shape_directory: '#1faaaa'
        shape_external: '#1faaaa'
        shape_externalarg: { fg: '#00c918' attr: 'b' }
        shape_filepath: '#1faaaa'
        shape_flag: { fg: '#3777e6' attr: 'b' }
        shape_float: { fg: '#ad00a1' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_globpattern: { fg: '#1faaaa' attr: 'b' }
        shape_int: { fg: '#ad00a1' attr: 'b' }
        shape_internalcall: { fg: '#1faaaa' attr: 'b' }
        shape_list: { fg: '#1faaaa' attr: 'b' }
        shape_literal: '#3777e6'
        shape_match_pattern: '#00c918'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#1faaaa'
        shape_operator: '#aba800'
        shape_or: { fg: '#ad00a1' attr: 'b' }
        shape_pipe: { fg: '#ad00a1' attr: 'b' }
        shape_range: { fg: '#aba800' attr: 'b' }
        shape_record: { fg: '#1faaaa' attr: 'b' }
        shape_redirection: { fg: '#ad00a1' attr: 'b' }
        shape_signature: { fg: '#00c918' attr: 'b' }
        shape_string: '#00c918'
        shape_string_interpolation: { fg: '#1faaaa' attr: 'b' }
        shape_table: { fg: '#3777e6' attr: 'b' }
        shape_variable: '#ad00a1'

        background: '#ffffff'
        foreground: '#101010'
        cursor: '#101010'
    }
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

# Activate the theme when sourced
use activate