# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bb00bb'
        block: '#3a9bdb'
        cell-path: '#bbbbbb'
        closure: '#00bbbb'
        custom: '#ffffff'
        duration: '#fecd22'
        float: '#ff0003'
        glob: '#ffffff'
        int: '#bb00bb'
        list: '#00bbbb'
        nothing: '#a60001'
        range: '#fecd22'
        record: '#00bbbb'
        string: '#00bb00'

        bool: {|| if $in { '#55ffff' } else { '#fecd22' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a60001' attr: 'b' }
            } else if $in < 6hr {
                '#a60001'
            } else if $in < 1day {
                '#fecd22'
            } else if $in < 3day {
                '#00bb00'
            } else if $in < 1wk {
                { fg: '#00bb00' attr: 'b' }
            } else if $in < 6wk {
                '#00bbbb'
            } else if $in < 52wk {
                '#3a9bdb'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#00bbbb'
            } else {{ fg: '#3a9bdb' }}
        }

        shape_and: { fg: '#bb00bb' attr: 'b' }
        shape_binary: { fg: '#bb00bb' attr: 'b' }
        shape_block: { fg: '#3a9bdb' attr: 'b' }
        shape_bool: '#55ffff'
        shape_closure: { fg: '#00bbbb' attr: 'b' }
        shape_custom: '#00bb00'
        shape_datetime: { fg: '#00bbbb' attr: 'b' }
        shape_directory: '#00bbbb'
        shape_external: '#00bbbb'
        shape_external_resolved: '#55ffff'
        shape_externalarg: { fg: '#00bb00' attr: 'b' }
        shape_filepath: '#00bbbb'
        shape_flag: { fg: '#3a9bdb' attr: 'b' }
        shape_float: { fg: '#ff0003' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00bbbb' attr: 'b' }
        shape_globpattern: { fg: '#00bbbb' attr: 'b' }
        shape_int: { fg: '#bb00bb' attr: 'b' }
        shape_internalcall: { fg: '#00bbbb' attr: 'b' }
        shape_keyword: { fg: '#bb00bb' attr: 'b' }
        shape_list: { fg: '#00bbbb' attr: 'b' }
        shape_literal: '#3a9bdb'
        shape_match_pattern: '#00bb00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a60001'
        shape_operator: '#fecd22'
        shape_or: { fg: '#bb00bb' attr: 'b' }
        shape_pipe: { fg: '#bb00bb' attr: 'b' }
        shape_range: { fg: '#fecd22' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00bbbb' attr: 'b' }
        shape_redirection: { fg: '#bb00bb' attr: 'b' }
        shape_signature: { fg: '#00bb00' attr: 'b' }
        shape_string: '#00bb00'
        shape_string_interpolation: { fg: '#00bbbb' attr: 'b' }
        shape_table: { fg: '#3a9bdb' attr: 'b' }
        shape_vardecl: { fg: '#3a9bdb' attr: 'u' }
        shape_variable: '#bb00bb'

        foreground: '#cdcdcd'
        background: '#283033'
        cursor: '#cdcdcd'

        empty: '#3a9bdb'
        header: { fg: '#00bb00' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00bb00' attr: 'b' }
        search_result: { fg: '#a60001' bg: '#bbbbbb' }
        separator: '#bbbbbb'
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