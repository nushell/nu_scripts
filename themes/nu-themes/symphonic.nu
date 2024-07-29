# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b729d9'
        block: '#0084d4'
        cell-path: '#ffffff'
        closure: '#ccccff'
        custom: '#ffffff'
        duration: '#ff8400'
        float: '#dc322f'
        glob: '#ffffff'
        int: '#b729d9'
        list: '#ccccff'
        nothing: '#dc322f'
        range: '#ff8400'
        record: '#ccccff'
        string: '#56db3a'

        bool: {|| if $in { '#ccccff' } else { '#ff8400' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#dc322f' attr: 'b' }
            } else if $in < 6hr {
                '#dc322f'
            } else if $in < 1day {
                '#ff8400'
            } else if $in < 3day {
                '#56db3a'
            } else if $in < 1wk {
                { fg: '#56db3a' attr: 'b' }
            } else if $in < 6wk {
                '#ccccff'
            } else if $in < 52wk {
                '#0084d4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#ccccff'
            } else {{ fg: '#0084d4' }}
        }

        shape_and: { fg: '#b729d9' attr: 'b' }
        shape_binary: { fg: '#b729d9' attr: 'b' }
        shape_block: { fg: '#0084d4' attr: 'b' }
        shape_bool: '#ccccff'
        shape_closure: { fg: '#ccccff' attr: 'b' }
        shape_custom: '#56db3a'
        shape_datetime: { fg: '#ccccff' attr: 'b' }
        shape_directory: '#ccccff'
        shape_external: '#ccccff'
        shape_external_resolved: '#ccccff'
        shape_externalarg: { fg: '#56db3a' attr: 'b' }
        shape_filepath: '#ccccff'
        shape_flag: { fg: '#0084d4' attr: 'b' }
        shape_float: { fg: '#dc322f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#ccccff' attr: 'b' }
        shape_globpattern: { fg: '#ccccff' attr: 'b' }
        shape_int: { fg: '#b729d9' attr: 'b' }
        shape_internalcall: { fg: '#ccccff' attr: 'b' }
        shape_keyword: { fg: '#b729d9' attr: 'b' }
        shape_list: { fg: '#ccccff' attr: 'b' }
        shape_literal: '#0084d4'
        shape_match_pattern: '#56db3a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#dc322f'
        shape_operator: '#ff8400'
        shape_or: { fg: '#b729d9' attr: 'b' }
        shape_pipe: { fg: '#b729d9' attr: 'b' }
        shape_range: { fg: '#ff8400' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#ccccff' attr: 'b' }
        shape_redirection: { fg: '#b729d9' attr: 'b' }
        shape_signature: { fg: '#56db3a' attr: 'b' }
        shape_string: '#56db3a'
        shape_string_interpolation: { fg: '#ccccff' attr: 'b' }
        shape_table: { fg: '#0084d4' attr: 'b' }
        shape_vardecl: { fg: '#0084d4' attr: 'u' }
        shape_variable: '#b729d9'

        foreground: '#ffffff'
        background: '#000000'
        cursor: '#ffffff'

        empty: '#0084d4'
        header: { fg: '#56db3a' attr: 'b' }
        hints: '#1b1d21'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#56db3a' attr: 'b' }
        search_result: { fg: '#dc322f' bg: '#ffffff' }
        separator: '#ffffff'
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