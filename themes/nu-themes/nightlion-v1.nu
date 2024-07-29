# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bb00bb'
        block: '#276bd8'
        cell-path: '#bbbbbb'
        closure: '#00dadf'
        custom: '#ffffff'
        duration: '#f3f167'
        float: '#ff5555'
        glob: '#ffffff'
        int: '#bb00bb'
        list: '#00dadf'
        nothing: '#bb0000'
        range: '#f3f167'
        record: '#00dadf'
        string: '#5fde8f'

        bool: {|| if $in { '#55ffff' } else { '#f3f167' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#bb0000' attr: 'b' }
            } else if $in < 6hr {
                '#bb0000'
            } else if $in < 1day {
                '#f3f167'
            } else if $in < 3day {
                '#5fde8f'
            } else if $in < 1wk {
                { fg: '#5fde8f' attr: 'b' }
            } else if $in < 6wk {
                '#00dadf'
            } else if $in < 52wk {
                '#276bd8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#00dadf'
            } else {{ fg: '#276bd8' }}
        }

        shape_and: { fg: '#bb00bb' attr: 'b' }
        shape_binary: { fg: '#bb00bb' attr: 'b' }
        shape_block: { fg: '#276bd8' attr: 'b' }
        shape_bool: '#55ffff'
        shape_closure: { fg: '#00dadf' attr: 'b' }
        shape_custom: '#5fde8f'
        shape_datetime: { fg: '#00dadf' attr: 'b' }
        shape_directory: '#00dadf'
        shape_external: '#00dadf'
        shape_external_resolved: '#55ffff'
        shape_externalarg: { fg: '#5fde8f' attr: 'b' }
        shape_filepath: '#00dadf'
        shape_flag: { fg: '#276bd8' attr: 'b' }
        shape_float: { fg: '#ff5555' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00dadf' attr: 'b' }
        shape_globpattern: { fg: '#00dadf' attr: 'b' }
        shape_int: { fg: '#bb00bb' attr: 'b' }
        shape_internalcall: { fg: '#00dadf' attr: 'b' }
        shape_keyword: { fg: '#bb00bb' attr: 'b' }
        shape_list: { fg: '#00dadf' attr: 'b' }
        shape_literal: '#276bd8'
        shape_match_pattern: '#5fde8f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#bb0000'
        shape_operator: '#f3f167'
        shape_or: { fg: '#bb00bb' attr: 'b' }
        shape_pipe: { fg: '#bb00bb' attr: 'b' }
        shape_range: { fg: '#f3f167' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00dadf' attr: 'b' }
        shape_redirection: { fg: '#bb00bb' attr: 'b' }
        shape_signature: { fg: '#5fde8f' attr: 'b' }
        shape_string: '#5fde8f'
        shape_string_interpolation: { fg: '#00dadf' attr: 'b' }
        shape_table: { fg: '#276bd8' attr: 'b' }
        shape_vardecl: { fg: '#276bd8' attr: 'u' }
        shape_variable: '#bb00bb'

        foreground: '#bbbbbb'
        background: '#000000'
        cursor: '#bbbbbb'

        empty: '#276bd8'
        header: { fg: '#5fde8f' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#5fde8f' attr: 'b' }
        search_result: { fg: '#bb0000' bg: '#bbbbbb' }
        separator: '#bbbbbb'
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