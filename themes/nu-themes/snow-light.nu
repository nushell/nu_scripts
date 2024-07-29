# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8f63a2'
        block: '#2b7ab2'
        cell-path: '#535c65'
        closure: '#008483'
        custom: '#434951'
        duration: '#906c33'
        float: '#ae5865'
        glob: '#434951'
        int: '#8f63a2'
        list: '#008483'
        nothing: '#ae5865'
        range: '#906c33'
        record: '#008483'
        string: '#4d7f43'

        bool: {|| if $in { '#008483' } else { '#906c33' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ae5865' attr: 'b' }
            } else if $in < 6hr {
                '#ae5865'
            } else if $in < 1day {
                '#906c33'
            } else if $in < 3day {
                '#4d7f43'
            } else if $in < 1wk {
                { fg: '#4d7f43' attr: 'b' }
            } else if $in < 6wk {
                '#008483'
            } else if $in < 52wk {
                '#2b7ab2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#535c65'
            } else if $e < 1mb {
                '#008483'
            } else {{ fg: '#2b7ab2' }}
        }

        shape_and: { fg: '#8f63a2' attr: 'b' }
        shape_binary: { fg: '#8f63a2' attr: 'b' }
        shape_block: { fg: '#2b7ab2' attr: 'b' }
        shape_bool: '#008483'
        shape_closure: { fg: '#008483' attr: 'b' }
        shape_custom: '#4d7f43'
        shape_datetime: { fg: '#008483' attr: 'b' }
        shape_directory: '#008483'
        shape_external: '#008483'
        shape_external_resolved: '#008483'
        shape_externalarg: { fg: '#4d7f43' attr: 'b' }
        shape_filepath: '#008483'
        shape_flag: { fg: '#2b7ab2' attr: 'b' }
        shape_float: { fg: '#ae5865' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#008483' attr: 'b' }
        shape_globpattern: { fg: '#008483' attr: 'b' }
        shape_int: { fg: '#8f63a2' attr: 'b' }
        shape_internalcall: { fg: '#008483' attr: 'b' }
        shape_keyword: { fg: '#8f63a2' attr: 'b' }
        shape_list: { fg: '#008483' attr: 'b' }
        shape_literal: '#2b7ab2'
        shape_match_pattern: '#4d7f43'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ae5865'
        shape_operator: '#906c33'
        shape_or: { fg: '#8f63a2' attr: 'b' }
        shape_pipe: { fg: '#8f63a2' attr: 'b' }
        shape_range: { fg: '#906c33' attr: 'b' }
        shape_raw_string: { fg: '#434951' attr: 'b' }
        shape_record: { fg: '#008483' attr: 'b' }
        shape_redirection: { fg: '#8f63a2' attr: 'b' }
        shape_signature: { fg: '#4d7f43' attr: 'b' }
        shape_string: '#4d7f43'
        shape_string_interpolation: { fg: '#008483' attr: 'b' }
        shape_table: { fg: '#2b7ab2' attr: 'b' }
        shape_vardecl: { fg: '#2b7ab2' attr: 'u' }
        shape_variable: '#8f63a2'

        foreground: '#535c65'
        background: '#fbffff'
        cursor: '#434951'

        empty: '#2b7ab2'
        header: { fg: '#4d7f43' attr: 'b' }
        hints: '#6d7782'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#4d7f43' attr: 'b' }
        search_result: { fg: '#ae5865' bg: '#535c65' }
        separator: '#535c65'
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