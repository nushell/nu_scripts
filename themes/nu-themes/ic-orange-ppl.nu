# Retrieve the theme settings
export def main [] {
    return {
        binary: '#fc5e00'
        block: '#bd6d00'
        cell-path: '#ffc88a'
        closure: '#f79500'
        custom: '#fafaff'
        duration: '#caaf00'
        float: '#ff8c68'
        glob: '#fafaff'
        int: '#fc5e00'
        list: '#f79500'
        nothing: '#c13900'
        range: '#caaf00'
        record: '#f79500'
        string: '#a4a900'

        bool: {|| if $in { '#c69752' } else { '#caaf00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c13900' attr: 'b' }
            } else if $in < 6hr {
                '#c13900'
            } else if $in < 1day {
                '#caaf00'
            } else if $in < 3day {
                '#a4a900'
            } else if $in < 1wk {
                { fg: '#a4a900' attr: 'b' }
            } else if $in < 6wk {
                '#f79500'
            } else if $in < 52wk {
                '#bd6d00'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffc88a'
            } else if $e < 1mb {
                '#f79500'
            } else {{ fg: '#bd6d00' }}
        }

        shape_and: { fg: '#fc5e00' attr: 'b' }
        shape_binary: { fg: '#fc5e00' attr: 'b' }
        shape_block: { fg: '#bd6d00' attr: 'b' }
        shape_bool: '#c69752'
        shape_closure: { fg: '#f79500' attr: 'b' }
        shape_custom: '#a4a900'
        shape_datetime: { fg: '#f79500' attr: 'b' }
        shape_directory: '#f79500'
        shape_external: '#f79500'
        shape_external_resolved: '#c69752'
        shape_externalarg: { fg: '#a4a900' attr: 'b' }
        shape_filepath: '#f79500'
        shape_flag: { fg: '#bd6d00' attr: 'b' }
        shape_float: { fg: '#ff8c68' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#f79500' attr: 'b' }
        shape_globpattern: { fg: '#f79500' attr: 'b' }
        shape_int: { fg: '#fc5e00' attr: 'b' }
        shape_internalcall: { fg: '#f79500' attr: 'b' }
        shape_keyword: { fg: '#fc5e00' attr: 'b' }
        shape_list: { fg: '#f79500' attr: 'b' }
        shape_literal: '#bd6d00'
        shape_match_pattern: '#a4a900'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c13900'
        shape_operator: '#caaf00'
        shape_or: { fg: '#fc5e00' attr: 'b' }
        shape_pipe: { fg: '#fc5e00' attr: 'b' }
        shape_range: { fg: '#caaf00' attr: 'b' }
        shape_raw_string: { fg: '#fafaff' attr: 'b' }
        shape_record: { fg: '#f79500' attr: 'b' }
        shape_redirection: { fg: '#fc5e00' attr: 'b' }
        shape_signature: { fg: '#a4a900' attr: 'b' }
        shape_string: '#a4a900'
        shape_string_interpolation: { fg: '#f79500' attr: 'b' }
        shape_table: { fg: '#bd6d00' attr: 'b' }
        shape_vardecl: { fg: '#bd6d00' attr: 'u' }
        shape_variable: '#fc5e00'

        foreground: '#ffcb83'
        background: '#262626'
        cursor: '#ffcb83'

        empty: '#bd6d00'
        header: { fg: '#a4a900' attr: 'b' }
        hints: '#6a4f2a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a4a900' attr: 'b' }
        search_result: { fg: '#c13900' bg: '#ffc88a' }
        separator: '#ffc88a'
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