# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff77a8'
        block: '#83769c'
        cell-path: '#5f574f'
        closure: '#29adff'
        custom: '#fff1e8'
        duration: '#fff024'
        float: '#ff004d'
        glob: '#fff1e8'
        int: '#ff77a8'
        list: '#29adff'
        nothing: '#ff004d'
        range: '#fff024'
        record: '#29adff'
        string: '#00e756'

        bool: {|| if $in { '#29adff' } else { '#fff024' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff004d' attr: 'b' }
            } else if $in < 6hr {
                '#ff004d'
            } else if $in < 1day {
                '#fff024'
            } else if $in < 3day {
                '#00e756'
            } else if $in < 1wk {
                { fg: '#00e756' attr: 'b' }
            } else if $in < 6wk {
                '#29adff'
            } else if $in < 52wk {
                '#83769c'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#5f574f'
            } else if $e < 1mb {
                '#29adff'
            } else {{ fg: '#83769c' }}
        }

        shape_and: { fg: '#ff77a8' attr: 'b' }
        shape_binary: { fg: '#ff77a8' attr: 'b' }
        shape_block: { fg: '#83769c' attr: 'b' }
        shape_bool: '#29adff'
        shape_closure: { fg: '#29adff' attr: 'b' }
        shape_custom: '#00e756'
        shape_datetime: { fg: '#29adff' attr: 'b' }
        shape_directory: '#29adff'
        shape_external: '#29adff'
        shape_external_resolved: '#29adff'
        shape_externalarg: { fg: '#00e756' attr: 'b' }
        shape_filepath: '#29adff'
        shape_flag: { fg: '#83769c' attr: 'b' }
        shape_float: { fg: '#ff004d' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#29adff' attr: 'b' }
        shape_globpattern: { fg: '#29adff' attr: 'b' }
        shape_int: { fg: '#ff77a8' attr: 'b' }
        shape_internalcall: { fg: '#29adff' attr: 'b' }
        shape_keyword: { fg: '#ff77a8' attr: 'b' }
        shape_list: { fg: '#29adff' attr: 'b' }
        shape_literal: '#83769c'
        shape_match_pattern: '#00e756'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff004d'
        shape_operator: '#fff024'
        shape_or: { fg: '#ff77a8' attr: 'b' }
        shape_pipe: { fg: '#ff77a8' attr: 'b' }
        shape_range: { fg: '#fff024' attr: 'b' }
        shape_raw_string: { fg: '#fff1e8' attr: 'b' }
        shape_record: { fg: '#29adff' attr: 'b' }
        shape_redirection: { fg: '#ff77a8' attr: 'b' }
        shape_signature: { fg: '#00e756' attr: 'b' }
        shape_string: '#00e756'
        shape_string_interpolation: { fg: '#29adff' attr: 'b' }
        shape_table: { fg: '#83769c' attr: 'b' }
        shape_vardecl: { fg: '#83769c' attr: 'u' }
        shape_variable: '#ff77a8'

        foreground: '#5f574f'
        background: '#000000'
        cursor: '#5f574f'

        empty: '#83769c'
        header: { fg: '#00e756' attr: 'b' }
        hints: '#008751'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00e756' attr: 'b' }
        search_result: { fg: '#ff004d' bg: '#5f574f' }
        separator: '#5f574f'
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