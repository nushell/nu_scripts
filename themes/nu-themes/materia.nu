# Retrieve the theme settings
export def main [] {
    return {
        binary: '#82aaff'
        block: '#89ddff'
        cell-path: '#cdd3de'
        closure: '#80cbc4'
        custom: '#ffffff'
        duration: '#ffcc00'
        float: '#ec5f67'
        glob: '#ffffff'
        int: '#82aaff'
        list: '#80cbc4'
        nothing: '#ec5f67'
        range: '#ffcc00'
        record: '#80cbc4'
        string: '#8bd649'

        bool: {|| if $in { '#80cbc4' } else { '#ffcc00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ec5f67' attr: 'b' }
            } else if $in < 6hr {
                '#ec5f67'
            } else if $in < 1day {
                '#ffcc00'
            } else if $in < 3day {
                '#8bd649'
            } else if $in < 1wk {
                { fg: '#8bd649' attr: 'b' }
            } else if $in < 6wk {
                '#80cbc4'
            } else if $in < 52wk {
                '#89ddff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cdd3de'
            } else if $e < 1mb {
                '#80cbc4'
            } else {{ fg: '#89ddff' }}
        }

        shape_and: { fg: '#82aaff' attr: 'b' }
        shape_binary: { fg: '#82aaff' attr: 'b' }
        shape_block: { fg: '#89ddff' attr: 'b' }
        shape_bool: '#80cbc4'
        shape_closure: { fg: '#80cbc4' attr: 'b' }
        shape_custom: '#8bd649'
        shape_datetime: { fg: '#80cbc4' attr: 'b' }
        shape_directory: '#80cbc4'
        shape_external: '#80cbc4'
        shape_external_resolved: '#80cbc4'
        shape_externalarg: { fg: '#8bd649' attr: 'b' }
        shape_filepath: '#80cbc4'
        shape_flag: { fg: '#89ddff' attr: 'b' }
        shape_float: { fg: '#ec5f67' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#80cbc4' attr: 'b' }
        shape_globpattern: { fg: '#80cbc4' attr: 'b' }
        shape_int: { fg: '#82aaff' attr: 'b' }
        shape_internalcall: { fg: '#80cbc4' attr: 'b' }
        shape_keyword: { fg: '#82aaff' attr: 'b' }
        shape_list: { fg: '#80cbc4' attr: 'b' }
        shape_literal: '#89ddff'
        shape_match_pattern: '#8bd649'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ec5f67'
        shape_operator: '#ffcc00'
        shape_or: { fg: '#82aaff' attr: 'b' }
        shape_pipe: { fg: '#82aaff' attr: 'b' }
        shape_range: { fg: '#ffcc00' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#80cbc4' attr: 'b' }
        shape_redirection: { fg: '#82aaff' attr: 'b' }
        shape_signature: { fg: '#8bd649' attr: 'b' }
        shape_string: '#8bd649'
        shape_string_interpolation: { fg: '#80cbc4' attr: 'b' }
        shape_table: { fg: '#89ddff' attr: 'b' }
        shape_vardecl: { fg: '#89ddff' attr: 'u' }
        shape_variable: '#82aaff'

        foreground: '#cdd3de'
        background: '#263238'
        cursor: '#cdd3de'

        empty: '#89ddff'
        header: { fg: '#8bd649' attr: 'b' }
        hints: '#707880'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8bd649' attr: 'b' }
        search_result: { fg: '#ec5f67' bg: '#cdd3de' }
        separator: '#cdd3de'
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