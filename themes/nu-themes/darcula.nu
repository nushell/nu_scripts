# Retrieve the theme settings
export def main [] {
    return {
        binary: '#cc7832'
        block: '#9876aa'
        cell-path: '#a9b7c6'
        closure: '#629755'
        custom: '#ffffff'
        duration: '#bbb529'
        float: '#4eade5'
        glob: '#ffffff'
        int: '#cc7832'
        list: '#629755'
        nothing: '#4eade5'
        range: '#bbb529'
        record: '#629755'
        string: '#6a8759'

        bool: {|| if $in { '#629755' } else { '#bbb529' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#4eade5' attr: 'b' }
            } else if $in < 6hr {
                '#4eade5'
            } else if $in < 1day {
                '#bbb529'
            } else if $in < 3day {
                '#6a8759'
            } else if $in < 1wk {
                { fg: '#6a8759' attr: 'b' }
            } else if $in < 6wk {
                '#629755'
            } else if $in < 52wk {
                '#9876aa'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a9b7c6'
            } else if $e < 1mb {
                '#629755'
            } else {{ fg: '#9876aa' }}
        }

        shape_and: { fg: '#cc7832' attr: 'b' }
        shape_binary: { fg: '#cc7832' attr: 'b' }
        shape_block: { fg: '#9876aa' attr: 'b' }
        shape_bool: '#629755'
        shape_closure: { fg: '#629755' attr: 'b' }
        shape_custom: '#6a8759'
        shape_datetime: { fg: '#629755' attr: 'b' }
        shape_directory: '#629755'
        shape_external: '#629755'
        shape_external_resolved: '#629755'
        shape_externalarg: { fg: '#6a8759' attr: 'b' }
        shape_filepath: '#629755'
        shape_flag: { fg: '#9876aa' attr: 'b' }
        shape_float: { fg: '#4eade5' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#629755' attr: 'b' }
        shape_globpattern: { fg: '#629755' attr: 'b' }
        shape_int: { fg: '#cc7832' attr: 'b' }
        shape_internalcall: { fg: '#629755' attr: 'b' }
        shape_keyword: { fg: '#cc7832' attr: 'b' }
        shape_list: { fg: '#629755' attr: 'b' }
        shape_literal: '#9876aa'
        shape_match_pattern: '#6a8759'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#4eade5'
        shape_operator: '#bbb529'
        shape_or: { fg: '#cc7832' attr: 'b' }
        shape_pipe: { fg: '#cc7832' attr: 'b' }
        shape_range: { fg: '#bbb529' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#629755' attr: 'b' }
        shape_redirection: { fg: '#cc7832' attr: 'b' }
        shape_signature: { fg: '#6a8759' attr: 'b' }
        shape_string: '#6a8759'
        shape_string_interpolation: { fg: '#629755' attr: 'b' }
        shape_table: { fg: '#9876aa' attr: 'b' }
        shape_vardecl: { fg: '#9876aa' attr: 'u' }
        shape_variable: '#cc7832'

        foreground: '#a9b7c6'
        background: '#2b2b2b'
        cursor: '#a9b7c6'

        empty: '#9876aa'
        header: { fg: '#6a8759' attr: 'b' }
        hints: '#606366'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6a8759' attr: 'b' }
        search_result: { fg: '#4eade5' bg: '#a9b7c6' }
        separator: '#a9b7c6'
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