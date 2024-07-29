# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9bc0c8'
        block: '#498091'
        cell-path: '#c7c7a5'
        closure: '#66d9ef'
        custom: '#e1eaef'
        duration: '#fdb11f'
        float: '#ff4658'
        glob: '#e1eaef'
        int: '#9bc0c8'
        list: '#66d9ef'
        nothing: '#ff4658'
        range: '#fdb11f'
        record: '#66d9ef'
        string: '#499180'

        bool: {|| if $in { '#66d9ef' } else { '#fdb11f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff4658' attr: 'b' }
            } else if $in < 6hr {
                '#ff4658'
            } else if $in < 1day {
                '#fdb11f'
            } else if $in < 3day {
                '#499180'
            } else if $in < 1wk {
                { fg: '#499180' attr: 'b' }
            } else if $in < 6wk {
                '#66d9ef'
            } else if $in < 52wk {
                '#498091'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c7c7a5'
            } else if $e < 1mb {
                '#66d9ef'
            } else {{ fg: '#498091' }}
        }

        shape_and: { fg: '#9bc0c8' attr: 'b' }
        shape_binary: { fg: '#9bc0c8' attr: 'b' }
        shape_block: { fg: '#498091' attr: 'b' }
        shape_bool: '#66d9ef'
        shape_closure: { fg: '#66d9ef' attr: 'b' }
        shape_custom: '#499180'
        shape_datetime: { fg: '#66d9ef' attr: 'b' }
        shape_directory: '#66d9ef'
        shape_external: '#66d9ef'
        shape_external_resolved: '#66d9ef'
        shape_externalarg: { fg: '#499180' attr: 'b' }
        shape_filepath: '#66d9ef'
        shape_flag: { fg: '#498091' attr: 'b' }
        shape_float: { fg: '#ff4658' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#66d9ef' attr: 'b' }
        shape_globpattern: { fg: '#66d9ef' attr: 'b' }
        shape_int: { fg: '#9bc0c8' attr: 'b' }
        shape_internalcall: { fg: '#66d9ef' attr: 'b' }
        shape_keyword: { fg: '#9bc0c8' attr: 'b' }
        shape_list: { fg: '#66d9ef' attr: 'b' }
        shape_literal: '#498091'
        shape_match_pattern: '#499180'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff4658'
        shape_operator: '#fdb11f'
        shape_or: { fg: '#9bc0c8' attr: 'b' }
        shape_pipe: { fg: '#9bc0c8' attr: 'b' }
        shape_range: { fg: '#fdb11f' attr: 'b' }
        shape_raw_string: { fg: '#e1eaef' attr: 'b' }
        shape_record: { fg: '#66d9ef' attr: 'b' }
        shape_redirection: { fg: '#9bc0c8' attr: 'b' }
        shape_signature: { fg: '#499180' attr: 'b' }
        shape_string: '#499180'
        shape_string_interpolation: { fg: '#66d9ef' attr: 'b' }
        shape_table: { fg: '#498091' attr: 'b' }
        shape_vardecl: { fg: '#498091' attr: 'u' }
        shape_variable: '#9bc0c8'

        foreground: '#c7c7a5'
        background: '#171e1f'
        cursor: '#c7c7a5'

        empty: '#498091'
        header: { fg: '#499180' attr: 'b' }
        hints: '#555e5f'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#499180' attr: 'b' }
        search_result: { fg: '#ff4658' bg: '#c7c7a5' }
        separator: '#c7c7a5'
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