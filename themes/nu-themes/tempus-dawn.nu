# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8d377e'
        block: '#4b529a'
        cell-path: '#e2e4e1'
        closure: '#086784'
        custom: '#eff0f2'
        duration: '#745300'
        float: '#ae4e2a'
        glob: '#eff0f2'
        int: '#8d377e'
        list: '#086784'
        nothing: '#a32a3a'
        range: '#745300'
        record: '#086784'
        string: '#206620'

        bool: {|| if $in { '#106e8c' } else { '#745300' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a32a3a' attr: 'b' }
            } else if $in < 6hr {
                '#a32a3a'
            } else if $in < 1day {
                '#745300'
            } else if $in < 3day {
                '#206620'
            } else if $in < 1wk {
                { fg: '#206620' attr: 'b' }
            } else if $in < 6wk {
                '#086784'
            } else if $in < 52wk {
                '#4b529a'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e2e4e1'
            } else if $e < 1mb {
                '#086784'
            } else {{ fg: '#4b529a' }}
        }

        shape_and: { fg: '#8d377e' attr: 'b' }
        shape_binary: { fg: '#8d377e' attr: 'b' }
        shape_block: { fg: '#4b529a' attr: 'b' }
        shape_bool: '#106e8c'
        shape_closure: { fg: '#086784' attr: 'b' }
        shape_custom: '#206620'
        shape_datetime: { fg: '#086784' attr: 'b' }
        shape_directory: '#086784'
        shape_external: '#086784'
        shape_external_resolved: '#106e8c'
        shape_externalarg: { fg: '#206620' attr: 'b' }
        shape_filepath: '#086784'
        shape_flag: { fg: '#4b529a' attr: 'b' }
        shape_float: { fg: '#ae4e2a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#086784' attr: 'b' }
        shape_globpattern: { fg: '#086784' attr: 'b' }
        shape_int: { fg: '#8d377e' attr: 'b' }
        shape_internalcall: { fg: '#086784' attr: 'b' }
        shape_keyword: { fg: '#8d377e' attr: 'b' }
        shape_list: { fg: '#086784' attr: 'b' }
        shape_literal: '#4b529a'
        shape_match_pattern: '#206620'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a32a3a'
        shape_operator: '#745300'
        shape_or: { fg: '#8d377e' attr: 'b' }
        shape_pipe: { fg: '#8d377e' attr: 'b' }
        shape_range: { fg: '#745300' attr: 'b' }
        shape_raw_string: { fg: '#eff0f2' attr: 'b' }
        shape_record: { fg: '#086784' attr: 'b' }
        shape_redirection: { fg: '#8d377e' attr: 'b' }
        shape_signature: { fg: '#206620' attr: 'b' }
        shape_string: '#206620'
        shape_string_interpolation: { fg: '#086784' attr: 'b' }
        shape_table: { fg: '#4b529a' attr: 'b' }
        shape_vardecl: { fg: '#4b529a' attr: 'u' }
        shape_variable: '#8d377e'

        foreground: '#4a4b4e'
        background: '#eff0f2'
        cursor: '#4a4b4e'

        empty: '#4b529a'
        header: { fg: '#206620' attr: 'b' }
        hints: '#686565'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#206620' attr: 'b' }
        search_result: { fg: '#a32a3a' bg: '#e2e4e1' }
        separator: '#e2e4e1'
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