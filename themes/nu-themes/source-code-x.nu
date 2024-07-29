# Retrieve the theme settings
export def main [] {
    return {
        binary: '#fb5ea3'
        block: '#9586f4'
        cell-path: '#bfbfbf'
        closure: '#79c8b6'
        custom: '#91a0b1'
        duration: '#fc8e3e'
        float: '#fb695d'
        glob: '#91a0b1'
        int: '#fb5ea3'
        list: '#79c8b6'
        nothing: '#fb695d'
        range: '#fc8e3e'
        record: '#79c8b6'
        string: '#74b391'

        bool: {|| if $in { '#83d2c0' } else { '#fc8e3e' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#fb695d' attr: 'b' }
            } else if $in < 6hr {
                '#fb695d'
            } else if $in < 1day {
                '#fc8e3e'
            } else if $in < 3day {
                '#74b391'
            } else if $in < 1wk {
                { fg: '#74b391' attr: 'b' }
            } else if $in < 6wk {
                '#79c8b6'
            } else if $in < 52wk {
                '#9586f4'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bfbfbf'
            } else if $e < 1mb {
                '#79c8b6'
            } else {{ fg: '#9586f4' }}
        }

        shape_and: { fg: '#fb5ea3' attr: 'b' }
        shape_binary: { fg: '#fb5ea3' attr: 'b' }
        shape_block: { fg: '#9586f4' attr: 'b' }
        shape_bool: '#83d2c0'
        shape_closure: { fg: '#79c8b6' attr: 'b' }
        shape_custom: '#74b391'
        shape_datetime: { fg: '#79c8b6' attr: 'b' }
        shape_directory: '#79c8b6'
        shape_external: '#79c8b6'
        shape_external_resolved: '#83d2c0'
        shape_externalarg: { fg: '#74b391' attr: 'b' }
        shape_filepath: '#79c8b6'
        shape_flag: { fg: '#9586f4' attr: 'b' }
        shape_float: { fg: '#fb695d' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#79c8b6' attr: 'b' }
        shape_globpattern: { fg: '#79c8b6' attr: 'b' }
        shape_int: { fg: '#fb5ea3' attr: 'b' }
        shape_internalcall: { fg: '#79c8b6' attr: 'b' }
        shape_keyword: { fg: '#fb5ea3' attr: 'b' }
        shape_list: { fg: '#79c8b6' attr: 'b' }
        shape_literal: '#9586f4'
        shape_match_pattern: '#74b391'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#fb695d'
        shape_operator: '#fc8e3e'
        shape_or: { fg: '#fb5ea3' attr: 'b' }
        shape_pipe: { fg: '#fb5ea3' attr: 'b' }
        shape_range: { fg: '#fc8e3e' attr: 'b' }
        shape_raw_string: { fg: '#91a0b1' attr: 'b' }
        shape_record: { fg: '#79c8b6' attr: 'b' }
        shape_redirection: { fg: '#fb5ea3' attr: 'b' }
        shape_signature: { fg: '#74b391' attr: 'b' }
        shape_string: '#74b391'
        shape_string_interpolation: { fg: '#79c8b6' attr: 'b' }
        shape_table: { fg: '#9586f4' attr: 'b' }
        shape_vardecl: { fg: '#9586f4' attr: 'u' }
        shape_variable: '#fb5ea3'

        foreground: '#000000'
        background: '#1f1f24'
        cursor: '#7f7f7f'

        empty: '#9586f4'
        header: { fg: '#74b391' attr: 'b' }
        hints: '#91a0b1'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#74b391' attr: 'b' }
        search_result: { fg: '#fb695d' bg: '#bfbfbf' }
        separator: '#bfbfbf'
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