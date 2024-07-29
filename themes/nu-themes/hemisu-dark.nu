# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b576bc'
        block: '#67bee3'
        cell-path: '#ededed'
        closure: '#569a9f'
        custom: '#ffffff'
        duration: '#9d895e'
        float: '#d65e75'
        glob: '#ffffff'
        int: '#b576bc'
        list: '#569a9f'
        nothing: '#ff0054'
        range: '#9d895e'
        record: '#569a9f'
        string: '#b1d630'

        bool: {|| if $in { '#b6e0e5' } else { '#9d895e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff0054' attr: 'b' }
            } else if $in < 6hr {
                '#ff0054'
            } else if $in < 1day {
                '#9d895e'
            } else if $in < 3day {
                '#b1d630'
            } else if $in < 1wk {
                { fg: '#b1d630' attr: 'b' }
            } else if $in < 6wk {
                '#569a9f'
            } else if $in < 52wk {
                '#67bee3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ededed'
            } else if $e < 1mb {
                '#569a9f'
            } else {{ fg: '#67bee3' }}
        }

        shape_and: { fg: '#b576bc' attr: 'b' }
        shape_binary: { fg: '#b576bc' attr: 'b' }
        shape_block: { fg: '#67bee3' attr: 'b' }
        shape_bool: '#b6e0e5'
        shape_closure: { fg: '#569a9f' attr: 'b' }
        shape_custom: '#b1d630'
        shape_datetime: { fg: '#569a9f' attr: 'b' }
        shape_directory: '#569a9f'
        shape_external: '#569a9f'
        shape_external_resolved: '#b6e0e5'
        shape_externalarg: { fg: '#b1d630' attr: 'b' }
        shape_filepath: '#569a9f'
        shape_flag: { fg: '#67bee3' attr: 'b' }
        shape_float: { fg: '#d65e75' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#569a9f' attr: 'b' }
        shape_globpattern: { fg: '#569a9f' attr: 'b' }
        shape_int: { fg: '#b576bc' attr: 'b' }
        shape_internalcall: { fg: '#569a9f' attr: 'b' }
        shape_keyword: { fg: '#b576bc' attr: 'b' }
        shape_list: { fg: '#569a9f' attr: 'b' }
        shape_literal: '#67bee3'
        shape_match_pattern: '#b1d630'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff0054'
        shape_operator: '#9d895e'
        shape_or: { fg: '#b576bc' attr: 'b' }
        shape_pipe: { fg: '#b576bc' attr: 'b' }
        shape_range: { fg: '#9d895e' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#569a9f' attr: 'b' }
        shape_redirection: { fg: '#b576bc' attr: 'b' }
        shape_signature: { fg: '#b1d630' attr: 'b' }
        shape_string: '#b1d630'
        shape_string_interpolation: { fg: '#569a9f' attr: 'b' }
        shape_table: { fg: '#67bee3' attr: 'b' }
        shape_vardecl: { fg: '#67bee3' attr: 'u' }
        shape_variable: '#b576bc'

        foreground: '#ffffff'
        background: '#000000'
        cursor: '#baffaa'

        empty: '#67bee3'
        header: { fg: '#b1d630' attr: 'b' }
        hints: '#777777'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b1d630' attr: 'b' }
        search_result: { fg: '#ff0054' bg: '#ededed' }
        separator: '#ededed'
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