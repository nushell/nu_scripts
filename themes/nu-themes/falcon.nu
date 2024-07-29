# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff761a'
        block: '#635196'
        cell-path: '#b4b4b9'
        closure: '#34bfa4'
        custom: '#f8f8ff'
        duration: '#ffc552'
        float: '#ff8e78'
        glob: '#f8f8ff'
        int: '#ff761a'
        list: '#34bfa4'
        nothing: '#ff3600'
        range: '#ffc552'
        record: '#34bfa4'
        string: '#718e3f'

        bool: {|| if $in { '#8bccbf' } else { '#ffc552' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff3600' attr: 'b' }
            } else if $in < 6hr {
                '#ff3600'
            } else if $in < 1day {
                '#ffc552'
            } else if $in < 3day {
                '#718e3f'
            } else if $in < 1wk {
                { fg: '#718e3f' attr: 'b' }
            } else if $in < 6wk {
                '#34bfa4'
            } else if $in < 52wk {
                '#635196'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b4b4b9'
            } else if $e < 1mb {
                '#34bfa4'
            } else {{ fg: '#635196' }}
        }

        shape_and: { fg: '#ff761a' attr: 'b' }
        shape_binary: { fg: '#ff761a' attr: 'b' }
        shape_block: { fg: '#635196' attr: 'b' }
        shape_bool: '#8bccbf'
        shape_closure: { fg: '#34bfa4' attr: 'b' }
        shape_custom: '#718e3f'
        shape_datetime: { fg: '#34bfa4' attr: 'b' }
        shape_directory: '#34bfa4'
        shape_external: '#34bfa4'
        shape_external_resolved: '#8bccbf'
        shape_externalarg: { fg: '#718e3f' attr: 'b' }
        shape_filepath: '#34bfa4'
        shape_flag: { fg: '#635196' attr: 'b' }
        shape_float: { fg: '#ff8e78' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#34bfa4' attr: 'b' }
        shape_globpattern: { fg: '#34bfa4' attr: 'b' }
        shape_int: { fg: '#ff761a' attr: 'b' }
        shape_internalcall: { fg: '#34bfa4' attr: 'b' }
        shape_keyword: { fg: '#ff761a' attr: 'b' }
        shape_list: { fg: '#34bfa4' attr: 'b' }
        shape_literal: '#635196'
        shape_match_pattern: '#718e3f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff3600'
        shape_operator: '#ffc552'
        shape_or: { fg: '#ff761a' attr: 'b' }
        shape_pipe: { fg: '#ff761a' attr: 'b' }
        shape_range: { fg: '#ffc552' attr: 'b' }
        shape_raw_string: { fg: '#f8f8ff' attr: 'b' }
        shape_record: { fg: '#34bfa4' attr: 'b' }
        shape_redirection: { fg: '#ff761a' attr: 'b' }
        shape_signature: { fg: '#718e3f' attr: 'b' }
        shape_string: '#718e3f'
        shape_string_interpolation: { fg: '#34bfa4' attr: 'b' }
        shape_table: { fg: '#635196' attr: 'b' }
        shape_vardecl: { fg: '#635196' attr: 'u' }
        shape_variable: '#ff761a'

        foreground: '#b4b4b9'
        background: '#020221'
        cursor: '#ffe8c0'

        empty: '#635196'
        header: { fg: '#718e3f' attr: 'b' }
        hints: '#020221'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#718e3f' attr: 'b' }
        search_result: { fg: '#ff3600' bg: '#b4b4b9' }
        separator: '#b4b4b9'
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