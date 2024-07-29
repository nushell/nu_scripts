# Retrieve the theme settings
export def main [] {
    return {
        binary: '#cd7b7e'
        block: '#798fd7'
        cell-path: '#909294'
        closure: '#4fa090'
        custom: '#8da3b8'
        duration: '#959721'
        float: '#db7824'
        glob: '#8da3b8'
        int: '#cd7b7e'
        list: '#4fa090'
        nothing: '#eb6a58'
        range: '#959721'
        record: '#4fa090'
        string: '#49a61d'

        bool: {|| if $in { '#1ba2a0' } else { '#959721' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#eb6a58' attr: 'b' }
            } else if $in < 6hr {
                '#eb6a58'
            } else if $in < 1day {
                '#959721'
            } else if $in < 3day {
                '#49a61d'
            } else if $in < 1wk {
                { fg: '#49a61d' attr: 'b' }
            } else if $in < 6wk {
                '#4fa090'
            } else if $in < 52wk {
                '#798fd7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#909294'
            } else if $e < 1mb {
                '#4fa090'
            } else {{ fg: '#798fd7' }}
        }

        shape_and: { fg: '#cd7b7e' attr: 'b' }
        shape_binary: { fg: '#cd7b7e' attr: 'b' }
        shape_block: { fg: '#798fd7' attr: 'b' }
        shape_bool: '#1ba2a0'
        shape_closure: { fg: '#4fa090' attr: 'b' }
        shape_custom: '#49a61d'
        shape_datetime: { fg: '#4fa090' attr: 'b' }
        shape_directory: '#4fa090'
        shape_external: '#4fa090'
        shape_external_resolved: '#1ba2a0'
        shape_externalarg: { fg: '#49a61d' attr: 'b' }
        shape_filepath: '#4fa090'
        shape_flag: { fg: '#798fd7' attr: 'b' }
        shape_float: { fg: '#db7824' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#4fa090' attr: 'b' }
        shape_globpattern: { fg: '#4fa090' attr: 'b' }
        shape_int: { fg: '#cd7b7e' attr: 'b' }
        shape_internalcall: { fg: '#4fa090' attr: 'b' }
        shape_keyword: { fg: '#cd7b7e' attr: 'b' }
        shape_list: { fg: '#4fa090' attr: 'b' }
        shape_literal: '#798fd7'
        shape_match_pattern: '#49a61d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#eb6a58'
        shape_operator: '#959721'
        shape_or: { fg: '#cd7b7e' attr: 'b' }
        shape_pipe: { fg: '#cd7b7e' attr: 'b' }
        shape_range: { fg: '#959721' attr: 'b' }
        shape_raw_string: { fg: '#8da3b8' attr: 'b' }
        shape_record: { fg: '#4fa090' attr: 'b' }
        shape_redirection: { fg: '#cd7b7e' attr: 'b' }
        shape_signature: { fg: '#49a61d' attr: 'b' }
        shape_string: '#49a61d'
        shape_string_interpolation: { fg: '#4fa090' attr: 'b' }
        shape_table: { fg: '#798fd7' attr: 'b' }
        shape_vardecl: { fg: '#798fd7' attr: 'u' }
        shape_variable: '#cd7b7e'

        foreground: '#8da3b8'
        background: '#202427'
        cursor: '#8da3b8'

        empty: '#798fd7'
        header: { fg: '#49a61d' attr: 'b' }
        hints: '#292b35'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#49a61d' attr: 'b' }
        search_result: { fg: '#eb6a58' bg: '#909294' }
        separator: '#909294'
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