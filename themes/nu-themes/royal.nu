# Retrieve the theme settings
export def main [] {
    return {
        binary: '#674d96'
        block: '#6580b0'
        cell-path: '#524966'
        closure: '#8aaabe'
        custom: '#9e8cbd'
        duration: '#b49d27'
        float: '#d5356c'
        glob: '#9e8cbd'
        int: '#674d96'
        list: '#8aaabe'
        nothing: '#91284c'
        range: '#b49d27'
        record: '#8aaabe'
        string: '#23801c'

        bool: {|| if $in { '#acd4eb' } else { '#b49d27' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#91284c' attr: 'b' }
            } else if $in < 6hr {
                '#91284c'
            } else if $in < 1day {
                '#b49d27'
            } else if $in < 3day {
                '#23801c'
            } else if $in < 1wk {
                { fg: '#23801c' attr: 'b' }
            } else if $in < 6wk {
                '#8aaabe'
            } else if $in < 52wk {
                '#6580b0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#524966'
            } else if $e < 1mb {
                '#8aaabe'
            } else {{ fg: '#6580b0' }}
        }

        shape_and: { fg: '#674d96' attr: 'b' }
        shape_binary: { fg: '#674d96' attr: 'b' }
        shape_block: { fg: '#6580b0' attr: 'b' }
        shape_bool: '#acd4eb'
        shape_closure: { fg: '#8aaabe' attr: 'b' }
        shape_custom: '#23801c'
        shape_datetime: { fg: '#8aaabe' attr: 'b' }
        shape_directory: '#8aaabe'
        shape_external: '#8aaabe'
        shape_external_resolved: '#acd4eb'
        shape_externalarg: { fg: '#23801c' attr: 'b' }
        shape_filepath: '#8aaabe'
        shape_flag: { fg: '#6580b0' attr: 'b' }
        shape_float: { fg: '#d5356c' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8aaabe' attr: 'b' }
        shape_globpattern: { fg: '#8aaabe' attr: 'b' }
        shape_int: { fg: '#674d96' attr: 'b' }
        shape_internalcall: { fg: '#8aaabe' attr: 'b' }
        shape_keyword: { fg: '#674d96' attr: 'b' }
        shape_list: { fg: '#8aaabe' attr: 'b' }
        shape_literal: '#6580b0'
        shape_match_pattern: '#23801c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#91284c'
        shape_operator: '#b49d27'
        shape_or: { fg: '#674d96' attr: 'b' }
        shape_pipe: { fg: '#674d96' attr: 'b' }
        shape_range: { fg: '#b49d27' attr: 'b' }
        shape_raw_string: { fg: '#9e8cbd' attr: 'b' }
        shape_record: { fg: '#8aaabe' attr: 'b' }
        shape_redirection: { fg: '#674d96' attr: 'b' }
        shape_signature: { fg: '#23801c' attr: 'b' }
        shape_string: '#23801c'
        shape_string_interpolation: { fg: '#8aaabe' attr: 'b' }
        shape_table: { fg: '#6580b0' attr: 'b' }
        shape_vardecl: { fg: '#6580b0' attr: 'u' }
        shape_variable: '#674d96'

        foreground: '#514968'
        background: '#100815'
        cursor: '#514968'

        empty: '#6580b0'
        header: { fg: '#23801c' attr: 'b' }
        hints: '#312d3d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#23801c' attr: 'b' }
        search_result: { fg: '#91284c' bg: '#524966' }
        separator: '#524966'
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