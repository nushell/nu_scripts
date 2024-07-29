# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e1c0fa'
        block: '#97bedc'
        cell-path: '#dedede'
        closure: '#00988e'
        custom: '#ffffff'
        duration: '#ffba7b'
        float: '#ffa1a1'
        glob: '#ffffff'
        int: '#e1c0fa'
        list: '#00988e'
        nothing: '#e27373'
        range: '#ffba7b'
        record: '#00988e'
        string: '#94b979'

        bool: {|| if $in { '#1ab2a8' } else { '#ffba7b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e27373' attr: 'b' }
            } else if $in < 6hr {
                '#e27373'
            } else if $in < 1day {
                '#ffba7b'
            } else if $in < 3day {
                '#94b979'
            } else if $in < 1wk {
                { fg: '#94b979' attr: 'b' }
            } else if $in < 6wk {
                '#00988e'
            } else if $in < 52wk {
                '#97bedc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#dedede'
            } else if $e < 1mb {
                '#00988e'
            } else {{ fg: '#97bedc' }}
        }

        shape_and: { fg: '#e1c0fa' attr: 'b' }
        shape_binary: { fg: '#e1c0fa' attr: 'b' }
        shape_block: { fg: '#97bedc' attr: 'b' }
        shape_bool: '#1ab2a8'
        shape_closure: { fg: '#00988e' attr: 'b' }
        shape_custom: '#94b979'
        shape_datetime: { fg: '#00988e' attr: 'b' }
        shape_directory: '#00988e'
        shape_external: '#00988e'
        shape_external_resolved: '#1ab2a8'
        shape_externalarg: { fg: '#94b979' attr: 'b' }
        shape_filepath: '#00988e'
        shape_flag: { fg: '#97bedc' attr: 'b' }
        shape_float: { fg: '#ffa1a1' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00988e' attr: 'b' }
        shape_globpattern: { fg: '#00988e' attr: 'b' }
        shape_int: { fg: '#e1c0fa' attr: 'b' }
        shape_internalcall: { fg: '#00988e' attr: 'b' }
        shape_keyword: { fg: '#e1c0fa' attr: 'b' }
        shape_list: { fg: '#00988e' attr: 'b' }
        shape_literal: '#97bedc'
        shape_match_pattern: '#94b979'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e27373'
        shape_operator: '#ffba7b'
        shape_or: { fg: '#e1c0fa' attr: 'b' }
        shape_pipe: { fg: '#e1c0fa' attr: 'b' }
        shape_range: { fg: '#ffba7b' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00988e' attr: 'b' }
        shape_redirection: { fg: '#e1c0fa' attr: 'b' }
        shape_signature: { fg: '#94b979' attr: 'b' }
        shape_string: '#94b979'
        shape_string_interpolation: { fg: '#00988e' attr: 'b' }
        shape_table: { fg: '#97bedc' attr: 'b' }
        shape_vardecl: { fg: '#97bedc' attr: 'u' }
        shape_variable: '#e1c0fa'

        foreground: '#dedede'
        background: '#121212'
        cursor: '#dedede'

        empty: '#97bedc'
        header: { fg: '#94b979' attr: 'b' }
        hints: '#bdbdbd'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#94b979' attr: 'b' }
        search_result: { fg: '#e27373' bg: '#dedede' }
        separator: '#dedede'
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