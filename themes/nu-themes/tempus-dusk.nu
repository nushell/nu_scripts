# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b190af'
        block: '#8c9abe'
        cell-path: '#a29899'
        closure: '#8e9aba'
        custom: '#a2a8ba'
        duration: '#a79c46'
        float: '#d39d74'
        glob: '#a2a8ba'
        int: '#b190af'
        list: '#8e9aba'
        nothing: '#cb8d56'
        range: '#a79c46'
        record: '#8e9aba'
        string: '#8ba089'

        bool: {|| if $in { '#8caeb6' } else { '#a79c46' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#cb8d56' attr: 'b' }
            } else if $in < 6hr {
                '#cb8d56'
            } else if $in < 1day {
                '#a79c46'
            } else if $in < 3day {
                '#8ba089'
            } else if $in < 1wk {
                { fg: '#8ba089' attr: 'b' }
            } else if $in < 6wk {
                '#8e9aba'
            } else if $in < 52wk {
                '#8c9abe'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a29899'
            } else if $e < 1mb {
                '#8e9aba'
            } else {{ fg: '#8c9abe' }}
        }

        shape_and: { fg: '#b190af' attr: 'b' }
        shape_binary: { fg: '#b190af' attr: 'b' }
        shape_block: { fg: '#8c9abe' attr: 'b' }
        shape_bool: '#8caeb6'
        shape_closure: { fg: '#8e9aba' attr: 'b' }
        shape_custom: '#8ba089'
        shape_datetime: { fg: '#8e9aba' attr: 'b' }
        shape_directory: '#8e9aba'
        shape_external: '#8e9aba'
        shape_external_resolved: '#8caeb6'
        shape_externalarg: { fg: '#8ba089' attr: 'b' }
        shape_filepath: '#8e9aba'
        shape_flag: { fg: '#8c9abe' attr: 'b' }
        shape_float: { fg: '#d39d74' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8e9aba' attr: 'b' }
        shape_globpattern: { fg: '#8e9aba' attr: 'b' }
        shape_int: { fg: '#b190af' attr: 'b' }
        shape_internalcall: { fg: '#8e9aba' attr: 'b' }
        shape_keyword: { fg: '#b190af' attr: 'b' }
        shape_list: { fg: '#8e9aba' attr: 'b' }
        shape_literal: '#8c9abe'
        shape_match_pattern: '#8ba089'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#cb8d56'
        shape_operator: '#a79c46'
        shape_or: { fg: '#b190af' attr: 'b' }
        shape_pipe: { fg: '#b190af' attr: 'b' }
        shape_range: { fg: '#a79c46' attr: 'b' }
        shape_raw_string: { fg: '#a2a8ba' attr: 'b' }
        shape_record: { fg: '#8e9aba' attr: 'b' }
        shape_redirection: { fg: '#b190af' attr: 'b' }
        shape_signature: { fg: '#8ba089' attr: 'b' }
        shape_string: '#8ba089'
        shape_string_interpolation: { fg: '#8e9aba' attr: 'b' }
        shape_table: { fg: '#8c9abe' attr: 'b' }
        shape_vardecl: { fg: '#8c9abe' attr: 'u' }
        shape_variable: '#b190af'

        foreground: '#a2a8ba'
        background: '#1f252d'
        cursor: '#a2a8ba'

        empty: '#8c9abe'
        header: { fg: '#8ba089' attr: 'b' }
        hints: '#2c3150'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8ba089' attr: 'b' }
        search_result: { fg: '#cb8d56' bg: '#a29899' }
        separator: '#a29899'
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