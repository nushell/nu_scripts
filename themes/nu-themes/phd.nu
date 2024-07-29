# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9989cc'
        block: '#5299bf'
        cell-path: '#b8bbc2'
        closure: '#72b9bf'
        custom: '#ffffff'
        duration: '#fbd461'
        float: '#d07346'
        glob: '#ffffff'
        int: '#9989cc'
        list: '#72b9bf'
        nothing: '#d07346'
        range: '#fbd461'
        record: '#72b9bf'
        string: '#99bf52'

        bool: {|| if $in { '#72b9bf' } else { '#fbd461' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d07346' attr: 'b' }
            } else if $in < 6hr {
                '#d07346'
            } else if $in < 1day {
                '#fbd461'
            } else if $in < 3day {
                '#99bf52'
            } else if $in < 1wk {
                { fg: '#99bf52' attr: 'b' }
            } else if $in < 6wk {
                '#72b9bf'
            } else if $in < 52wk {
                '#5299bf'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b8bbc2'
            } else if $e < 1mb {
                '#72b9bf'
            } else {{ fg: '#5299bf' }}
        }

        shape_and: { fg: '#9989cc' attr: 'b' }
        shape_binary: { fg: '#9989cc' attr: 'b' }
        shape_block: { fg: '#5299bf' attr: 'b' }
        shape_bool: '#72b9bf'
        shape_closure: { fg: '#72b9bf' attr: 'b' }
        shape_custom: '#99bf52'
        shape_datetime: { fg: '#72b9bf' attr: 'b' }
        shape_directory: '#72b9bf'
        shape_external: '#72b9bf'
        shape_external_resolved: '#72b9bf'
        shape_externalarg: { fg: '#99bf52' attr: 'b' }
        shape_filepath: '#72b9bf'
        shape_flag: { fg: '#5299bf' attr: 'b' }
        shape_float: { fg: '#d07346' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#72b9bf' attr: 'b' }
        shape_globpattern: { fg: '#72b9bf' attr: 'b' }
        shape_int: { fg: '#9989cc' attr: 'b' }
        shape_internalcall: { fg: '#72b9bf' attr: 'b' }
        shape_keyword: { fg: '#9989cc' attr: 'b' }
        shape_list: { fg: '#72b9bf' attr: 'b' }
        shape_literal: '#5299bf'
        shape_match_pattern: '#99bf52'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d07346'
        shape_operator: '#fbd461'
        shape_or: { fg: '#9989cc' attr: 'b' }
        shape_pipe: { fg: '#9989cc' attr: 'b' }
        shape_range: { fg: '#fbd461' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#72b9bf' attr: 'b' }
        shape_redirection: { fg: '#9989cc' attr: 'b' }
        shape_signature: { fg: '#99bf52' attr: 'b' }
        shape_string: '#99bf52'
        shape_string_interpolation: { fg: '#72b9bf' attr: 'b' }
        shape_table: { fg: '#5299bf' attr: 'b' }
        shape_vardecl: { fg: '#5299bf' attr: 'u' }
        shape_variable: '#9989cc'

        foreground: '#b8bbc2'
        background: '#061229'
        cursor: '#b8bbc2'

        empty: '#5299bf'
        header: { fg: '#99bf52' attr: 'b' }
        hints: '#717885'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#99bf52' attr: 'b' }
        search_result: { fg: '#d07346' bg: '#b8bbc2' }
        separator: '#b8bbc2'
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