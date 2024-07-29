# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ff8080'
        block: '#489bf0'
        cell-path: '#736e55'
        closure: '#5aebbc'
        custom: '#f8f5de'
        duration: '#f2ff27'
        float: '#e35142'
        glob: '#f8f5de'
        int: '#ff8080'
        list: '#5aebbc'
        nothing: '#e35142'
        range: '#f2ff27'
        record: '#5aebbc'
        string: '#5ceb5a'

        bool: {|| if $in { '#5aebbc' } else { '#f2ff27' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#e35142' attr: 'b' }
            } else if $in < 6hr {
                '#e35142'
            } else if $in < 1day {
                '#f2ff27'
            } else if $in < 3day {
                '#5ceb5a'
            } else if $in < 1wk {
                { fg: '#5ceb5a' attr: 'b' }
            } else if $in < 6wk {
                '#5aebbc'
            } else if $in < 52wk {
                '#489bf0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#736e55'
            } else if $e < 1mb {
                '#5aebbc'
            } else {{ fg: '#489bf0' }}
        }

        shape_and: { fg: '#ff8080' attr: 'b' }
        shape_binary: { fg: '#ff8080' attr: 'b' }
        shape_block: { fg: '#489bf0' attr: 'b' }
        shape_bool: '#5aebbc'
        shape_closure: { fg: '#5aebbc' attr: 'b' }
        shape_custom: '#5ceb5a'
        shape_datetime: { fg: '#5aebbc' attr: 'b' }
        shape_directory: '#5aebbc'
        shape_external: '#5aebbc'
        shape_external_resolved: '#5aebbc'
        shape_externalarg: { fg: '#5ceb5a' attr: 'b' }
        shape_filepath: '#5aebbc'
        shape_flag: { fg: '#489bf0' attr: 'b' }
        shape_float: { fg: '#e35142' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#5aebbc' attr: 'b' }
        shape_globpattern: { fg: '#5aebbc' attr: 'b' }
        shape_int: { fg: '#ff8080' attr: 'b' }
        shape_internalcall: { fg: '#5aebbc' attr: 'b' }
        shape_keyword: { fg: '#ff8080' attr: 'b' }
        shape_list: { fg: '#5aebbc' attr: 'b' }
        shape_literal: '#489bf0'
        shape_match_pattern: '#5ceb5a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#e35142'
        shape_operator: '#f2ff27'
        shape_or: { fg: '#ff8080' attr: 'b' }
        shape_pipe: { fg: '#ff8080' attr: 'b' }
        shape_range: { fg: '#f2ff27' attr: 'b' }
        shape_raw_string: { fg: '#f8f5de' attr: 'b' }
        shape_record: { fg: '#5aebbc' attr: 'b' }
        shape_redirection: { fg: '#ff8080' attr: 'b' }
        shape_signature: { fg: '#5ceb5a' attr: 'b' }
        shape_string: '#5ceb5a'
        shape_string_interpolation: { fg: '#5aebbc' attr: 'b' }
        shape_table: { fg: '#489bf0' attr: 'b' }
        shape_vardecl: { fg: '#489bf0' attr: 'u' }
        shape_variable: '#ff8080'

        foreground: '#736e55'
        background: '#1c1810'
        cursor: '#736e55'

        empty: '#489bf0'
        header: { fg: '#5ceb5a' attr: 'b' }
        hints: '#504b38'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#5ceb5a' attr: 'b' }
        search_result: { fg: '#e35142' bg: '#736e55' }
        separator: '#736e55'
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