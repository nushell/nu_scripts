# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c795ae'
        block: '#ae95c7'
        cell-path: '#c7ccd1'
        closure: '#95aec7'
        custom: '#f3f4f5'
        duration: '#aec795'
        float: '#c7ae95'
        glob: '#f3f4f5'
        int: '#c795ae'
        list: '#95aec7'
        nothing: '#c7ae95'
        range: '#aec795'
        record: '#95aec7'
        string: '#95c7ae'

        bool: {|| if $in { '#95aec7' } else { '#aec795' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c7ae95' attr: 'b' }
            } else if $in < 6hr {
                '#c7ae95'
            } else if $in < 1day {
                '#aec795'
            } else if $in < 3day {
                '#95c7ae'
            } else if $in < 1wk {
                { fg: '#95c7ae' attr: 'b' }
            } else if $in < 6wk {
                '#95aec7'
            } else if $in < 52wk {
                '#ae95c7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c7ccd1'
            } else if $e < 1mb {
                '#95aec7'
            } else {{ fg: '#ae95c7' }}
        }

        shape_and: { fg: '#c795ae' attr: 'b' }
        shape_binary: { fg: '#c795ae' attr: 'b' }
        shape_block: { fg: '#ae95c7' attr: 'b' }
        shape_bool: '#95aec7'
        shape_closure: { fg: '#95aec7' attr: 'b' }
        shape_custom: '#95c7ae'
        shape_datetime: { fg: '#95aec7' attr: 'b' }
        shape_directory: '#95aec7'
        shape_external: '#95aec7'
        shape_external_resolved: '#95aec7'
        shape_externalarg: { fg: '#95c7ae' attr: 'b' }
        shape_filepath: '#95aec7'
        shape_flag: { fg: '#ae95c7' attr: 'b' }
        shape_float: { fg: '#c7ae95' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#95aec7' attr: 'b' }
        shape_globpattern: { fg: '#95aec7' attr: 'b' }
        shape_int: { fg: '#c795ae' attr: 'b' }
        shape_internalcall: { fg: '#95aec7' attr: 'b' }
        shape_keyword: { fg: '#c795ae' attr: 'b' }
        shape_list: { fg: '#95aec7' attr: 'b' }
        shape_literal: '#ae95c7'
        shape_match_pattern: '#95c7ae'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c7ae95'
        shape_operator: '#aec795'
        shape_or: { fg: '#c795ae' attr: 'b' }
        shape_pipe: { fg: '#c795ae' attr: 'b' }
        shape_range: { fg: '#aec795' attr: 'b' }
        shape_raw_string: { fg: '#f3f4f5' attr: 'b' }
        shape_record: { fg: '#95aec7' attr: 'b' }
        shape_redirection: { fg: '#c795ae' attr: 'b' }
        shape_signature: { fg: '#95c7ae' attr: 'b' }
        shape_string: '#95c7ae'
        shape_string_interpolation: { fg: '#95aec7' attr: 'b' }
        shape_table: { fg: '#ae95c7' attr: 'b' }
        shape_vardecl: { fg: '#ae95c7' attr: 'u' }
        shape_variable: '#c795ae'

        foreground: '#c7ccd1'
        background: '#1c2023'
        cursor: '#c7ccd1'

        empty: '#ae95c7'
        header: { fg: '#95c7ae' attr: 'b' }
        hints: '#747c84'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#95c7ae' attr: 'b' }
        search_result: { fg: '#c7ae95' bg: '#c7ccd1' }
        separator: '#c7ccd1'
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