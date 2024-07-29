# Retrieve the theme settings
export def main [] {
    return {
        binary: '#4700a5'
        block: '#0000d3'
        cell-path: '#c0c0c0'
        closure: '#02abea'
        custom: '#ffffff'
        duration: '#fbf305'
        float: '#dd0907'
        glob: '#ffffff'
        int: '#4700a5'
        list: '#02abea'
        nothing: '#dd0907'
        range: '#fbf305'
        record: '#02abea'
        string: '#1fb714'

        bool: {|| if $in { '#02abea' } else { '#fbf305' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#dd0907' attr: 'b' }
            } else if $in < 6hr {
                '#dd0907'
            } else if $in < 1day {
                '#fbf305'
            } else if $in < 3day {
                '#1fb714'
            } else if $in < 1wk {
                { fg: '#1fb714' attr: 'b' }
            } else if $in < 6wk {
                '#02abea'
            } else if $in < 52wk {
                '#0000d3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c0c0c0'
            } else if $e < 1mb {
                '#02abea'
            } else {{ fg: '#0000d3' }}
        }

        shape_and: { fg: '#4700a5' attr: 'b' }
        shape_binary: { fg: '#4700a5' attr: 'b' }
        shape_block: { fg: '#0000d3' attr: 'b' }
        shape_bool: '#02abea'
        shape_closure: { fg: '#02abea' attr: 'b' }
        shape_custom: '#1fb714'
        shape_datetime: { fg: '#02abea' attr: 'b' }
        shape_directory: '#02abea'
        shape_external: '#02abea'
        shape_external_resolved: '#02abea'
        shape_externalarg: { fg: '#1fb714' attr: 'b' }
        shape_filepath: '#02abea'
        shape_flag: { fg: '#0000d3' attr: 'b' }
        shape_float: { fg: '#dd0907' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#02abea' attr: 'b' }
        shape_globpattern: { fg: '#02abea' attr: 'b' }
        shape_int: { fg: '#4700a5' attr: 'b' }
        shape_internalcall: { fg: '#02abea' attr: 'b' }
        shape_keyword: { fg: '#4700a5' attr: 'b' }
        shape_list: { fg: '#02abea' attr: 'b' }
        shape_literal: '#0000d3'
        shape_match_pattern: '#1fb714'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#dd0907'
        shape_operator: '#fbf305'
        shape_or: { fg: '#4700a5' attr: 'b' }
        shape_pipe: { fg: '#4700a5' attr: 'b' }
        shape_range: { fg: '#fbf305' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#02abea' attr: 'b' }
        shape_redirection: { fg: '#4700a5' attr: 'b' }
        shape_signature: { fg: '#1fb714' attr: 'b' }
        shape_string: '#1fb714'
        shape_string_interpolation: { fg: '#02abea' attr: 'b' }
        shape_table: { fg: '#0000d3' attr: 'b' }
        shape_vardecl: { fg: '#0000d3' attr: 'u' }
        shape_variable: '#4700a5'

        foreground: '#c0c0c0'
        background: '#000000'
        cursor: '#c0c0c0'

        empty: '#0000d3'
        header: { fg: '#1fb714' attr: 'b' }
        hints: '#808080'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#1fb714' attr: 'b' }
        search_result: { fg: '#dd0907' bg: '#c0c0c0' }
        separator: '#c0c0c0'
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