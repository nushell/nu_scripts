# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b77eb8'
        block: '#5486c0'
        cell-path: '#ffffff'
        closure: '#50a5a4'
        custom: '#ffffff'
        duration: '#f7bd51'
        float: '#e44754'
        glob: '#ffffff'
        int: '#b77eb8'
        list: '#50a5a4'
        nothing: '#e44754'
        range: '#f7bd51'
        record: '#50a5a4'
        string: '#89bd82'

        bool: {|| if $in { '#50a5a4' } else { '#f7bd51' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e44754' attr: 'b' }
            } else if $in < 6hr {
                '#e44754'
            } else if $in < 1day {
                '#f7bd51'
            } else if $in < 3day {
                '#89bd82'
            } else if $in < 1wk {
                { fg: '#89bd82' attr: 'b' }
            } else if $in < 6wk {
                '#50a5a4'
            } else if $in < 52wk {
                '#5486c0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#50a5a4'
            } else {{ fg: '#5486c0' }}
        }

        shape_and: { fg: '#b77eb8' attr: 'b' }
        shape_binary: { fg: '#b77eb8' attr: 'b' }
        shape_block: { fg: '#5486c0' attr: 'b' }
        shape_bool: '#50a5a4'
        shape_closure: { fg: '#50a5a4' attr: 'b' }
        shape_custom: '#89bd82'
        shape_datetime: { fg: '#50a5a4' attr: 'b' }
        shape_directory: '#50a5a4'
        shape_external: '#50a5a4'
        shape_external_resolved: '#50a5a4'
        shape_externalarg: { fg: '#89bd82' attr: 'b' }
        shape_filepath: '#50a5a4'
        shape_flag: { fg: '#5486c0' attr: 'b' }
        shape_float: { fg: '#e44754' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#50a5a4' attr: 'b' }
        shape_globpattern: { fg: '#50a5a4' attr: 'b' }
        shape_int: { fg: '#b77eb8' attr: 'b' }
        shape_internalcall: { fg: '#50a5a4' attr: 'b' }
        shape_keyword: { fg: '#b77eb8' attr: 'b' }
        shape_list: { fg: '#50a5a4' attr: 'b' }
        shape_literal: '#5486c0'
        shape_match_pattern: '#89bd82'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e44754'
        shape_operator: '#f7bd51'
        shape_or: { fg: '#b77eb8' attr: 'b' }
        shape_pipe: { fg: '#b77eb8' attr: 'b' }
        shape_range: { fg: '#f7bd51' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#50a5a4' attr: 'b' }
        shape_redirection: { fg: '#b77eb8' attr: 'b' }
        shape_signature: { fg: '#89bd82' attr: 'b' }
        shape_string: '#89bd82'
        shape_string_interpolation: { fg: '#50a5a4' attr: 'b' }
        shape_table: { fg: '#5486c0' attr: 'b' }
        shape_vardecl: { fg: '#5486c0' attr: 'u' }
        shape_variable: '#b77eb8'

        foreground: '#b3b8c3'
        background: '#121b21'
        cursor: '#b3b8c3'

        empty: '#5486c0'
        header: { fg: '#89bd82' attr: 'b' }
        hints: '#52606b'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#89bd82' attr: 'b' }
        search_result: { fg: '#e44754' bg: '#ffffff' }
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