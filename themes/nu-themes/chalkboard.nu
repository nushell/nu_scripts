# Retrieve the theme settings
export def main [] {
    return {
        binary: '#c372c2'
        block: '#7372c3'
        cell-path: '#d9d9d9'
        closure: '#72c2c3'
        custom: '#ffffff'
        duration: '#c2c372'
        float: '#dbaaaa'
        glob: '#ffffff'
        int: '#c372c2'
        list: '#72c2c3'
        nothing: '#c37372'
        range: '#c2c372'
        record: '#72c2c3'
        string: '#72c373'

        bool: {|| if $in { '#aadadb' } else { '#c2c372' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c37372' attr: 'b' }
            } else if $in < 6hr {
                '#c37372'
            } else if $in < 1day {
                '#c2c372'
            } else if $in < 3day {
                '#72c373'
            } else if $in < 1wk {
                { fg: '#72c373' attr: 'b' }
            } else if $in < 6wk {
                '#72c2c3'
            } else if $in < 52wk {
                '#7372c3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d9d9d9'
            } else if $e < 1mb {
                '#72c2c3'
            } else {{ fg: '#7372c3' }}
        }

        shape_and: { fg: '#c372c2' attr: 'b' }
        shape_binary: { fg: '#c372c2' attr: 'b' }
        shape_block: { fg: '#7372c3' attr: 'b' }
        shape_bool: '#aadadb'
        shape_closure: { fg: '#72c2c3' attr: 'b' }
        shape_custom: '#72c373'
        shape_datetime: { fg: '#72c2c3' attr: 'b' }
        shape_directory: '#72c2c3'
        shape_external: '#72c2c3'
        shape_external_resolved: '#aadadb'
        shape_externalarg: { fg: '#72c373' attr: 'b' }
        shape_filepath: '#72c2c3'
        shape_flag: { fg: '#7372c3' attr: 'b' }
        shape_float: { fg: '#dbaaaa' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#72c2c3' attr: 'b' }
        shape_globpattern: { fg: '#72c2c3' attr: 'b' }
        shape_int: { fg: '#c372c2' attr: 'b' }
        shape_internalcall: { fg: '#72c2c3' attr: 'b' }
        shape_keyword: { fg: '#c372c2' attr: 'b' }
        shape_list: { fg: '#72c2c3' attr: 'b' }
        shape_literal: '#7372c3'
        shape_match_pattern: '#72c373'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c37372'
        shape_operator: '#c2c372'
        shape_or: { fg: '#c372c2' attr: 'b' }
        shape_pipe: { fg: '#c372c2' attr: 'b' }
        shape_range: { fg: '#c2c372' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#72c2c3' attr: 'b' }
        shape_redirection: { fg: '#c372c2' attr: 'b' }
        shape_signature: { fg: '#72c373' attr: 'b' }
        shape_string: '#72c373'
        shape_string_interpolation: { fg: '#72c2c3' attr: 'b' }
        shape_table: { fg: '#7372c3' attr: 'b' }
        shape_vardecl: { fg: '#7372c3' attr: 'u' }
        shape_variable: '#c372c2'

        foreground: '#d9e6f2'
        background: '#29262f'
        cursor: '#d9e6f2'

        empty: '#7372c3'
        header: { fg: '#72c373' attr: 'b' }
        hints: '#323232'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#72c373' attr: 'b' }
        search_result: { fg: '#c37372' bg: '#d9d9d9' }
        separator: '#d9d9d9'
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