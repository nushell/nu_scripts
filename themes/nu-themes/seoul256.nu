# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d7afaf'
        block: '#85add4'
        cell-path: '#d0d0d0'
        closure: '#87afaf'
        custom: '#e4e4e4'
        duration: '#d8af5f'
        float: '#d75f87'
        glob: '#e4e4e4'
        int: '#d7afaf'
        list: '#87afaf'
        nothing: '#d68787'
        range: '#d8af5f'
        record: '#87afaf'
        string: '#5f865f'

        bool: {|| if $in { '#87d7d7' } else { '#d8af5f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d68787' attr: 'b' }
            } else if $in < 6hr {
                '#d68787'
            } else if $in < 1day {
                '#d8af5f'
            } else if $in < 3day {
                '#5f865f'
            } else if $in < 1wk {
                { fg: '#5f865f' attr: 'b' }
            } else if $in < 6wk {
                '#87afaf'
            } else if $in < 52wk {
                '#85add4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0d0d0'
            } else if $e < 1mb {
                '#87afaf'
            } else {{ fg: '#85add4' }}
        }

        shape_and: { fg: '#d7afaf' attr: 'b' }
        shape_binary: { fg: '#d7afaf' attr: 'b' }
        shape_block: { fg: '#85add4' attr: 'b' }
        shape_bool: '#87d7d7'
        shape_closure: { fg: '#87afaf' attr: 'b' }
        shape_custom: '#5f865f'
        shape_datetime: { fg: '#87afaf' attr: 'b' }
        shape_directory: '#87afaf'
        shape_external: '#87afaf'
        shape_external_resolved: '#87d7d7'
        shape_externalarg: { fg: '#5f865f' attr: 'b' }
        shape_filepath: '#87afaf'
        shape_flag: { fg: '#85add4' attr: 'b' }
        shape_float: { fg: '#d75f87' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#87afaf' attr: 'b' }
        shape_globpattern: { fg: '#87afaf' attr: 'b' }
        shape_int: { fg: '#d7afaf' attr: 'b' }
        shape_internalcall: { fg: '#87afaf' attr: 'b' }
        shape_keyword: { fg: '#d7afaf' attr: 'b' }
        shape_list: { fg: '#87afaf' attr: 'b' }
        shape_literal: '#85add4'
        shape_match_pattern: '#5f865f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d68787'
        shape_operator: '#d8af5f'
        shape_or: { fg: '#d7afaf' attr: 'b' }
        shape_pipe: { fg: '#d7afaf' attr: 'b' }
        shape_range: { fg: '#d8af5f' attr: 'b' }
        shape_raw_string: { fg: '#e4e4e4' attr: 'b' }
        shape_record: { fg: '#87afaf' attr: 'b' }
        shape_redirection: { fg: '#d7afaf' attr: 'b' }
        shape_signature: { fg: '#5f865f' attr: 'b' }
        shape_string: '#5f865f'
        shape_string_interpolation: { fg: '#87afaf' attr: 'b' }
        shape_table: { fg: '#85add4' attr: 'b' }
        shape_vardecl: { fg: '#85add4' attr: 'u' }
        shape_variable: '#d7afaf'

        foreground: '#d0d0d0'
        background: '#3a3a3a'
        cursor: '#d0d0d0'

        empty: '#85add4'
        header: { fg: '#5f865f' attr: 'b' }
        hints: '#626262'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#5f865f' attr: 'b' }
        search_result: { fg: '#d68787' bg: '#d0d0d0' }
        separator: '#d0d0d0'
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