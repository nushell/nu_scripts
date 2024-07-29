# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a83971'
        block: '#7139a8'
        cell-path: '#8a8a8a'
        closure: '#3971a8'
        custom: '#cfcfcf'
        duration: '#71a839'
        float: '#b0763b'
        glob: '#cfcfcf'
        int: '#a83971'
        list: '#3971a8'
        nothing: '#a87139'
        range: '#71a839'
        record: '#3971a8'
        string: '#39a871'

        bool: {|| if $in { '#3b76b0' } else { '#71a839' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a87139' attr: 'b' }
            } else if $in < 6hr {
                '#a87139'
            } else if $in < 1day {
                '#71a839'
            } else if $in < 3day {
                '#39a871'
            } else if $in < 1wk {
                { fg: '#39a871' attr: 'b' }
            } else if $in < 6wk {
                '#3971a8'
            } else if $in < 52wk {
                '#7139a8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#8a8a8a'
            } else if $e < 1mb {
                '#3971a8'
            } else {{ fg: '#7139a8' }}
        }

        shape_and: { fg: '#a83971' attr: 'b' }
        shape_binary: { fg: '#a83971' attr: 'b' }
        shape_block: { fg: '#7139a8' attr: 'b' }
        shape_bool: '#3b76b0'
        shape_closure: { fg: '#3971a8' attr: 'b' }
        shape_custom: '#39a871'
        shape_datetime: { fg: '#3971a8' attr: 'b' }
        shape_directory: '#3971a8'
        shape_external: '#3971a8'
        shape_external_resolved: '#3b76b0'
        shape_externalarg: { fg: '#39a871' attr: 'b' }
        shape_filepath: '#3971a8'
        shape_flag: { fg: '#7139a8' attr: 'b' }
        shape_float: { fg: '#b0763b' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3971a8' attr: 'b' }
        shape_globpattern: { fg: '#3971a8' attr: 'b' }
        shape_int: { fg: '#a83971' attr: 'b' }
        shape_internalcall: { fg: '#3971a8' attr: 'b' }
        shape_keyword: { fg: '#a83971' attr: 'b' }
        shape_list: { fg: '#3971a8' attr: 'b' }
        shape_literal: '#7139a8'
        shape_match_pattern: '#39a871'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a87139'
        shape_operator: '#71a839'
        shape_or: { fg: '#a83971' attr: 'b' }
        shape_pipe: { fg: '#a83971' attr: 'b' }
        shape_range: { fg: '#71a839' attr: 'b' }
        shape_raw_string: { fg: '#cfcfcf' attr: 'b' }
        shape_record: { fg: '#3971a8' attr: 'b' }
        shape_redirection: { fg: '#a83971' attr: 'b' }
        shape_signature: { fg: '#39a871' attr: 'b' }
        shape_string: '#39a871'
        shape_string_interpolation: { fg: '#3971a8' attr: 'b' }
        shape_table: { fg: '#7139a8' attr: 'b' }
        shape_vardecl: { fg: '#7139a8' attr: 'u' }
        shape_variable: '#a83971'

        foreground: '#d9e6f2'
        background: '#191f1d'
        cursor: '#d9e6f2'

        empty: '#7139a8'
        header: { fg: '#39a871' attr: 'b' }
        hints: '#494949'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#39a871' attr: 'b' }
        search_result: { fg: '#a87139' bg: '#8a8a8a' }
        separator: '#8a8a8a'
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