# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9445ae'
        block: '#415baf'
        cell-path: '#850000'
        closure: '#008aff'
        custom: '#c9c9c9'
        duration: '#f0c75e'
        float: '#d3a624'
        glob: '#c9c9c9'
        int: '#9445ae'
        list: '#008aff'
        nothing: '#ae0000'
        range: '#f0c75e'
        record: '#008aff'
        string: '#3e7c54'

        bool: {|| if $in { '#25de50' } else { '#f0c75e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ae0000' attr: 'b' }
            } else if $in < 6hr {
                '#ae0000'
            } else if $in < 1day {
                '#f0c75e'
            } else if $in < 3day {
                '#3e7c54'
            } else if $in < 1wk {
                { fg: '#3e7c54' attr: 'b' }
            } else if $in < 6wk {
                '#008aff'
            } else if $in < 52wk {
                '#415baf'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#850000'
            } else if $e < 1mb {
                '#008aff'
            } else {{ fg: '#415baf' }}
        }

        shape_and: { fg: '#9445ae' attr: 'b' }
        shape_binary: { fg: '#9445ae' attr: 'b' }
        shape_block: { fg: '#415baf' attr: 'b' }
        shape_bool: '#25de50'
        shape_closure: { fg: '#008aff' attr: 'b' }
        shape_custom: '#3e7c54'
        shape_datetime: { fg: '#008aff' attr: 'b' }
        shape_directory: '#008aff'
        shape_external: '#008aff'
        shape_external_resolved: '#25de50'
        shape_externalarg: { fg: '#3e7c54' attr: 'b' }
        shape_filepath: '#008aff'
        shape_flag: { fg: '#415baf' attr: 'b' }
        shape_float: { fg: '#d3a624' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#008aff' attr: 'b' }
        shape_globpattern: { fg: '#008aff' attr: 'b' }
        shape_int: { fg: '#9445ae' attr: 'b' }
        shape_internalcall: { fg: '#008aff' attr: 'b' }
        shape_keyword: { fg: '#9445ae' attr: 'b' }
        shape_list: { fg: '#008aff' attr: 'b' }
        shape_literal: '#415baf'
        shape_match_pattern: '#3e7c54'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ae0000'
        shape_operator: '#f0c75e'
        shape_or: { fg: '#9445ae' attr: 'b' }
        shape_pipe: { fg: '#9445ae' attr: 'b' }
        shape_range: { fg: '#f0c75e' attr: 'b' }
        shape_raw_string: { fg: '#c9c9c9' attr: 'b' }
        shape_record: { fg: '#008aff' attr: 'b' }
        shape_redirection: { fg: '#9445ae' attr: 'b' }
        shape_signature: { fg: '#3e7c54' attr: 'b' }
        shape_string: '#3e7c54'
        shape_string_interpolation: { fg: '#008aff' attr: 'b' }
        shape_table: { fg: '#415baf' attr: 'b' }
        shape_vardecl: { fg: '#415baf' attr: 'u' }
        shape_variable: '#9445ae'

        foreground: '#c4c8c5'
        background: '#422553'
        cursor: '#c4c8c5'

        empty: '#415baf'
        header: { fg: '#3e7c54' attr: 'b' }
        hints: '#413e53'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#3e7c54' attr: 'b' }
        search_result: { fg: '#ae0000' bg: '#850000' }
        separator: '#850000'
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