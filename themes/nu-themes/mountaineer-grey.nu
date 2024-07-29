# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b294bb'
        block: '#81a2be'
        cell-path: '#c5c8c6'
        closure: '#8abeb7'
        custom: '#ffffff'
        duration: '#f0c674'
        float: '#cc6666'
        glob: '#ffffff'
        int: '#b294bb'
        list: '#8abeb7'
        nothing: '#cc6666'
        range: '#f0c674'
        record: '#8abeb7'
        string: '#b5bd68'

        bool: {|| if $in { '#8abeb7' } else { '#f0c674' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cc6666' attr: 'b' }
            } else if $in < 6hr {
                '#cc6666'
            } else if $in < 1day {
                '#f0c674'
            } else if $in < 3day {
                '#b5bd68'
            } else if $in < 1wk {
                { fg: '#b5bd68' attr: 'b' }
            } else if $in < 6wk {
                '#8abeb7'
            } else if $in < 52wk {
                '#81a2be'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c5c8c6'
            } else if $e < 1mb {
                '#8abeb7'
            } else {{ fg: '#81a2be' }}
        }

        shape_and: { fg: '#b294bb' attr: 'b' }
        shape_binary: { fg: '#b294bb' attr: 'b' }
        shape_block: { fg: '#81a2be' attr: 'b' }
        shape_bool: '#8abeb7'
        shape_closure: { fg: '#8abeb7' attr: 'b' }
        shape_custom: '#b5bd68'
        shape_datetime: { fg: '#8abeb7' attr: 'b' }
        shape_directory: '#8abeb7'
        shape_external: '#8abeb7'
        shape_external_resolved: '#8abeb7'
        shape_externalarg: { fg: '#b5bd68' attr: 'b' }
        shape_filepath: '#8abeb7'
        shape_flag: { fg: '#81a2be' attr: 'b' }
        shape_float: { fg: '#cc6666' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8abeb7' attr: 'b' }
        shape_globpattern: { fg: '#8abeb7' attr: 'b' }
        shape_int: { fg: '#b294bb' attr: 'b' }
        shape_internalcall: { fg: '#8abeb7' attr: 'b' }
        shape_keyword: { fg: '#b294bb' attr: 'b' }
        shape_list: { fg: '#8abeb7' attr: 'b' }
        shape_literal: '#81a2be'
        shape_match_pattern: '#b5bd68'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cc6666'
        shape_operator: '#f0c674'
        shape_or: { fg: '#b294bb' attr: 'b' }
        shape_pipe: { fg: '#b294bb' attr: 'b' }
        shape_range: { fg: '#f0c674' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#8abeb7' attr: 'b' }
        shape_redirection: { fg: '#b294bb' attr: 'b' }
        shape_signature: { fg: '#b5bd68' attr: 'b' }
        shape_string: '#b5bd68'
        shape_string_interpolation: { fg: '#8abeb7' attr: 'b' }
        shape_table: { fg: '#81a2be' attr: 'b' }
        shape_vardecl: { fg: '#81a2be' attr: 'u' }
        shape_variable: '#b294bb'

        foreground: '#c0c0c0'
        background: '#232323'
        cursor: '#b5bd68'

        empty: '#81a2be'
        header: { fg: '#b5bd68' attr: 'b' }
        hints: '#969896'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b5bd68' attr: 'b' }
        search_result: { fg: '#cc6666' bg: '#c5c8c6' }
        separator: '#c5c8c6'
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