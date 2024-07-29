# Retrieve the theme settings
export def main [] {
    return {
        binary: '#cc69c8'
        block: '#0099cc'
        cell-path: '#bccccc'
        closure: '#7ac4cc'
        custom: '#bccccc'
        duration: '#ccac00'
        float: '#ff3030'
        glob: '#bccccc'
        int: '#cc69c8'
        list: '#7ac4cc'
        nothing: '#ff3030'
        range: '#ccac00'
        record: '#7ac4cc'
        string: '#559a70'

        bool: {|| if $in { '#7ac4cc' } else { '#ccac00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff3030' attr: 'b' }
            } else if $in < 6hr {
                '#ff3030'
            } else if $in < 1day {
                '#ccac00'
            } else if $in < 3day {
                '#559a70'
            } else if $in < 1wk {
                { fg: '#559a70' attr: 'b' }
            } else if $in < 6wk {
                '#7ac4cc'
            } else if $in < 52wk {
                '#0099cc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bccccc'
            } else if $e < 1mb {
                '#7ac4cc'
            } else {{ fg: '#0099cc' }}
        }

        shape_and: { fg: '#cc69c8' attr: 'b' }
        shape_binary: { fg: '#cc69c8' attr: 'b' }
        shape_block: { fg: '#0099cc' attr: 'b' }
        shape_bool: '#7ac4cc'
        shape_closure: { fg: '#7ac4cc' attr: 'b' }
        shape_custom: '#559a70'
        shape_datetime: { fg: '#7ac4cc' attr: 'b' }
        shape_directory: '#7ac4cc'
        shape_external: '#7ac4cc'
        shape_external_resolved: '#7ac4cc'
        shape_externalarg: { fg: '#559a70' attr: 'b' }
        shape_filepath: '#7ac4cc'
        shape_flag: { fg: '#0099cc' attr: 'b' }
        shape_float: { fg: '#ff3030' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#7ac4cc' attr: 'b' }
        shape_globpattern: { fg: '#7ac4cc' attr: 'b' }
        shape_int: { fg: '#cc69c8' attr: 'b' }
        shape_internalcall: { fg: '#7ac4cc' attr: 'b' }
        shape_keyword: { fg: '#cc69c8' attr: 'b' }
        shape_list: { fg: '#7ac4cc' attr: 'b' }
        shape_literal: '#0099cc'
        shape_match_pattern: '#559a70'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff3030'
        shape_operator: '#ccac00'
        shape_or: { fg: '#cc69c8' attr: 'b' }
        shape_pipe: { fg: '#cc69c8' attr: 'b' }
        shape_range: { fg: '#ccac00' attr: 'b' }
        shape_raw_string: { fg: '#bccccc' attr: 'b' }
        shape_record: { fg: '#7ac4cc' attr: 'b' }
        shape_redirection: { fg: '#cc69c8' attr: 'b' }
        shape_signature: { fg: '#559a70' attr: 'b' }
        shape_string: '#559a70'
        shape_string_interpolation: { fg: '#7ac4cc' attr: 'b' }
        shape_table: { fg: '#0099cc' attr: 'b' }
        shape_vardecl: { fg: '#0099cc' attr: 'u' }
        shape_variable: '#cc69c8'

        foreground: '#afc2c2'
        background: '#000000'
        cursor: '#afc2c2'

        empty: '#0099cc'
        header: { fg: '#559a70' attr: 'b' }
        hints: '#000000'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#559a70' attr: 'b' }
        search_result: { fg: '#ff3030' bg: '#bccccc' }
        separator: '#bccccc'
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