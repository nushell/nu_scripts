# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ac80a6'
        block: '#5a86ad'
        cell-path: '#e0dbb7'
        closure: '#74a6ad'
        custom: '#fff9d5'
        duration: '#e99d2a'
        float: '#e84627'
        glob: '#fff9d5'
        int: '#ac80a6'
        list: '#74a6ad'
        nothing: '#be2d26'
        range: '#e99d2a'
        record: '#74a6ad'
        string: '#6ba18a'

        bool: {|| if $in { '#93cfd7' } else { '#e99d2a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#be2d26' attr: 'b' }
            } else if $in < 6hr {
                '#be2d26'
            } else if $in < 1day {
                '#e99d2a'
            } else if $in < 3day {
                '#6ba18a'
            } else if $in < 1wk {
                { fg: '#6ba18a' attr: 'b' }
            } else if $in < 6wk {
                '#74a6ad'
            } else if $in < 52wk {
                '#5a86ad'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e0dbb7'
            } else if $e < 1mb {
                '#74a6ad'
            } else {{ fg: '#5a86ad' }}
        }

        shape_and: { fg: '#ac80a6' attr: 'b' }
        shape_binary: { fg: '#ac80a6' attr: 'b' }
        shape_block: { fg: '#5a86ad' attr: 'b' }
        shape_bool: '#93cfd7'
        shape_closure: { fg: '#74a6ad' attr: 'b' }
        shape_custom: '#6ba18a'
        shape_datetime: { fg: '#74a6ad' attr: 'b' }
        shape_directory: '#74a6ad'
        shape_external: '#74a6ad'
        shape_external_resolved: '#93cfd7'
        shape_externalarg: { fg: '#6ba18a' attr: 'b' }
        shape_filepath: '#74a6ad'
        shape_flag: { fg: '#5a86ad' attr: 'b' }
        shape_float: { fg: '#e84627' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#74a6ad' attr: 'b' }
        shape_globpattern: { fg: '#74a6ad' attr: 'b' }
        shape_int: { fg: '#ac80a6' attr: 'b' }
        shape_internalcall: { fg: '#74a6ad' attr: 'b' }
        shape_keyword: { fg: '#ac80a6' attr: 'b' }
        shape_list: { fg: '#74a6ad' attr: 'b' }
        shape_literal: '#5a86ad'
        shape_match_pattern: '#6ba18a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#be2d26'
        shape_operator: '#e99d2a'
        shape_or: { fg: '#ac80a6' attr: 'b' }
        shape_pipe: { fg: '#ac80a6' attr: 'b' }
        shape_range: { fg: '#e99d2a' attr: 'b' }
        shape_raw_string: { fg: '#fff9d5' attr: 'b' }
        shape_record: { fg: '#74a6ad' attr: 'b' }
        shape_redirection: { fg: '#ac80a6' attr: 'b' }
        shape_signature: { fg: '#6ba18a' attr: 'b' }
        shape_string: '#6ba18a'
        shape_string_interpolation: { fg: '#74a6ad' attr: 'b' }
        shape_table: { fg: '#5a86ad' attr: 'b' }
        shape_vardecl: { fg: '#5a86ad' attr: 'u' }
        shape_variable: '#ac80a6'

        foreground: '#e0dbb7'
        background: '#2a1f1d'
        cursor: '#e0dbb7'

        empty: '#5a86ad'
        header: { fg: '#6ba18a' attr: 'b' }
        hints: '#9b6c4a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6ba18a' attr: 'b' }
        search_result: { fg: '#be2d26' bg: '#e0dbb7' }
        separator: '#e0dbb7'
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