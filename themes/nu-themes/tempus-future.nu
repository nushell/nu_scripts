# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e58a82'
        block: '#4aaed3'
        cell-path: '#a59ebd'
        closure: '#29b3bb'
        custom: '#b4abac'
        duration: '#bfa01a'
        float: '#f78e2f'
        glob: '#b4abac'
        int: '#e58a82'
        list: '#29b3bb'
        nothing: '#ff778a'
        range: '#bfa01a'
        record: '#29b3bb'
        string: '#6ab539'

        bool: {|| if $in { '#2cbab6' } else { '#bfa01a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ff778a' attr: 'b' }
            } else if $in < 6hr {
                '#ff778a'
            } else if $in < 1day {
                '#bfa01a'
            } else if $in < 3day {
                '#6ab539'
            } else if $in < 1wk {
                { fg: '#6ab539' attr: 'b' }
            } else if $in < 6wk {
                '#29b3bb'
            } else if $in < 52wk {
                '#4aaed3'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a59ebd'
            } else if $e < 1mb {
                '#29b3bb'
            } else {{ fg: '#4aaed3' }}
        }

        shape_and: { fg: '#e58a82' attr: 'b' }
        shape_binary: { fg: '#e58a82' attr: 'b' }
        shape_block: { fg: '#4aaed3' attr: 'b' }
        shape_bool: '#2cbab6'
        shape_closure: { fg: '#29b3bb' attr: 'b' }
        shape_custom: '#6ab539'
        shape_datetime: { fg: '#29b3bb' attr: 'b' }
        shape_directory: '#29b3bb'
        shape_external: '#29b3bb'
        shape_external_resolved: '#2cbab6'
        shape_externalarg: { fg: '#6ab539' attr: 'b' }
        shape_filepath: '#29b3bb'
        shape_flag: { fg: '#4aaed3' attr: 'b' }
        shape_float: { fg: '#f78e2f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#29b3bb' attr: 'b' }
        shape_globpattern: { fg: '#29b3bb' attr: 'b' }
        shape_int: { fg: '#e58a82' attr: 'b' }
        shape_internalcall: { fg: '#29b3bb' attr: 'b' }
        shape_keyword: { fg: '#e58a82' attr: 'b' }
        shape_list: { fg: '#29b3bb' attr: 'b' }
        shape_literal: '#4aaed3'
        shape_match_pattern: '#6ab539'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ff778a'
        shape_operator: '#bfa01a'
        shape_or: { fg: '#e58a82' attr: 'b' }
        shape_pipe: { fg: '#e58a82' attr: 'b' }
        shape_range: { fg: '#bfa01a' attr: 'b' }
        shape_raw_string: { fg: '#b4abac' attr: 'b' }
        shape_record: { fg: '#29b3bb' attr: 'b' }
        shape_redirection: { fg: '#e58a82' attr: 'b' }
        shape_signature: { fg: '#6ab539' attr: 'b' }
        shape_string: '#6ab539'
        shape_string_interpolation: { fg: '#29b3bb' attr: 'b' }
        shape_table: { fg: '#4aaed3' attr: 'b' }
        shape_vardecl: { fg: '#4aaed3' attr: 'u' }
        shape_variable: '#e58a82'

        foreground: '#b4abac'
        background: '#090a18'
        cursor: '#b4abac'

        empty: '#4aaed3'
        header: { fg: '#6ab539' attr: 'b' }
        hints: '#260e22'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6ab539' attr: 'b' }
        search_result: { fg: '#ff778a' bg: '#a59ebd' }
        separator: '#a59ebd'
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