# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c61c6f'
        block: '#2176c7'
        cell-path: '#eae3cb'
        closure: '#259286'
        custom: '#fcf4dc'
        duration: '#a57706'
        float: '#f5163b'
        glob: '#fcf4dc'
        int: '#c61c6f'
        list: '#259286'
        nothing: '#d11c24'
        range: '#a57706'
        record: '#259286'
        string: '#6cbe6c'

        bool: {|| if $in { '#00b39e' } else { '#a57706' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d11c24' attr: 'b' }
            } else if $in < 6hr {
                '#d11c24'
            } else if $in < 1day {
                '#a57706'
            } else if $in < 3day {
                '#6cbe6c'
            } else if $in < 1wk {
                { fg: '#6cbe6c' attr: 'b' }
            } else if $in < 6wk {
                '#259286'
            } else if $in < 52wk {
                '#2176c7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#eae3cb'
            } else if $e < 1mb {
                '#259286'
            } else {{ fg: '#2176c7' }}
        }

        shape_and: { fg: '#c61c6f' attr: 'b' }
        shape_binary: { fg: '#c61c6f' attr: 'b' }
        shape_block: { fg: '#2176c7' attr: 'b' }
        shape_bool: '#00b39e'
        shape_closure: { fg: '#259286' attr: 'b' }
        shape_custom: '#6cbe6c'
        shape_datetime: { fg: '#259286' attr: 'b' }
        shape_directory: '#259286'
        shape_external: '#259286'
        shape_external_resolved: '#00b39e'
        shape_externalarg: { fg: '#6cbe6c' attr: 'b' }
        shape_filepath: '#259286'
        shape_flag: { fg: '#2176c7' attr: 'b' }
        shape_float: { fg: '#f5163b' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#259286' attr: 'b' }
        shape_globpattern: { fg: '#259286' attr: 'b' }
        shape_int: { fg: '#c61c6f' attr: 'b' }
        shape_internalcall: { fg: '#259286' attr: 'b' }
        shape_keyword: { fg: '#c61c6f' attr: 'b' }
        shape_list: { fg: '#259286' attr: 'b' }
        shape_literal: '#2176c7'
        shape_match_pattern: '#6cbe6c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d11c24'
        shape_operator: '#a57706'
        shape_or: { fg: '#c61c6f' attr: 'b' }
        shape_pipe: { fg: '#c61c6f' attr: 'b' }
        shape_range: { fg: '#a57706' attr: 'b' }
        shape_raw_string: { fg: '#fcf4dc' attr: 'b' }
        shape_record: { fg: '#259286' attr: 'b' }
        shape_redirection: { fg: '#c61c6f' attr: 'b' }
        shape_signature: { fg: '#6cbe6c' attr: 'b' }
        shape_string: '#6cbe6c'
        shape_string_interpolation: { fg: '#259286' attr: 'b' }
        shape_table: { fg: '#2176c7' attr: 'b' }
        shape_vardecl: { fg: '#2176c7' attr: 'u' }
        shape_variable: '#c61c6f'

        foreground: '#9cc2c3'
        background: '#001e27'
        cursor: '#9cc2c3'

        empty: '#2176c7'
        header: { fg: '#6cbe6c' attr: 'b' }
        hints: '#006488'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6cbe6c' attr: 'b' }
        search_result: { fg: '#d11c24' bg: '#eae3cb' }
        separator: '#eae3cb'
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