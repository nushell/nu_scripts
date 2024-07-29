# Retrieve the theme settings
export def main [] {
    return {
        binary: '#5e468c'
        block: '#395573'
        cell-path: '#899ca1'
        closure: '#31658c'
        custom: '#c0c0c0'
        duration: '#7c7c99'
        float: '#bf4d80'
        glob: '#c0c0c0'
        int: '#5e468c'
        list: '#31658c'
        nothing: '#8c4665'
        range: '#7c7c99'
        record: '#31658c'
        string: '#287373'

        bool: {|| if $in { '#6096bf' } else { '#7c7c99' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#8c4665' attr: 'b' }
            } else if $in < 6hr {
                '#8c4665'
            } else if $in < 1day {
                '#7c7c99'
            } else if $in < 3day {
                '#287373'
            } else if $in < 1wk {
                { fg: '#287373' attr: 'b' }
            } else if $in < 6wk {
                '#31658c'
            } else if $in < 52wk {
                '#395573'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#899ca1'
            } else if $e < 1mb {
                '#31658c'
            } else {{ fg: '#395573' }}
        }

        shape_and: { fg: '#5e468c' attr: 'b' }
        shape_binary: { fg: '#5e468c' attr: 'b' }
        shape_block: { fg: '#395573' attr: 'b' }
        shape_bool: '#6096bf'
        shape_closure: { fg: '#31658c' attr: 'b' }
        shape_custom: '#287373'
        shape_datetime: { fg: '#31658c' attr: 'b' }
        shape_directory: '#31658c'
        shape_external: '#31658c'
        shape_external_resolved: '#6096bf'
        shape_externalarg: { fg: '#287373' attr: 'b' }
        shape_filepath: '#31658c'
        shape_flag: { fg: '#395573' attr: 'b' }
        shape_float: { fg: '#bf4d80' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#31658c' attr: 'b' }
        shape_globpattern: { fg: '#31658c' attr: 'b' }
        shape_int: { fg: '#5e468c' attr: 'b' }
        shape_internalcall: { fg: '#31658c' attr: 'b' }
        shape_keyword: { fg: '#5e468c' attr: 'b' }
        shape_list: { fg: '#31658c' attr: 'b' }
        shape_literal: '#395573'
        shape_match_pattern: '#287373'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#8c4665'
        shape_operator: '#7c7c99'
        shape_or: { fg: '#5e468c' attr: 'b' }
        shape_pipe: { fg: '#5e468c' attr: 'b' }
        shape_range: { fg: '#7c7c99' attr: 'b' }
        shape_raw_string: { fg: '#c0c0c0' attr: 'b' }
        shape_record: { fg: '#31658c' attr: 'b' }
        shape_redirection: { fg: '#5e468c' attr: 'b' }
        shape_signature: { fg: '#287373' attr: 'b' }
        shape_string: '#287373'
        shape_string_interpolation: { fg: '#31658c' attr: 'b' }
        shape_table: { fg: '#395573' attr: 'b' }
        shape_vardecl: { fg: '#395573' attr: 'u' }
        shape_variable: '#5e468c'

        foreground: '#999993'
        background: '#101010'
        cursor: '#999993'

        empty: '#395573'
        header: { fg: '#287373' attr: 'b' }
        hints: '#3d3d3d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#287373' attr: 'b' }
        search_result: { fg: '#8c4665' bg: '#899ca1' }
        separator: '#899ca1'
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