# Retrieve the theme settings
export def main [] {
    return {
        binary: '#737271'
        block: '#737074'
        cell-path: '#c5c5be'
        closure: '#615f5e'
        custom: '#dadad5'
        duration: '#f3fd21'
        float: '#fff68d'
        glob: '#dadad5'
        int: '#737271'
        list: '#615f5e'
        nothing: '#e6db43'
        range: '#f3fd21'
        record: '#615f5e'
        string: '#c8be46'

        bool: {|| if $in { '#a2a2a5' } else { '#f3fd21' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e6db43' attr: 'b' }
            } else if $in < 6hr {
                '#e6db43'
            } else if $in < 1day {
                '#f3fd21'
            } else if $in < 3day {
                '#c8be46'
            } else if $in < 1wk {
                { fg: '#c8be46' attr: 'b' }
            } else if $in < 6wk {
                '#615f5e'
            } else if $in < 52wk {
                '#737074'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c5c5be'
            } else if $e < 1mb {
                '#615f5e'
            } else {{ fg: '#737074' }}
        }

        shape_and: { fg: '#737271' attr: 'b' }
        shape_binary: { fg: '#737271' attr: 'b' }
        shape_block: { fg: '#737074' attr: 'b' }
        shape_bool: '#a2a2a5'
        shape_closure: { fg: '#615f5e' attr: 'b' }
        shape_custom: '#c8be46'
        shape_datetime: { fg: '#615f5e' attr: 'b' }
        shape_directory: '#615f5e'
        shape_external: '#615f5e'
        shape_external_resolved: '#a2a2a5'
        shape_externalarg: { fg: '#c8be46' attr: 'b' }
        shape_filepath: '#615f5e'
        shape_flag: { fg: '#737074' attr: 'b' }
        shape_float: { fg: '#fff68d' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#615f5e' attr: 'b' }
        shape_globpattern: { fg: '#615f5e' attr: 'b' }
        shape_int: { fg: '#737271' attr: 'b' }
        shape_internalcall: { fg: '#615f5e' attr: 'b' }
        shape_keyword: { fg: '#737271' attr: 'b' }
        shape_list: { fg: '#615f5e' attr: 'b' }
        shape_literal: '#737074'
        shape_match_pattern: '#c8be46'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e6db43'
        shape_operator: '#f3fd21'
        shape_or: { fg: '#737271' attr: 'b' }
        shape_pipe: { fg: '#737271' attr: 'b' }
        shape_range: { fg: '#f3fd21' attr: 'b' }
        shape_raw_string: { fg: '#dadad5' attr: 'b' }
        shape_record: { fg: '#615f5e' attr: 'b' }
        shape_redirection: { fg: '#737271' attr: 'b' }
        shape_signature: { fg: '#c8be46' attr: 'b' }
        shape_string: '#c8be46'
        shape_string_interpolation: { fg: '#615f5e' attr: 'b' }
        shape_table: { fg: '#737074' attr: 'b' }
        shape_vardecl: { fg: '#737074' attr: 'u' }
        shape_variable: '#737271'

        foreground: '#6e6e6e'
        background: '#1b1d1e'
        cursor: '#fcee0b'

        empty: '#737074'
        header: { fg: '#c8be46' attr: 'b' }
        hints: '#505354'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#c8be46' attr: 'b' }
        search_result: { fg: '#e6db43' bg: '#c5c5be' }
        separator: '#c5c5be'
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