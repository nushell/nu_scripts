# Retrieve the theme settings
export def main [] {
    return {
        binary: '#9933cc'
        block: '#44b4cc'
        cell-path: '#f5f5f5'
        closure: '#44b4cc'
        custom: '#e5e5e5'
        duration: '#ffcc00'
        float: '#ff0000'
        glob: '#e5e5e5'
        int: '#9933cc'
        list: '#44b4cc'
        nothing: '#ff6600'
        range: '#ffcc00'
        record: '#44b4cc'
        string: '#ccff04'

        bool: {|| if $in { '#00ffff' } else { '#ffcc00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff6600' attr: 'b' }
            } else if $in < 6hr {
                '#ff6600'
            } else if $in < 1day {
                '#ffcc00'
            } else if $in < 3day {
                '#ccff04'
            } else if $in < 1wk {
                { fg: '#ccff04' attr: 'b' }
            } else if $in < 6wk {
                '#44b4cc'
            } else if $in < 52wk {
                '#44b4cc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f5f5f5'
            } else if $e < 1mb {
                '#44b4cc'
            } else {{ fg: '#44b4cc' }}
        }

        shape_and: { fg: '#9933cc' attr: 'b' }
        shape_binary: { fg: '#9933cc' attr: 'b' }
        shape_block: { fg: '#44b4cc' attr: 'b' }
        shape_bool: '#00ffff'
        shape_closure: { fg: '#44b4cc' attr: 'b' }
        shape_custom: '#ccff04'
        shape_datetime: { fg: '#44b4cc' attr: 'b' }
        shape_directory: '#44b4cc'
        shape_external: '#44b4cc'
        shape_external_resolved: '#00ffff'
        shape_externalarg: { fg: '#ccff04' attr: 'b' }
        shape_filepath: '#44b4cc'
        shape_flag: { fg: '#44b4cc' attr: 'b' }
        shape_float: { fg: '#ff0000' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#44b4cc' attr: 'b' }
        shape_globpattern: { fg: '#44b4cc' attr: 'b' }
        shape_int: { fg: '#9933cc' attr: 'b' }
        shape_internalcall: { fg: '#44b4cc' attr: 'b' }
        shape_keyword: { fg: '#9933cc' attr: 'b' }
        shape_list: { fg: '#44b4cc' attr: 'b' }
        shape_literal: '#44b4cc'
        shape_match_pattern: '#ccff04'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff6600'
        shape_operator: '#ffcc00'
        shape_or: { fg: '#9933cc' attr: 'b' }
        shape_pipe: { fg: '#9933cc' attr: 'b' }
        shape_range: { fg: '#ffcc00' attr: 'b' }
        shape_raw_string: { fg: '#e5e5e5' attr: 'b' }
        shape_record: { fg: '#44b4cc' attr: 'b' }
        shape_redirection: { fg: '#9933cc' attr: 'b' }
        shape_signature: { fg: '#ccff04' attr: 'b' }
        shape_string: '#ccff04'
        shape_string_interpolation: { fg: '#44b4cc' attr: 'b' }
        shape_table: { fg: '#44b4cc' attr: 'b' }
        shape_vardecl: { fg: '#44b4cc' attr: 'u' }
        shape_variable: '#9933cc'

        foreground: '#ffffff'
        background: '#000000'
        cursor: '#ffffff'

        empty: '#44b4cc'
        header: { fg: '#ccff04' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#ccff04' attr: 'b' }
        search_result: { fg: '#ff6600' bg: '#f5f5f5' }
        separator: '#f5f5f5'
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