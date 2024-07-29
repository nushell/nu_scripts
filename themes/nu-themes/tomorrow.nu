# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8959a8'
        block: '#4271ae'
        cell-path: '#4d4d4c'
        closure: '#3e999f'
        custom: '#1d1f21'
        duration: '#eab700'
        float: '#c82829'
        glob: '#1d1f21'
        int: '#8959a8'
        list: '#3e999f'
        nothing: '#c82829'
        range: '#eab700'
        record: '#3e999f'
        string: '#718c00'

        bool: {|| if $in { '#3e999f' } else { '#eab700' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c82829' attr: 'b' }
            } else if $in < 6hr {
                '#c82829'
            } else if $in < 1day {
                '#eab700'
            } else if $in < 3day {
                '#718c00'
            } else if $in < 1wk {
                { fg: '#718c00' attr: 'b' }
            } else if $in < 6wk {
                '#3e999f'
            } else if $in < 52wk {
                '#4271ae'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#4d4d4c'
            } else if $e < 1mb {
                '#3e999f'
            } else {{ fg: '#4271ae' }}
        }

        shape_and: { fg: '#8959a8' attr: 'b' }
        shape_binary: { fg: '#8959a8' attr: 'b' }
        shape_block: { fg: '#4271ae' attr: 'b' }
        shape_bool: '#3e999f'
        shape_closure: { fg: '#3e999f' attr: 'b' }
        shape_custom: '#718c00'
        shape_datetime: { fg: '#3e999f' attr: 'b' }
        shape_directory: '#3e999f'
        shape_external: '#3e999f'
        shape_external_resolved: '#3e999f'
        shape_externalarg: { fg: '#718c00' attr: 'b' }
        shape_filepath: '#3e999f'
        shape_flag: { fg: '#4271ae' attr: 'b' }
        shape_float: { fg: '#c82829' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3e999f' attr: 'b' }
        shape_globpattern: { fg: '#3e999f' attr: 'b' }
        shape_int: { fg: '#8959a8' attr: 'b' }
        shape_internalcall: { fg: '#3e999f' attr: 'b' }
        shape_keyword: { fg: '#8959a8' attr: 'b' }
        shape_list: { fg: '#3e999f' attr: 'b' }
        shape_literal: '#4271ae'
        shape_match_pattern: '#718c00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c82829'
        shape_operator: '#eab700'
        shape_or: { fg: '#8959a8' attr: 'b' }
        shape_pipe: { fg: '#8959a8' attr: 'b' }
        shape_range: { fg: '#eab700' attr: 'b' }
        shape_raw_string: { fg: '#1d1f21' attr: 'b' }
        shape_record: { fg: '#3e999f' attr: 'b' }
        shape_redirection: { fg: '#8959a8' attr: 'b' }
        shape_signature: { fg: '#718c00' attr: 'b' }
        shape_string: '#718c00'
        shape_string_interpolation: { fg: '#3e999f' attr: 'b' }
        shape_table: { fg: '#4271ae' attr: 'b' }
        shape_vardecl: { fg: '#4271ae' attr: 'u' }
        shape_variable: '#8959a8'

        foreground: '#4d4d4c'
        background: '#ffffff'
        cursor: '#4d4d4c'

        empty: '#4271ae'
        header: { fg: '#718c00' attr: 'b' }
        hints: '#8e908c'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#718c00' attr: 'b' }
        search_result: { fg: '#c82829' bg: '#4d4d4c' }
        separator: '#4d4d4c'
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