# Retrieve the theme settings
export def main [] {
    return {
        binary: '#fc54fc'
        block: '#5454fc'
        cell-path: '#a8a8a8'
        closure: '#54fcfc'
        custom: '#fcfcfc'
        duration: '#fcfc54'
        float: '#fc5454'
        glob: '#fcfcfc'
        int: '#fc54fc'
        list: '#54fcfc'
        nothing: '#fc5454'
        range: '#fcfc54'
        record: '#54fcfc'
        string: '#54fc54'

        bool: {|| if $in { '#54fcfc' } else { '#fcfc54' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fc5454' attr: 'b' }
            } else if $in < 6hr {
                '#fc5454'
            } else if $in < 1day {
                '#fcfc54'
            } else if $in < 3day {
                '#54fc54'
            } else if $in < 1wk {
                { fg: '#54fc54' attr: 'b' }
            } else if $in < 6wk {
                '#54fcfc'
            } else if $in < 52wk {
                '#5454fc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a8a8a8'
            } else if $e < 1mb {
                '#54fcfc'
            } else {{ fg: '#5454fc' }}
        }

        shape_and: { fg: '#fc54fc' attr: 'b' }
        shape_binary: { fg: '#fc54fc' attr: 'b' }
        shape_block: { fg: '#5454fc' attr: 'b' }
        shape_bool: '#54fcfc'
        shape_closure: { fg: '#54fcfc' attr: 'b' }
        shape_custom: '#54fc54'
        shape_datetime: { fg: '#54fcfc' attr: 'b' }
        shape_directory: '#54fcfc'
        shape_external: '#54fcfc'
        shape_external_resolved: '#54fcfc'
        shape_externalarg: { fg: '#54fc54' attr: 'b' }
        shape_filepath: '#54fcfc'
        shape_flag: { fg: '#5454fc' attr: 'b' }
        shape_float: { fg: '#fc5454' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#54fcfc' attr: 'b' }
        shape_globpattern: { fg: '#54fcfc' attr: 'b' }
        shape_int: { fg: '#fc54fc' attr: 'b' }
        shape_internalcall: { fg: '#54fcfc' attr: 'b' }
        shape_keyword: { fg: '#fc54fc' attr: 'b' }
        shape_list: { fg: '#54fcfc' attr: 'b' }
        shape_literal: '#5454fc'
        shape_match_pattern: '#54fc54'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fc5454'
        shape_operator: '#fcfc54'
        shape_or: { fg: '#fc54fc' attr: 'b' }
        shape_pipe: { fg: '#fc54fc' attr: 'b' }
        shape_range: { fg: '#fcfc54' attr: 'b' }
        shape_raw_string: { fg: '#fcfcfc' attr: 'b' }
        shape_record: { fg: '#54fcfc' attr: 'b' }
        shape_redirection: { fg: '#fc54fc' attr: 'b' }
        shape_signature: { fg: '#54fc54' attr: 'b' }
        shape_string: '#54fc54'
        shape_string_interpolation: { fg: '#54fcfc' attr: 'b' }
        shape_table: { fg: '#5454fc' attr: 'b' }
        shape_vardecl: { fg: '#5454fc' attr: 'u' }
        shape_variable: '#fc54fc'

        foreground: '#a8a8a8'
        background: '#000000'
        cursor: '#a8a8a8'

        empty: '#5454fc'
        header: { fg: '#54fc54' attr: 'b' }
        hints: '#545454'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#54fc54' attr: 'b' }
        search_result: { fg: '#fc5454' bg: '#a8a8a8' }
        separator: '#a8a8a8'
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