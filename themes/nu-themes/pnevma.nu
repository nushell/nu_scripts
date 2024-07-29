# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c79ec4'
        block: '#7fa5bd'
        cell-path: '#d0d0d0'
        closure: '#8adbb4'
        custom: '#efefef'
        duration: '#d7af87'
        float: '#d78787'
        glob: '#efefef'
        int: '#c79ec4'
        list: '#8adbb4'
        nothing: '#a36666'
        range: '#d7af87'
        record: '#8adbb4'
        string: '#90a57d'

        bool: {|| if $in { '#b1e7dd' } else { '#d7af87' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a36666' attr: 'b' }
            } else if $in < 6hr {
                '#a36666'
            } else if $in < 1day {
                '#d7af87'
            } else if $in < 3day {
                '#90a57d'
            } else if $in < 1wk {
                { fg: '#90a57d' attr: 'b' }
            } else if $in < 6wk {
                '#8adbb4'
            } else if $in < 52wk {
                '#7fa5bd'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0d0d0'
            } else if $e < 1mb {
                '#8adbb4'
            } else {{ fg: '#7fa5bd' }}
        }

        shape_and: { fg: '#c79ec4' attr: 'b' }
        shape_binary: { fg: '#c79ec4' attr: 'b' }
        shape_block: { fg: '#7fa5bd' attr: 'b' }
        shape_bool: '#b1e7dd'
        shape_closure: { fg: '#8adbb4' attr: 'b' }
        shape_custom: '#90a57d'
        shape_datetime: { fg: '#8adbb4' attr: 'b' }
        shape_directory: '#8adbb4'
        shape_external: '#8adbb4'
        shape_external_resolved: '#b1e7dd'
        shape_externalarg: { fg: '#90a57d' attr: 'b' }
        shape_filepath: '#8adbb4'
        shape_flag: { fg: '#7fa5bd' attr: 'b' }
        shape_float: { fg: '#d78787' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8adbb4' attr: 'b' }
        shape_globpattern: { fg: '#8adbb4' attr: 'b' }
        shape_int: { fg: '#c79ec4' attr: 'b' }
        shape_internalcall: { fg: '#8adbb4' attr: 'b' }
        shape_keyword: { fg: '#c79ec4' attr: 'b' }
        shape_list: { fg: '#8adbb4' attr: 'b' }
        shape_literal: '#7fa5bd'
        shape_match_pattern: '#90a57d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a36666'
        shape_operator: '#d7af87'
        shape_or: { fg: '#c79ec4' attr: 'b' }
        shape_pipe: { fg: '#c79ec4' attr: 'b' }
        shape_range: { fg: '#d7af87' attr: 'b' }
        shape_raw_string: { fg: '#efefef' attr: 'b' }
        shape_record: { fg: '#8adbb4' attr: 'b' }
        shape_redirection: { fg: '#c79ec4' attr: 'b' }
        shape_signature: { fg: '#90a57d' attr: 'b' }
        shape_string: '#90a57d'
        shape_string_interpolation: { fg: '#8adbb4' attr: 'b' }
        shape_table: { fg: '#7fa5bd' attr: 'b' }
        shape_vardecl: { fg: '#7fa5bd' attr: 'u' }
        shape_variable: '#c79ec4'

        foreground: '#d0d0d0'
        background: '#1c1c1c'
        cursor: '#d0d0d0'

        empty: '#7fa5bd'
        header: { fg: '#90a57d' attr: 'b' }
        hints: '#4a4845'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#90a57d' attr: 'b' }
        search_result: { fg: '#a36666' bg: '#d0d0d0' }
        separator: '#d0d0d0'
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