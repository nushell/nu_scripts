# Retrieve the theme settings
export def main [] {
    return {
        binary: '#986f82'
        block: '#525fb8'
        cell-path: '#ecf0fc'
        closure: '#968763'
        custom: '#f6ffec'
        duration: '#fecd5e'
        float: '#da4b8a'
        glob: '#f6ffec'
        int: '#986f82'
        list: '#968763'
        nothing: '#c6004a'
        range: '#fecd5e'
        record: '#968763'
        string: '#acf157'

        bool: {|| if $in { '#a5bd86' } else { '#fecd5e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c6004a' attr: 'b' }
            } else if $in < 6hr {
                '#c6004a'
            } else if $in < 1day {
                '#fecd5e'
            } else if $in < 3day {
                '#acf157'
            } else if $in < 1wk {
                { fg: '#acf157' attr: 'b' }
            } else if $in < 6wk {
                '#968763'
            } else if $in < 52wk {
                '#525fb8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ecf0fc'
            } else if $e < 1mb {
                '#968763'
            } else {{ fg: '#525fb8' }}
        }

        shape_and: { fg: '#986f82' attr: 'b' }
        shape_binary: { fg: '#986f82' attr: 'b' }
        shape_block: { fg: '#525fb8' attr: 'b' }
        shape_bool: '#a5bd86'
        shape_closure: { fg: '#968763' attr: 'b' }
        shape_custom: '#acf157'
        shape_datetime: { fg: '#968763' attr: 'b' }
        shape_directory: '#968763'
        shape_external: '#968763'
        shape_external_resolved: '#a5bd86'
        shape_externalarg: { fg: '#acf157' attr: 'b' }
        shape_filepath: '#968763'
        shape_flag: { fg: '#525fb8' attr: 'b' }
        shape_float: { fg: '#da4b8a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#968763' attr: 'b' }
        shape_globpattern: { fg: '#968763' attr: 'b' }
        shape_int: { fg: '#986f82' attr: 'b' }
        shape_internalcall: { fg: '#968763' attr: 'b' }
        shape_keyword: { fg: '#986f82' attr: 'b' }
        shape_list: { fg: '#968763' attr: 'b' }
        shape_literal: '#525fb8'
        shape_match_pattern: '#acf157'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c6004a'
        shape_operator: '#fecd5e'
        shape_or: { fg: '#986f82' attr: 'b' }
        shape_pipe: { fg: '#986f82' attr: 'b' }
        shape_range: { fg: '#fecd5e' attr: 'b' }
        shape_raw_string: { fg: '#f6ffec' attr: 'b' }
        shape_record: { fg: '#968763' attr: 'b' }
        shape_redirection: { fg: '#986f82' attr: 'b' }
        shape_signature: { fg: '#acf157' attr: 'b' }
        shape_string: '#acf157'
        shape_string_interpolation: { fg: '#968763' attr: 'b' }
        shape_table: { fg: '#525fb8' attr: 'b' }
        shape_vardecl: { fg: '#525fb8' attr: 'u' }
        shape_variable: '#986f82'

        foreground: '#ecf0fe'
        background: '#232537'
        cursor: '#ecf0fe'

        empty: '#525fb8'
        header: { fg: '#acf157' attr: 'b' }
        hints: '#6c5b30'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#acf157' attr: 'b' }
        search_result: { fg: '#c6004a' bg: '#ecf0fc' }
        separator: '#ecf0fc'
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