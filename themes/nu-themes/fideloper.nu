# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c0226e'
        block: '#2e78c1'
        cell-path: '#e9e2cd'
        closure: '#309185'
        custom: '#fcf4de'
        duration: '#b7aa9a'
        float: '#d35f5a'
        glob: '#fcf4de'
        int: '#c0226e'
        list: '#309185'
        nothing: '#ca1d2c'
        range: '#b7aa9a'
        record: '#309185'
        string: '#edb7ab'

        bool: {|| if $in { '#81908f' } else { '#b7aa9a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ca1d2c' attr: 'b' }
            } else if $in < 6hr {
                '#ca1d2c'
            } else if $in < 1day {
                '#b7aa9a'
            } else if $in < 3day {
                '#edb7ab'
            } else if $in < 1wk {
                { fg: '#edb7ab' attr: 'b' }
            } else if $in < 6wk {
                '#309185'
            } else if $in < 52wk {
                '#2e78c1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e9e2cd'
            } else if $e < 1mb {
                '#309185'
            } else {{ fg: '#2e78c1' }}
        }

        shape_and: { fg: '#c0226e' attr: 'b' }
        shape_binary: { fg: '#c0226e' attr: 'b' }
        shape_block: { fg: '#2e78c1' attr: 'b' }
        shape_bool: '#81908f'
        shape_closure: { fg: '#309185' attr: 'b' }
        shape_custom: '#edb7ab'
        shape_datetime: { fg: '#309185' attr: 'b' }
        shape_directory: '#309185'
        shape_external: '#309185'
        shape_external_resolved: '#81908f'
        shape_externalarg: { fg: '#edb7ab' attr: 'b' }
        shape_filepath: '#309185'
        shape_flag: { fg: '#2e78c1' attr: 'b' }
        shape_float: { fg: '#d35f5a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#309185' attr: 'b' }
        shape_globpattern: { fg: '#309185' attr: 'b' }
        shape_int: { fg: '#c0226e' attr: 'b' }
        shape_internalcall: { fg: '#309185' attr: 'b' }
        shape_keyword: { fg: '#c0226e' attr: 'b' }
        shape_list: { fg: '#309185' attr: 'b' }
        shape_literal: '#2e78c1'
        shape_match_pattern: '#edb7ab'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ca1d2c'
        shape_operator: '#b7aa9a'
        shape_or: { fg: '#c0226e' attr: 'b' }
        shape_pipe: { fg: '#c0226e' attr: 'b' }
        shape_range: { fg: '#b7aa9a' attr: 'b' }
        shape_raw_string: { fg: '#fcf4de' attr: 'b' }
        shape_record: { fg: '#309185' attr: 'b' }
        shape_redirection: { fg: '#c0226e' attr: 'b' }
        shape_signature: { fg: '#edb7ab' attr: 'b' }
        shape_string: '#edb7ab'
        shape_string_interpolation: { fg: '#309185' attr: 'b' }
        shape_table: { fg: '#2e78c1' attr: 'b' }
        shape_vardecl: { fg: '#2e78c1' attr: 'u' }
        shape_variable: '#c0226e'

        foreground: '#dad9df'
        background: '#282f32'
        cursor: '#d35f5a'

        empty: '#2e78c1'
        header: { fg: '#edb7ab' attr: 'b' }
        hints: '#092027'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#edb7ab' attr: 'b' }
        search_result: { fg: '#ca1d2c' bg: '#e9e2cd' }
        separator: '#e9e2cd'
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