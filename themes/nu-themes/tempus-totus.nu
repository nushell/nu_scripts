# Retrieve the theme settings
export def main [] {
    return {
        binary: '#882a7a'
        block: '#1d3fcf'
        cell-path: '#f3f1f3'
        closure: '#185870'
        custom: '#ffffff'
        duration: '#714900'
        float: '#9b2230'
        glob: '#ffffff'
        int: '#882a7a'
        list: '#185870'
        nothing: '#a80000'
        range: '#714900'
        record: '#185870'
        string: '#005f26'

        bool: {|| if $in { '#005589' } else { '#714900' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#a80000' attr: 'b' }
            } else if $in < 6hr {
                '#a80000'
            } else if $in < 1day {
                '#714900'
            } else if $in < 3day {
                '#005f26'
            } else if $in < 1wk {
                { fg: '#005f26' attr: 'b' }
            } else if $in < 6wk {
                '#185870'
            } else if $in < 52wk {
                '#1d3fcf'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f3f1f3'
            } else if $e < 1mb {
                '#185870'
            } else {{ fg: '#1d3fcf' }}
        }

        shape_and: { fg: '#882a7a' attr: 'b' }
        shape_binary: { fg: '#882a7a' attr: 'b' }
        shape_block: { fg: '#1d3fcf' attr: 'b' }
        shape_bool: '#005589'
        shape_closure: { fg: '#185870' attr: 'b' }
        shape_custom: '#005f26'
        shape_datetime: { fg: '#185870' attr: 'b' }
        shape_directory: '#185870'
        shape_external: '#185870'
        shape_external_resolved: '#005589'
        shape_externalarg: { fg: '#005f26' attr: 'b' }
        shape_filepath: '#185870'
        shape_flag: { fg: '#1d3fcf' attr: 'b' }
        shape_float: { fg: '#9b2230' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#185870' attr: 'b' }
        shape_globpattern: { fg: '#185870' attr: 'b' }
        shape_int: { fg: '#882a7a' attr: 'b' }
        shape_internalcall: { fg: '#185870' attr: 'b' }
        shape_keyword: { fg: '#882a7a' attr: 'b' }
        shape_list: { fg: '#185870' attr: 'b' }
        shape_literal: '#1d3fcf'
        shape_match_pattern: '#005f26'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#a80000'
        shape_operator: '#714900'
        shape_or: { fg: '#882a7a' attr: 'b' }
        shape_pipe: { fg: '#882a7a' attr: 'b' }
        shape_range: { fg: '#714900' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#185870' attr: 'b' }
        shape_redirection: { fg: '#882a7a' attr: 'b' }
        shape_signature: { fg: '#005f26' attr: 'b' }
        shape_string: '#005f26'
        shape_string_interpolation: { fg: '#185870' attr: 'b' }
        shape_table: { fg: '#1d3fcf' attr: 'b' }
        shape_vardecl: { fg: '#1d3fcf' attr: 'u' }
        shape_variable: '#882a7a'

        foreground: '#4a484d'
        background: '#ffffff'
        cursor: '#4a484d'

        empty: '#1d3fcf'
        header: { fg: '#005f26' attr: 'b' }
        hints: '#5f4d4f'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#005f26' attr: 'b' }
        search_result: { fg: '#a80000' bg: '#f3f1f3' }
        separator: '#f3f1f3'
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