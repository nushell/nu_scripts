# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b386b2'
        block: '#868cb3'
        cell-path: '#b0c5c8'
        closure: '#86b3b3'
        custom: '#e3efef'
        duration: '#aab386'
        float: '#b38686'
        glob: '#e3efef'
        int: '#b386b2'
        list: '#86b3b3'
        nothing: '#b38686'
        range: '#aab386'
        record: '#86b3b3'
        string: '#87b386'

        bool: {|| if $in { '#86b3b3' } else { '#aab386' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b38686' attr: 'b' }
            } else if $in < 6hr {
                '#b38686'
            } else if $in < 1day {
                '#aab386'
            } else if $in < 3day {
                '#87b386'
            } else if $in < 1wk {
                { fg: '#87b386' attr: 'b' }
            } else if $in < 6wk {
                '#86b3b3'
            } else if $in < 52wk {
                '#868cb3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b0c5c8'
            } else if $e < 1mb {
                '#86b3b3'
            } else {{ fg: '#868cb3' }}
        }

        shape_and: { fg: '#b386b2' attr: 'b' }
        shape_binary: { fg: '#b386b2' attr: 'b' }
        shape_block: { fg: '#868cb3' attr: 'b' }
        shape_bool: '#86b3b3'
        shape_closure: { fg: '#86b3b3' attr: 'b' }
        shape_custom: '#87b386'
        shape_datetime: { fg: '#86b3b3' attr: 'b' }
        shape_directory: '#86b3b3'
        shape_external: '#86b3b3'
        shape_external_resolved: '#86b3b3'
        shape_externalarg: { fg: '#87b386' attr: 'b' }
        shape_filepath: '#86b3b3'
        shape_flag: { fg: '#868cb3' attr: 'b' }
        shape_float: { fg: '#b38686' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#86b3b3' attr: 'b' }
        shape_globpattern: { fg: '#86b3b3' attr: 'b' }
        shape_int: { fg: '#b386b2' attr: 'b' }
        shape_internalcall: { fg: '#86b3b3' attr: 'b' }
        shape_keyword: { fg: '#b386b2' attr: 'b' }
        shape_list: { fg: '#86b3b3' attr: 'b' }
        shape_literal: '#868cb3'
        shape_match_pattern: '#87b386'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b38686'
        shape_operator: '#aab386'
        shape_or: { fg: '#b386b2' attr: 'b' }
        shape_pipe: { fg: '#b386b2' attr: 'b' }
        shape_range: { fg: '#aab386' attr: 'b' }
        shape_raw_string: { fg: '#e3efef' attr: 'b' }
        shape_record: { fg: '#86b3b3' attr: 'b' }
        shape_redirection: { fg: '#b386b2' attr: 'b' }
        shape_signature: { fg: '#87b386' attr: 'b' }
        shape_string: '#87b386'
        shape_string_interpolation: { fg: '#86b3b3' attr: 'b' }
        shape_table: { fg: '#868cb3' attr: 'b' }
        shape_vardecl: { fg: '#868cb3' attr: 'u' }
        shape_variable: '#b386b2'

        foreground: '#b0c5c8'
        background: '#485867'
        cursor: '#b0c5c8'

        empty: '#868cb3'
        header: { fg: '#87b386' attr: 'b' }
        hints: '#8299a1'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#87b386' attr: 'b' }
        search_result: { fg: '#b38686' bg: '#b0c5c8' }
        separator: '#b0c5c8'
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