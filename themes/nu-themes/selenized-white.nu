# Retrieve the theme settings
export def main [] {
    return {
        separator: '#878787'
        leading_trailing_space_bg: { attr: 'n' }
        header: { fg: '#1d9700' attr: 'b' }
        empty: '#0064e4'
        bool: {|| if $in { '#009a8a' } else { 'light_gray' } }
        int: '#878787'
        filesize: {|e|
            if $e == 0b {
                '#878787'
            } else if $e < 1mb {
                '#00ad9c'
            } else {{ fg: '#0064e4' }}
        }
        duration: '#878787'
        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d6000c' attr: 'b' }
            } else if $in < 6hr {
                '#d6000c'
            } else if $in < 1day {
                '#c49700'
            } else if $in < 3day {
                '#1d9700'
            } else if $in < 1wk {
                { fg: '#1d9700' attr: 'b' }
            } else if $in < 6wk {
                '#00ad9c'
            } else if $in < 52wk {
                '#0064e4'
            } else { 'dark_gray' }
        }
        range: '#878787'
        float: '#878787'
        string: '#878787'
        nothing: '#878787'
        binary: '#878787'
        cell-path: '#878787'
        row_index: { fg: '#1d9700' attr: 'b' }
        record: '#878787'
        list: '#878787'
        block: '#878787'
        hints: 'dark_gray'
        search_result: { fg: '#d6000c' bg: '#878787' }

        shape_and: { fg: '#dd0f9d' attr: 'b' }
        shape_binary: { fg: '#dd0f9d' attr: 'b' }
        shape_block: { fg: '#0064e4' attr: 'b' }
        shape_bool: '#009a8a'
        shape_custom: '#1d9700'
        shape_datetime: { fg: '#00ad9c' attr: 'b' }
        shape_directory: '#00ad9c'
        shape_external: '#00ad9c'
        shape_externalarg: { fg: '#1d9700' attr: 'b' }
        shape_filepath: '#00ad9c'
        shape_flag: { fg: '#0064e4' attr: 'b' }
        shape_float: { fg: '#dd0f9d' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_globpattern: { fg: '#00ad9c' attr: 'b' }
        shape_int: { fg: '#dd0f9d' attr: 'b' }
        shape_internalcall: { fg: '#00ad9c' attr: 'b' }
        shape_list: { fg: '#00ad9c' attr: 'b' }
        shape_literal: '#0064e4'
        shape_match_pattern: '#1d9700'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#009a8a'
        shape_operator: '#c49700'
        shape_or: { fg: '#dd0f9d' attr: 'b' }
        shape_pipe: { fg: '#dd0f9d' attr: 'b' }
        shape_range: { fg: '#c49700' attr: 'b' }
        shape_record: { fg: '#00ad9c' attr: 'b' }
        shape_redirection: { fg: '#dd0f9d' attr: 'b' }
        shape_signature: { fg: '#1d9700' attr: 'b' }
        shape_string: '#1d9700'
        shape_string_interpolation: { fg: '#00ad9c' attr: 'b' }
        shape_table: { fg: '#0064e4' attr: 'b' }
        shape_variable: '#dd0f9d'

        background: '#ffffff'
        foreground: '#474747'
        cursor: '#474747'
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
    # to one line
    | str replace --all "\n" ''
    | print $in
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

# Activate the theme when sourced
use activate