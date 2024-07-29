# Retrieve the theme settings
export def main [] {
    return {
        binary: '#cc84ad'
        block: '#609fda'
        cell-path: '#919ab9'
        closure: '#3dab95'
        custom: '#a0abae'
        duration: '#af9a0a'
        float: '#eb7b4d'
        glob: '#a0abae'
        int: '#cc84ad'
        list: '#3dab95'
        nothing: '#f76f6e'
        range: '#af9a0a'
        record: '#3dab95'
        string: '#4eac6d'

        bool: {|| if $in { '#2aa9b6' } else { '#af9a0a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f76f6e' attr: 'b' }
            } else if $in < 6hr {
                '#f76f6e'
            } else if $in < 1day {
                '#af9a0a'
            } else if $in < 3day {
                '#4eac6d'
            } else if $in < 1wk {
                { fg: '#4eac6d' attr: 'b' }
            } else if $in < 6wk {
                '#3dab95'
            } else if $in < 52wk {
                '#609fda'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#919ab9'
            } else if $e < 1mb {
                '#3dab95'
            } else {{ fg: '#609fda' }}
        }

        shape_and: { fg: '#cc84ad' attr: 'b' }
        shape_binary: { fg: '#cc84ad' attr: 'b' }
        shape_block: { fg: '#609fda' attr: 'b' }
        shape_bool: '#2aa9b6'
        shape_closure: { fg: '#3dab95' attr: 'b' }
        shape_custom: '#4eac6d'
        shape_datetime: { fg: '#3dab95' attr: 'b' }
        shape_directory: '#3dab95'
        shape_external: '#3dab95'
        shape_external_resolved: '#2aa9b6'
        shape_externalarg: { fg: '#4eac6d' attr: 'b' }
        shape_filepath: '#3dab95'
        shape_flag: { fg: '#609fda' attr: 'b' }
        shape_float: { fg: '#eb7b4d' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3dab95' attr: 'b' }
        shape_globpattern: { fg: '#3dab95' attr: 'b' }
        shape_int: { fg: '#cc84ad' attr: 'b' }
        shape_internalcall: { fg: '#3dab95' attr: 'b' }
        shape_keyword: { fg: '#cc84ad' attr: 'b' }
        shape_list: { fg: '#3dab95' attr: 'b' }
        shape_literal: '#609fda'
        shape_match_pattern: '#4eac6d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f76f6e'
        shape_operator: '#af9a0a'
        shape_or: { fg: '#cc84ad' attr: 'b' }
        shape_pipe: { fg: '#cc84ad' attr: 'b' }
        shape_range: { fg: '#af9a0a' attr: 'b' }
        shape_raw_string: { fg: '#a0abae' attr: 'b' }
        shape_record: { fg: '#3dab95' attr: 'b' }
        shape_redirection: { fg: '#cc84ad' attr: 'b' }
        shape_signature: { fg: '#4eac6d' attr: 'b' }
        shape_string: '#4eac6d'
        shape_string_interpolation: { fg: '#3dab95' attr: 'b' }
        shape_table: { fg: '#609fda' attr: 'b' }
        shape_vardecl: { fg: '#609fda' attr: 'u' }
        shape_variable: '#cc84ad'

        foreground: '#a0abae'
        background: '#202c3d'
        cursor: '#a0abae'

        empty: '#609fda'
        header: { fg: '#4eac6d' attr: 'b' }
        hints: '#352f49'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#4eac6d' attr: 'b' }
        search_result: { fg: '#f76f6e' bg: '#919ab9' }
        separator: '#919ab9'
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