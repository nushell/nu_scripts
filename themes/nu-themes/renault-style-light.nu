# Retrieve the theme settings
export def main [] {
    return {
        binary: '#cfcfff'
        block: '#46657d'
        cell-path: '#ffffff'
        closure: '#87c1f1'
        custom: '#ffffff'
        duration: '#ffd249'
        float: '#ff7b6a'
        glob: '#ffffff'
        int: '#cfcfff'
        list: '#87c1f1'
        nothing: '#da4839'
        range: '#ffd249'
        record: '#87c1f1'
        string: '#509f50'

        bool: {|| if $in { '#a4d4f8' } else { '#ffd249' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#da4839' attr: 'b' }
            } else if $in < 6hr {
                '#da4839'
            } else if $in < 1day {
                '#ffd249'
            } else if $in < 3day {
                '#509f50'
            } else if $in < 1wk {
                { fg: '#509f50' attr: 'b' }
            } else if $in < 6wk {
                '#87c1f1'
            } else if $in < 52wk {
                '#46657d'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#87c1f1'
            } else {{ fg: '#46657d' }}
        }

        shape_and: { fg: '#cfcfff' attr: 'b' }
        shape_binary: { fg: '#cfcfff' attr: 'b' }
        shape_block: { fg: '#46657d' attr: 'b' }
        shape_bool: '#a4d4f8'
        shape_closure: { fg: '#87c1f1' attr: 'b' }
        shape_custom: '#509f50'
        shape_datetime: { fg: '#87c1f1' attr: 'b' }
        shape_directory: '#87c1f1'
        shape_external: '#87c1f1'
        shape_external_resolved: '#a4d4f8'
        shape_externalarg: { fg: '#509f50' attr: 'b' }
        shape_filepath: '#87c1f1'
        shape_flag: { fg: '#46657d' attr: 'b' }
        shape_float: { fg: '#ff7b6a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#87c1f1' attr: 'b' }
        shape_globpattern: { fg: '#87c1f1' attr: 'b' }
        shape_int: { fg: '#cfcfff' attr: 'b' }
        shape_internalcall: { fg: '#87c1f1' attr: 'b' }
        shape_keyword: { fg: '#cfcfff' attr: 'b' }
        shape_list: { fg: '#87c1f1' attr: 'b' }
        shape_literal: '#46657d'
        shape_match_pattern: '#509f50'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#da4839'
        shape_operator: '#ffd249'
        shape_or: { fg: '#cfcfff' attr: 'b' }
        shape_pipe: { fg: '#cfcfff' attr: 'b' }
        shape_range: { fg: '#ffd249' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#87c1f1' attr: 'b' }
        shape_redirection: { fg: '#cfcfff' attr: 'b' }
        shape_signature: { fg: '#509f50' attr: 'b' }
        shape_string: '#509f50'
        shape_string_interpolation: { fg: '#87c1f1' attr: 'b' }
        shape_table: { fg: '#46657d' attr: 'b' }
        shape_vardecl: { fg: '#46657d' attr: 'u' }
        shape_variable: '#cfcfff'

        foreground: '#e9cb7b'
        background: '#3a3a3a'
        cursor: '#7f7f7f'

        empty: '#46657d'
        header: { fg: '#509f50' attr: 'b' }
        hints: '#323232'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#509f50' attr: 'b' }
        search_result: { fg: '#da4839' bg: '#ffffff' }
        separator: '#ffffff'
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