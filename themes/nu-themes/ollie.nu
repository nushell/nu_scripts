# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b08528'
        block: '#2d57ac'
        cell-path: '#8a8eac'
        closure: '#1fa6ac'
        custom: '#5b6ea7'
        duration: '#ac4300'
        float: '#ff3d48'
        glob: '#5b6ea7'
        int: '#b08528'
        list: '#1fa6ac'
        nothing: '#ac2e31'
        range: '#ac4300'
        record: '#1fa6ac'
        string: '#31ac61'

        bool: {|| if $in { '#1ffaff' } else { '#ac4300' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ac2e31' attr: 'b' }
            } else if $in < 6hr {
                '#ac2e31'
            } else if $in < 1day {
                '#ac4300'
            } else if $in < 3day {
                '#31ac61'
            } else if $in < 1wk {
                { fg: '#31ac61' attr: 'b' }
            } else if $in < 6wk {
                '#1fa6ac'
            } else if $in < 52wk {
                '#2d57ac'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#8a8eac'
            } else if $e < 1mb {
                '#1fa6ac'
            } else {{ fg: '#2d57ac' }}
        }

        shape_and: { fg: '#b08528' attr: 'b' }
        shape_binary: { fg: '#b08528' attr: 'b' }
        shape_block: { fg: '#2d57ac' attr: 'b' }
        shape_bool: '#1ffaff'
        shape_closure: { fg: '#1fa6ac' attr: 'b' }
        shape_custom: '#31ac61'
        shape_datetime: { fg: '#1fa6ac' attr: 'b' }
        shape_directory: '#1fa6ac'
        shape_external: '#1fa6ac'
        shape_external_resolved: '#1ffaff'
        shape_externalarg: { fg: '#31ac61' attr: 'b' }
        shape_filepath: '#1fa6ac'
        shape_flag: { fg: '#2d57ac' attr: 'b' }
        shape_float: { fg: '#ff3d48' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1fa6ac' attr: 'b' }
        shape_globpattern: { fg: '#1fa6ac' attr: 'b' }
        shape_int: { fg: '#b08528' attr: 'b' }
        shape_internalcall: { fg: '#1fa6ac' attr: 'b' }
        shape_keyword: { fg: '#b08528' attr: 'b' }
        shape_list: { fg: '#1fa6ac' attr: 'b' }
        shape_literal: '#2d57ac'
        shape_match_pattern: '#31ac61'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ac2e31'
        shape_operator: '#ac4300'
        shape_or: { fg: '#b08528' attr: 'b' }
        shape_pipe: { fg: '#b08528' attr: 'b' }
        shape_range: { fg: '#ac4300' attr: 'b' }
        shape_raw_string: { fg: '#5b6ea7' attr: 'b' }
        shape_record: { fg: '#1fa6ac' attr: 'b' }
        shape_redirection: { fg: '#b08528' attr: 'b' }
        shape_signature: { fg: '#31ac61' attr: 'b' }
        shape_string: '#31ac61'
        shape_string_interpolation: { fg: '#1fa6ac' attr: 'b' }
        shape_table: { fg: '#2d57ac' attr: 'b' }
        shape_vardecl: { fg: '#2d57ac' attr: 'u' }
        shape_variable: '#b08528'

        foreground: '#8a8dae'
        background: '#222125'
        cursor: '#8a8dae'

        empty: '#2d57ac'
        header: { fg: '#31ac61' attr: 'b' }
        hints: '#5b3725'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#31ac61' attr: 'b' }
        search_result: { fg: '#ac2e31' bg: '#8a8eac' }
        separator: '#8a8eac'
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