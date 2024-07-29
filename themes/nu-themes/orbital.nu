# Retrieve the theme settings
export def main [] {
    return {
        binary: '#87afd7'
        block: '#5f87d7'
        cell-path: '#0000d7'
        closure: '#0087d7'
        custom: '#0000d7'
        duration: '#d7af87'
        float: '#949494'
        glob: '#0000d7'
        int: '#87afd7'
        list: '#0087d7'
        nothing: '#5f5f5f'
        range: '#d7af87'
        record: '#0087d7'
        string: '#bcbcbc'

        bool: {|| if $in { '#005faf' } else { '#d7af87' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#5f5f5f' attr: 'b' }
            } else if $in < 6hr {
                '#5f5f5f'
            } else if $in < 1day {
                '#d7af87'
            } else if $in < 3day {
                '#bcbcbc'
            } else if $in < 1wk {
                { fg: '#bcbcbc' attr: 'b' }
            } else if $in < 6wk {
                '#0087d7'
            } else if $in < 52wk {
                '#5f87d7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#0000d7'
            } else if $e < 1mb {
                '#0087d7'
            } else {{ fg: '#5f87d7' }}
        }

        shape_and: { fg: '#87afd7' attr: 'b' }
        shape_binary: { fg: '#87afd7' attr: 'b' }
        shape_block: { fg: '#5f87d7' attr: 'b' }
        shape_bool: '#005faf'
        shape_closure: { fg: '#0087d7' attr: 'b' }
        shape_custom: '#bcbcbc'
        shape_datetime: { fg: '#0087d7' attr: 'b' }
        shape_directory: '#0087d7'
        shape_external: '#0087d7'
        shape_external_resolved: '#005faf'
        shape_externalarg: { fg: '#bcbcbc' attr: 'b' }
        shape_filepath: '#0087d7'
        shape_flag: { fg: '#5f87d7' attr: 'b' }
        shape_float: { fg: '#949494' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0087d7' attr: 'b' }
        shape_globpattern: { fg: '#0087d7' attr: 'b' }
        shape_int: { fg: '#87afd7' attr: 'b' }
        shape_internalcall: { fg: '#0087d7' attr: 'b' }
        shape_keyword: { fg: '#87afd7' attr: 'b' }
        shape_list: { fg: '#0087d7' attr: 'b' }
        shape_literal: '#5f87d7'
        shape_match_pattern: '#bcbcbc'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#5f5f5f'
        shape_operator: '#d7af87'
        shape_or: { fg: '#87afd7' attr: 'b' }
        shape_pipe: { fg: '#87afd7' attr: 'b' }
        shape_range: { fg: '#d7af87' attr: 'b' }
        shape_raw_string: { fg: '#0000d7' attr: 'b' }
        shape_record: { fg: '#0087d7' attr: 'b' }
        shape_redirection: { fg: '#87afd7' attr: 'b' }
        shape_signature: { fg: '#bcbcbc' attr: 'b' }
        shape_string: '#bcbcbc'
        shape_string_interpolation: { fg: '#0087d7' attr: 'b' }
        shape_table: { fg: '#5f87d7' attr: 'b' }
        shape_vardecl: { fg: '#5f87d7' attr: 'u' }
        shape_variable: '#87afd7'

        foreground: '#e4e4e4'
        background: '#000000'
        cursor: '#5fafff'

        empty: '#5f87d7'
        header: { fg: '#bcbcbc' attr: 'b' }
        hints: '#262626'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#bcbcbc' attr: 'b' }
        search_result: { fg: '#5f5f5f' bg: '#0000d7' }
        separator: '#0000d7'
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