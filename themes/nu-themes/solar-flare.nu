# Retrieve the theme settings
export def main [] {
    return {
        binary: '#A363D5'
        block: '#33B5E1'
        cell-path: '#A6AFB8'
        closure: '#52CBB0'
        custom: '#F5F7FA'
        duration: '#E4B51C'
        float: '#EF5253'
        glob: '#F5F7FA'
        int: '#A363D5'
        list: '#52CBB0'
        nothing: '#EF5253'
        range: '#E4B51C'
        record: '#52CBB0'
        string: '#7CC844'

        bool: {|| if $in { '#52CBB0' } else { '#E4B51C' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#EF5253' attr: 'b' }
            } else if $in < 6hr {
                '#EF5253'
            } else if $in < 1day {
                '#E4B51C'
            } else if $in < 3day {
                '#7CC844'
            } else if $in < 1wk {
                { fg: '#7CC844' attr: 'b' }
            } else if $in < 6wk {
                '#52CBB0'
            } else if $in < 52wk {
                '#33B5E1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#A6AFB8'
            } else if $e < 1mb {
                '#52CBB0'
            } else {{ fg: '#33B5E1' }}
        }

        shape_and: { fg: '#A363D5' attr: 'b' }
        shape_binary: { fg: '#A363D5' attr: 'b' }
        shape_block: { fg: '#33B5E1' attr: 'b' }
        shape_bool: '#52CBB0'
        shape_closure: { fg: '#52CBB0' attr: 'b' }
        shape_custom: '#7CC844'
        shape_datetime: { fg: '#52CBB0' attr: 'b' }
        shape_directory: '#52CBB0'
        shape_external: '#52CBB0'
        shape_external_resolved: '#52CBB0'
        shape_externalarg: { fg: '#7CC844' attr: 'b' }
        shape_filepath: '#52CBB0'
        shape_flag: { fg: '#33B5E1' attr: 'b' }
        shape_float: { fg: '#EF5253' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#52CBB0' attr: 'b' }
        shape_globpattern: { fg: '#52CBB0' attr: 'b' }
        shape_int: { fg: '#A363D5' attr: 'b' }
        shape_internalcall: { fg: '#52CBB0' attr: 'b' }
        shape_keyword: { fg: '#A363D5' attr: 'b' }
        shape_list: { fg: '#52CBB0' attr: 'b' }
        shape_literal: '#33B5E1'
        shape_match_pattern: '#7CC844'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#EF5253'
        shape_operator: '#E4B51C'
        shape_or: { fg: '#A363D5' attr: 'b' }
        shape_pipe: { fg: '#A363D5' attr: 'b' }
        shape_range: { fg: '#E4B51C' attr: 'b' }
        shape_raw_string: { fg: '#F5F7FA' attr: 'b' }
        shape_record: { fg: '#52CBB0' attr: 'b' }
        shape_redirection: { fg: '#A363D5' attr: 'b' }
        shape_signature: { fg: '#7CC844' attr: 'b' }
        shape_string: '#7CC844'
        shape_string_interpolation: { fg: '#52CBB0' attr: 'b' }
        shape_table: { fg: '#33B5E1' attr: 'b' }
        shape_vardecl: { fg: '#33B5E1' attr: 'u' }
        shape_variable: '#A363D5'

        foreground: '#A6AFB8'
        background: '#18262F'
        cursor: '#A6AFB8'

        empty: '#33B5E1'
        header: { fg: '#7CC844' attr: 'b' }
        hints: '#667581'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7CC844' attr: 'b' }
        search_result: { fg: '#EF5253' bg: '#A6AFB8' }
        separator: '#A6AFB8'
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