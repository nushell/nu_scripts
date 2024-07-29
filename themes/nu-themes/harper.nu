# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b296c6'
        block: '#489e48'
        cell-path: '#a8a49d'
        closure: '#f5bfd7'
        custom: '#fefbea'
        duration: '#d6da25'
        float: '#f8b63f'
        glob: '#fefbea'
        int: '#b296c6'
        list: '#f5bfd7'
        nothing: '#f8b63f'
        range: '#d6da25'
        record: '#f5bfd7'
        string: '#7fb5e1'

        bool: {|| if $in { '#f5bfd7' } else { '#d6da25' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f8b63f' attr: 'b' }
            } else if $in < 6hr {
                '#f8b63f'
            } else if $in < 1day {
                '#d6da25'
            } else if $in < 3day {
                '#7fb5e1'
            } else if $in < 1wk {
                { fg: '#7fb5e1' attr: 'b' }
            } else if $in < 6wk {
                '#f5bfd7'
            } else if $in < 52wk {
                '#489e48'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#a8a49d'
            } else if $e < 1mb {
                '#f5bfd7'
            } else {{ fg: '#489e48' }}
        }

        shape_and: { fg: '#b296c6' attr: 'b' }
        shape_binary: { fg: '#b296c6' attr: 'b' }
        shape_block: { fg: '#489e48' attr: 'b' }
        shape_bool: '#f5bfd7'
        shape_closure: { fg: '#f5bfd7' attr: 'b' }
        shape_custom: '#7fb5e1'
        shape_datetime: { fg: '#f5bfd7' attr: 'b' }
        shape_directory: '#f5bfd7'
        shape_external: '#f5bfd7'
        shape_external_resolved: '#f5bfd7'
        shape_externalarg: { fg: '#7fb5e1' attr: 'b' }
        shape_filepath: '#f5bfd7'
        shape_flag: { fg: '#489e48' attr: 'b' }
        shape_float: { fg: '#f8b63f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#f5bfd7' attr: 'b' }
        shape_globpattern: { fg: '#f5bfd7' attr: 'b' }
        shape_int: { fg: '#b296c6' attr: 'b' }
        shape_internalcall: { fg: '#f5bfd7' attr: 'b' }
        shape_keyword: { fg: '#b296c6' attr: 'b' }
        shape_list: { fg: '#f5bfd7' attr: 'b' }
        shape_literal: '#489e48'
        shape_match_pattern: '#7fb5e1'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f8b63f'
        shape_operator: '#d6da25'
        shape_or: { fg: '#b296c6' attr: 'b' }
        shape_pipe: { fg: '#b296c6' attr: 'b' }
        shape_range: { fg: '#d6da25' attr: 'b' }
        shape_raw_string: { fg: '#fefbea' attr: 'b' }
        shape_record: { fg: '#f5bfd7' attr: 'b' }
        shape_redirection: { fg: '#b296c6' attr: 'b' }
        shape_signature: { fg: '#7fb5e1' attr: 'b' }
        shape_string: '#7fb5e1'
        shape_string_interpolation: { fg: '#f5bfd7' attr: 'b' }
        shape_table: { fg: '#489e48' attr: 'b' }
        shape_vardecl: { fg: '#489e48' attr: 'u' }
        shape_variable: '#b296c6'

        foreground: '#a8a49d'
        background: '#010101'
        cursor: '#a8a49d'

        empty: '#489e48'
        header: { fg: '#7fb5e1' attr: 'b' }
        hints: '#726e6a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7fb5e1' attr: 'b' }
        search_result: { fg: '#f8b63f' bg: '#a8a49d' }
        separator: '#a8a49d'
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