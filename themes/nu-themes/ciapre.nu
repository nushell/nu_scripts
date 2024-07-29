# Retrieve the theme settings
export def main [] {
    return {
        binary: '#724d7c'
        block: '#576d8c'
        cell-path: '#aea47f'
        closure: '#5c4f4b'
        custom: '#f4f4f4'
        duration: '#cc8b3f'
        float: '#ac3835'
        glob: '#f4f4f4'
        int: '#724d7c'
        list: '#5c4f4b'
        nothing: '#810009'
        range: '#cc8b3f'
        record: '#5c4f4b'
        string: '#48513b'

        bool: {|| if $in { '#f3dbb2' } else { '#cc8b3f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#810009' attr: 'b' }
            } else if $in < 6hr {
                '#810009'
            } else if $in < 1day {
                '#cc8b3f'
            } else if $in < 3day {
                '#48513b'
            } else if $in < 1wk {
                { fg: '#48513b' attr: 'b' }
            } else if $in < 6wk {
                '#5c4f4b'
            } else if $in < 52wk {
                '#576d8c'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#aea47f'
            } else if $e < 1mb {
                '#5c4f4b'
            } else {{ fg: '#576d8c' }}
        }

        shape_and: { fg: '#724d7c' attr: 'b' }
        shape_binary: { fg: '#724d7c' attr: 'b' }
        shape_block: { fg: '#576d8c' attr: 'b' }
        shape_bool: '#f3dbb2'
        shape_closure: { fg: '#5c4f4b' attr: 'b' }
        shape_custom: '#48513b'
        shape_datetime: { fg: '#5c4f4b' attr: 'b' }
        shape_directory: '#5c4f4b'
        shape_external: '#5c4f4b'
        shape_external_resolved: '#f3dbb2'
        shape_externalarg: { fg: '#48513b' attr: 'b' }
        shape_filepath: '#5c4f4b'
        shape_flag: { fg: '#576d8c' attr: 'b' }
        shape_float: { fg: '#ac3835' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5c4f4b' attr: 'b' }
        shape_globpattern: { fg: '#5c4f4b' attr: 'b' }
        shape_int: { fg: '#724d7c' attr: 'b' }
        shape_internalcall: { fg: '#5c4f4b' attr: 'b' }
        shape_keyword: { fg: '#724d7c' attr: 'b' }
        shape_list: { fg: '#5c4f4b' attr: 'b' }
        shape_literal: '#576d8c'
        shape_match_pattern: '#48513b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#810009'
        shape_operator: '#cc8b3f'
        shape_or: { fg: '#724d7c' attr: 'b' }
        shape_pipe: { fg: '#724d7c' attr: 'b' }
        shape_range: { fg: '#cc8b3f' attr: 'b' }
        shape_raw_string: { fg: '#f4f4f4' attr: 'b' }
        shape_record: { fg: '#5c4f4b' attr: 'b' }
        shape_redirection: { fg: '#724d7c' attr: 'b' }
        shape_signature: { fg: '#48513b' attr: 'b' }
        shape_string: '#48513b'
        shape_string_interpolation: { fg: '#5c4f4b' attr: 'b' }
        shape_table: { fg: '#576d8c' attr: 'b' }
        shape_vardecl: { fg: '#576d8c' attr: 'u' }
        shape_variable: '#724d7c'

        foreground: '#aea47a'
        background: '#191c27'
        cursor: '#aea47a'

        empty: '#576d8c'
        header: { fg: '#48513b' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#48513b' attr: 'b' }
        search_result: { fg: '#810009' bg: '#aea47f' }
        separator: '#aea47f'
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