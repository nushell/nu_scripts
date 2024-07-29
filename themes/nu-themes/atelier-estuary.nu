# Retrieve the theme settings
export def main [] {
    return {
        binary: '#5f9182'
        block: '#36a166'
        cell-path: '#929181'
        closure: '#5b9d48'
        custom: '#f4f3ec'
        duration: '#a5980d'
        float: '#ba6236'
        glob: '#f4f3ec'
        int: '#5f9182'
        list: '#5b9d48'
        nothing: '#ba6236'
        range: '#a5980d'
        record: '#5b9d48'
        string: '#7d9726'

        bool: {|| if $in { '#5b9d48' } else { '#a5980d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ba6236' attr: 'b' }
            } else if $in < 6hr {
                '#ba6236'
            } else if $in < 1day {
                '#a5980d'
            } else if $in < 3day {
                '#7d9726'
            } else if $in < 1wk {
                { fg: '#7d9726' attr: 'b' }
            } else if $in < 6wk {
                '#5b9d48'
            } else if $in < 52wk {
                '#36a166'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#929181'
            } else if $e < 1mb {
                '#5b9d48'
            } else {{ fg: '#36a166' }}
        }

        shape_and: { fg: '#5f9182' attr: 'b' }
        shape_binary: { fg: '#5f9182' attr: 'b' }
        shape_block: { fg: '#36a166' attr: 'b' }
        shape_bool: '#5b9d48'
        shape_closure: { fg: '#5b9d48' attr: 'b' }
        shape_custom: '#7d9726'
        shape_datetime: { fg: '#5b9d48' attr: 'b' }
        shape_directory: '#5b9d48'
        shape_external: '#5b9d48'
        shape_external_resolved: '#5b9d48'
        shape_externalarg: { fg: '#7d9726' attr: 'b' }
        shape_filepath: '#5b9d48'
        shape_flag: { fg: '#36a166' attr: 'b' }
        shape_float: { fg: '#ba6236' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5b9d48' attr: 'b' }
        shape_globpattern: { fg: '#5b9d48' attr: 'b' }
        shape_int: { fg: '#5f9182' attr: 'b' }
        shape_internalcall: { fg: '#5b9d48' attr: 'b' }
        shape_keyword: { fg: '#5f9182' attr: 'b' }
        shape_list: { fg: '#5b9d48' attr: 'b' }
        shape_literal: '#36a166'
        shape_match_pattern: '#7d9726'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ba6236'
        shape_operator: '#a5980d'
        shape_or: { fg: '#5f9182' attr: 'b' }
        shape_pipe: { fg: '#5f9182' attr: 'b' }
        shape_range: { fg: '#a5980d' attr: 'b' }
        shape_raw_string: { fg: '#f4f3ec' attr: 'b' }
        shape_record: { fg: '#5b9d48' attr: 'b' }
        shape_redirection: { fg: '#5f9182' attr: 'b' }
        shape_signature: { fg: '#7d9726' attr: 'b' }
        shape_string: '#7d9726'
        shape_string_interpolation: { fg: '#5b9d48' attr: 'b' }
        shape_table: { fg: '#36a166' attr: 'b' }
        shape_vardecl: { fg: '#36a166' attr: 'u' }
        shape_variable: '#5f9182'

        foreground: '#929181'
        background: '#22221b'
        cursor: '#929181'

        empty: '#36a166'
        header: { fg: '#7d9726' attr: 'b' }
        hints: '#6c6b5a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7d9726' attr: 'b' }
        search_result: { fg: '#ba6236' bg: '#929181' }
        separator: '#929181'
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