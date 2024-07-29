# Retrieve the theme settings
export def main [] {
    return {
        binary: '#1b3cff'
        block: '#3282ff'
        cell-path: '#bbbbbb'
        closure: '#0037fc'
        custom: '#ffffff'
        duration: '#7f0a1f'
        float: '#ff5454'
        glob: '#ffffff'
        int: '#1b3cff'
        list: '#0037fc'
        nothing: '#ff5555'
        range: '#7f0a1f'
        record: '#0037fc'
        string: '#fa0074'

        bool: {|| if $in { '#8ae9fc' } else { '#7f0a1f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff5555' attr: 'b' }
            } else if $in < 6hr {
                '#ff5555'
            } else if $in < 1day {
                '#7f0a1f'
            } else if $in < 3day {
                '#fa0074'
            } else if $in < 1wk {
                { fg: '#fa0074' attr: 'b' }
            } else if $in < 6wk {
                '#0037fc'
            } else if $in < 52wk {
                '#3282ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#0037fc'
            } else {{ fg: '#3282ff' }}
        }

        shape_and: { fg: '#1b3cff' attr: 'b' }
        shape_binary: { fg: '#1b3cff' attr: 'b' }
        shape_block: { fg: '#3282ff' attr: 'b' }
        shape_bool: '#8ae9fc'
        shape_closure: { fg: '#0037fc' attr: 'b' }
        shape_custom: '#fa0074'
        shape_datetime: { fg: '#0037fc' attr: 'b' }
        shape_directory: '#0037fc'
        shape_external: '#0037fc'
        shape_external_resolved: '#8ae9fc'
        shape_externalarg: { fg: '#fa0074' attr: 'b' }
        shape_filepath: '#0037fc'
        shape_flag: { fg: '#3282ff' attr: 'b' }
        shape_float: { fg: '#ff5454' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0037fc' attr: 'b' }
        shape_globpattern: { fg: '#0037fc' attr: 'b' }
        shape_int: { fg: '#1b3cff' attr: 'b' }
        shape_internalcall: { fg: '#0037fc' attr: 'b' }
        shape_keyword: { fg: '#1b3cff' attr: 'b' }
        shape_list: { fg: '#0037fc' attr: 'b' }
        shape_literal: '#3282ff'
        shape_match_pattern: '#fa0074'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff5555'
        shape_operator: '#7f0a1f'
        shape_or: { fg: '#1b3cff' attr: 'b' }
        shape_pipe: { fg: '#1b3cff' attr: 'b' }
        shape_range: { fg: '#7f0a1f' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#0037fc' attr: 'b' }
        shape_redirection: { fg: '#1b3cff' attr: 'b' }
        shape_signature: { fg: '#fa0074' attr: 'b' }
        shape_string: '#fa0074'
        shape_string_interpolation: { fg: '#0037fc' attr: 'b' }
        shape_table: { fg: '#3282ff' attr: 'b' }
        shape_vardecl: { fg: '#3282ff' attr: 'u' }
        shape_variable: '#1b3cff'

        foreground: '#cef3ff'
        background: '#222330'
        cursor: '#ffffff'

        empty: '#3282ff'
        header: { fg: '#fa0074' attr: 'b' }
        hints: '#545454'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#fa0074' attr: 'b' }
        search_result: { fg: '#ff5555' bg: '#bbbbbb' }
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