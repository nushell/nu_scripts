# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff73fd'
        block: '#75a5b0'
        cell-path: '#bfbfbf'
        closure: '#5a647e'
        custom: '#e5e5e5'
        duration: '#bfbb1f'
        float: '#eecbad'
        glob: '#e5e5e5'
        int: '#ff73fd'
        list: '#5a647e'
        nothing: '#cdaf95'
        range: '#bfbb1f'
        record: '#5a647e'
        string: '#a8ff60'

        bool: {|| if $in { '#8c9bc4' } else { '#bfbb1f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cdaf95' attr: 'b' }
            } else if $in < 6hr {
                '#cdaf95'
            } else if $in < 1day {
                '#bfbb1f'
            } else if $in < 3day {
                '#a8ff60'
            } else if $in < 1wk {
                { fg: '#a8ff60' attr: 'b' }
            } else if $in < 6wk {
                '#5a647e'
            } else if $in < 52wk {
                '#75a5b0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bfbfbf'
            } else if $e < 1mb {
                '#5a647e'
            } else {{ fg: '#75a5b0' }}
        }

        shape_and: { fg: '#ff73fd' attr: 'b' }
        shape_binary: { fg: '#ff73fd' attr: 'b' }
        shape_block: { fg: '#75a5b0' attr: 'b' }
        shape_bool: '#8c9bc4'
        shape_closure: { fg: '#5a647e' attr: 'b' }
        shape_custom: '#a8ff60'
        shape_datetime: { fg: '#5a647e' attr: 'b' }
        shape_directory: '#5a647e'
        shape_external: '#5a647e'
        shape_external_resolved: '#8c9bc4'
        shape_externalarg: { fg: '#a8ff60' attr: 'b' }
        shape_filepath: '#5a647e'
        shape_flag: { fg: '#75a5b0' attr: 'b' }
        shape_float: { fg: '#eecbad' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5a647e' attr: 'b' }
        shape_globpattern: { fg: '#5a647e' attr: 'b' }
        shape_int: { fg: '#ff73fd' attr: 'b' }
        shape_internalcall: { fg: '#5a647e' attr: 'b' }
        shape_keyword: { fg: '#ff73fd' attr: 'b' }
        shape_list: { fg: '#5a647e' attr: 'b' }
        shape_literal: '#75a5b0'
        shape_match_pattern: '#a8ff60'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cdaf95'
        shape_operator: '#bfbb1f'
        shape_or: { fg: '#ff73fd' attr: 'b' }
        shape_pipe: { fg: '#ff73fd' attr: 'b' }
        shape_range: { fg: '#bfbb1f' attr: 'b' }
        shape_raw_string: { fg: '#e5e5e5' attr: 'b' }
        shape_record: { fg: '#5a647e' attr: 'b' }
        shape_redirection: { fg: '#ff73fd' attr: 'b' }
        shape_signature: { fg: '#a8ff60' attr: 'b' }
        shape_string: '#a8ff60'
        shape_string_interpolation: { fg: '#5a647e' attr: 'b' }
        shape_table: { fg: '#75a5b0' attr: 'b' }
        shape_vardecl: { fg: '#75a5b0' attr: 'u' }
        shape_variable: '#ff73fd'

        foreground: '#ffffff'
        background: '#2b2b2b'
        cursor: '#ffffff'

        empty: '#75a5b0'
        header: { fg: '#a8ff60' attr: 'b' }
        hints: '#666666'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a8ff60' attr: 'b' }
        search_result: { fg: '#cdaf95' bg: '#bfbfbf' }
        separator: '#bfbfbf'
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