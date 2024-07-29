# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b02874'
        block: '#1763aa'
        cell-path: '#ece6de'
        closure: '#096a83'
        custom: '#f3f2f4'
        duration: '#a6403a'
        float: '#bd3636'
        glob: '#f3f2f4'
        int: '#b02874'
        list: '#096a83'
        nothing: '#c00c50'
        range: '#a6403a'
        record: '#096a83'
        string: '#0a7040'

        bool: {|| if $in { '#07737a' } else { '#a6403a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c00c50' attr: 'b' }
            } else if $in < 6hr {
                '#c00c50'
            } else if $in < 1day {
                '#a6403a'
            } else if $in < 3day {
                '#0a7040'
            } else if $in < 1wk {
                { fg: '#0a7040' attr: 'b' }
            } else if $in < 6wk {
                '#096a83'
            } else if $in < 52wk {
                '#1763aa'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ece6de'
            } else if $e < 1mb {
                '#096a83'
            } else {{ fg: '#1763aa' }}
        }

        shape_and: { fg: '#b02874' attr: 'b' }
        shape_binary: { fg: '#b02874' attr: 'b' }
        shape_block: { fg: '#1763aa' attr: 'b' }
        shape_bool: '#07737a'
        shape_closure: { fg: '#096a83' attr: 'b' }
        shape_custom: '#0a7040'
        shape_datetime: { fg: '#096a83' attr: 'b' }
        shape_directory: '#096a83'
        shape_external: '#096a83'
        shape_external_resolved: '#07737a'
        shape_externalarg: { fg: '#0a7040' attr: 'b' }
        shape_filepath: '#096a83'
        shape_flag: { fg: '#1763aa' attr: 'b' }
        shape_float: { fg: '#bd3636' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#096a83' attr: 'b' }
        shape_globpattern: { fg: '#096a83' attr: 'b' }
        shape_int: { fg: '#b02874' attr: 'b' }
        shape_internalcall: { fg: '#096a83' attr: 'b' }
        shape_keyword: { fg: '#b02874' attr: 'b' }
        shape_list: { fg: '#096a83' attr: 'b' }
        shape_literal: '#1763aa'
        shape_match_pattern: '#0a7040'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c00c50'
        shape_operator: '#a6403a'
        shape_or: { fg: '#b02874' attr: 'b' }
        shape_pipe: { fg: '#b02874' attr: 'b' }
        shape_range: { fg: '#a6403a' attr: 'b' }
        shape_raw_string: { fg: '#f3f2f4' attr: 'b' }
        shape_record: { fg: '#096a83' attr: 'b' }
        shape_redirection: { fg: '#b02874' attr: 'b' }
        shape_signature: { fg: '#0a7040' attr: 'b' }
        shape_string: '#0a7040'
        shape_string_interpolation: { fg: '#096a83' attr: 'b' }
        shape_table: { fg: '#1763aa' attr: 'b' }
        shape_vardecl: { fg: '#1763aa' attr: 'u' }
        shape_variable: '#b02874'

        foreground: '#53545b'
        background: '#f3f2f4'
        cursor: '#53545b'

        empty: '#1763aa'
        header: { fg: '#0a7040' attr: 'b' }
        hints: '#80565d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#0a7040' attr: 'b' }
        search_result: { fg: '#c00c50' bg: '#ece6de' }
        separator: '#ece6de'
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