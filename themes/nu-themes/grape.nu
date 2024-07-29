# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8d35c9'
        block: '#487df4'
        cell-path: '#9e9ea0'
        closure: '#3bdeed'
        custom: '#a288f7'
        duration: '#8ddc20'
        float: '#f0729a'
        glob: '#a288f7'
        int: '#8d35c9'
        list: '#3bdeed'
        nothing: '#ed2261'
        range: '#8ddc20'
        record: '#3bdeed'
        string: '#1fa91b'

        bool: {|| if $in { '#9de3eb' } else { '#8ddc20' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ed2261' attr: 'b' }
            } else if $in < 6hr {
                '#ed2261'
            } else if $in < 1day {
                '#8ddc20'
            } else if $in < 3day {
                '#1fa91b'
            } else if $in < 1wk {
                { fg: '#1fa91b' attr: 'b' }
            } else if $in < 6wk {
                '#3bdeed'
            } else if $in < 52wk {
                '#487df4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#9e9ea0'
            } else if $e < 1mb {
                '#3bdeed'
            } else {{ fg: '#487df4' }}
        }

        shape_and: { fg: '#8d35c9' attr: 'b' }
        shape_binary: { fg: '#8d35c9' attr: 'b' }
        shape_block: { fg: '#487df4' attr: 'b' }
        shape_bool: '#9de3eb'
        shape_closure: { fg: '#3bdeed' attr: 'b' }
        shape_custom: '#1fa91b'
        shape_datetime: { fg: '#3bdeed' attr: 'b' }
        shape_directory: '#3bdeed'
        shape_external: '#3bdeed'
        shape_external_resolved: '#9de3eb'
        shape_externalarg: { fg: '#1fa91b' attr: 'b' }
        shape_filepath: '#3bdeed'
        shape_flag: { fg: '#487df4' attr: 'b' }
        shape_float: { fg: '#f0729a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3bdeed' attr: 'b' }
        shape_globpattern: { fg: '#3bdeed' attr: 'b' }
        shape_int: { fg: '#8d35c9' attr: 'b' }
        shape_internalcall: { fg: '#3bdeed' attr: 'b' }
        shape_keyword: { fg: '#8d35c9' attr: 'b' }
        shape_list: { fg: '#3bdeed' attr: 'b' }
        shape_literal: '#487df4'
        shape_match_pattern: '#1fa91b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ed2261'
        shape_operator: '#8ddc20'
        shape_or: { fg: '#8d35c9' attr: 'b' }
        shape_pipe: { fg: '#8d35c9' attr: 'b' }
        shape_range: { fg: '#8ddc20' attr: 'b' }
        shape_raw_string: { fg: '#a288f7' attr: 'b' }
        shape_record: { fg: '#3bdeed' attr: 'b' }
        shape_redirection: { fg: '#8d35c9' attr: 'b' }
        shape_signature: { fg: '#1fa91b' attr: 'b' }
        shape_string: '#1fa91b'
        shape_string_interpolation: { fg: '#3bdeed' attr: 'b' }
        shape_table: { fg: '#487df4' attr: 'b' }
        shape_vardecl: { fg: '#487df4' attr: 'u' }
        shape_variable: '#8d35c9'

        foreground: '#9f9fa1'
        background: '#171423'
        cursor: '#9f9fa1'

        empty: '#487df4'
        header: { fg: '#1fa91b' attr: 'b' }
        hints: '#59516a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#1fa91b' attr: 'b' }
        search_result: { fg: '#ed2261' bg: '#9e9ea0' }
        separator: '#9e9ea0'
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