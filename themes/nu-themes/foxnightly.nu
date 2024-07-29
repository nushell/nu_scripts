# Retrieve the theme settings
export def main [] {
    return {
        binary: '#75507b'
        block: '#66a05b'
        cell-path: '#ffffff'
        closure: '#acacae'
        custom: '#5c3566'
        duration: '#729fcf'
        float: '#bf4040'
        glob: '#5c3566'
        int: '#75507b'
        list: '#acacae'
        nothing: '#b98eff'
        range: '#729fcf'
        record: '#acacae'
        string: '#ff7de9'

        bool: {|| if $in { '#c4a000' } else { '#729fcf' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b98eff' attr: 'b' }
            } else if $in < 6hr {
                '#b98eff'
            } else if $in < 1day {
                '#729fcf'
            } else if $in < 3day {
                '#ff7de9'
            } else if $in < 1wk {
                { fg: '#ff7de9' attr: 'b' }
            } else if $in < 6wk {
                '#acacae'
            } else if $in < 52wk {
                '#66a05b'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#acacae'
            } else {{ fg: '#66a05b' }}
        }

        shape_and: { fg: '#75507b' attr: 'b' }
        shape_binary: { fg: '#75507b' attr: 'b' }
        shape_block: { fg: '#66a05b' attr: 'b' }
        shape_bool: '#c4a000'
        shape_closure: { fg: '#acacae' attr: 'b' }
        shape_custom: '#ff7de9'
        shape_datetime: { fg: '#acacae' attr: 'b' }
        shape_directory: '#acacae'
        shape_external: '#acacae'
        shape_external_resolved: '#c4a000'
        shape_externalarg: { fg: '#ff7de9' attr: 'b' }
        shape_filepath: '#acacae'
        shape_flag: { fg: '#66a05b' attr: 'b' }
        shape_float: { fg: '#bf4040' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#acacae' attr: 'b' }
        shape_globpattern: { fg: '#acacae' attr: 'b' }
        shape_int: { fg: '#75507b' attr: 'b' }
        shape_internalcall: { fg: '#acacae' attr: 'b' }
        shape_keyword: { fg: '#75507b' attr: 'b' }
        shape_list: { fg: '#acacae' attr: 'b' }
        shape_literal: '#66a05b'
        shape_match_pattern: '#ff7de9'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b98eff'
        shape_operator: '#729fcf'
        shape_or: { fg: '#75507b' attr: 'b' }
        shape_pipe: { fg: '#75507b' attr: 'b' }
        shape_range: { fg: '#729fcf' attr: 'b' }
        shape_raw_string: { fg: '#5c3566' attr: 'b' }
        shape_record: { fg: '#acacae' attr: 'b' }
        shape_redirection: { fg: '#75507b' attr: 'b' }
        shape_signature: { fg: '#ff7de9' attr: 'b' }
        shape_string: '#ff7de9'
        shape_string_interpolation: { fg: '#acacae' attr: 'b' }
        shape_table: { fg: '#66a05b' attr: 'b' }
        shape_vardecl: { fg: '#66a05b' attr: 'u' }
        shape_variable: '#75507b'

        foreground: '#d7d7db'
        background: '#2a2a2e'
        cursor: '#d7d7db'

        empty: '#66a05b'
        header: { fg: '#ff7de9' attr: 'b' }
        hints: '#a40000'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#ff7de9' attr: 'b' }
        search_result: { fg: '#b98eff' bg: '#ffffff' }
        separator: '#ffffff'
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