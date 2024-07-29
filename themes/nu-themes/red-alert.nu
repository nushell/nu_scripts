# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e979d7'
        block: '#489bee'
        cell-path: '#d6d6d6'
        closure: '#6bbeb8'
        custom: '#ffffff'
        duration: '#beb86b'
        float: '#e02553'
        glob: '#ffffff'
        int: '#e979d7'
        list: '#6bbeb8'
        nothing: '#d62e4e'
        range: '#beb86b'
        record: '#6bbeb8'
        string: '#71be6b'

        bool: {|| if $in { '#b7dfdd' } else { '#beb86b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d62e4e' attr: 'b' }
            } else if $in < 6hr {
                '#d62e4e'
            } else if $in < 1day {
                '#beb86b'
            } else if $in < 3day {
                '#71be6b'
            } else if $in < 1wk {
                { fg: '#71be6b' attr: 'b' }
            } else if $in < 6wk {
                '#6bbeb8'
            } else if $in < 52wk {
                '#489bee'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d6d6d6'
            } else if $e < 1mb {
                '#6bbeb8'
            } else {{ fg: '#489bee' }}
        }

        shape_and: { fg: '#e979d7' attr: 'b' }
        shape_binary: { fg: '#e979d7' attr: 'b' }
        shape_block: { fg: '#489bee' attr: 'b' }
        shape_bool: '#b7dfdd'
        shape_closure: { fg: '#6bbeb8' attr: 'b' }
        shape_custom: '#71be6b'
        shape_datetime: { fg: '#6bbeb8' attr: 'b' }
        shape_directory: '#6bbeb8'
        shape_external: '#6bbeb8'
        shape_external_resolved: '#b7dfdd'
        shape_externalarg: { fg: '#71be6b' attr: 'b' }
        shape_filepath: '#6bbeb8'
        shape_flag: { fg: '#489bee' attr: 'b' }
        shape_float: { fg: '#e02553' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#6bbeb8' attr: 'b' }
        shape_globpattern: { fg: '#6bbeb8' attr: 'b' }
        shape_int: { fg: '#e979d7' attr: 'b' }
        shape_internalcall: { fg: '#6bbeb8' attr: 'b' }
        shape_keyword: { fg: '#e979d7' attr: 'b' }
        shape_list: { fg: '#6bbeb8' attr: 'b' }
        shape_literal: '#489bee'
        shape_match_pattern: '#71be6b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d62e4e'
        shape_operator: '#beb86b'
        shape_or: { fg: '#e979d7' attr: 'b' }
        shape_pipe: { fg: '#e979d7' attr: 'b' }
        shape_range: { fg: '#beb86b' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#6bbeb8' attr: 'b' }
        shape_redirection: { fg: '#e979d7' attr: 'b' }
        shape_signature: { fg: '#71be6b' attr: 'b' }
        shape_string: '#71be6b'
        shape_string_interpolation: { fg: '#6bbeb8' attr: 'b' }
        shape_table: { fg: '#489bee' attr: 'b' }
        shape_vardecl: { fg: '#489bee' attr: 'u' }
        shape_variable: '#e979d7'

        foreground: '#ffffff'
        background: '#762423'
        cursor: '#ffffff'

        empty: '#489bee'
        header: { fg: '#71be6b' attr: 'b' }
        hints: '#262626'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#71be6b' attr: 'b' }
        search_result: { fg: '#d62e4e' bg: '#d6d6d6' }
        separator: '#d6d6d6'
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