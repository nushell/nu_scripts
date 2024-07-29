# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bd2523'
        block: '#1f5872'
        cell-path: '#ffffff'
        closure: '#778397'
        custom: '#ffffff'
        duration: '#fb9435'
        float: '#bd0f2f'
        glob: '#ffffff'
        int: '#bd2523'
        list: '#778397'
        nothing: '#bd0f2f'
        range: '#fb9435'
        record: '#778397'
        string: '#35a770'

        bool: {|| if $in { '#a0b6d3' } else { '#fb9435' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#bd0f2f' attr: 'b' }
            } else if $in < 6hr {
                '#bd0f2f'
            } else if $in < 1day {
                '#fb9435'
            } else if $in < 3day {
                '#35a770'
            } else if $in < 1wk {
                { fg: '#35a770' attr: 'b' }
            } else if $in < 6wk {
                '#778397'
            } else if $in < 52wk {
                '#1f5872'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#ffffff'
            } else if $e < 1mb {
                '#778397'
            } else {{ fg: '#1f5872' }}
        }

        shape_and: { fg: '#bd2523' attr: 'b' }
        shape_binary: { fg: '#bd2523' attr: 'b' }
        shape_block: { fg: '#1f5872' attr: 'b' }
        shape_bool: '#a0b6d3'
        shape_closure: { fg: '#778397' attr: 'b' }
        shape_custom: '#35a770'
        shape_datetime: { fg: '#778397' attr: 'b' }
        shape_directory: '#778397'
        shape_external: '#778397'
        shape_external_resolved: '#a0b6d3'
        shape_externalarg: { fg: '#35a770' attr: 'b' }
        shape_filepath: '#778397'
        shape_flag: { fg: '#1f5872' attr: 'b' }
        shape_float: { fg: '#bd0f2f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#778397' attr: 'b' }
        shape_globpattern: { fg: '#778397' attr: 'b' }
        shape_int: { fg: '#bd2523' attr: 'b' }
        shape_internalcall: { fg: '#778397' attr: 'b' }
        shape_keyword: { fg: '#bd2523' attr: 'b' }
        shape_list: { fg: '#778397' attr: 'b' }
        shape_literal: '#1f5872'
        shape_match_pattern: '#35a770'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#bd0f2f'
        shape_operator: '#fb9435'
        shape_or: { fg: '#bd2523' attr: 'b' }
        shape_pipe: { fg: '#bd2523' attr: 'b' }
        shape_range: { fg: '#fb9435' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#778397' attr: 'b' }
        shape_redirection: { fg: '#bd2523' attr: 'b' }
        shape_signature: { fg: '#35a770' attr: 'b' }
        shape_string: '#35a770'
        shape_string_interpolation: { fg: '#778397' attr: 'b' }
        shape_table: { fg: '#1f5872' attr: 'b' }
        shape_vardecl: { fg: '#1f5872' attr: 'u' }
        shape_variable: '#bd2523'

        foreground: '#ffffff'
        background: '#0c1115'
        cursor: '#6c6c6c'

        empty: '#1f5872'
        header: { fg: '#35a770' attr: 'b' }
        hints: '#404a55'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#35a770' attr: 'b' }
        search_result: { fg: '#bd0f2f' bg: '#ffffff' }
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