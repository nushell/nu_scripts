# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6d43a6'
        block: '#008df8'
        cell-path: '#ffffff'
        closure: '#00d8eb'
        custom: '#ffffff'
        duration: '#ffb900'
        float: '#ff2740'
        glob: '#ffffff'
        int: '#6d43a6'
        list: '#00d8eb'
        nothing: '#ff000f'
        range: '#ffb900'
        record: '#00d8eb'
        string: '#8ce10b'

        bool: {|| if $in { '#67fff0' } else { '#ffb900' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff000f' attr: 'b' }
            } else if $in < 6hr {
                '#ff000f'
            } else if $in < 1day {
                '#ffb900'
            } else if $in < 3day {
                '#8ce10b'
            } else if $in < 1wk {
                { fg: '#8ce10b' attr: 'b' }
            } else if $in < 6wk {
                '#00d8eb'
            } else if $in < 52wk {
                '#008df8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#00d8eb'
            } else {{ fg: '#008df8' }}
        }

        shape_and: { fg: '#6d43a6' attr: 'b' }
        shape_binary: { fg: '#6d43a6' attr: 'b' }
        shape_block: { fg: '#008df8' attr: 'b' }
        shape_bool: '#67fff0'
        shape_closure: { fg: '#00d8eb' attr: 'b' }
        shape_custom: '#8ce10b'
        shape_datetime: { fg: '#00d8eb' attr: 'b' }
        shape_directory: '#00d8eb'
        shape_external: '#00d8eb'
        shape_external_resolved: '#67fff0'
        shape_externalarg: { fg: '#8ce10b' attr: 'b' }
        shape_filepath: '#00d8eb'
        shape_flag: { fg: '#008df8' attr: 'b' }
        shape_float: { fg: '#ff2740' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00d8eb' attr: 'b' }
        shape_globpattern: { fg: '#00d8eb' attr: 'b' }
        shape_int: { fg: '#6d43a6' attr: 'b' }
        shape_internalcall: { fg: '#00d8eb' attr: 'b' }
        shape_keyword: { fg: '#6d43a6' attr: 'b' }
        shape_list: { fg: '#00d8eb' attr: 'b' }
        shape_literal: '#008df8'
        shape_match_pattern: '#8ce10b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff000f'
        shape_operator: '#ffb900'
        shape_or: { fg: '#6d43a6' attr: 'b' }
        shape_pipe: { fg: '#6d43a6' attr: 'b' }
        shape_range: { fg: '#ffb900' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00d8eb' attr: 'b' }
        shape_redirection: { fg: '#6d43a6' attr: 'b' }
        shape_signature: { fg: '#8ce10b' attr: 'b' }
        shape_string: '#8ce10b'
        shape_string_interpolation: { fg: '#00d8eb' attr: 'b' }
        shape_table: { fg: '#008df8' attr: 'b' }
        shape_vardecl: { fg: '#008df8' attr: 'u' }
        shape_variable: '#6d43a6'

        foreground: '#fffaf4'
        background: '#0e1019'
        cursor: '#fffaf4'

        empty: '#008df8'
        header: { fg: '#8ce10b' attr: 'b' }
        hints: '#444444'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8ce10b' attr: 'b' }
        search_result: { fg: '#ff000f' bg: '#ffffff' }
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