# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a4799d'
        block: '#6a7c93'
        cell-path: '#e6e8ef'
        closure: '#3f94a8'
        custom: '#ebedf2'
        duration: '#deb566'
        float: '#b54036'
        glob: '#ebedf2'
        int: '#a4799d'
        list: '#3f94a8'
        nothing: '#b54036'
        range: '#deb566'
        record: '#3f94a8'
        string: '#5ab977'

        bool: {|| if $in { '#3f94a8' } else { '#deb566' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b54036' attr: 'b' }
            } else if $in < 6hr {
                '#b54036'
            } else if $in < 1day {
                '#deb566'
            } else if $in < 3day {
                '#5ab977'
            } else if $in < 1wk {
                { fg: '#5ab977' attr: 'b' }
            } else if $in < 6wk {
                '#3f94a8'
            } else if $in < 52wk {
                '#6a7c93'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#e6e8ef'
            } else if $e < 1mb {
                '#3f94a8'
            } else {{ fg: '#6a7c93' }}
        }

        shape_and: { fg: '#a4799d' attr: 'b' }
        shape_binary: { fg: '#a4799d' attr: 'b' }
        shape_block: { fg: '#6a7c93' attr: 'b' }
        shape_bool: '#3f94a8'
        shape_closure: { fg: '#3f94a8' attr: 'b' }
        shape_custom: '#5ab977'
        shape_datetime: { fg: '#3f94a8' attr: 'b' }
        shape_directory: '#3f94a8'
        shape_external: '#3f94a8'
        shape_external_resolved: '#3f94a8'
        shape_externalarg: { fg: '#5ab977' attr: 'b' }
        shape_filepath: '#3f94a8'
        shape_flag: { fg: '#6a7c93' attr: 'b' }
        shape_float: { fg: '#b54036' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3f94a8' attr: 'b' }
        shape_globpattern: { fg: '#3f94a8' attr: 'b' }
        shape_int: { fg: '#a4799d' attr: 'b' }
        shape_internalcall: { fg: '#3f94a8' attr: 'b' }
        shape_keyword: { fg: '#a4799d' attr: 'b' }
        shape_list: { fg: '#3f94a8' attr: 'b' }
        shape_literal: '#6a7c93'
        shape_match_pattern: '#5ab977'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b54036'
        shape_operator: '#deb566'
        shape_or: { fg: '#a4799d' attr: 'b' }
        shape_pipe: { fg: '#a4799d' attr: 'b' }
        shape_range: { fg: '#deb566' attr: 'b' }
        shape_raw_string: { fg: '#ebedf2' attr: 'b' }
        shape_record: { fg: '#3f94a8' attr: 'b' }
        shape_redirection: { fg: '#a4799d' attr: 'b' }
        shape_signature: { fg: '#5ab977' attr: 'b' }
        shape_string: '#5ab977'
        shape_string_interpolation: { fg: '#3f94a8' attr: 'b' }
        shape_table: { fg: '#6a7c93' attr: 'b' }
        shape_vardecl: { fg: '#6a7c93' attr: 'u' }
        shape_variable: '#a4799d'

        foreground: '#e6e8ef'
        background: '#1c1e22'
        cursor: '#e6e8ef'

        empty: '#6a7c93'
        header: { fg: '#5ab977' attr: 'b' }
        hints: '#23252b'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#5ab977' attr: 'b' }
        search_result: { fg: '#b54036' bg: '#e6e8ef' }
        separator: '#e6e8ef'
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