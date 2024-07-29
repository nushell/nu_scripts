# Retrieve the theme settings
export def main [] {
    return {
        binary: '#944d95'
        block: '#589df6'
        cell-path: '#bbbbbb'
        closure: '#1f9ee7'
        custom: '#ffffff'
        duration: '#fef02a'
        float: '#fa8c8f'
        glob: '#ffffff'
        int: '#944d95'
        list: '#1f9ee7'
        nothing: '#f9555f'
        range: '#fef02a'
        record: '#1f9ee7'
        string: '#21b089'

        bool: {|| if $in { '#3979bc' } else { '#fef02a' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f9555f' attr: 'b' }
            } else if $in < 6hr {
                '#f9555f'
            } else if $in < 1day {
                '#fef02a'
            } else if $in < 3day {
                '#21b089'
            } else if $in < 1wk {
                { fg: '#21b089' attr: 'b' }
            } else if $in < 6wk {
                '#1f9ee7'
            } else if $in < 52wk {
                '#589df6'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#1f9ee7'
            } else {{ fg: '#589df6' }}
        }

        shape_and: { fg: '#944d95' attr: 'b' }
        shape_binary: { fg: '#944d95' attr: 'b' }
        shape_block: { fg: '#589df6' attr: 'b' }
        shape_bool: '#3979bc'
        shape_closure: { fg: '#1f9ee7' attr: 'b' }
        shape_custom: '#21b089'
        shape_datetime: { fg: '#1f9ee7' attr: 'b' }
        shape_directory: '#1f9ee7'
        shape_external: '#1f9ee7'
        shape_external_resolved: '#3979bc'
        shape_externalarg: { fg: '#21b089' attr: 'b' }
        shape_filepath: '#1f9ee7'
        shape_flag: { fg: '#589df6' attr: 'b' }
        shape_float: { fg: '#fa8c8f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#1f9ee7' attr: 'b' }
        shape_globpattern: { fg: '#1f9ee7' attr: 'b' }
        shape_int: { fg: '#944d95' attr: 'b' }
        shape_internalcall: { fg: '#1f9ee7' attr: 'b' }
        shape_keyword: { fg: '#944d95' attr: 'b' }
        shape_list: { fg: '#1f9ee7' attr: 'b' }
        shape_literal: '#589df6'
        shape_match_pattern: '#21b089'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f9555f'
        shape_operator: '#fef02a'
        shape_or: { fg: '#944d95' attr: 'b' }
        shape_pipe: { fg: '#944d95' attr: 'b' }
        shape_range: { fg: '#fef02a' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#1f9ee7' attr: 'b' }
        shape_redirection: { fg: '#944d95' attr: 'b' }
        shape_signature: { fg: '#21b089' attr: 'b' }
        shape_string: '#21b089'
        shape_string_interpolation: { fg: '#1f9ee7' attr: 'b' }
        shape_table: { fg: '#589df6' attr: 'b' }
        shape_vardecl: { fg: '#589df6' attr: 'u' }
        shape_variable: '#944d95'

        foreground: '#ffffff'
        background: '#1d2837'
        cursor: '#ffffff'

        empty: '#589df6'
        header: { fg: '#21b089' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#21b089' attr: 'b' }
        search_result: { fg: '#f9555f' bg: '#bbbbbb' }
        separator: '#bbbbbb'
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