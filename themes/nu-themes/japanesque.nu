# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a57fc4'
        block: '#4c9ad4'
        cell-path: '#fafaf6'
        closure: '#389aad'
        custom: '#b2b5ae'
        duration: '#e9b32a'
        float: '#d18fa6'
        glob: '#b2b5ae'
        int: '#a57fc4'
        list: '#389aad'
        nothing: '#cf3f61'
        range: '#e9b32a'
        record: '#389aad'
        string: '#7bb75b'

        bool: {|| if $in { '#76bbca' } else { '#e9b32a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cf3f61' attr: 'b' }
            } else if $in < 6hr {
                '#cf3f61'
            } else if $in < 1day {
                '#e9b32a'
            } else if $in < 3day {
                '#7bb75b'
            } else if $in < 1wk {
                { fg: '#7bb75b' attr: 'b' }
            } else if $in < 6wk {
                '#389aad'
            } else if $in < 52wk {
                '#4c9ad4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#fafaf6'
            } else if $e < 1mb {
                '#389aad'
            } else {{ fg: '#4c9ad4' }}
        }

        shape_and: { fg: '#a57fc4' attr: 'b' }
        shape_binary: { fg: '#a57fc4' attr: 'b' }
        shape_block: { fg: '#4c9ad4' attr: 'b' }
        shape_bool: '#76bbca'
        shape_closure: { fg: '#389aad' attr: 'b' }
        shape_custom: '#7bb75b'
        shape_datetime: { fg: '#389aad' attr: 'b' }
        shape_directory: '#389aad'
        shape_external: '#389aad'
        shape_external_resolved: '#76bbca'
        shape_externalarg: { fg: '#7bb75b' attr: 'b' }
        shape_filepath: '#389aad'
        shape_flag: { fg: '#4c9ad4' attr: 'b' }
        shape_float: { fg: '#d18fa6' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#389aad' attr: 'b' }
        shape_globpattern: { fg: '#389aad' attr: 'b' }
        shape_int: { fg: '#a57fc4' attr: 'b' }
        shape_internalcall: { fg: '#389aad' attr: 'b' }
        shape_keyword: { fg: '#a57fc4' attr: 'b' }
        shape_list: { fg: '#389aad' attr: 'b' }
        shape_literal: '#4c9ad4'
        shape_match_pattern: '#7bb75b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cf3f61'
        shape_operator: '#e9b32a'
        shape_or: { fg: '#a57fc4' attr: 'b' }
        shape_pipe: { fg: '#a57fc4' attr: 'b' }
        shape_range: { fg: '#e9b32a' attr: 'b' }
        shape_raw_string: { fg: '#b2b5ae' attr: 'b' }
        shape_record: { fg: '#389aad' attr: 'b' }
        shape_redirection: { fg: '#a57fc4' attr: 'b' }
        shape_signature: { fg: '#7bb75b' attr: 'b' }
        shape_string: '#7bb75b'
        shape_string_interpolation: { fg: '#389aad' attr: 'b' }
        shape_table: { fg: '#4c9ad4' attr: 'b' }
        shape_vardecl: { fg: '#4c9ad4' attr: 'u' }
        shape_variable: '#a57fc4'

        foreground: '#f7f6ec'
        background: '#1e1e1e'
        cursor: '#f7f6ec'

        empty: '#4c9ad4'
        header: { fg: '#7bb75b' attr: 'b' }
        hints: '#595b59'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7bb75b' attr: 'b' }
        search_result: { fg: '#cf3f61' bg: '#fafaf6' }
        separator: '#fafaf6'
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