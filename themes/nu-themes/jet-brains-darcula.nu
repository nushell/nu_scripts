# Retrieve the theme settings
export def main [] {
    return {
        binary: '#fa54ff'
        block: '#4581eb'
        cell-path: '#adadad'
        closure: '#33c2c1'
        custom: '#eeeeee'
        duration: '#c2c300'
        float: '#fb7172'
        glob: '#eeeeee'
        int: '#fa54ff'
        list: '#33c2c1'
        nothing: '#fa5355'
        range: '#c2c300'
        record: '#33c2c1'
        string: '#126e00'

        bool: {|| if $in { '#60d3d1' } else { '#c2c300' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fa5355' attr: 'b' }
            } else if $in < 6hr {
                '#fa5355'
            } else if $in < 1day {
                '#c2c300'
            } else if $in < 3day {
                '#126e00'
            } else if $in < 1wk {
                { fg: '#126e00' attr: 'b' }
            } else if $in < 6wk {
                '#33c2c1'
            } else if $in < 52wk {
                '#4581eb'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#adadad'
            } else if $e < 1mb {
                '#33c2c1'
            } else {{ fg: '#4581eb' }}
        }

        shape_and: { fg: '#fa54ff' attr: 'b' }
        shape_binary: { fg: '#fa54ff' attr: 'b' }
        shape_block: { fg: '#4581eb' attr: 'b' }
        shape_bool: '#60d3d1'
        shape_closure: { fg: '#33c2c1' attr: 'b' }
        shape_custom: '#126e00'
        shape_datetime: { fg: '#33c2c1' attr: 'b' }
        shape_directory: '#33c2c1'
        shape_external: '#33c2c1'
        shape_external_resolved: '#60d3d1'
        shape_externalarg: { fg: '#126e00' attr: 'b' }
        shape_filepath: '#33c2c1'
        shape_flag: { fg: '#4581eb' attr: 'b' }
        shape_float: { fg: '#fb7172' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#33c2c1' attr: 'b' }
        shape_globpattern: { fg: '#33c2c1' attr: 'b' }
        shape_int: { fg: '#fa54ff' attr: 'b' }
        shape_internalcall: { fg: '#33c2c1' attr: 'b' }
        shape_keyword: { fg: '#fa54ff' attr: 'b' }
        shape_list: { fg: '#33c2c1' attr: 'b' }
        shape_literal: '#4581eb'
        shape_match_pattern: '#126e00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fa5355'
        shape_operator: '#c2c300'
        shape_or: { fg: '#fa54ff' attr: 'b' }
        shape_pipe: { fg: '#fa54ff' attr: 'b' }
        shape_range: { fg: '#c2c300' attr: 'b' }
        shape_raw_string: { fg: '#eeeeee' attr: 'b' }
        shape_record: { fg: '#33c2c1' attr: 'b' }
        shape_redirection: { fg: '#fa54ff' attr: 'b' }
        shape_signature: { fg: '#126e00' attr: 'b' }
        shape_string: '#126e00'
        shape_string_interpolation: { fg: '#33c2c1' attr: 'b' }
        shape_table: { fg: '#4581eb' attr: 'b' }
        shape_vardecl: { fg: '#4581eb' attr: 'u' }
        shape_variable: '#fa54ff'

        foreground: '#adadad'
        background: '#202020'
        cursor: '#ffffff'

        empty: '#4581eb'
        header: { fg: '#126e00' attr: 'b' }
        hints: '#545454'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#126e00' attr: 'b' }
        search_result: { fg: '#fa5355' bg: '#adadad' }
        separator: '#adadad'
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