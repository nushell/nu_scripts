# Retrieve the theme settings
export def main [] {
    return {
        binary: '#97522c'
        block: '#426a79'
        cell-path: '#968c83'
        closure: '#989a9c'
        custom: '#d5ccba'
        duration: '#eaa549'
        float: '#be100e'
        glob: '#d5ccba'
        int: '#97522c'
        list: '#989a9c'
        nothing: '#be100e'
        range: '#eaa549'
        record: '#989a9c'
        string: '#858162'

        bool: {|| if $in { '#989a9c' } else { '#eaa549' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#be100e' attr: 'b' }
            } else if $in < 6hr {
                '#be100e'
            } else if $in < 1day {
                '#eaa549'
            } else if $in < 3day {
                '#858162'
            } else if $in < 1wk {
                { fg: '#858162' attr: 'b' }
            } else if $in < 6wk {
                '#989a9c'
            } else if $in < 52wk {
                '#426a79'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#968c83'
            } else if $e < 1mb {
                '#989a9c'
            } else {{ fg: '#426a79' }}
        }

        shape_and: { fg: '#97522c' attr: 'b' }
        shape_binary: { fg: '#97522c' attr: 'b' }
        shape_block: { fg: '#426a79' attr: 'b' }
        shape_bool: '#989a9c'
        shape_closure: { fg: '#989a9c' attr: 'b' }
        shape_custom: '#858162'
        shape_datetime: { fg: '#989a9c' attr: 'b' }
        shape_directory: '#989a9c'
        shape_external: '#989a9c'
        shape_external_resolved: '#989a9c'
        shape_externalarg: { fg: '#858162' attr: 'b' }
        shape_filepath: '#989a9c'
        shape_flag: { fg: '#426a79' attr: 'b' }
        shape_float: { fg: '#be100e' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#989a9c' attr: 'b' }
        shape_globpattern: { fg: '#989a9c' attr: 'b' }
        shape_int: { fg: '#97522c' attr: 'b' }
        shape_internalcall: { fg: '#989a9c' attr: 'b' }
        shape_keyword: { fg: '#97522c' attr: 'b' }
        shape_list: { fg: '#989a9c' attr: 'b' }
        shape_literal: '#426a79'
        shape_match_pattern: '#858162'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#be100e'
        shape_operator: '#eaa549'
        shape_or: { fg: '#97522c' attr: 'b' }
        shape_pipe: { fg: '#97522c' attr: 'b' }
        shape_range: { fg: '#eaa549' attr: 'b' }
        shape_raw_string: { fg: '#d5ccba' attr: 'b' }
        shape_record: { fg: '#989a9c' attr: 'b' }
        shape_redirection: { fg: '#97522c' attr: 'b' }
        shape_signature: { fg: '#858162' attr: 'b' }
        shape_string: '#858162'
        shape_string_interpolation: { fg: '#989a9c' attr: 'b' }
        shape_table: { fg: '#426a79' attr: 'b' }
        shape_vardecl: { fg: '#426a79' attr: 'u' }
        shape_variable: '#97522c'

        foreground: '#968c83'
        background: '#20111b'
        cursor: '#968c83'

        empty: '#426a79'
        header: { fg: '#858162' attr: 'b' }
        hints: '#5e5252'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#858162' attr: 'b' }
        search_result: { fg: '#be100e' bg: '#968c83' }
        separator: '#968c83'
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