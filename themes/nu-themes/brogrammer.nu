# Retrieve the theme settings
export def main [] {
    return {
        binary: '#0f7ddb'
        block: '#5350b9'
        cell-path: '#4e5ab7'
        closure: '#1081d6'
        custom: '#d6dbe5'
        duration: '#1dd361'
        float: '#d6dbe5'
        glob: '#d6dbe5'
        int: '#0f7ddb'
        list: '#1081d6'
        nothing: '#d6dbe5'
        range: '#1dd361'
        record: '#1081d6'
        string: '#f3bd09'

        bool: {|| if $in { '#1081d6' } else { '#1dd361' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d6dbe5' attr: 'b' }
            } else if $in < 6hr {
                '#d6dbe5'
            } else if $in < 1day {
                '#1dd361'
            } else if $in < 3day {
                '#f3bd09'
            } else if $in < 1wk {
                { fg: '#f3bd09' attr: 'b' }
            } else if $in < 6wk {
                '#1081d6'
            } else if $in < 52wk {
                '#5350b9'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#4e5ab7'
            } else if $e < 1mb {
                '#1081d6'
            } else {{ fg: '#5350b9' }}
        }

        shape_and: { fg: '#0f7ddb' attr: 'b' }
        shape_binary: { fg: '#0f7ddb' attr: 'b' }
        shape_block: { fg: '#5350b9' attr: 'b' }
        shape_bool: '#1081d6'
        shape_closure: { fg: '#1081d6' attr: 'b' }
        shape_custom: '#f3bd09'
        shape_datetime: { fg: '#1081d6' attr: 'b' }
        shape_directory: '#1081d6'
        shape_external: '#1081d6'
        shape_external_resolved: '#1081d6'
        shape_externalarg: { fg: '#f3bd09' attr: 'b' }
        shape_filepath: '#1081d6'
        shape_flag: { fg: '#5350b9' attr: 'b' }
        shape_float: { fg: '#d6dbe5' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1081d6' attr: 'b' }
        shape_globpattern: { fg: '#1081d6' attr: 'b' }
        shape_int: { fg: '#0f7ddb' attr: 'b' }
        shape_internalcall: { fg: '#1081d6' attr: 'b' }
        shape_keyword: { fg: '#0f7ddb' attr: 'b' }
        shape_list: { fg: '#1081d6' attr: 'b' }
        shape_literal: '#5350b9'
        shape_match_pattern: '#f3bd09'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d6dbe5'
        shape_operator: '#1dd361'
        shape_or: { fg: '#0f7ddb' attr: 'b' }
        shape_pipe: { fg: '#0f7ddb' attr: 'b' }
        shape_range: { fg: '#1dd361' attr: 'b' }
        shape_raw_string: { fg: '#d6dbe5' attr: 'b' }
        shape_record: { fg: '#1081d6' attr: 'b' }
        shape_redirection: { fg: '#0f7ddb' attr: 'b' }
        shape_signature: { fg: '#f3bd09' attr: 'b' }
        shape_string: '#f3bd09'
        shape_string_interpolation: { fg: '#1081d6' attr: 'b' }
        shape_table: { fg: '#5350b9' attr: 'b' }
        shape_vardecl: { fg: '#5350b9' attr: 'u' }
        shape_variable: '#0f7ddb'

        foreground: '#4e5ab7'
        background: '#1f1f1f'
        cursor: '#4e5ab7'

        empty: '#5350b9'
        header: { fg: '#f3bd09' attr: 'b' }
        hints: '#ecba0f'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#f3bd09' attr: 'b' }
        search_result: { fg: '#d6dbe5' bg: '#4e5ab7' }
        separator: '#4e5ab7'
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