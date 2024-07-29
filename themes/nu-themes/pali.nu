# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ab748f'
        block: '#8f74ab'
        cell-path: '#f2f2f2'
        closure: '#748fab'
        custom: '#a020f0'
        duration: '#8fab74'
        float: '#ff1d62'
        glob: '#a020f0'
        int: '#ab748f'
        list: '#748fab'
        nothing: '#ab8f74'
        range: '#8fab74'
        record: '#748fab'
        string: '#74ab8f'

        bool: {|| if $in { '#4bb8fd' } else { '#8fab74' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ab8f74' attr: 'b' }
            } else if $in < 6hr {
                '#ab8f74'
            } else if $in < 1day {
                '#8fab74'
            } else if $in < 3day {
                '#74ab8f'
            } else if $in < 1wk {
                { fg: '#74ab8f' attr: 'b' }
            } else if $in < 6wk {
                '#748fab'
            } else if $in < 52wk {
                '#8f74ab'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f2f2f2'
            } else if $e < 1mb {
                '#748fab'
            } else {{ fg: '#8f74ab' }}
        }

        shape_and: { fg: '#ab748f' attr: 'b' }
        shape_binary: { fg: '#ab748f' attr: 'b' }
        shape_block: { fg: '#8f74ab' attr: 'b' }
        shape_bool: '#4bb8fd'
        shape_closure: { fg: '#748fab' attr: 'b' }
        shape_custom: '#74ab8f'
        shape_datetime: { fg: '#748fab' attr: 'b' }
        shape_directory: '#748fab'
        shape_external: '#748fab'
        shape_external_resolved: '#4bb8fd'
        shape_externalarg: { fg: '#74ab8f' attr: 'b' }
        shape_filepath: '#748fab'
        shape_flag: { fg: '#8f74ab' attr: 'b' }
        shape_float: { fg: '#ff1d62' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#748fab' attr: 'b' }
        shape_globpattern: { fg: '#748fab' attr: 'b' }
        shape_int: { fg: '#ab748f' attr: 'b' }
        shape_internalcall: { fg: '#748fab' attr: 'b' }
        shape_keyword: { fg: '#ab748f' attr: 'b' }
        shape_list: { fg: '#748fab' attr: 'b' }
        shape_literal: '#8f74ab'
        shape_match_pattern: '#74ab8f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ab8f74'
        shape_operator: '#8fab74'
        shape_or: { fg: '#ab748f' attr: 'b' }
        shape_pipe: { fg: '#ab748f' attr: 'b' }
        shape_range: { fg: '#8fab74' attr: 'b' }
        shape_raw_string: { fg: '#a020f0' attr: 'b' }
        shape_record: { fg: '#748fab' attr: 'b' }
        shape_redirection: { fg: '#ab748f' attr: 'b' }
        shape_signature: { fg: '#74ab8f' attr: 'b' }
        shape_string: '#74ab8f'
        shape_string_interpolation: { fg: '#748fab' attr: 'b' }
        shape_table: { fg: '#8f74ab' attr: 'b' }
        shape_vardecl: { fg: '#8f74ab' attr: 'u' }
        shape_variable: '#ab748f'

        foreground: '#d9e6f2'
        background: '#232e37'
        cursor: '#d9e6f2'

        empty: '#8f74ab'
        header: { fg: '#74ab8f' attr: 'b' }
        hints: '#5d5d5d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#74ab8f' attr: 'b' }
        search_result: { fg: '#ab8f74' bg: '#f2f2f2' }
        separator: '#f2f2f2'
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