# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d0633d'
        block: '#1398b9'
        cell-path: '#e5c6aa'
        closure: '#509552'
        custom: '#f6f7ec'
        duration: '#f5ae2e'
        float: '#ff645a'
        glob: '#f6f7ec'
        int: '#d0633d'
        list: '#509552'
        nothing: '#c94234'
        range: '#f5ae2e'
        record: '#509552'
        string: '#85c54c'

        bool: {|| if $in { '#84f088' } else { '#f5ae2e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c94234' attr: 'b' }
            } else if $in < 6hr {
                '#c94234'
            } else if $in < 1day {
                '#f5ae2e'
            } else if $in < 3day {
                '#85c54c'
            } else if $in < 1wk {
                { fg: '#85c54c' attr: 'b' }
            } else if $in < 6wk {
                '#509552'
            } else if $in < 52wk {
                '#1398b9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e5c6aa'
            } else if $e < 1mb {
                '#509552'
            } else {{ fg: '#1398b9' }}
        }

        shape_and: { fg: '#d0633d' attr: 'b' }
        shape_binary: { fg: '#d0633d' attr: 'b' }
        shape_block: { fg: '#1398b9' attr: 'b' }
        shape_bool: '#84f088'
        shape_closure: { fg: '#509552' attr: 'b' }
        shape_custom: '#85c54c'
        shape_datetime: { fg: '#509552' attr: 'b' }
        shape_directory: '#509552'
        shape_external: '#509552'
        shape_external_resolved: '#84f088'
        shape_externalarg: { fg: '#85c54c' attr: 'b' }
        shape_filepath: '#509552'
        shape_flag: { fg: '#1398b9' attr: 'b' }
        shape_float: { fg: '#ff645a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#509552' attr: 'b' }
        shape_globpattern: { fg: '#509552' attr: 'b' }
        shape_int: { fg: '#d0633d' attr: 'b' }
        shape_internalcall: { fg: '#509552' attr: 'b' }
        shape_keyword: { fg: '#d0633d' attr: 'b' }
        shape_list: { fg: '#509552' attr: 'b' }
        shape_literal: '#1398b9'
        shape_match_pattern: '#85c54c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c94234'
        shape_operator: '#f5ae2e'
        shape_or: { fg: '#d0633d' attr: 'b' }
        shape_pipe: { fg: '#d0633d' attr: 'b' }
        shape_range: { fg: '#f5ae2e' attr: 'b' }
        shape_raw_string: { fg: '#f6f7ec' attr: 'b' }
        shape_record: { fg: '#509552' attr: 'b' }
        shape_redirection: { fg: '#d0633d' attr: 'b' }
        shape_signature: { fg: '#85c54c' attr: 'b' }
        shape_string: '#85c54c'
        shape_string_interpolation: { fg: '#509552' attr: 'b' }
        shape_table: { fg: '#1398b9' attr: 'b' }
        shape_vardecl: { fg: '#1398b9' attr: 'u' }
        shape_variable: '#d0633d'

        foreground: '#e5c7a9'
        background: '#292520'
        cursor: '#e5c7a9'

        empty: '#1398b9'
        header: { fg: '#85c54c' attr: 'b' }
        hints: '#675f54'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#85c54c' attr: 'b' }
        search_result: { fg: '#c94234' bg: '#e5c6aa' }
        separator: '#e5c6aa'
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