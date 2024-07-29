# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c8954c'
        block: '#30aeb0'
        cell-path: '#ab9aa9'
        closure: '#5fad8f'
        custom: '#bbbcbc'
        duration: '#7fad00'
        float: '#d2a634'
        glob: '#bbbcbc'
        int: '#c8954c'
        list: '#5fad8f'
        nothing: '#c19904'
        range: '#7fad00'
        record: '#5fad8f'
        string: '#34b534'

        bool: {|| if $in { '#10c480' } else { '#7fad00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c19904' attr: 'b' }
            } else if $in < 6hr {
                '#c19904'
            } else if $in < 1day {
                '#7fad00'
            } else if $in < 3day {
                '#34b534'
            } else if $in < 1wk {
                { fg: '#34b534' attr: 'b' }
            } else if $in < 6wk {
                '#5fad8f'
            } else if $in < 52wk {
                '#30aeb0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ab9aa9'
            } else if $e < 1mb {
                '#5fad8f'
            } else {{ fg: '#30aeb0' }}
        }

        shape_and: { fg: '#c8954c' attr: 'b' }
        shape_binary: { fg: '#c8954c' attr: 'b' }
        shape_block: { fg: '#30aeb0' attr: 'b' }
        shape_bool: '#10c480'
        shape_closure: { fg: '#5fad8f' attr: 'b' }
        shape_custom: '#34b534'
        shape_datetime: { fg: '#5fad8f' attr: 'b' }
        shape_directory: '#5fad8f'
        shape_external: '#5fad8f'
        shape_external_resolved: '#10c480'
        shape_externalarg: { fg: '#34b534' attr: 'b' }
        shape_filepath: '#5fad8f'
        shape_flag: { fg: '#30aeb0' attr: 'b' }
        shape_float: { fg: '#d2a634' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5fad8f' attr: 'b' }
        shape_globpattern: { fg: '#5fad8f' attr: 'b' }
        shape_int: { fg: '#c8954c' attr: 'b' }
        shape_internalcall: { fg: '#5fad8f' attr: 'b' }
        shape_keyword: { fg: '#c8954c' attr: 'b' }
        shape_list: { fg: '#5fad8f' attr: 'b' }
        shape_literal: '#30aeb0'
        shape_match_pattern: '#34b534'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c19904'
        shape_operator: '#7fad00'
        shape_or: { fg: '#c8954c' attr: 'b' }
        shape_pipe: { fg: '#c8954c' attr: 'b' }
        shape_range: { fg: '#7fad00' attr: 'b' }
        shape_raw_string: { fg: '#bbbcbc' attr: 'b' }
        shape_record: { fg: '#5fad8f' attr: 'b' }
        shape_redirection: { fg: '#c8954c' attr: 'b' }
        shape_signature: { fg: '#34b534' attr: 'b' }
        shape_string: '#34b534'
        shape_string_interpolation: { fg: '#5fad8f' attr: 'b' }
        shape_table: { fg: '#30aeb0' attr: 'b' }
        shape_vardecl: { fg: '#30aeb0' attr: 'u' }
        shape_variable: '#c8954c'

        foreground: '#bbbcbc'
        background: '#162c22'
        cursor: '#bbbcbc'

        empty: '#30aeb0'
        header: { fg: '#34b534' attr: 'b' }
        hints: '#283431'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#34b534' attr: 'b' }
        search_result: { fg: '#c19904' bg: '#ab9aa9' }
        separator: '#ab9aa9'
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