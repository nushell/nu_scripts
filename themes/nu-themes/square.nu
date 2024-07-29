# Retrieve the theme settings
export def main [] {
    return {
        binary: '#75507b'
        block: '#a9cdeb'
        cell-path: '#f2f2f2'
        closure: '#c9caec'
        custom: '#e2e2e2'
        duration: '#ecebbe'
        float: '#f99286'
        glob: '#e2e2e2'
        int: '#75507b'
        list: '#c9caec'
        nothing: '#e9897c'
        range: '#ecebbe'
        record: '#c9caec'
        string: '#b6377d'

        bool: {|| if $in { '#d7d9fc' } else { '#ecebbe' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e9897c' attr: 'b' }
            } else if $in < 6hr {
                '#e9897c'
            } else if $in < 1day {
                '#ecebbe'
            } else if $in < 3day {
                '#b6377d'
            } else if $in < 1wk {
                { fg: '#b6377d' attr: 'b' }
            } else if $in < 6wk {
                '#c9caec'
            } else if $in < 52wk {
                '#a9cdeb'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f2f2f2'
            } else if $e < 1mb {
                '#c9caec'
            } else {{ fg: '#a9cdeb' }}
        }

        shape_and: { fg: '#75507b' attr: 'b' }
        shape_binary: { fg: '#75507b' attr: 'b' }
        shape_block: { fg: '#a9cdeb' attr: 'b' }
        shape_bool: '#d7d9fc'
        shape_closure: { fg: '#c9caec' attr: 'b' }
        shape_custom: '#b6377d'
        shape_datetime: { fg: '#c9caec' attr: 'b' }
        shape_directory: '#c9caec'
        shape_external: '#c9caec'
        shape_external_resolved: '#d7d9fc'
        shape_externalarg: { fg: '#b6377d' attr: 'b' }
        shape_filepath: '#c9caec'
        shape_flag: { fg: '#a9cdeb' attr: 'b' }
        shape_float: { fg: '#f99286' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#c9caec' attr: 'b' }
        shape_globpattern: { fg: '#c9caec' attr: 'b' }
        shape_int: { fg: '#75507b' attr: 'b' }
        shape_internalcall: { fg: '#c9caec' attr: 'b' }
        shape_keyword: { fg: '#75507b' attr: 'b' }
        shape_list: { fg: '#c9caec' attr: 'b' }
        shape_literal: '#a9cdeb'
        shape_match_pattern: '#b6377d'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e9897c'
        shape_operator: '#ecebbe'
        shape_or: { fg: '#75507b' attr: 'b' }
        shape_pipe: { fg: '#75507b' attr: 'b' }
        shape_range: { fg: '#ecebbe' attr: 'b' }
        shape_raw_string: { fg: '#e2e2e2' attr: 'b' }
        shape_record: { fg: '#c9caec' attr: 'b' }
        shape_redirection: { fg: '#75507b' attr: 'b' }
        shape_signature: { fg: '#b6377d' attr: 'b' }
        shape_string: '#b6377d'
        shape_string_interpolation: { fg: '#c9caec' attr: 'b' }
        shape_table: { fg: '#a9cdeb' attr: 'b' }
        shape_vardecl: { fg: '#a9cdeb' attr: 'u' }
        shape_variable: '#75507b'

        foreground: '#1a1a1a'
        background: '#0a1e24'
        cursor: '#1a1a1a'

        empty: '#a9cdeb'
        header: { fg: '#b6377d' attr: 'b' }
        hints: '#141414'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b6377d' attr: 'b' }
        search_result: { fg: '#e9897c' bg: '#f2f2f2' }
        separator: '#f2f2f2'
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