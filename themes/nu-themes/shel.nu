# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6c24a2'
        block: '#2c64a2'
        cell-path: '#918988'
        closure: '#2ca363'
        custom: '#f5eeec'
        duration: '#ab6423'
        float: '#f588b9'
        glob: '#f5eeec'
        int: '#6c24a2'
        list: '#2ca363'
        nothing: '#ab2463'
        range: '#ab6423'
        record: '#2ca363'
        string: '#6ca323'

        bool: {|| if $in { '#8feeb9' } else { '#ab6423' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#ab2463' attr: 'b' }
            } else if $in < 6hr {
                '#ab2463'
            } else if $in < 1day {
                '#ab6423'
            } else if $in < 3day {
                '#6ca323'
            } else if $in < 1wk {
                { fg: '#6ca323' attr: 'b' }
            } else if $in < 6wk {
                '#2ca363'
            } else if $in < 52wk {
                '#2c64a2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#918988'
            } else if $e < 1mb {
                '#2ca363'
            } else {{ fg: '#2c64a2' }}
        }

        shape_and: { fg: '#6c24a2' attr: 'b' }
        shape_binary: { fg: '#6c24a2' attr: 'b' }
        shape_block: { fg: '#2c64a2' attr: 'b' }
        shape_bool: '#8feeb9'
        shape_closure: { fg: '#2ca363' attr: 'b' }
        shape_custom: '#6ca323'
        shape_datetime: { fg: '#2ca363' attr: 'b' }
        shape_directory: '#2ca363'
        shape_external: '#2ca363'
        shape_external_resolved: '#8feeb9'
        shape_externalarg: { fg: '#6ca323' attr: 'b' }
        shape_filepath: '#2ca363'
        shape_flag: { fg: '#2c64a2' attr: 'b' }
        shape_float: { fg: '#f588b9' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#2ca363' attr: 'b' }
        shape_globpattern: { fg: '#2ca363' attr: 'b' }
        shape_int: { fg: '#6c24a2' attr: 'b' }
        shape_internalcall: { fg: '#2ca363' attr: 'b' }
        shape_keyword: { fg: '#6c24a2' attr: 'b' }
        shape_list: { fg: '#2ca363' attr: 'b' }
        shape_literal: '#2c64a2'
        shape_match_pattern: '#6ca323'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#ab2463'
        shape_operator: '#ab6423'
        shape_or: { fg: '#6c24a2' attr: 'b' }
        shape_pipe: { fg: '#6c24a2' attr: 'b' }
        shape_range: { fg: '#ab6423' attr: 'b' }
        shape_raw_string: { fg: '#f5eeec' attr: 'b' }
        shape_record: { fg: '#2ca363' attr: 'b' }
        shape_redirection: { fg: '#6c24a2' attr: 'b' }
        shape_signature: { fg: '#6ca323' attr: 'b' }
        shape_string: '#6ca323'
        shape_string_interpolation: { fg: '#2ca363' attr: 'b' }
        shape_table: { fg: '#2c64a2' attr: 'b' }
        shape_vardecl: { fg: '#2c64a2' attr: 'u' }
        shape_variable: '#6c24a2'

        foreground: '#4882cd'
        background: '#2a201f'
        cursor: '#4882cd'

        empty: '#2c64a2'
        header: { fg: '#6ca323' attr: 'b' }
        hints: '#918988'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6ca323' attr: 'b' }
        search_result: { fg: '#ab2463' bg: '#918988' }
        separator: '#918988'
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