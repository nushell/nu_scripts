# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8c54fe'
        block: '#2757d6'
        cell-path: '#ccccc6'
        closure: '#38c8b5'
        custom: '#f8f8f2'
        duration: '#f4fd22'
        float: '#ff5995'
        glob: '#f8f8f2'
        int: '#8c54fe'
        list: '#38c8b5'
        nothing: '#f92672'
        range: '#f4fd22'
        record: '#38c8b5'
        string: '#4df840'

        bool: {|| if $in { '#23cfd5' } else { '#f4fd22' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f92672' attr: 'b' }
            } else if $in < 6hr {
                '#f92672'
            } else if $in < 1day {
                '#f4fd22'
            } else if $in < 3day {
                '#4df840'
            } else if $in < 1wk {
                { fg: '#4df840' attr: 'b' }
            } else if $in < 6wk {
                '#38c8b5'
            } else if $in < 52wk {
                '#2757d6'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ccccc6'
            } else if $e < 1mb {
                '#38c8b5'
            } else {{ fg: '#2757d6' }}
        }

        shape_and: { fg: '#8c54fe' attr: 'b' }
        shape_binary: { fg: '#8c54fe' attr: 'b' }
        shape_block: { fg: '#2757d6' attr: 'b' }
        shape_bool: '#23cfd5'
        shape_closure: { fg: '#38c8b5' attr: 'b' }
        shape_custom: '#4df840'
        shape_datetime: { fg: '#38c8b5' attr: 'b' }
        shape_directory: '#38c8b5'
        shape_external: '#38c8b5'
        shape_external_resolved: '#23cfd5'
        shape_externalarg: { fg: '#4df840' attr: 'b' }
        shape_filepath: '#38c8b5'
        shape_flag: { fg: '#2757d6' attr: 'b' }
        shape_float: { fg: '#ff5995' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#38c8b5' attr: 'b' }
        shape_globpattern: { fg: '#38c8b5' attr: 'b' }
        shape_int: { fg: '#8c54fe' attr: 'b' }
        shape_internalcall: { fg: '#38c8b5' attr: 'b' }
        shape_keyword: { fg: '#8c54fe' attr: 'b' }
        shape_list: { fg: '#38c8b5' attr: 'b' }
        shape_literal: '#2757d6'
        shape_match_pattern: '#4df840'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f92672'
        shape_operator: '#f4fd22'
        shape_or: { fg: '#8c54fe' attr: 'b' }
        shape_pipe: { fg: '#8c54fe' attr: 'b' }
        shape_range: { fg: '#f4fd22' attr: 'b' }
        shape_raw_string: { fg: '#f8f8f2' attr: 'b' }
        shape_record: { fg: '#38c8b5' attr: 'b' }
        shape_redirection: { fg: '#8c54fe' attr: 'b' }
        shape_signature: { fg: '#4df840' attr: 'b' }
        shape_string: '#4df840'
        shape_string_interpolation: { fg: '#38c8b5' attr: 'b' }
        shape_table: { fg: '#2757d6' attr: 'b' }
        shape_vardecl: { fg: '#2757d6' attr: 'u' }
        shape_variable: '#8c54fe'

        foreground: '#f8f8f8'
        background: '#1b1d1e'
        cursor: '#f8f8f8'

        empty: '#2757d6'
        header: { fg: '#4df840' attr: 'b' }
        hints: '#505354'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#4df840' attr: 'b' }
        search_result: { fg: '#f92672' bg: '#ccccc6' }
        separator: '#ccccc6'
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