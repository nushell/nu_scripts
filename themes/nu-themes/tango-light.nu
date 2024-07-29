# Retrieve the theme settings
export def main [] {
    return {
        binary: '#74507a'
        block: '#3464a4'
        cell-path: '#d3d7cf'
        closure: '#05989a'
        custom: '#ededec'
        duration: '#c4a000'
        float: '#ef2828'
        glob: '#ededec'
        int: '#74507a'
        list: '#05989a'
        nothing: '#cc0000'
        range: '#c4a000'
        record: '#05989a'
        string: '#4e9a05'

        bool: {|| if $in { '#34e2e2' } else { '#c4a000' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cc0000' attr: 'b' }
            } else if $in < 6hr {
                '#cc0000'
            } else if $in < 1day {
                '#c4a000'
            } else if $in < 3day {
                '#4e9a05'
            } else if $in < 1wk {
                { fg: '#4e9a05' attr: 'b' }
            } else if $in < 6wk {
                '#05989a'
            } else if $in < 52wk {
                '#3464a4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d3d7cf'
            } else if $e < 1mb {
                '#05989a'
            } else {{ fg: '#3464a4' }}
        }

        shape_and: { fg: '#74507a' attr: 'b' }
        shape_binary: { fg: '#74507a' attr: 'b' }
        shape_block: { fg: '#3464a4' attr: 'b' }
        shape_bool: '#34e2e2'
        shape_closure: { fg: '#05989a' attr: 'b' }
        shape_custom: '#4e9a05'
        shape_datetime: { fg: '#05989a' attr: 'b' }
        shape_directory: '#05989a'
        shape_external: '#05989a'
        shape_external_resolved: '#34e2e2'
        shape_externalarg: { fg: '#4e9a05' attr: 'b' }
        shape_filepath: '#05989a'
        shape_flag: { fg: '#3464a4' attr: 'b' }
        shape_float: { fg: '#ef2828' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#05989a' attr: 'b' }
        shape_globpattern: { fg: '#05989a' attr: 'b' }
        shape_int: { fg: '#74507a' attr: 'b' }
        shape_internalcall: { fg: '#05989a' attr: 'b' }
        shape_keyword: { fg: '#74507a' attr: 'b' }
        shape_list: { fg: '#05989a' attr: 'b' }
        shape_literal: '#3464a4'
        shape_match_pattern: '#4e9a05'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cc0000'
        shape_operator: '#c4a000'
        shape_or: { fg: '#74507a' attr: 'b' }
        shape_pipe: { fg: '#74507a' attr: 'b' }
        shape_range: { fg: '#c4a000' attr: 'b' }
        shape_raw_string: { fg: '#ededec' attr: 'b' }
        shape_record: { fg: '#05989a' attr: 'b' }
        shape_redirection: { fg: '#74507a' attr: 'b' }
        shape_signature: { fg: '#4e9a05' attr: 'b' }
        shape_string: '#4e9a05'
        shape_string_interpolation: { fg: '#05989a' attr: 'b' }
        shape_table: { fg: '#3464a4' attr: 'b' }
        shape_vardecl: { fg: '#3464a4' attr: 'u' }
        shape_variable: '#74507a'

        foreground: '#000000'
        background: '#ffffff'
        cursor: '#000000'

        empty: '#3464a4'
        header: { fg: '#4e9a05' attr: 'b' }
        hints: '#545753'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#4e9a05' attr: 'b' }
        search_result: { fg: '#cc0000' bg: '#d3d7cf' }
        separator: '#d3d7cf'
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