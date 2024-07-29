# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b083f0'
        block: '#539bf5'
        cell-path: '#909dab'
        closure: '#39c5cf'
        custom: '#cdd9e5'
        duration: '#c69026'
        float: '#ff938a'
        glob: '#cdd9e5'
        int: '#b083f0'
        list: '#39c5cf'
        nothing: '#f47067'
        range: '#c69026'
        record: '#39c5cf'
        string: '#57ab5a'

        bool: {|| if $in { '#56d4dd' } else { '#c69026' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f47067' attr: 'b' }
            } else if $in < 6hr {
                '#f47067'
            } else if $in < 1day {
                '#c69026'
            } else if $in < 3day {
                '#57ab5a'
            } else if $in < 1wk {
                { fg: '#57ab5a' attr: 'b' }
            } else if $in < 6wk {
                '#39c5cf'
            } else if $in < 52wk {
                '#539bf5'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#909dab'
            } else if $e < 1mb {
                '#39c5cf'
            } else {{ fg: '#539bf5' }}
        }

        shape_and: { fg: '#b083f0' attr: 'b' }
        shape_binary: { fg: '#b083f0' attr: 'b' }
        shape_block: { fg: '#539bf5' attr: 'b' }
        shape_bool: '#56d4dd'
        shape_closure: { fg: '#39c5cf' attr: 'b' }
        shape_custom: '#57ab5a'
        shape_datetime: { fg: '#39c5cf' attr: 'b' }
        shape_directory: '#39c5cf'
        shape_external: '#39c5cf'
        shape_external_resolved: '#56d4dd'
        shape_externalarg: { fg: '#57ab5a' attr: 'b' }
        shape_filepath: '#39c5cf'
        shape_flag: { fg: '#539bf5' attr: 'b' }
        shape_float: { fg: '#ff938a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#39c5cf' attr: 'b' }
        shape_globpattern: { fg: '#39c5cf' attr: 'b' }
        shape_int: { fg: '#b083f0' attr: 'b' }
        shape_internalcall: { fg: '#39c5cf' attr: 'b' }
        shape_keyword: { fg: '#b083f0' attr: 'b' }
        shape_list: { fg: '#39c5cf' attr: 'b' }
        shape_literal: '#539bf5'
        shape_match_pattern: '#57ab5a'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f47067'
        shape_operator: '#c69026'
        shape_or: { fg: '#b083f0' attr: 'b' }
        shape_pipe: { fg: '#b083f0' attr: 'b' }
        shape_range: { fg: '#c69026' attr: 'b' }
        shape_raw_string: { fg: '#cdd9e5' attr: 'b' }
        shape_record: { fg: '#39c5cf' attr: 'b' }
        shape_redirection: { fg: '#b083f0' attr: 'b' }
        shape_signature: { fg: '#57ab5a' attr: 'b' }
        shape_string: '#57ab5a'
        shape_string_interpolation: { fg: '#39c5cf' attr: 'b' }
        shape_table: { fg: '#539bf5' attr: 'b' }
        shape_vardecl: { fg: '#539bf5' attr: 'u' }
        shape_variable: '#b083f0'

        foreground: '#768390'
        background: '#22272e'
        cursor: '#6cb6ff'

        empty: '#539bf5'
        header: { fg: '#57ab5a' attr: 'b' }
        hints: '#636e7b'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#57ab5a' attr: 'b' }
        search_result: { fg: '#f47067' bg: '#909dab' }
        separator: '#909dab'
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