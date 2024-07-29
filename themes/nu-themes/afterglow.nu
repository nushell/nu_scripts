# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9f4e85'
        block: '#6c99bb'
        cell-path: '#d0d0d0'
        closure: '#7dd6cf'
        custom: '#f5f5f5'
        duration: '#d3a04d'
        float: '#a53c23'
        glob: '#f5f5f5'
        int: '#9f4e85'
        list: '#7dd6cf'
        nothing: '#a53c23'
        range: '#d3a04d'
        record: '#7dd6cf'
        string: '#7b9246'

        bool: {|| if $in { '#7dd6cf' } else { '#d3a04d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a53c23' attr: 'b' }
            } else if $in < 6hr {
                '#a53c23'
            } else if $in < 1day {
                '#d3a04d'
            } else if $in < 3day {
                '#7b9246'
            } else if $in < 1wk {
                { fg: '#7b9246' attr: 'b' }
            } else if $in < 6wk {
                '#7dd6cf'
            } else if $in < 52wk {
                '#6c99bb'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0d0d0'
            } else if $e < 1mb {
                '#7dd6cf'
            } else {{ fg: '#6c99bb' }}
        }

        shape_and: { fg: '#9f4e85' attr: 'b' }
        shape_binary: { fg: '#9f4e85' attr: 'b' }
        shape_block: { fg: '#6c99bb' attr: 'b' }
        shape_bool: '#7dd6cf'
        shape_closure: { fg: '#7dd6cf' attr: 'b' }
        shape_custom: '#7b9246'
        shape_datetime: { fg: '#7dd6cf' attr: 'b' }
        shape_directory: '#7dd6cf'
        shape_external: '#7dd6cf'
        shape_external_resolved: '#7dd6cf'
        shape_externalarg: { fg: '#7b9246' attr: 'b' }
        shape_filepath: '#7dd6cf'
        shape_flag: { fg: '#6c99bb' attr: 'b' }
        shape_float: { fg: '#a53c23' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#7dd6cf' attr: 'b' }
        shape_globpattern: { fg: '#7dd6cf' attr: 'b' }
        shape_int: { fg: '#9f4e85' attr: 'b' }
        shape_internalcall: { fg: '#7dd6cf' attr: 'b' }
        shape_keyword: { fg: '#9f4e85' attr: 'b' }
        shape_list: { fg: '#7dd6cf' attr: 'b' }
        shape_literal: '#6c99bb'
        shape_match_pattern: '#7b9246'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a53c23'
        shape_operator: '#d3a04d'
        shape_or: { fg: '#9f4e85' attr: 'b' }
        shape_pipe: { fg: '#9f4e85' attr: 'b' }
        shape_range: { fg: '#d3a04d' attr: 'b' }
        shape_raw_string: { fg: '#f5f5f5' attr: 'b' }
        shape_record: { fg: '#7dd6cf' attr: 'b' }
        shape_redirection: { fg: '#9f4e85' attr: 'b' }
        shape_signature: { fg: '#7b9246' attr: 'b' }
        shape_string: '#7b9246'
        shape_string_interpolation: { fg: '#7dd6cf' attr: 'b' }
        shape_table: { fg: '#6c99bb' attr: 'b' }
        shape_vardecl: { fg: '#6c99bb' attr: 'u' }
        shape_variable: '#9f4e85'

        foreground: '#d0d0d0'
        background: '#222222'
        cursor: '#d0d0d0'

        empty: '#6c99bb'
        header: { fg: '#7b9246' attr: 'b' }
        hints: '#505050'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7b9246' attr: 'b' }
        search_result: { fg: '#a53c23' bg: '#d0d0d0' }
        separator: '#d0d0d0'
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