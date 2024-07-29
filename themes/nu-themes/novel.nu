# Retrieve the theme settings
export def main [] {
    return {
        binary: '#cc00cc'
        block: '#0000cc'
        cell-path: '#cccccc'
        closure: '#0087cc'
        custom: '#ffffff'
        duration: '#d06b00'
        float: '#cc0000'
        glob: '#ffffff'
        int: '#cc00cc'
        list: '#0087cc'
        nothing: '#cc0000'
        range: '#d06b00'
        record: '#0087cc'
        string: '#009600'

        bool: {|| if $in { '#0087cc' } else { '#d06b00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cc0000' attr: 'b' }
            } else if $in < 6hr {
                '#cc0000'
            } else if $in < 1day {
                '#d06b00'
            } else if $in < 3day {
                '#009600'
            } else if $in < 1wk {
                { fg: '#009600' attr: 'b' }
            } else if $in < 6wk {
                '#0087cc'
            } else if $in < 52wk {
                '#0000cc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cccccc'
            } else if $e < 1mb {
                '#0087cc'
            } else {{ fg: '#0000cc' }}
        }

        shape_and: { fg: '#cc00cc' attr: 'b' }
        shape_binary: { fg: '#cc00cc' attr: 'b' }
        shape_block: { fg: '#0000cc' attr: 'b' }
        shape_bool: '#0087cc'
        shape_closure: { fg: '#0087cc' attr: 'b' }
        shape_custom: '#009600'
        shape_datetime: { fg: '#0087cc' attr: 'b' }
        shape_directory: '#0087cc'
        shape_external: '#0087cc'
        shape_external_resolved: '#0087cc'
        shape_externalarg: { fg: '#009600' attr: 'b' }
        shape_filepath: '#0087cc'
        shape_flag: { fg: '#0000cc' attr: 'b' }
        shape_float: { fg: '#cc0000' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0087cc' attr: 'b' }
        shape_globpattern: { fg: '#0087cc' attr: 'b' }
        shape_int: { fg: '#cc00cc' attr: 'b' }
        shape_internalcall: { fg: '#0087cc' attr: 'b' }
        shape_keyword: { fg: '#cc00cc' attr: 'b' }
        shape_list: { fg: '#0087cc' attr: 'b' }
        shape_literal: '#0000cc'
        shape_match_pattern: '#009600'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cc0000'
        shape_operator: '#d06b00'
        shape_or: { fg: '#cc00cc' attr: 'b' }
        shape_pipe: { fg: '#cc00cc' attr: 'b' }
        shape_range: { fg: '#d06b00' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#0087cc' attr: 'b' }
        shape_redirection: { fg: '#cc00cc' attr: 'b' }
        shape_signature: { fg: '#009600' attr: 'b' }
        shape_string: '#009600'
        shape_string_interpolation: { fg: '#0087cc' attr: 'b' }
        shape_table: { fg: '#0000cc' attr: 'b' }
        shape_vardecl: { fg: '#0000cc' attr: 'u' }
        shape_variable: '#cc00cc'

        foreground: '#3b2322'
        background: '#dfdbc3'
        cursor: '#3b2322'

        empty: '#0000cc'
        header: { fg: '#009600' attr: 'b' }
        hints: '#808080'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#009600' attr: 'b' }
        search_result: { fg: '#cc0000' bg: '#cccccc' }
        separator: '#cccccc'
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