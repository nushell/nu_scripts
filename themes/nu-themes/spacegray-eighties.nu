# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bf83c1'
        block: '#5486c0'
        cell-path: '#efece7'
        closure: '#57c2c1'
        custom: '#ffffff'
        duration: '#fec254'
        float: '#ff6973'
        glob: '#ffffff'
        int: '#bf83c1'
        list: '#57c2c1'
        nothing: '#ec5f67'
        range: '#fec254'
        record: '#57c2c1'
        string: '#81a764'

        bool: {|| if $in { '#83e9e4' } else { '#fec254' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ec5f67' attr: 'b' }
            } else if $in < 6hr {
                '#ec5f67'
            } else if $in < 1day {
                '#fec254'
            } else if $in < 3day {
                '#81a764'
            } else if $in < 1wk {
                { fg: '#81a764' attr: 'b' }
            } else if $in < 6wk {
                '#57c2c1'
            } else if $in < 52wk {
                '#5486c0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#efece7'
            } else if $e < 1mb {
                '#57c2c1'
            } else {{ fg: '#5486c0' }}
        }

        shape_and: { fg: '#bf83c1' attr: 'b' }
        shape_binary: { fg: '#bf83c1' attr: 'b' }
        shape_block: { fg: '#5486c0' attr: 'b' }
        shape_bool: '#83e9e4'
        shape_closure: { fg: '#57c2c1' attr: 'b' }
        shape_custom: '#81a764'
        shape_datetime: { fg: '#57c2c1' attr: 'b' }
        shape_directory: '#57c2c1'
        shape_external: '#57c2c1'
        shape_external_resolved: '#83e9e4'
        shape_externalarg: { fg: '#81a764' attr: 'b' }
        shape_filepath: '#57c2c1'
        shape_flag: { fg: '#5486c0' attr: 'b' }
        shape_float: { fg: '#ff6973' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#57c2c1' attr: 'b' }
        shape_globpattern: { fg: '#57c2c1' attr: 'b' }
        shape_int: { fg: '#bf83c1' attr: 'b' }
        shape_internalcall: { fg: '#57c2c1' attr: 'b' }
        shape_keyword: { fg: '#bf83c1' attr: 'b' }
        shape_list: { fg: '#57c2c1' attr: 'b' }
        shape_literal: '#5486c0'
        shape_match_pattern: '#81a764'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ec5f67'
        shape_operator: '#fec254'
        shape_or: { fg: '#bf83c1' attr: 'b' }
        shape_pipe: { fg: '#bf83c1' attr: 'b' }
        shape_range: { fg: '#fec254' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#57c2c1' attr: 'b' }
        shape_redirection: { fg: '#bf83c1' attr: 'b' }
        shape_signature: { fg: '#81a764' attr: 'b' }
        shape_string: '#81a764'
        shape_string_interpolation: { fg: '#57c2c1' attr: 'b' }
        shape_table: { fg: '#5486c0' attr: 'b' }
        shape_vardecl: { fg: '#5486c0' attr: 'u' }
        shape_variable: '#bf83c1'

        foreground: '#bdbaae'
        background: '#222222'
        cursor: '#bdbaae'

        empty: '#5486c0'
        header: { fg: '#81a764' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#81a764' attr: 'b' }
        search_result: { fg: '#ec5f67' bg: '#efece7' }
        separator: '#efece7'
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