# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ed53c9'
        block: '#1155ff'
        cell-path: '#cccccc'
        closure: '#00ffbb'
        custom: '#ffffff'
        duration: '#ffbb33'
        float: '#ff4488'
        glob: '#ffffff'
        int: '#ed53c9'
        list: '#00ffbb'
        nothing: '#ff1155'
        range: '#ffbb33'
        record: '#00ffbb'
        string: '#11ff55'

        bool: {|| if $in { '#66ffdd' } else { '#ffbb33' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff1155' attr: 'b' }
            } else if $in < 6hr {
                '#ff1155'
            } else if $in < 1day {
                '#ffbb33'
            } else if $in < 3day {
                '#11ff55'
            } else if $in < 1wk {
                { fg: '#11ff55' attr: 'b' }
            } else if $in < 6wk {
                '#00ffbb'
            } else if $in < 52wk {
                '#1155ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cccccc'
            } else if $e < 1mb {
                '#00ffbb'
            } else {{ fg: '#1155ff' }}
        }

        shape_and: { fg: '#ed53c9' attr: 'b' }
        shape_binary: { fg: '#ed53c9' attr: 'b' }
        shape_block: { fg: '#1155ff' attr: 'b' }
        shape_bool: '#66ffdd'
        shape_closure: { fg: '#00ffbb' attr: 'b' }
        shape_custom: '#11ff55'
        shape_datetime: { fg: '#00ffbb' attr: 'b' }
        shape_directory: '#00ffbb'
        shape_external: '#00ffbb'
        shape_external_resolved: '#66ffdd'
        shape_externalarg: { fg: '#11ff55' attr: 'b' }
        shape_filepath: '#00ffbb'
        shape_flag: { fg: '#1155ff' attr: 'b' }
        shape_float: { fg: '#ff4488' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00ffbb' attr: 'b' }
        shape_globpattern: { fg: '#00ffbb' attr: 'b' }
        shape_int: { fg: '#ed53c9' attr: 'b' }
        shape_internalcall: { fg: '#00ffbb' attr: 'b' }
        shape_keyword: { fg: '#ed53c9' attr: 'b' }
        shape_list: { fg: '#00ffbb' attr: 'b' }
        shape_literal: '#1155ff'
        shape_match_pattern: '#11ff55'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff1155'
        shape_operator: '#ffbb33'
        shape_or: { fg: '#ed53c9' attr: 'b' }
        shape_pipe: { fg: '#ed53c9' attr: 'b' }
        shape_range: { fg: '#ffbb33' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00ffbb' attr: 'b' }
        shape_redirection: { fg: '#ed53c9' attr: 'b' }
        shape_signature: { fg: '#11ff55' attr: 'b' }
        shape_string: '#11ff55'
        shape_string_interpolation: { fg: '#00ffbb' attr: 'b' }
        shape_table: { fg: '#1155ff' attr: 'b' }
        shape_vardecl: { fg: '#1155ff' attr: 'u' }
        shape_variable: '#ed53c9'

        foreground: '#aaaaaa'
        background: '#1e1e1e'
        cursor: '#aaaaaa'

        empty: '#1155ff'
        header: { fg: '#11ff55' attr: 'b' }
        hints: '#666666'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#11ff55' attr: 'b' }
        search_result: { fg: '#ff1155' bg: '#cccccc' }
        separator: '#cccccc'
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