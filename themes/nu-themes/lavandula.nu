# Retrieve the theme settings
export def main [] {
    return {
        binary: '#5a3f7f'
        block: '#4f4a7f'
        cell-path: '#736e7d'
        closure: '#58777f'
        custom: '#8c91fa'
        duration: '#7f6f49'
        float: '#e05167'
        glob: '#8c91fa'
        int: '#5a3f7f'
        list: '#58777f'
        nothing: '#7d1625'
        range: '#7f6f49'
        record: '#58777f'
        string: '#337e6f'

        bool: {|| if $in { '#9ad4e0' } else { '#7f6f49' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#7d1625' attr: 'b' }
            } else if $in < 6hr {
                '#7d1625'
            } else if $in < 1day {
                '#7f6f49'
            } else if $in < 3day {
                '#337e6f'
            } else if $in < 1wk {
                { fg: '#337e6f' attr: 'b' }
            } else if $in < 6wk {
                '#58777f'
            } else if $in < 52wk {
                '#4f4a7f'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#736e7d'
            } else if $e < 1mb {
                '#58777f'
            } else {{ fg: '#4f4a7f' }}
        }

        shape_and: { fg: '#5a3f7f' attr: 'b' }
        shape_binary: { fg: '#5a3f7f' attr: 'b' }
        shape_block: { fg: '#4f4a7f' attr: 'b' }
        shape_bool: '#9ad4e0'
        shape_closure: { fg: '#58777f' attr: 'b' }
        shape_custom: '#337e6f'
        shape_datetime: { fg: '#58777f' attr: 'b' }
        shape_directory: '#58777f'
        shape_external: '#58777f'
        shape_external_resolved: '#9ad4e0'
        shape_externalarg: { fg: '#337e6f' attr: 'b' }
        shape_filepath: '#58777f'
        shape_flag: { fg: '#4f4a7f' attr: 'b' }
        shape_float: { fg: '#e05167' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#58777f' attr: 'b' }
        shape_globpattern: { fg: '#58777f' attr: 'b' }
        shape_int: { fg: '#5a3f7f' attr: 'b' }
        shape_internalcall: { fg: '#58777f' attr: 'b' }
        shape_keyword: { fg: '#5a3f7f' attr: 'b' }
        shape_list: { fg: '#58777f' attr: 'b' }
        shape_literal: '#4f4a7f'
        shape_match_pattern: '#337e6f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#7d1625'
        shape_operator: '#7f6f49'
        shape_or: { fg: '#5a3f7f' attr: 'b' }
        shape_pipe: { fg: '#5a3f7f' attr: 'b' }
        shape_range: { fg: '#7f6f49' attr: 'b' }
        shape_raw_string: { fg: '#8c91fa' attr: 'b' }
        shape_record: { fg: '#58777f' attr: 'b' }
        shape_redirection: { fg: '#5a3f7f' attr: 'b' }
        shape_signature: { fg: '#337e6f' attr: 'b' }
        shape_string: '#337e6f'
        shape_string_interpolation: { fg: '#58777f' attr: 'b' }
        shape_table: { fg: '#4f4a7f' attr: 'b' }
        shape_vardecl: { fg: '#4f4a7f' attr: 'u' }
        shape_variable: '#5a3f7f'

        foreground: '#736e7d'
        background: '#050014'
        cursor: '#736e7d'

        empty: '#4f4a7f'
        header: { fg: '#337e6f' attr: 'b' }
        hints: '#372d46'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#337e6f' attr: 'b' }
        search_result: { fg: '#7d1625' bg: '#736e7d' }
        separator: '#736e7d'
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