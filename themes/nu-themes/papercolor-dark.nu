# Retrieve the theme settings
export def main [] {
    return {
        binary: '#00afaf'
        block: '#ff5faf'
        cell-path: '#808080'
        closure: '#ffaf00'
        custom: '#d0d0d0'
        duration: '#afd700'
        float: '#585858'
        glob: '#d0d0d0'
        int: '#00afaf'
        list: '#ffaf00'
        nothing: '#585858'
        range: '#afd700'
        record: '#ffaf00'
        string: '#af87d7'

        bool: {|| if $in { '#ffaf00' } else { '#afd700' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#585858' attr: 'b' }
            } else if $in < 6hr {
                '#585858'
            } else if $in < 1day {
                '#afd700'
            } else if $in < 3day {
                '#af87d7'
            } else if $in < 1wk {
                { fg: '#af87d7' attr: 'b' }
            } else if $in < 6wk {
                '#ffaf00'
            } else if $in < 52wk {
                '#ff5faf'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#808080'
            } else if $e < 1mb {
                '#ffaf00'
            } else {{ fg: '#ff5faf' }}
        }

        shape_and: { fg: '#00afaf' attr: 'b' }
        shape_binary: { fg: '#00afaf' attr: 'b' }
        shape_block: { fg: '#ff5faf' attr: 'b' }
        shape_bool: '#ffaf00'
        shape_closure: { fg: '#ffaf00' attr: 'b' }
        shape_custom: '#af87d7'
        shape_datetime: { fg: '#ffaf00' attr: 'b' }
        shape_directory: '#ffaf00'
        shape_external: '#ffaf00'
        shape_external_resolved: '#ffaf00'
        shape_externalarg: { fg: '#af87d7' attr: 'b' }
        shape_filepath: '#ffaf00'
        shape_flag: { fg: '#ff5faf' attr: 'b' }
        shape_float: { fg: '#585858' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#ffaf00' attr: 'b' }
        shape_globpattern: { fg: '#ffaf00' attr: 'b' }
        shape_int: { fg: '#00afaf' attr: 'b' }
        shape_internalcall: { fg: '#ffaf00' attr: 'b' }
        shape_keyword: { fg: '#00afaf' attr: 'b' }
        shape_list: { fg: '#ffaf00' attr: 'b' }
        shape_literal: '#ff5faf'
        shape_match_pattern: '#af87d7'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#585858'
        shape_operator: '#afd700'
        shape_or: { fg: '#00afaf' attr: 'b' }
        shape_pipe: { fg: '#00afaf' attr: 'b' }
        shape_range: { fg: '#afd700' attr: 'b' }
        shape_raw_string: { fg: '#d0d0d0' attr: 'b' }
        shape_record: { fg: '#ffaf00' attr: 'b' }
        shape_redirection: { fg: '#00afaf' attr: 'b' }
        shape_signature: { fg: '#af87d7' attr: 'b' }
        shape_string: '#af87d7'
        shape_string_interpolation: { fg: '#ffaf00' attr: 'b' }
        shape_table: { fg: '#ff5faf' attr: 'b' }
        shape_vardecl: { fg: '#ff5faf' attr: 'u' }
        shape_variable: '#00afaf'

        foreground: '#808080'
        background: '#1c1c1c'
        cursor: '#808080'

        empty: '#ff5faf'
        header: { fg: '#af87d7' attr: 'b' }
        hints: '#d7af5f'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#af87d7' attr: 'b' }
        search_result: { fg: '#585858' bg: '#808080' }
        separator: '#808080'
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