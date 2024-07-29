# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9c6cd3'
        block: '#15f4ee'
        cell-path: '#9fa2a6'
        closure: '#4b8f77'
        custom: '#ffffff'
        duration: '#ffff66'
        float: '#c4676c'
        glob: '#ffffff'
        int: '#9c6cd3'
        list: '#4b8f77'
        nothing: '#c4676c'
        range: '#ffff66'
        record: '#4b8f77'
        string: '#66ff66'

        bool: {|| if $in { '#4b8f77' } else { '#ffff66' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c4676c' attr: 'b' }
            } else if $in < 6hr {
                '#c4676c'
            } else if $in < 1day {
                '#ffff66'
            } else if $in < 3day {
                '#66ff66'
            } else if $in < 1wk {
                { fg: '#66ff66' attr: 'b' }
            } else if $in < 6wk {
                '#4b8f77'
            } else if $in < 52wk {
                '#15f4ee'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#9fa2a6'
            } else if $e < 1mb {
                '#4b8f77'
            } else {{ fg: '#15f4ee' }}
        }

        shape_and: { fg: '#9c6cd3' attr: 'b' }
        shape_binary: { fg: '#9c6cd3' attr: 'b' }
        shape_block: { fg: '#15f4ee' attr: 'b' }
        shape_bool: '#4b8f77'
        shape_closure: { fg: '#4b8f77' attr: 'b' }
        shape_custom: '#66ff66'
        shape_datetime: { fg: '#4b8f77' attr: 'b' }
        shape_directory: '#4b8f77'
        shape_external: '#4b8f77'
        shape_external_resolved: '#4b8f77'
        shape_externalarg: { fg: '#66ff66' attr: 'b' }
        shape_filepath: '#4b8f77'
        shape_flag: { fg: '#15f4ee' attr: 'b' }
        shape_float: { fg: '#c4676c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#4b8f77' attr: 'b' }
        shape_globpattern: { fg: '#4b8f77' attr: 'b' }
        shape_int: { fg: '#9c6cd3' attr: 'b' }
        shape_internalcall: { fg: '#4b8f77' attr: 'b' }
        shape_keyword: { fg: '#9c6cd3' attr: 'b' }
        shape_list: { fg: '#4b8f77' attr: 'b' }
        shape_literal: '#15f4ee'
        shape_match_pattern: '#66ff66'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c4676c'
        shape_operator: '#ffff66'
        shape_or: { fg: '#9c6cd3' attr: 'b' }
        shape_pipe: { fg: '#9c6cd3' attr: 'b' }
        shape_range: { fg: '#ffff66' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#4b8f77' attr: 'b' }
        shape_redirection: { fg: '#9c6cd3' attr: 'b' }
        shape_signature: { fg: '#66ff66' attr: 'b' }
        shape_string: '#66ff66'
        shape_string_interpolation: { fg: '#4b8f77' attr: 'b' }
        shape_table: { fg: '#15f4ee' attr: 'b' }
        shape_vardecl: { fg: '#15f4ee' attr: 'u' }
        shape_variable: '#9c6cd3'

        foreground: '#9fa2a6'
        background: '#2a3b4d'
        cursor: '#9fa2a6'

        empty: '#15f4ee'
        header: { fg: '#66ff66' attr: 'b' }
        hints: '#55799c'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#66ff66' attr: 'b' }
        search_result: { fg: '#c4676c' bg: '#9fa2a6' }
        separator: '#9fa2a6'
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