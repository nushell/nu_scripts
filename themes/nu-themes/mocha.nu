# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a89bb9'
        block: '#8ab3b5'
        cell-path: '#d0c8c6'
        closure: '#7bbda4'
        custom: '#f5eeeb'
        duration: '#f4bc87'
        float: '#cb6077'
        glob: '#f5eeeb'
        int: '#a89bb9'
        list: '#7bbda4'
        nothing: '#cb6077'
        range: '#f4bc87'
        record: '#7bbda4'
        string: '#beb55b'

        bool: {|| if $in { '#7bbda4' } else { '#f4bc87' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cb6077' attr: 'b' }
            } else if $in < 6hr {
                '#cb6077'
            } else if $in < 1day {
                '#f4bc87'
            } else if $in < 3day {
                '#beb55b'
            } else if $in < 1wk {
                { fg: '#beb55b' attr: 'b' }
            } else if $in < 6wk {
                '#7bbda4'
            } else if $in < 52wk {
                '#8ab3b5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0c8c6'
            } else if $e < 1mb {
                '#7bbda4'
            } else {{ fg: '#8ab3b5' }}
        }

        shape_and: { fg: '#a89bb9' attr: 'b' }
        shape_binary: { fg: '#a89bb9' attr: 'b' }
        shape_block: { fg: '#8ab3b5' attr: 'b' }
        shape_bool: '#7bbda4'
        shape_closure: { fg: '#7bbda4' attr: 'b' }
        shape_custom: '#beb55b'
        shape_datetime: { fg: '#7bbda4' attr: 'b' }
        shape_directory: '#7bbda4'
        shape_external: '#7bbda4'
        shape_external_resolved: '#7bbda4'
        shape_externalarg: { fg: '#beb55b' attr: 'b' }
        shape_filepath: '#7bbda4'
        shape_flag: { fg: '#8ab3b5' attr: 'b' }
        shape_float: { fg: '#cb6077' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#7bbda4' attr: 'b' }
        shape_globpattern: { fg: '#7bbda4' attr: 'b' }
        shape_int: { fg: '#a89bb9' attr: 'b' }
        shape_internalcall: { fg: '#7bbda4' attr: 'b' }
        shape_keyword: { fg: '#a89bb9' attr: 'b' }
        shape_list: { fg: '#7bbda4' attr: 'b' }
        shape_literal: '#8ab3b5'
        shape_match_pattern: '#beb55b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cb6077'
        shape_operator: '#f4bc87'
        shape_or: { fg: '#a89bb9' attr: 'b' }
        shape_pipe: { fg: '#a89bb9' attr: 'b' }
        shape_range: { fg: '#f4bc87' attr: 'b' }
        shape_raw_string: { fg: '#f5eeeb' attr: 'b' }
        shape_record: { fg: '#7bbda4' attr: 'b' }
        shape_redirection: { fg: '#a89bb9' attr: 'b' }
        shape_signature: { fg: '#beb55b' attr: 'b' }
        shape_string: '#beb55b'
        shape_string_interpolation: { fg: '#7bbda4' attr: 'b' }
        shape_table: { fg: '#8ab3b5' attr: 'b' }
        shape_vardecl: { fg: '#8ab3b5' attr: 'u' }
        shape_variable: '#a89bb9'

        foreground: '#d0c8c6'
        background: '#3b3228'
        cursor: '#d0c8c6'

        empty: '#8ab3b5'
        header: { fg: '#beb55b' attr: 'b' }
        hints: '#7e705a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#beb55b' attr: 'b' }
        search_result: { fg: '#cb6077' bg: '#d0c8c6' }
        separator: '#d0c8c6'
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