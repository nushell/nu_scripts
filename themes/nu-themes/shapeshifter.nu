# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f996e2'
        block: '#3b48e3'
        cell-path: '#102015'
        closure: '#23edda'
        custom: '#000000'
        duration: '#dddd13'
        float: '#e92f2f'
        glob: '#000000'
        int: '#f996e2'
        list: '#23edda'
        nothing: '#e92f2f'
        range: '#dddd13'
        record: '#23edda'
        string: '#0ed839'

        bool: {|| if $in { '#23edda' } else { '#dddd13' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e92f2f' attr: 'b' }
            } else if $in < 6hr {
                '#e92f2f'
            } else if $in < 1day {
                '#dddd13'
            } else if $in < 3day {
                '#0ed839'
            } else if $in < 1wk {
                { fg: '#0ed839' attr: 'b' }
            } else if $in < 6wk {
                '#23edda'
            } else if $in < 52wk {
                '#3b48e3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#102015'
            } else if $e < 1mb {
                '#23edda'
            } else {{ fg: '#3b48e3' }}
        }

        shape_and: { fg: '#f996e2' attr: 'b' }
        shape_binary: { fg: '#f996e2' attr: 'b' }
        shape_block: { fg: '#3b48e3' attr: 'b' }
        shape_bool: '#23edda'
        shape_closure: { fg: '#23edda' attr: 'b' }
        shape_custom: '#0ed839'
        shape_datetime: { fg: '#23edda' attr: 'b' }
        shape_directory: '#23edda'
        shape_external: '#23edda'
        shape_external_resolved: '#23edda'
        shape_externalarg: { fg: '#0ed839' attr: 'b' }
        shape_filepath: '#23edda'
        shape_flag: { fg: '#3b48e3' attr: 'b' }
        shape_float: { fg: '#e92f2f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#23edda' attr: 'b' }
        shape_globpattern: { fg: '#23edda' attr: 'b' }
        shape_int: { fg: '#f996e2' attr: 'b' }
        shape_internalcall: { fg: '#23edda' attr: 'b' }
        shape_keyword: { fg: '#f996e2' attr: 'b' }
        shape_list: { fg: '#23edda' attr: 'b' }
        shape_literal: '#3b48e3'
        shape_match_pattern: '#0ed839'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e92f2f'
        shape_operator: '#dddd13'
        shape_or: { fg: '#f996e2' attr: 'b' }
        shape_pipe: { fg: '#f996e2' attr: 'b' }
        shape_range: { fg: '#dddd13' attr: 'b' }
        shape_raw_string: { fg: '#000000' attr: 'b' }
        shape_record: { fg: '#23edda' attr: 'b' }
        shape_redirection: { fg: '#f996e2' attr: 'b' }
        shape_signature: { fg: '#0ed839' attr: 'b' }
        shape_string: '#0ed839'
        shape_string_interpolation: { fg: '#23edda' attr: 'b' }
        shape_table: { fg: '#3b48e3' attr: 'b' }
        shape_vardecl: { fg: '#3b48e3' attr: 'u' }
        shape_variable: '#f996e2'

        foreground: '#102015'
        background: '#f9f9f9'
        cursor: '#102015'

        empty: '#3b48e3'
        header: { fg: '#0ed839' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#0ed839' attr: 'b' }
        search_result: { fg: '#e92f2f' bg: '#102015' }
        separator: '#102015'
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