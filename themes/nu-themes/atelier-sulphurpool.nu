# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6679cc'
        block: '#3d8fd1'
        cell-path: '#979db4'
        closure: '#22a2c9'
        custom: '#f5f7ff'
        duration: '#c08b30'
        float: '#c94922'
        glob: '#f5f7ff'
        int: '#6679cc'
        list: '#22a2c9'
        nothing: '#c94922'
        range: '#c08b30'
        record: '#22a2c9'
        string: '#ac9739'

        bool: {|| if $in { '#22a2c9' } else { '#c08b30' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c94922' attr: 'b' }
            } else if $in < 6hr {
                '#c94922'
            } else if $in < 1day {
                '#c08b30'
            } else if $in < 3day {
                '#ac9739'
            } else if $in < 1wk {
                { fg: '#ac9739' attr: 'b' }
            } else if $in < 6wk {
                '#22a2c9'
            } else if $in < 52wk {
                '#3d8fd1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#979db4'
            } else if $e < 1mb {
                '#22a2c9'
            } else {{ fg: '#3d8fd1' }}
        }

        shape_and: { fg: '#6679cc' attr: 'b' }
        shape_binary: { fg: '#6679cc' attr: 'b' }
        shape_block: { fg: '#3d8fd1' attr: 'b' }
        shape_bool: '#22a2c9'
        shape_closure: { fg: '#22a2c9' attr: 'b' }
        shape_custom: '#ac9739'
        shape_datetime: { fg: '#22a2c9' attr: 'b' }
        shape_directory: '#22a2c9'
        shape_external: '#22a2c9'
        shape_external_resolved: '#22a2c9'
        shape_externalarg: { fg: '#ac9739' attr: 'b' }
        shape_filepath: '#22a2c9'
        shape_flag: { fg: '#3d8fd1' attr: 'b' }
        shape_float: { fg: '#c94922' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#22a2c9' attr: 'b' }
        shape_globpattern: { fg: '#22a2c9' attr: 'b' }
        shape_int: { fg: '#6679cc' attr: 'b' }
        shape_internalcall: { fg: '#22a2c9' attr: 'b' }
        shape_keyword: { fg: '#6679cc' attr: 'b' }
        shape_list: { fg: '#22a2c9' attr: 'b' }
        shape_literal: '#3d8fd1'
        shape_match_pattern: '#ac9739'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c94922'
        shape_operator: '#c08b30'
        shape_or: { fg: '#6679cc' attr: 'b' }
        shape_pipe: { fg: '#6679cc' attr: 'b' }
        shape_range: { fg: '#c08b30' attr: 'b' }
        shape_raw_string: { fg: '#f5f7ff' attr: 'b' }
        shape_record: { fg: '#22a2c9' attr: 'b' }
        shape_redirection: { fg: '#6679cc' attr: 'b' }
        shape_signature: { fg: '#ac9739' attr: 'b' }
        shape_string: '#ac9739'
        shape_string_interpolation: { fg: '#22a2c9' attr: 'b' }
        shape_table: { fg: '#3d8fd1' attr: 'b' }
        shape_vardecl: { fg: '#3d8fd1' attr: 'u' }
        shape_variable: '#6679cc'

        foreground: '#979db4'
        background: '#202746'
        cursor: '#979db4'

        empty: '#3d8fd1'
        header: { fg: '#ac9739' attr: 'b' }
        hints: '#6b7394'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#ac9739' attr: 'b' }
        search_result: { fg: '#c94922' bg: '#979db4' }
        separator: '#979db4'
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