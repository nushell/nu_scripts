# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6b2775'
        block: '#006bb3'
        cell-path: '#ededed'
        closure: '#384564'
        custom: '#ffffff'
        duration: '#ffcb3e'
        float: '#f07e18'
        glob: '#ffffff'
        int: '#6b2775'
        list: '#384564'
        nothing: '#d00e18'
        range: '#ffcb3e'
        record: '#384564'
        string: '#138034'

        bool: {|| if $in { '#5d504a' } else { '#ffcb3e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d00e18' attr: 'b' }
            } else if $in < 6hr {
                '#d00e18'
            } else if $in < 1day {
                '#ffcb3e'
            } else if $in < 3day {
                '#138034'
            } else if $in < 1wk {
                { fg: '#138034' attr: 'b' }
            } else if $in < 6wk {
                '#384564'
            } else if $in < 52wk {
                '#006bb3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ededed'
            } else if $e < 1mb {
                '#384564'
            } else {{ fg: '#006bb3' }}
        }

        shape_and: { fg: '#6b2775' attr: 'b' }
        shape_binary: { fg: '#6b2775' attr: 'b' }
        shape_block: { fg: '#006bb3' attr: 'b' }
        shape_bool: '#5d504a'
        shape_closure: { fg: '#384564' attr: 'b' }
        shape_custom: '#138034'
        shape_datetime: { fg: '#384564' attr: 'b' }
        shape_directory: '#384564'
        shape_external: '#384564'
        shape_external_resolved: '#5d504a'
        shape_externalarg: { fg: '#138034' attr: 'b' }
        shape_filepath: '#384564'
        shape_flag: { fg: '#006bb3' attr: 'b' }
        shape_float: { fg: '#f07e18' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#384564' attr: 'b' }
        shape_globpattern: { fg: '#384564' attr: 'b' }
        shape_int: { fg: '#6b2775' attr: 'b' }
        shape_internalcall: { fg: '#384564' attr: 'b' }
        shape_keyword: { fg: '#6b2775' attr: 'b' }
        shape_list: { fg: '#384564' attr: 'b' }
        shape_literal: '#006bb3'
        shape_match_pattern: '#138034'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d00e18'
        shape_operator: '#ffcb3e'
        shape_or: { fg: '#6b2775' attr: 'b' }
        shape_pipe: { fg: '#6b2775' attr: 'b' }
        shape_range: { fg: '#ffcb3e' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#384564' attr: 'b' }
        shape_redirection: { fg: '#6b2775' attr: 'b' }
        shape_signature: { fg: '#138034' attr: 'b' }
        shape_string: '#138034'
        shape_string_interpolation: { fg: '#384564' attr: 'b' }
        shape_table: { fg: '#006bb3' attr: 'b' }
        shape_vardecl: { fg: '#006bb3' attr: 'u' }
        shape_variable: '#6b2775'

        foreground: '#ededed'
        background: '#222225'
        cursor: '#ededed'

        empty: '#006bb3'
        header: { fg: '#138034' attr: 'b' }
        hints: '#5d504a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#138034' attr: 'b' }
        search_result: { fg: '#d00e18' bg: '#ededed' }
        separator: '#ededed'
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