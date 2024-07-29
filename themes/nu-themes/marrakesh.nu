# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8868b3'
        block: '#477ca1'
        cell-path: '#948e48'
        closure: '#75a738'
        custom: '#faf0a5'
        duration: '#a88339'
        float: '#c35359'
        glob: '#faf0a5'
        int: '#8868b3'
        list: '#75a738'
        nothing: '#c35359'
        range: '#a88339'
        record: '#75a738'
        string: '#18974e'

        bool: {|| if $in { '#75a738' } else { '#a88339' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c35359' attr: 'b' }
            } else if $in < 6hr {
                '#c35359'
            } else if $in < 1day {
                '#a88339'
            } else if $in < 3day {
                '#18974e'
            } else if $in < 1wk {
                { fg: '#18974e' attr: 'b' }
            } else if $in < 6wk {
                '#75a738'
            } else if $in < 52wk {
                '#477ca1'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#948e48'
            } else if $e < 1mb {
                '#75a738'
            } else {{ fg: '#477ca1' }}
        }

        shape_and: { fg: '#8868b3' attr: 'b' }
        shape_binary: { fg: '#8868b3' attr: 'b' }
        shape_block: { fg: '#477ca1' attr: 'b' }
        shape_bool: '#75a738'
        shape_closure: { fg: '#75a738' attr: 'b' }
        shape_custom: '#18974e'
        shape_datetime: { fg: '#75a738' attr: 'b' }
        shape_directory: '#75a738'
        shape_external: '#75a738'
        shape_external_resolved: '#75a738'
        shape_externalarg: { fg: '#18974e' attr: 'b' }
        shape_filepath: '#75a738'
        shape_flag: { fg: '#477ca1' attr: 'b' }
        shape_float: { fg: '#c35359' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#75a738' attr: 'b' }
        shape_globpattern: { fg: '#75a738' attr: 'b' }
        shape_int: { fg: '#8868b3' attr: 'b' }
        shape_internalcall: { fg: '#75a738' attr: 'b' }
        shape_keyword: { fg: '#8868b3' attr: 'b' }
        shape_list: { fg: '#75a738' attr: 'b' }
        shape_literal: '#477ca1'
        shape_match_pattern: '#18974e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c35359'
        shape_operator: '#a88339'
        shape_or: { fg: '#8868b3' attr: 'b' }
        shape_pipe: { fg: '#8868b3' attr: 'b' }
        shape_range: { fg: '#a88339' attr: 'b' }
        shape_raw_string: { fg: '#faf0a5' attr: 'b' }
        shape_record: { fg: '#75a738' attr: 'b' }
        shape_redirection: { fg: '#8868b3' attr: 'b' }
        shape_signature: { fg: '#18974e' attr: 'b' }
        shape_string: '#18974e'
        shape_string_interpolation: { fg: '#75a738' attr: 'b' }
        shape_table: { fg: '#477ca1' attr: 'b' }
        shape_vardecl: { fg: '#477ca1' attr: 'u' }
        shape_variable: '#8868b3'

        foreground: '#948e48'
        background: '#201602'
        cursor: '#948e48'

        empty: '#477ca1'
        header: { fg: '#18974e' attr: 'b' }
        hints: '#6c6823'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#18974e' attr: 'b' }
        search_result: { fg: '#c35359' bg: '#948e48' }
        separator: '#948e48'
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