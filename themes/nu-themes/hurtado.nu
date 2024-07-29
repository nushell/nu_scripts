# Retrieve the theme settings
export def main [] {
    return {
        binary: '#fd5ff1'
        block: '#496487'
        cell-path: '#cbcccb'
        closure: '#86e9fe'
        custom: '#dbdbdb'
        duration: '#fbe74a'
        float: '#d51d00'
        glob: '#dbdbdb'
        int: '#fd5ff1'
        list: '#86e9fe'
        nothing: '#ff1b00'
        range: '#fbe74a'
        record: '#86e9fe'
        string: '#a5e055'

        bool: {|| if $in { '#86eafe' } else { '#fbe74a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff1b00' attr: 'b' }
            } else if $in < 6hr {
                '#ff1b00'
            } else if $in < 1day {
                '#fbe74a'
            } else if $in < 3day {
                '#a5e055'
            } else if $in < 1wk {
                { fg: '#a5e055' attr: 'b' }
            } else if $in < 6wk {
                '#86e9fe'
            } else if $in < 52wk {
                '#496487'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cbcccb'
            } else if $e < 1mb {
                '#86e9fe'
            } else {{ fg: '#496487' }}
        }

        shape_and: { fg: '#fd5ff1' attr: 'b' }
        shape_binary: { fg: '#fd5ff1' attr: 'b' }
        shape_block: { fg: '#496487' attr: 'b' }
        shape_bool: '#86eafe'
        shape_closure: { fg: '#86e9fe' attr: 'b' }
        shape_custom: '#a5e055'
        shape_datetime: { fg: '#86e9fe' attr: 'b' }
        shape_directory: '#86e9fe'
        shape_external: '#86e9fe'
        shape_external_resolved: '#86eafe'
        shape_externalarg: { fg: '#a5e055' attr: 'b' }
        shape_filepath: '#86e9fe'
        shape_flag: { fg: '#496487' attr: 'b' }
        shape_float: { fg: '#d51d00' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#86e9fe' attr: 'b' }
        shape_globpattern: { fg: '#86e9fe' attr: 'b' }
        shape_int: { fg: '#fd5ff1' attr: 'b' }
        shape_internalcall: { fg: '#86e9fe' attr: 'b' }
        shape_keyword: { fg: '#fd5ff1' attr: 'b' }
        shape_list: { fg: '#86e9fe' attr: 'b' }
        shape_literal: '#496487'
        shape_match_pattern: '#a5e055'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff1b00'
        shape_operator: '#fbe74a'
        shape_or: { fg: '#fd5ff1' attr: 'b' }
        shape_pipe: { fg: '#fd5ff1' attr: 'b' }
        shape_range: { fg: '#fbe74a' attr: 'b' }
        shape_raw_string: { fg: '#dbdbdb' attr: 'b' }
        shape_record: { fg: '#86e9fe' attr: 'b' }
        shape_redirection: { fg: '#fd5ff1' attr: 'b' }
        shape_signature: { fg: '#a5e055' attr: 'b' }
        shape_string: '#a5e055'
        shape_string_interpolation: { fg: '#86e9fe' attr: 'b' }
        shape_table: { fg: '#496487' attr: 'b' }
        shape_vardecl: { fg: '#496487' attr: 'u' }
        shape_variable: '#fd5ff1'

        foreground: '#dbdbdb'
        background: '#000000'
        cursor: '#dbdbdb'

        empty: '#496487'
        header: { fg: '#a5e055' attr: 'b' }
        hints: '#262626'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a5e055' attr: 'b' }
        search_result: { fg: '#ff1b00' bg: '#cbcccb' }
        separator: '#cbcccb'
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