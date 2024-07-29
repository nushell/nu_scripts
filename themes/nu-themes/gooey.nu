# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6488c4'
        block: '#58b6ca'
        cell-path: '#858893'
        closure: '#8d84c6'
        custom: '#ffffff'
        duration: '#c65e3d'
        float: '#ee829f'
        glob: '#ffffff'
        int: '#6488c4'
        list: '#8d84c6'
        nothing: '#bb4f6c'
        range: '#c65e3d'
        record: '#8d84c6'
        string: '#72ccae'

        bool: {|| if $in { '#c0b7f9' } else { '#c65e3d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#bb4f6c' attr: 'b' }
            } else if $in < 6hr {
                '#bb4f6c'
            } else if $in < 1day {
                '#c65e3d'
            } else if $in < 3day {
                '#72ccae'
            } else if $in < 1wk {
                { fg: '#72ccae' attr: 'b' }
            } else if $in < 6wk {
                '#8d84c6'
            } else if $in < 52wk {
                '#58b6ca'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#858893'
            } else if $e < 1mb {
                '#8d84c6'
            } else {{ fg: '#58b6ca' }}
        }

        shape_and: { fg: '#6488c4' attr: 'b' }
        shape_binary: { fg: '#6488c4' attr: 'b' }
        shape_block: { fg: '#58b6ca' attr: 'b' }
        shape_bool: '#c0b7f9'
        shape_closure: { fg: '#8d84c6' attr: 'b' }
        shape_custom: '#72ccae'
        shape_datetime: { fg: '#8d84c6' attr: 'b' }
        shape_directory: '#8d84c6'
        shape_external: '#8d84c6'
        shape_external_resolved: '#c0b7f9'
        shape_externalarg: { fg: '#72ccae' attr: 'b' }
        shape_filepath: '#8d84c6'
        shape_flag: { fg: '#58b6ca' attr: 'b' }
        shape_float: { fg: '#ee829f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8d84c6' attr: 'b' }
        shape_globpattern: { fg: '#8d84c6' attr: 'b' }
        shape_int: { fg: '#6488c4' attr: 'b' }
        shape_internalcall: { fg: '#8d84c6' attr: 'b' }
        shape_keyword: { fg: '#6488c4' attr: 'b' }
        shape_list: { fg: '#8d84c6' attr: 'b' }
        shape_literal: '#58b6ca'
        shape_match_pattern: '#72ccae'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#bb4f6c'
        shape_operator: '#c65e3d'
        shape_or: { fg: '#6488c4' attr: 'b' }
        shape_pipe: { fg: '#6488c4' attr: 'b' }
        shape_range: { fg: '#c65e3d' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#8d84c6' attr: 'b' }
        shape_redirection: { fg: '#6488c4' attr: 'b' }
        shape_signature: { fg: '#72ccae' attr: 'b' }
        shape_string: '#72ccae'
        shape_string_interpolation: { fg: '#8d84c6' attr: 'b' }
        shape_table: { fg: '#58b6ca' attr: 'b' }
        shape_vardecl: { fg: '#58b6ca' attr: 'u' }
        shape_variable: '#6488c4'

        foreground: '#ebeef9'
        background: '#0d101b'
        cursor: '#ebeef9'

        empty: '#58b6ca'
        header: { fg: '#72ccae' attr: 'b' }
        hints: '#1f222d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#72ccae' attr: 'b' }
        search_result: { fg: '#bb4f6c' bg: '#858893' }
        separator: '#858893'
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