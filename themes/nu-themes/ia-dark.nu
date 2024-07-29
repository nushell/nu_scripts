# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b98eb2'
        block: '#8eccdd'
        cell-path: '#cccccc'
        closure: '#7c9cae'
        custom: '#f8f8f8'
        duration: '#b99353'
        float: '#d88568'
        glob: '#f8f8f8'
        int: '#b98eb2'
        list: '#7c9cae'
        nothing: '#d88568'
        range: '#b99353'
        record: '#7c9cae'
        string: '#83a471'

        bool: {|| if $in { '#7c9cae' } else { '#b99353' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d88568' attr: 'b' }
            } else if $in < 6hr {
                '#d88568'
            } else if $in < 1day {
                '#b99353'
            } else if $in < 3day {
                '#83a471'
            } else if $in < 1wk {
                { fg: '#83a471' attr: 'b' }
            } else if $in < 6wk {
                '#7c9cae'
            } else if $in < 52wk {
                '#8eccdd'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cccccc'
            } else if $e < 1mb {
                '#7c9cae'
            } else {{ fg: '#8eccdd' }}
        }

        shape_and: { fg: '#b98eb2' attr: 'b' }
        shape_binary: { fg: '#b98eb2' attr: 'b' }
        shape_block: { fg: '#8eccdd' attr: 'b' }
        shape_bool: '#7c9cae'
        shape_closure: { fg: '#7c9cae' attr: 'b' }
        shape_custom: '#83a471'
        shape_datetime: { fg: '#7c9cae' attr: 'b' }
        shape_directory: '#7c9cae'
        shape_external: '#7c9cae'
        shape_external_resolved: '#7c9cae'
        shape_externalarg: { fg: '#83a471' attr: 'b' }
        shape_filepath: '#7c9cae'
        shape_flag: { fg: '#8eccdd' attr: 'b' }
        shape_float: { fg: '#d88568' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#7c9cae' attr: 'b' }
        shape_globpattern: { fg: '#7c9cae' attr: 'b' }
        shape_int: { fg: '#b98eb2' attr: 'b' }
        shape_internalcall: { fg: '#7c9cae' attr: 'b' }
        shape_keyword: { fg: '#b98eb2' attr: 'b' }
        shape_list: { fg: '#7c9cae' attr: 'b' }
        shape_literal: '#8eccdd'
        shape_match_pattern: '#83a471'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d88568'
        shape_operator: '#b99353'
        shape_or: { fg: '#b98eb2' attr: 'b' }
        shape_pipe: { fg: '#b98eb2' attr: 'b' }
        shape_range: { fg: '#b99353' attr: 'b' }
        shape_raw_string: { fg: '#f8f8f8' attr: 'b' }
        shape_record: { fg: '#7c9cae' attr: 'b' }
        shape_redirection: { fg: '#b98eb2' attr: 'b' }
        shape_signature: { fg: '#83a471' attr: 'b' }
        shape_string: '#83a471'
        shape_string_interpolation: { fg: '#7c9cae' attr: 'b' }
        shape_table: { fg: '#8eccdd' attr: 'b' }
        shape_vardecl: { fg: '#8eccdd' attr: 'u' }
        shape_variable: '#b98eb2'

        foreground: '#cccccc'
        background: '#1a1a1a'
        cursor: '#cccccc'

        empty: '#8eccdd'
        header: { fg: '#83a471' attr: 'b' }
        hints: '#767676'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#83a471' attr: 'b' }
        search_result: { fg: '#d88568' bg: '#cccccc' }
        separator: '#cccccc'
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