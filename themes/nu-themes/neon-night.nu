# Retrieve the theme settings
export def main [] {
    return {
        binary: '#dd92f6'
        block: '#69b4f9'
        cell-path: '#c9cccd'
        closure: '#8ce8ff'
        custom: '#c9cccd'
        duration: '#fcad3f'
        float: '#ff8e8e'
        glob: '#c9cccd'
        int: '#dd92f6'
        list: '#8ce8ff'
        nothing: '#ff8e8e'
        range: '#fcad3f'
        record: '#8ce8ff'
        string: '#7efdd0'

        bool: {|| if $in { '#8ce8ff' } else { '#fcad3f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff8e8e' attr: 'b' }
            } else if $in < 6hr {
                '#ff8e8e'
            } else if $in < 1day {
                '#fcad3f'
            } else if $in < 3day {
                '#7efdd0'
            } else if $in < 1wk {
                { fg: '#7efdd0' attr: 'b' }
            } else if $in < 6wk {
                '#8ce8ff'
            } else if $in < 52wk {
                '#69b4f9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#c9cccd'
            } else if $e < 1mb {
                '#8ce8ff'
            } else {{ fg: '#69b4f9' }}
        }

        shape_and: { fg: '#dd92f6' attr: 'b' }
        shape_binary: { fg: '#dd92f6' attr: 'b' }
        shape_block: { fg: '#69b4f9' attr: 'b' }
        shape_bool: '#8ce8ff'
        shape_closure: { fg: '#8ce8ff' attr: 'b' }
        shape_custom: '#7efdd0'
        shape_datetime: { fg: '#8ce8ff' attr: 'b' }
        shape_directory: '#8ce8ff'
        shape_external: '#8ce8ff'
        shape_external_resolved: '#8ce8ff'
        shape_externalarg: { fg: '#7efdd0' attr: 'b' }
        shape_filepath: '#8ce8ff'
        shape_flag: { fg: '#69b4f9' attr: 'b' }
        shape_float: { fg: '#ff8e8e' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#8ce8ff' attr: 'b' }
        shape_globpattern: { fg: '#8ce8ff' attr: 'b' }
        shape_int: { fg: '#dd92f6' attr: 'b' }
        shape_internalcall: { fg: '#8ce8ff' attr: 'b' }
        shape_keyword: { fg: '#dd92f6' attr: 'b' }
        shape_list: { fg: '#8ce8ff' attr: 'b' }
        shape_literal: '#69b4f9'
        shape_match_pattern: '#7efdd0'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff8e8e'
        shape_operator: '#fcad3f'
        shape_or: { fg: '#dd92f6' attr: 'b' }
        shape_pipe: { fg: '#dd92f6' attr: 'b' }
        shape_range: { fg: '#fcad3f' attr: 'b' }
        shape_raw_string: { fg: '#c9cccd' attr: 'b' }
        shape_record: { fg: '#8ce8ff' attr: 'b' }
        shape_redirection: { fg: '#dd92f6' attr: 'b' }
        shape_signature: { fg: '#7efdd0' attr: 'b' }
        shape_string: '#7efdd0'
        shape_string_interpolation: { fg: '#8ce8ff' attr: 'b' }
        shape_table: { fg: '#69b4f9' attr: 'b' }
        shape_vardecl: { fg: '#69b4f9' attr: 'u' }
        shape_variable: '#dd92f6'

        foreground: '#c7c8ff'
        background: '#20242d'
        cursor: '#c7c8ff'

        empty: '#69b4f9'
        header: { fg: '#7efdd0' attr: 'b' }
        hints: '#20242d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7efdd0' attr: 'b' }
        search_result: { fg: '#ff8e8e' bg: '#c9cccd' }
        separator: '#c9cccd'
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