# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8f4673'
        block: '#0d6678'
        cell-path: '#a89984'
        closure: '#8ba59b'
        custom: '#fdf4c1'
        duration: '#fac03b'
        float: '#fb543f'
        glob: '#fdf4c1'
        int: '#8f4673'
        list: '#8ba59b'
        nothing: '#fb543f'
        range: '#fac03b'
        record: '#8ba59b'
        string: '#95c085'

        bool: {|| if $in { '#8ba59b' } else { '#fac03b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fb543f' attr: 'b' }
            } else if $in < 6hr {
                '#fb543f'
            } else if $in < 1day {
                '#fac03b'
            } else if $in < 3day {
                '#95c085'
            } else if $in < 1wk {
                { fg: '#95c085' attr: 'b' }
            } else if $in < 6wk {
                '#8ba59b'
            } else if $in < 52wk {
                '#0d6678'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a89984'
            } else if $e < 1mb {
                '#8ba59b'
            } else {{ fg: '#0d6678' }}
        }

        shape_and: { fg: '#8f4673' attr: 'b' }
        shape_binary: { fg: '#8f4673' attr: 'b' }
        shape_block: { fg: '#0d6678' attr: 'b' }
        shape_bool: '#8ba59b'
        shape_closure: { fg: '#8ba59b' attr: 'b' }
        shape_custom: '#95c085'
        shape_datetime: { fg: '#8ba59b' attr: 'b' }
        shape_directory: '#8ba59b'
        shape_external: '#8ba59b'
        shape_external_resolved: '#8ba59b'
        shape_externalarg: { fg: '#95c085' attr: 'b' }
        shape_filepath: '#8ba59b'
        shape_flag: { fg: '#0d6678' attr: 'b' }
        shape_float: { fg: '#fb543f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8ba59b' attr: 'b' }
        shape_globpattern: { fg: '#8ba59b' attr: 'b' }
        shape_int: { fg: '#8f4673' attr: 'b' }
        shape_internalcall: { fg: '#8ba59b' attr: 'b' }
        shape_keyword: { fg: '#8f4673' attr: 'b' }
        shape_list: { fg: '#8ba59b' attr: 'b' }
        shape_literal: '#0d6678'
        shape_match_pattern: '#95c085'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fb543f'
        shape_operator: '#fac03b'
        shape_or: { fg: '#8f4673' attr: 'b' }
        shape_pipe: { fg: '#8f4673' attr: 'b' }
        shape_range: { fg: '#fac03b' attr: 'b' }
        shape_raw_string: { fg: '#fdf4c1' attr: 'b' }
        shape_record: { fg: '#8ba59b' attr: 'b' }
        shape_redirection: { fg: '#8f4673' attr: 'b' }
        shape_signature: { fg: '#95c085' attr: 'b' }
        shape_string: '#95c085'
        shape_string_interpolation: { fg: '#8ba59b' attr: 'b' }
        shape_table: { fg: '#0d6678' attr: 'b' }
        shape_vardecl: { fg: '#0d6678' attr: 'u' }
        shape_variable: '#8f4673'

        foreground: '#a89984'
        background: '#1d2021'
        cursor: '#a89984'

        empty: '#0d6678'
        header: { fg: '#95c085' attr: 'b' }
        hints: '#665c54'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#95c085' attr: 'b' }
        search_result: { fg: '#fb543f' bg: '#a89984' }
        separator: '#a89984'
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