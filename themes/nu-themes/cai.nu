# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a427ca'
        block: '#274dca'
        cell-path: '#808080'
        closure: '#27caa4'
        custom: '#ffffff'
        duration: '#caa427'
        float: '#e98da3'
        glob: '#ffffff'
        int: '#a427ca'
        list: '#27caa4'
        nothing: '#ca274d'
        range: '#caa427'
        record: '#27caa4'
        string: '#4dca27'

        bool: {|| if $in { '#8de9d4' } else { '#caa427' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ca274d' attr: 'b' }
            } else if $in < 6hr {
                '#ca274d'
            } else if $in < 1day {
                '#caa427'
            } else if $in < 3day {
                '#4dca27'
            } else if $in < 1wk {
                { fg: '#4dca27' attr: 'b' }
            } else if $in < 6wk {
                '#27caa4'
            } else if $in < 52wk {
                '#274dca'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#808080'
            } else if $e < 1mb {
                '#27caa4'
            } else {{ fg: '#274dca' }}
        }

        shape_and: { fg: '#a427ca' attr: 'b' }
        shape_binary: { fg: '#a427ca' attr: 'b' }
        shape_block: { fg: '#274dca' attr: 'b' }
        shape_bool: '#8de9d4'
        shape_closure: { fg: '#27caa4' attr: 'b' }
        shape_custom: '#4dca27'
        shape_datetime: { fg: '#27caa4' attr: 'b' }
        shape_directory: '#27caa4'
        shape_external: '#27caa4'
        shape_external_resolved: '#8de9d4'
        shape_externalarg: { fg: '#4dca27' attr: 'b' }
        shape_filepath: '#27caa4'
        shape_flag: { fg: '#274dca' attr: 'b' }
        shape_float: { fg: '#e98da3' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#27caa4' attr: 'b' }
        shape_globpattern: { fg: '#27caa4' attr: 'b' }
        shape_int: { fg: '#a427ca' attr: 'b' }
        shape_internalcall: { fg: '#27caa4' attr: 'b' }
        shape_keyword: { fg: '#a427ca' attr: 'b' }
        shape_list: { fg: '#27caa4' attr: 'b' }
        shape_literal: '#274dca'
        shape_match_pattern: '#4dca27'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ca274d'
        shape_operator: '#caa427'
        shape_or: { fg: '#a427ca' attr: 'b' }
        shape_pipe: { fg: '#a427ca' attr: 'b' }
        shape_range: { fg: '#caa427' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#27caa4' attr: 'b' }
        shape_redirection: { fg: '#a427ca' attr: 'b' }
        shape_signature: { fg: '#4dca27' attr: 'b' }
        shape_string: '#4dca27'
        shape_string_interpolation: { fg: '#27caa4' attr: 'b' }
        shape_table: { fg: '#274dca' attr: 'b' }
        shape_vardecl: { fg: '#274dca' attr: 'u' }
        shape_variable: '#a427ca'

        foreground: '#d9e6f2'
        background: '#09111a'
        cursor: '#d9e6f2'

        empty: '#274dca'
        header: { fg: '#4dca27' attr: 'b' }
        hints: '#808080'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#4dca27' attr: 'b' }
        search_result: { fg: '#ca274d' bg: '#808080' }
        separator: '#808080'
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