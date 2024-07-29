# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bc00ca'
        block: '#0081ff'
        cell-path: '#bbbbbb'
        closure: '#008b8b'
        custom: '#ffffff'
        duration: '#ffcf00'
        float: '#ff0000'
        glob: '#ffffff'
        int: '#bc00ca'
        list: '#008b8b'
        nothing: '#9f0000'
        range: '#ffcf00'
        record: '#008b8b'
        string: '#008b00'

        bool: {|| if $in { '#00cdcd' } else { '#ffcf00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#9f0000' attr: 'b' }
            } else if $in < 6hr {
                '#9f0000'
            } else if $in < 1day {
                '#ffcf00'
            } else if $in < 3day {
                '#008b00'
            } else if $in < 1wk {
                { fg: '#008b00' attr: 'b' }
            } else if $in < 6wk {
                '#008b8b'
            } else if $in < 52wk {
                '#0081ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#008b8b'
            } else {{ fg: '#0081ff' }}
        }

        shape_and: { fg: '#bc00ca' attr: 'b' }
        shape_binary: { fg: '#bc00ca' attr: 'b' }
        shape_block: { fg: '#0081ff' attr: 'b' }
        shape_bool: '#00cdcd'
        shape_closure: { fg: '#008b8b' attr: 'b' }
        shape_custom: '#008b00'
        shape_datetime: { fg: '#008b8b' attr: 'b' }
        shape_directory: '#008b8b'
        shape_external: '#008b8b'
        shape_external_resolved: '#00cdcd'
        shape_externalarg: { fg: '#008b00' attr: 'b' }
        shape_filepath: '#008b8b'
        shape_flag: { fg: '#0081ff' attr: 'b' }
        shape_float: { fg: '#ff0000' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#008b8b' attr: 'b' }
        shape_globpattern: { fg: '#008b8b' attr: 'b' }
        shape_int: { fg: '#bc00ca' attr: 'b' }
        shape_internalcall: { fg: '#008b8b' attr: 'b' }
        shape_keyword: { fg: '#bc00ca' attr: 'b' }
        shape_list: { fg: '#008b8b' attr: 'b' }
        shape_literal: '#0081ff'
        shape_match_pattern: '#008b00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#9f0000'
        shape_operator: '#ffcf00'
        shape_or: { fg: '#bc00ca' attr: 'b' }
        shape_pipe: { fg: '#bc00ca' attr: 'b' }
        shape_range: { fg: '#ffcf00' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#008b8b' attr: 'b' }
        shape_redirection: { fg: '#bc00ca' attr: 'b' }
        shape_signature: { fg: '#008b00' attr: 'b' }
        shape_string: '#008b00'
        shape_string_interpolation: { fg: '#008b8b' attr: 'b' }
        shape_table: { fg: '#0081ff' attr: 'b' }
        shape_vardecl: { fg: '#0081ff' attr: 'u' }
        shape_variable: '#bc00ca'

        foreground: '#00a595'
        background: '#000000'
        cursor: '#bbbbbb'

        empty: '#0081ff'
        header: { fg: '#008b00' attr: 'b' }
        hints: '#545454'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#008b00' attr: 'b' }
        search_result: { fg: '#9f0000' bg: '#bbbbbb' }
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