# Retrieve the theme settings
export def main [] {
    return {
        binary: '#cfbafa'
        block: '#6dcbfa'
        cell-path: '#c7c7c7'
        closure: '#90e1c6'
        custom: '#ffffff'
        duration: '#fad07b'
        float: '#f28779'
        glob: '#ffffff'
        int: '#cfbafa'
        list: '#90e1c6'
        nothing: '#ed8274'
        range: '#fad07b'
        record: '#90e1c6'
        string: '#a6cc70'

        bool: {|| if $in { '#95e6cb' } else { '#fad07b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ed8274' attr: 'b' }
            } else if $in < 6hr {
                '#ed8274'
            } else if $in < 1day {
                '#fad07b'
            } else if $in < 3day {
                '#a6cc70'
            } else if $in < 1wk {
                { fg: '#a6cc70' attr: 'b' }
            } else if $in < 6wk {
                '#90e1c6'
            } else if $in < 52wk {
                '#6dcbfa'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c7c7c7'
            } else if $e < 1mb {
                '#90e1c6'
            } else {{ fg: '#6dcbfa' }}
        }

        shape_and: { fg: '#cfbafa' attr: 'b' }
        shape_binary: { fg: '#cfbafa' attr: 'b' }
        shape_block: { fg: '#6dcbfa' attr: 'b' }
        shape_bool: '#95e6cb'
        shape_closure: { fg: '#90e1c6' attr: 'b' }
        shape_custom: '#a6cc70'
        shape_datetime: { fg: '#90e1c6' attr: 'b' }
        shape_directory: '#90e1c6'
        shape_external: '#90e1c6'
        shape_external_resolved: '#95e6cb'
        shape_externalarg: { fg: '#a6cc70' attr: 'b' }
        shape_filepath: '#90e1c6'
        shape_flag: { fg: '#6dcbfa' attr: 'b' }
        shape_float: { fg: '#f28779' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#90e1c6' attr: 'b' }
        shape_globpattern: { fg: '#90e1c6' attr: 'b' }
        shape_int: { fg: '#cfbafa' attr: 'b' }
        shape_internalcall: { fg: '#90e1c6' attr: 'b' }
        shape_keyword: { fg: '#cfbafa' attr: 'b' }
        shape_list: { fg: '#90e1c6' attr: 'b' }
        shape_literal: '#6dcbfa'
        shape_match_pattern: '#a6cc70'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ed8274'
        shape_operator: '#fad07b'
        shape_or: { fg: '#cfbafa' attr: 'b' }
        shape_pipe: { fg: '#cfbafa' attr: 'b' }
        shape_range: { fg: '#fad07b' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#90e1c6' attr: 'b' }
        shape_redirection: { fg: '#cfbafa' attr: 'b' }
        shape_signature: { fg: '#a6cc70' attr: 'b' }
        shape_string: '#a6cc70'
        shape_string_interpolation: { fg: '#90e1c6' attr: 'b' }
        shape_table: { fg: '#6dcbfa' attr: 'b' }
        shape_vardecl: { fg: '#6dcbfa' attr: 'u' }
        shape_variable: '#cfbafa'

        foreground: '#d9d7ce'
        background: '#212733'
        cursor: '#d9d7ce'

        empty: '#6dcbfa'
        header: { fg: '#a6cc70' attr: 'b' }
        hints: '#686868'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a6cc70' attr: 'b' }
        search_result: { fg: '#ed8274' bg: '#c7c7c7' }
        separator: '#c7c7c7'
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