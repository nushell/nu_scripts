# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8959a8'
        block: '#1dd3ee'
        cell-path: '#ffffff'
        closure: '#3e999f'
        custom: '#ffffff'
        duration: '#1fc95b'
        float: '#ff0021'
        glob: '#ffffff'
        int: '#8959a8'
        list: '#3e999f'
        nothing: '#ff4d83'
        range: '#1fc95b'
        record: '#3e999f'
        string: '#1f8c3b'

        bool: {|| if $in { '#3e999f' } else { '#1fc95b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff4d83' attr: 'b' }
            } else if $in < 6hr {
                '#ff4d83'
            } else if $in < 1day {
                '#1fc95b'
            } else if $in < 3day {
                '#1f8c3b'
            } else if $in < 1wk {
                { fg: '#1f8c3b' attr: 'b' }
            } else if $in < 6wk {
                '#3e999f'
            } else if $in < 52wk {
                '#1dd3ee'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#3e999f'
            } else {{ fg: '#1dd3ee' }}
        }

        shape_and: { fg: '#8959a8' attr: 'b' }
        shape_binary: { fg: '#8959a8' attr: 'b' }
        shape_block: { fg: '#1dd3ee' attr: 'b' }
        shape_bool: '#3e999f'
        shape_closure: { fg: '#3e999f' attr: 'b' }
        shape_custom: '#1f8c3b'
        shape_datetime: { fg: '#3e999f' attr: 'b' }
        shape_directory: '#3e999f'
        shape_external: '#3e999f'
        shape_external_resolved: '#3e999f'
        shape_externalarg: { fg: '#1f8c3b' attr: 'b' }
        shape_filepath: '#3e999f'
        shape_flag: { fg: '#1dd3ee' attr: 'b' }
        shape_float: { fg: '#ff0021' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#3e999f' attr: 'b' }
        shape_globpattern: { fg: '#3e999f' attr: 'b' }
        shape_int: { fg: '#8959a8' attr: 'b' }
        shape_internalcall: { fg: '#3e999f' attr: 'b' }
        shape_keyword: { fg: '#8959a8' attr: 'b' }
        shape_list: { fg: '#3e999f' attr: 'b' }
        shape_literal: '#1dd3ee'
        shape_match_pattern: '#1f8c3b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff4d83'
        shape_operator: '#1fc95b'
        shape_or: { fg: '#8959a8' attr: 'b' }
        shape_pipe: { fg: '#8959a8' attr: 'b' }
        shape_range: { fg: '#1fc95b' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#3e999f' attr: 'b' }
        shape_redirection: { fg: '#8959a8' attr: 'b' }
        shape_signature: { fg: '#1f8c3b' attr: 'b' }
        shape_string: '#1f8c3b'
        shape_string_interpolation: { fg: '#3e999f' attr: 'b' }
        shape_table: { fg: '#1dd3ee' attr: 'b' }
        shape_vardecl: { fg: '#1dd3ee' attr: 'u' }
        shape_variable: '#8959a8'

        foreground: '#ecf0c1'
        background: '#0a1e24'
        cursor: '#ecf0c1'

        empty: '#1dd3ee'
        header: { fg: '#1f8c3b' attr: 'b' }
        hints: '#000000'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#1f8c3b' attr: 'b' }
        search_result: { fg: '#ff4d83' bg: '#ffffff' }
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