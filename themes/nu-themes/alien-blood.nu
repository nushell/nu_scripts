# Retrieve the theme settings
export def main [] {
    return {
        binary: '#47587f'
        block: '#2f6a7f'
        cell-path: '#647d75'
        closure: '#327f77'
        custom: '#73fa91'
        duration: '#717f24'
        float: '#e08009'
        glob: '#73fa91'
        int: '#47587f'
        list: '#327f77'
        nothing: '#7f2b27'
        range: '#717f24'
        record: '#327f77'
        string: '#2f7e25'

        bool: {|| if $in { '#00e0c4' } else { '#717f24' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#7f2b27' attr: 'b' }
            } else if $in < 6hr {
                '#7f2b27'
            } else if $in < 1day {
                '#717f24'
            } else if $in < 3day {
                '#2f7e25'
            } else if $in < 1wk {
                { fg: '#2f7e25' attr: 'b' }
            } else if $in < 6wk {
                '#327f77'
            } else if $in < 52wk {
                '#2f6a7f'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#647d75'
            } else if $e < 1mb {
                '#327f77'
            } else {{ fg: '#2f6a7f' }}
        }

        shape_and: { fg: '#47587f' attr: 'b' }
        shape_binary: { fg: '#47587f' attr: 'b' }
        shape_block: { fg: '#2f6a7f' attr: 'b' }
        shape_bool: '#00e0c4'
        shape_closure: { fg: '#327f77' attr: 'b' }
        shape_custom: '#2f7e25'
        shape_datetime: { fg: '#327f77' attr: 'b' }
        shape_directory: '#327f77'
        shape_external: '#327f77'
        shape_external_resolved: '#00e0c4'
        shape_externalarg: { fg: '#2f7e25' attr: 'b' }
        shape_filepath: '#327f77'
        shape_flag: { fg: '#2f6a7f' attr: 'b' }
        shape_float: { fg: '#e08009' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#327f77' attr: 'b' }
        shape_globpattern: { fg: '#327f77' attr: 'b' }
        shape_int: { fg: '#47587f' attr: 'b' }
        shape_internalcall: { fg: '#327f77' attr: 'b' }
        shape_keyword: { fg: '#47587f' attr: 'b' }
        shape_list: { fg: '#327f77' attr: 'b' }
        shape_literal: '#2f6a7f'
        shape_match_pattern: '#2f7e25'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#7f2b27'
        shape_operator: '#717f24'
        shape_or: { fg: '#47587f' attr: 'b' }
        shape_pipe: { fg: '#47587f' attr: 'b' }
        shape_range: { fg: '#717f24' attr: 'b' }
        shape_raw_string: { fg: '#73fa91' attr: 'b' }
        shape_record: { fg: '#327f77' attr: 'b' }
        shape_redirection: { fg: '#47587f' attr: 'b' }
        shape_signature: { fg: '#2f7e25' attr: 'b' }
        shape_string: '#2f7e25'
        shape_string_interpolation: { fg: '#327f77' attr: 'b' }
        shape_table: { fg: '#2f6a7f' attr: 'b' }
        shape_vardecl: { fg: '#2f6a7f' attr: 'u' }
        shape_variable: '#47587f'

        foreground: '#637d75'
        background: '#0f1610'
        cursor: '#637d75'

        empty: '#2f6a7f'
        header: { fg: '#2f7e25' attr: 'b' }
        hints: '#3c4812'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#2f7e25' attr: 'b' }
        search_result: { fg: '#7f2b27' bg: '#647d75' }
        separator: '#647d75'
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