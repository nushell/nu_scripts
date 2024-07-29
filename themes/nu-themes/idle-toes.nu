# Retrieve the theme settings
export def main [] {
    return {
        binary: '#f680ff'
        block: '#4099ff'
        cell-path: '#eeeeec'
        closure: '#bed6ff'
        custom: '#ffffff'
        duration: '#ffc66d'
        float: '#f07070'
        glob: '#ffffff'
        int: '#f680ff'
        list: '#bed6ff'
        nothing: '#d25252'
        range: '#ffc66d'
        record: '#bed6ff'
        string: '#7fe173'

        bool: {|| if $in { '#dcf4ff' } else { '#ffc66d' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d25252' attr: 'b' }
            } else if $in < 6hr {
                '#d25252'
            } else if $in < 1day {
                '#ffc66d'
            } else if $in < 3day {
                '#7fe173'
            } else if $in < 1wk {
                { fg: '#7fe173' attr: 'b' }
            } else if $in < 6wk {
                '#bed6ff'
            } else if $in < 52wk {
                '#4099ff'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#eeeeec'
            } else if $e < 1mb {
                '#bed6ff'
            } else {{ fg: '#4099ff' }}
        }

        shape_and: { fg: '#f680ff' attr: 'b' }
        shape_binary: { fg: '#f680ff' attr: 'b' }
        shape_block: { fg: '#4099ff' attr: 'b' }
        shape_bool: '#dcf4ff'
        shape_closure: { fg: '#bed6ff' attr: 'b' }
        shape_custom: '#7fe173'
        shape_datetime: { fg: '#bed6ff' attr: 'b' }
        shape_directory: '#bed6ff'
        shape_external: '#bed6ff'
        shape_external_resolved: '#dcf4ff'
        shape_externalarg: { fg: '#7fe173' attr: 'b' }
        shape_filepath: '#bed6ff'
        shape_flag: { fg: '#4099ff' attr: 'b' }
        shape_float: { fg: '#f07070' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#bed6ff' attr: 'b' }
        shape_globpattern: { fg: '#bed6ff' attr: 'b' }
        shape_int: { fg: '#f680ff' attr: 'b' }
        shape_internalcall: { fg: '#bed6ff' attr: 'b' }
        shape_keyword: { fg: '#f680ff' attr: 'b' }
        shape_list: { fg: '#bed6ff' attr: 'b' }
        shape_literal: '#4099ff'
        shape_match_pattern: '#7fe173'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d25252'
        shape_operator: '#ffc66d'
        shape_or: { fg: '#f680ff' attr: 'b' }
        shape_pipe: { fg: '#f680ff' attr: 'b' }
        shape_range: { fg: '#ffc66d' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#bed6ff' attr: 'b' }
        shape_redirection: { fg: '#f680ff' attr: 'b' }
        shape_signature: { fg: '#7fe173' attr: 'b' }
        shape_string: '#7fe173'
        shape_string_interpolation: { fg: '#bed6ff' attr: 'b' }
        shape_table: { fg: '#4099ff' attr: 'b' }
        shape_vardecl: { fg: '#4099ff' attr: 'u' }
        shape_variable: '#f680ff'

        foreground: '#ffffff'
        background: '#323232'
        cursor: '#ffffff'

        empty: '#4099ff'
        header: { fg: '#7fe173' attr: 'b' }
        hints: '#535353'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7fe173' attr: 'b' }
        search_result: { fg: '#d25252' bg: '#eeeeec' }
        separator: '#eeeeec'
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