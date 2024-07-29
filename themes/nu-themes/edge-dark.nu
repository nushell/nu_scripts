# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d390e7'
        block: '#73b3e7'
        cell-path: '#b7bec9'
        closure: '#5ebaa5'
        custom: '#3e4249'
        duration: '#dbb774'
        float: '#e77171'
        glob: '#3e4249'
        int: '#d390e7'
        list: '#5ebaa5'
        nothing: '#e77171'
        range: '#dbb774'
        record: '#5ebaa5'
        string: '#a1bf78'

        bool: {|| if $in { '#5ebaa5' } else { '#dbb774' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e77171' attr: 'b' }
            } else if $in < 6hr {
                '#e77171'
            } else if $in < 1day {
                '#dbb774'
            } else if $in < 3day {
                '#a1bf78'
            } else if $in < 1wk {
                { fg: '#a1bf78' attr: 'b' }
            } else if $in < 6wk {
                '#5ebaa5'
            } else if $in < 52wk {
                '#73b3e7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b7bec9'
            } else if $e < 1mb {
                '#5ebaa5'
            } else {{ fg: '#73b3e7' }}
        }

        shape_and: { fg: '#d390e7' attr: 'b' }
        shape_binary: { fg: '#d390e7' attr: 'b' }
        shape_block: { fg: '#73b3e7' attr: 'b' }
        shape_bool: '#5ebaa5'
        shape_closure: { fg: '#5ebaa5' attr: 'b' }
        shape_custom: '#a1bf78'
        shape_datetime: { fg: '#5ebaa5' attr: 'b' }
        shape_directory: '#5ebaa5'
        shape_external: '#5ebaa5'
        shape_external_resolved: '#5ebaa5'
        shape_externalarg: { fg: '#a1bf78' attr: 'b' }
        shape_filepath: '#5ebaa5'
        shape_flag: { fg: '#73b3e7' attr: 'b' }
        shape_float: { fg: '#e77171' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5ebaa5' attr: 'b' }
        shape_globpattern: { fg: '#5ebaa5' attr: 'b' }
        shape_int: { fg: '#d390e7' attr: 'b' }
        shape_internalcall: { fg: '#5ebaa5' attr: 'b' }
        shape_keyword: { fg: '#d390e7' attr: 'b' }
        shape_list: { fg: '#5ebaa5' attr: 'b' }
        shape_literal: '#73b3e7'
        shape_match_pattern: '#a1bf78'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e77171'
        shape_operator: '#dbb774'
        shape_or: { fg: '#d390e7' attr: 'b' }
        shape_pipe: { fg: '#d390e7' attr: 'b' }
        shape_range: { fg: '#dbb774' attr: 'b' }
        shape_raw_string: { fg: '#3e4249' attr: 'b' }
        shape_record: { fg: '#5ebaa5' attr: 'b' }
        shape_redirection: { fg: '#d390e7' attr: 'b' }
        shape_signature: { fg: '#a1bf78' attr: 'b' }
        shape_string: '#a1bf78'
        shape_string_interpolation: { fg: '#5ebaa5' attr: 'b' }
        shape_table: { fg: '#73b3e7' attr: 'b' }
        shape_vardecl: { fg: '#73b3e7' attr: 'u' }
        shape_variable: '#d390e7'

        foreground: '#b7bec9'
        background: '#262729'
        cursor: '#b7bec9'

        empty: '#73b3e7'
        header: { fg: '#a1bf78' attr: 'b' }
        hints: '#3e4249'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a1bf78' attr: 'b' }
        search_result: { fg: '#e77171' bg: '#b7bec9' }
        separator: '#b7bec9'
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