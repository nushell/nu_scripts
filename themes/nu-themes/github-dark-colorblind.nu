# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bc8cff'
        block: '#58a6ff'
        cell-path: '#b1bac4'
        closure: '#39c5cf'
        custom: '#f0f6fc'
        duration: '#d29922'
        float: '#ffa198'
        glob: '#f0f6fc'
        int: '#bc8cff'
        list: '#39c5cf'
        nothing: '#ff7b72'
        range: '#d29922'
        record: '#39c5cf'
        string: '#3fb950'

        bool: {|| if $in { '#56d4dd' } else { '#d29922' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff7b72' attr: 'b' }
            } else if $in < 6hr {
                '#ff7b72'
            } else if $in < 1day {
                '#d29922'
            } else if $in < 3day {
                '#3fb950'
            } else if $in < 1wk {
                { fg: '#3fb950' attr: 'b' }
            } else if $in < 6wk {
                '#39c5cf'
            } else if $in < 52wk {
                '#58a6ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b1bac4'
            } else if $e < 1mb {
                '#39c5cf'
            } else {{ fg: '#58a6ff' }}
        }

        shape_and: { fg: '#bc8cff' attr: 'b' }
        shape_binary: { fg: '#bc8cff' attr: 'b' }
        shape_block: { fg: '#58a6ff' attr: 'b' }
        shape_bool: '#56d4dd'
        shape_closure: { fg: '#39c5cf' attr: 'b' }
        shape_custom: '#3fb950'
        shape_datetime: { fg: '#39c5cf' attr: 'b' }
        shape_directory: '#39c5cf'
        shape_external: '#39c5cf'
        shape_external_resolved: '#56d4dd'
        shape_externalarg: { fg: '#3fb950' attr: 'b' }
        shape_filepath: '#39c5cf'
        shape_flag: { fg: '#58a6ff' attr: 'b' }
        shape_float: { fg: '#ffa198' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#39c5cf' attr: 'b' }
        shape_globpattern: { fg: '#39c5cf' attr: 'b' }
        shape_int: { fg: '#bc8cff' attr: 'b' }
        shape_internalcall: { fg: '#39c5cf' attr: 'b' }
        shape_keyword: { fg: '#bc8cff' attr: 'b' }
        shape_list: { fg: '#39c5cf' attr: 'b' }
        shape_literal: '#58a6ff'
        shape_match_pattern: '#3fb950'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff7b72'
        shape_operator: '#d29922'
        shape_or: { fg: '#bc8cff' attr: 'b' }
        shape_pipe: { fg: '#bc8cff' attr: 'b' }
        shape_range: { fg: '#d29922' attr: 'b' }
        shape_raw_string: { fg: '#f0f6fc' attr: 'b' }
        shape_record: { fg: '#39c5cf' attr: 'b' }
        shape_redirection: { fg: '#bc8cff' attr: 'b' }
        shape_signature: { fg: '#3fb950' attr: 'b' }
        shape_string: '#3fb950'
        shape_string_interpolation: { fg: '#39c5cf' attr: 'b' }
        shape_table: { fg: '#58a6ff' attr: 'b' }
        shape_vardecl: { fg: '#58a6ff' attr: 'u' }
        shape_variable: '#bc8cff'

        foreground: '#b3b1ad'
        background: '#0d1117'
        cursor: '#73b7f2'

        empty: '#58a6ff'
        header: { fg: '#3fb950' attr: 'b' }
        hints: '#6e7681'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#3fb950' attr: 'b' }
        search_result: { fg: '#ff7b72' bg: '#b1bac4' }
        separator: '#b1bac4'
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