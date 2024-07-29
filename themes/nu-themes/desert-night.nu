# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d261a5'
        block: '#949fb4'
        cell-path: '#87765d'
        closure: '#bfab36'
        custom: '#87765d'
        duration: '#e18245'
        float: '#e56b55'
        glob: '#87765d'
        int: '#d261a5'
        list: '#bfab36'
        nothing: '#e56b55'
        range: '#e18245'
        record: '#bfab36'
        string: '#99b05f'

        bool: {|| if $in { '#bfab36' } else { '#e18245' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e56b55' attr: 'b' }
            } else if $in < 6hr {
                '#e56b55'
            } else if $in < 1day {
                '#e18245'
            } else if $in < 3day {
                '#99b05f'
            } else if $in < 1wk {
                { fg: '#99b05f' attr: 'b' }
            } else if $in < 6wk {
                '#bfab36'
            } else if $in < 52wk {
                '#949fb4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#87765d'
            } else if $e < 1mb {
                '#bfab36'
            } else {{ fg: '#949fb4' }}
        }

        shape_and: { fg: '#d261a5' attr: 'b' }
        shape_binary: { fg: '#d261a5' attr: 'b' }
        shape_block: { fg: '#949fb4' attr: 'b' }
        shape_bool: '#bfab36'
        shape_closure: { fg: '#bfab36' attr: 'b' }
        shape_custom: '#99b05f'
        shape_datetime: { fg: '#bfab36' attr: 'b' }
        shape_directory: '#bfab36'
        shape_external: '#bfab36'
        shape_external_resolved: '#bfab36'
        shape_externalarg: { fg: '#99b05f' attr: 'b' }
        shape_filepath: '#bfab36'
        shape_flag: { fg: '#949fb4' attr: 'b' }
        shape_float: { fg: '#e56b55' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#bfab36' attr: 'b' }
        shape_globpattern: { fg: '#bfab36' attr: 'b' }
        shape_int: { fg: '#d261a5' attr: 'b' }
        shape_internalcall: { fg: '#bfab36' attr: 'b' }
        shape_keyword: { fg: '#d261a5' attr: 'b' }
        shape_list: { fg: '#bfab36' attr: 'b' }
        shape_literal: '#949fb4'
        shape_match_pattern: '#99b05f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e56b55'
        shape_operator: '#e18245'
        shape_or: { fg: '#d261a5' attr: 'b' }
        shape_pipe: { fg: '#d261a5' attr: 'b' }
        shape_range: { fg: '#e18245' attr: 'b' }
        shape_raw_string: { fg: '#87765d' attr: 'b' }
        shape_record: { fg: '#bfab36' attr: 'b' }
        shape_redirection: { fg: '#d261a5' attr: 'b' }
        shape_signature: { fg: '#99b05f' attr: 'b' }
        shape_string: '#99b05f'
        shape_string_interpolation: { fg: '#bfab36' attr: 'b' }
        shape_table: { fg: '#949fb4' attr: 'b' }
        shape_vardecl: { fg: '#949fb4' attr: 'u' }
        shape_variable: '#d261a5'

        foreground: '#d4b07b'
        background: '#24221c'
        cursor: '#d4b07b'

        empty: '#949fb4'
        header: { fg: '#99b05f' attr: 'b' }
        hints: '#473f31'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#99b05f' attr: 'b' }
        search_result: { fg: '#e56b55' bg: '#87765d' }
        separator: '#87765d'
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