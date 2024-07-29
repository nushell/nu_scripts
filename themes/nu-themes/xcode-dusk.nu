# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b21889'
        block: '#790ead'
        cell-path: '#939599'
        closure: '#00a0be'
        custom: '#bebfc2'
        duration: '#438288'
        float: '#b21889'
        glob: '#bebfc2'
        int: '#b21889'
        list: '#00a0be'
        nothing: '#b21889'
        range: '#438288'
        record: '#00a0be'
        string: '#df0002'

        bool: {|| if $in { '#00a0be' } else { '#438288' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b21889' attr: 'b' }
            } else if $in < 6hr {
                '#b21889'
            } else if $in < 1day {
                '#438288'
            } else if $in < 3day {
                '#df0002'
            } else if $in < 1wk {
                { fg: '#df0002' attr: 'b' }
            } else if $in < 6wk {
                '#00a0be'
            } else if $in < 52wk {
                '#790ead'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#939599'
            } else if $e < 1mb {
                '#00a0be'
            } else {{ fg: '#790ead' }}
        }

        shape_and: { fg: '#b21889' attr: 'b' }
        shape_binary: { fg: '#b21889' attr: 'b' }
        shape_block: { fg: '#790ead' attr: 'b' }
        shape_bool: '#00a0be'
        shape_closure: { fg: '#00a0be' attr: 'b' }
        shape_custom: '#df0002'
        shape_datetime: { fg: '#00a0be' attr: 'b' }
        shape_directory: '#00a0be'
        shape_external: '#00a0be'
        shape_external_resolved: '#00a0be'
        shape_externalarg: { fg: '#df0002' attr: 'b' }
        shape_filepath: '#00a0be'
        shape_flag: { fg: '#790ead' attr: 'b' }
        shape_float: { fg: '#b21889' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00a0be' attr: 'b' }
        shape_globpattern: { fg: '#00a0be' attr: 'b' }
        shape_int: { fg: '#b21889' attr: 'b' }
        shape_internalcall: { fg: '#00a0be' attr: 'b' }
        shape_keyword: { fg: '#b21889' attr: 'b' }
        shape_list: { fg: '#00a0be' attr: 'b' }
        shape_literal: '#790ead'
        shape_match_pattern: '#df0002'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b21889'
        shape_operator: '#438288'
        shape_or: { fg: '#b21889' attr: 'b' }
        shape_pipe: { fg: '#b21889' attr: 'b' }
        shape_range: { fg: '#438288' attr: 'b' }
        shape_raw_string: { fg: '#bebfc2' attr: 'b' }
        shape_record: { fg: '#00a0be' attr: 'b' }
        shape_redirection: { fg: '#b21889' attr: 'b' }
        shape_signature: { fg: '#df0002' attr: 'b' }
        shape_string: '#df0002'
        shape_string_interpolation: { fg: '#00a0be' attr: 'b' }
        shape_table: { fg: '#790ead' attr: 'b' }
        shape_vardecl: { fg: '#790ead' attr: 'u' }
        shape_variable: '#b21889'

        foreground: '#939599'
        background: '#282b35'
        cursor: '#939599'

        empty: '#790ead'
        header: { fg: '#df0002' attr: 'b' }
        hints: '#686a71'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#df0002' attr: 'b' }
        search_result: { fg: '#b21889' bg: '#939599' }
        separator: '#939599'
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