# Retrieve the theme settings
export def main [] {
    return {
        binary: '#692f50'
        block: '#8c87b0'
        cell-path: '#68525a'
        closure: '#e8a866'
        custom: '#b0949d'
        duration: '#ab311b'
        float: '#c5255d'
        glob: '#b0949d'
        int: '#692f50'
        list: '#e8a866'
        nothing: '#91002b'
        range: '#ab311b'
        record: '#e8a866'
        string: '#579524'

        bool: {|| if $in { '#ffceaf' } else { '#ab311b' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#91002b' attr: 'b' }
            } else if $in < 6hr {
                '#91002b'
            } else if $in < 1day {
                '#ab311b'
            } else if $in < 3day {
                '#579524'
            } else if $in < 1wk {
                { fg: '#579524' attr: 'b' }
            } else if $in < 6wk {
                '#e8a866'
            } else if $in < 52wk {
                '#8c87b0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#68525a'
            } else if $e < 1mb {
                '#e8a866'
            } else {{ fg: '#8c87b0' }}
        }

        shape_and: { fg: '#692f50' attr: 'b' }
        shape_binary: { fg: '#692f50' attr: 'b' }
        shape_block: { fg: '#8c87b0' attr: 'b' }
        shape_bool: '#ffceaf'
        shape_closure: { fg: '#e8a866' attr: 'b' }
        shape_custom: '#579524'
        shape_datetime: { fg: '#e8a866' attr: 'b' }
        shape_directory: '#e8a866'
        shape_external: '#e8a866'
        shape_external_resolved: '#ffceaf'
        shape_externalarg: { fg: '#579524' attr: 'b' }
        shape_filepath: '#e8a866'
        shape_flag: { fg: '#8c87b0' attr: 'b' }
        shape_float: { fg: '#c5255d' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#e8a866' attr: 'b' }
        shape_globpattern: { fg: '#e8a866' attr: 'b' }
        shape_int: { fg: '#692f50' attr: 'b' }
        shape_internalcall: { fg: '#e8a866' attr: 'b' }
        shape_keyword: { fg: '#692f50' attr: 'b' }
        shape_list: { fg: '#e8a866' attr: 'b' }
        shape_literal: '#8c87b0'
        shape_match_pattern: '#579524'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#91002b'
        shape_operator: '#ab311b'
        shape_or: { fg: '#692f50' attr: 'b' }
        shape_pipe: { fg: '#692f50' attr: 'b' }
        shape_range: { fg: '#ab311b' attr: 'b' }
        shape_raw_string: { fg: '#b0949d' attr: 'b' }
        shape_record: { fg: '#e8a866' attr: 'b' }
        shape_redirection: { fg: '#692f50' attr: 'b' }
        shape_signature: { fg: '#579524' attr: 'b' }
        shape_string: '#579524'
        shape_string_interpolation: { fg: '#e8a866' attr: 'b' }
        shape_table: { fg: '#8c87b0' attr: 'b' }
        shape_vardecl: { fg: '#8c87b0' attr: 'u' }
        shape_variable: '#692f50'

        foreground: '#68525a'
        background: '#150707'
        cursor: '#68525a'

        empty: '#8c87b0'
        header: { fg: '#579524' attr: 'b' }
        hints: '#3d2b2e'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#579524' attr: 'b' }
        search_result: { fg: '#91002b' bg: '#68525a' }
        separator: '#68525a'
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