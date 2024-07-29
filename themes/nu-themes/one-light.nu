# Retrieve the theme settings
export def main [] {
    return {
        binary: '#a626a4'
        block: '#4078f2'
        cell-path: '#383a42'
        closure: '#0184bc'
        custom: '#090a0b'
        duration: '#c18401'
        float: '#ca1243'
        glob: '#090a0b'
        int: '#a626a4'
        list: '#0184bc'
        nothing: '#ca1243'
        range: '#c18401'
        record: '#0184bc'
        string: '#50a14f'

        bool: {|| if $in { '#0184bc' } else { '#c18401' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ca1243' attr: 'b' }
            } else if $in < 6hr {
                '#ca1243'
            } else if $in < 1day {
                '#c18401'
            } else if $in < 3day {
                '#50a14f'
            } else if $in < 1wk {
                { fg: '#50a14f' attr: 'b' }
            } else if $in < 6wk {
                '#0184bc'
            } else if $in < 52wk {
                '#4078f2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#383a42'
            } else if $e < 1mb {
                '#0184bc'
            } else {{ fg: '#4078f2' }}
        }

        shape_and: { fg: '#a626a4' attr: 'b' }
        shape_binary: { fg: '#a626a4' attr: 'b' }
        shape_block: { fg: '#4078f2' attr: 'b' }
        shape_bool: '#0184bc'
        shape_closure: { fg: '#0184bc' attr: 'b' }
        shape_custom: '#50a14f'
        shape_datetime: { fg: '#0184bc' attr: 'b' }
        shape_directory: '#0184bc'
        shape_external: '#0184bc'
        shape_external_resolved: '#0184bc'
        shape_externalarg: { fg: '#50a14f' attr: 'b' }
        shape_filepath: '#0184bc'
        shape_flag: { fg: '#4078f2' attr: 'b' }
        shape_float: { fg: '#ca1243' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#0184bc' attr: 'b' }
        shape_globpattern: { fg: '#0184bc' attr: 'b' }
        shape_int: { fg: '#a626a4' attr: 'b' }
        shape_internalcall: { fg: '#0184bc' attr: 'b' }
        shape_keyword: { fg: '#a626a4' attr: 'b' }
        shape_list: { fg: '#0184bc' attr: 'b' }
        shape_literal: '#4078f2'
        shape_match_pattern: '#50a14f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ca1243'
        shape_operator: '#c18401'
        shape_or: { fg: '#a626a4' attr: 'b' }
        shape_pipe: { fg: '#a626a4' attr: 'b' }
        shape_range: { fg: '#c18401' attr: 'b' }
        shape_raw_string: { fg: '#090a0b' attr: 'b' }
        shape_record: { fg: '#0184bc' attr: 'b' }
        shape_redirection: { fg: '#a626a4' attr: 'b' }
        shape_signature: { fg: '#50a14f' attr: 'b' }
        shape_string: '#50a14f'
        shape_string_interpolation: { fg: '#0184bc' attr: 'b' }
        shape_table: { fg: '#4078f2' attr: 'b' }
        shape_vardecl: { fg: '#4078f2' attr: 'u' }
        shape_variable: '#a626a4'

        foreground: '#383a42'
        background: '#fafafa'
        cursor: '#383a42'

        empty: '#4078f2'
        header: { fg: '#50a14f' attr: 'b' }
        hints: '#a0a1a7'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#50a14f' attr: 'b' }
        search_result: { fg: '#ca1243' bg: '#383a42' }
        separator: '#383a42'
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