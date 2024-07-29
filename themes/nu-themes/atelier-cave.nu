# Retrieve the theme settings
export def main [] {
    return {
        binary: '#955ae7'
        block: '#576ddb'
        cell-path: '#8b8792'
        closure: '#398bc6'
        custom: '#efecf4'
        duration: '#a06e3b'
        float: '#be4678'
        glob: '#efecf4'
        int: '#955ae7'
        list: '#398bc6'
        nothing: '#be4678'
        range: '#a06e3b'
        record: '#398bc6'
        string: '#2a9292'

        bool: {|| if $in { '#398bc6' } else { '#a06e3b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#be4678' attr: 'b' }
            } else if $in < 6hr {
                '#be4678'
            } else if $in < 1day {
                '#a06e3b'
            } else if $in < 3day {
                '#2a9292'
            } else if $in < 1wk {
                { fg: '#2a9292' attr: 'b' }
            } else if $in < 6wk {
                '#398bc6'
            } else if $in < 52wk {
                '#576ddb'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#8b8792'
            } else if $e < 1mb {
                '#398bc6'
            } else {{ fg: '#576ddb' }}
        }

        shape_and: { fg: '#955ae7' attr: 'b' }
        shape_binary: { fg: '#955ae7' attr: 'b' }
        shape_block: { fg: '#576ddb' attr: 'b' }
        shape_bool: '#398bc6'
        shape_closure: { fg: '#398bc6' attr: 'b' }
        shape_custom: '#2a9292'
        shape_datetime: { fg: '#398bc6' attr: 'b' }
        shape_directory: '#398bc6'
        shape_external: '#398bc6'
        shape_external_resolved: '#398bc6'
        shape_externalarg: { fg: '#2a9292' attr: 'b' }
        shape_filepath: '#398bc6'
        shape_flag: { fg: '#576ddb' attr: 'b' }
        shape_float: { fg: '#be4678' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#398bc6' attr: 'b' }
        shape_globpattern: { fg: '#398bc6' attr: 'b' }
        shape_int: { fg: '#955ae7' attr: 'b' }
        shape_internalcall: { fg: '#398bc6' attr: 'b' }
        shape_keyword: { fg: '#955ae7' attr: 'b' }
        shape_list: { fg: '#398bc6' attr: 'b' }
        shape_literal: '#576ddb'
        shape_match_pattern: '#2a9292'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#be4678'
        shape_operator: '#a06e3b'
        shape_or: { fg: '#955ae7' attr: 'b' }
        shape_pipe: { fg: '#955ae7' attr: 'b' }
        shape_range: { fg: '#a06e3b' attr: 'b' }
        shape_raw_string: { fg: '#efecf4' attr: 'b' }
        shape_record: { fg: '#398bc6' attr: 'b' }
        shape_redirection: { fg: '#955ae7' attr: 'b' }
        shape_signature: { fg: '#2a9292' attr: 'b' }
        shape_string: '#2a9292'
        shape_string_interpolation: { fg: '#398bc6' attr: 'b' }
        shape_table: { fg: '#576ddb' attr: 'b' }
        shape_vardecl: { fg: '#576ddb' attr: 'u' }
        shape_variable: '#955ae7'

        foreground: '#8b8792'
        background: '#19171c'
        cursor: '#8b8792'

        empty: '#576ddb'
        header: { fg: '#2a9292' attr: 'b' }
        hints: '#655f6d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#2a9292' attr: 'b' }
        search_result: { fg: '#be4678' bg: '#8b8792' }
        separator: '#8b8792'
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