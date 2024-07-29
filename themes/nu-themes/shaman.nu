# Retrieve the theme settings
export def main [] {
    return {
        binary: '#00599d'
        block: '#449a86'
        cell-path: '#405555'
        closure: '#5d7e19'
        custom: '#58fbd6'
        duration: '#5e8baa'
        float: '#ff4242'
        glob: '#58fbd6'
        int: '#00599d'
        list: '#5d7e19'
        nothing: '#b2302d'
        range: '#5e8baa'
        record: '#5d7e19'
        string: '#00a941'

        bool: {|| if $in { '#98d028' } else { '#5e8baa' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b2302d' attr: 'b' }
            } else if $in < 6hr {
                '#b2302d'
            } else if $in < 1day {
                '#5e8baa'
            } else if $in < 3day {
                '#00a941'
            } else if $in < 1wk {
                { fg: '#00a941' attr: 'b' }
            } else if $in < 6wk {
                '#5d7e19'
            } else if $in < 52wk {
                '#449a86'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#405555'
            } else if $e < 1mb {
                '#5d7e19'
            } else {{ fg: '#449a86' }}
        }

        shape_and: { fg: '#00599d' attr: 'b' }
        shape_binary: { fg: '#00599d' attr: 'b' }
        shape_block: { fg: '#449a86' attr: 'b' }
        shape_bool: '#98d028'
        shape_closure: { fg: '#5d7e19' attr: 'b' }
        shape_custom: '#00a941'
        shape_datetime: { fg: '#5d7e19' attr: 'b' }
        shape_directory: '#5d7e19'
        shape_external: '#5d7e19'
        shape_external_resolved: '#98d028'
        shape_externalarg: { fg: '#00a941' attr: 'b' }
        shape_filepath: '#5d7e19'
        shape_flag: { fg: '#449a86' attr: 'b' }
        shape_float: { fg: '#ff4242' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5d7e19' attr: 'b' }
        shape_globpattern: { fg: '#5d7e19' attr: 'b' }
        shape_int: { fg: '#00599d' attr: 'b' }
        shape_internalcall: { fg: '#5d7e19' attr: 'b' }
        shape_keyword: { fg: '#00599d' attr: 'b' }
        shape_list: { fg: '#5d7e19' attr: 'b' }
        shape_literal: '#449a86'
        shape_match_pattern: '#00a941'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b2302d'
        shape_operator: '#5e8baa'
        shape_or: { fg: '#00599d' attr: 'b' }
        shape_pipe: { fg: '#00599d' attr: 'b' }
        shape_range: { fg: '#5e8baa' attr: 'b' }
        shape_raw_string: { fg: '#58fbd6' attr: 'b' }
        shape_record: { fg: '#5d7e19' attr: 'b' }
        shape_redirection: { fg: '#00599d' attr: 'b' }
        shape_signature: { fg: '#00a941' attr: 'b' }
        shape_string: '#00a941'
        shape_string_interpolation: { fg: '#5d7e19' attr: 'b' }
        shape_table: { fg: '#449a86' attr: 'b' }
        shape_vardecl: { fg: '#449a86' attr: 'u' }
        shape_variable: '#00599d'

        foreground: '#405555'
        background: '#001015'
        cursor: '#405555'

        empty: '#449a86'
        header: { fg: '#00a941' attr: 'b' }
        hints: '#384451'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00a941' attr: 'b' }
        search_result: { fg: '#b2302d' bg: '#405555' }
        separator: '#405555'
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