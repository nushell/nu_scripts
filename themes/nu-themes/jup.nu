# Retrieve the theme settings
export def main [] {
    return {
        binary: '#6f00dd'
        block: '#006fdd'
        cell-path: '#f2f2f2'
        closure: '#00dd6f'
        custom: '#ffffff'
        duration: '#dd6f00'
        float: '#ff74b9'
        glob: '#ffffff'
        int: '#6f00dd'
        list: '#00dd6f'
        nothing: '#dd006f'
        range: '#dd6f00'
        record: '#00dd6f'
        string: '#6fdd00'

        bool: {|| if $in { '#74ffb9' } else { '#dd6f00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#dd006f' attr: 'b' }
            } else if $in < 6hr {
                '#dd006f'
            } else if $in < 1day {
                '#dd6f00'
            } else if $in < 3day {
                '#6fdd00'
            } else if $in < 1wk {
                { fg: '#6fdd00' attr: 'b' }
            } else if $in < 6wk {
                '#00dd6f'
            } else if $in < 52wk {
                '#006fdd'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f2f2f2'
            } else if $e < 1mb {
                '#00dd6f'
            } else {{ fg: '#006fdd' }}
        }

        shape_and: { fg: '#6f00dd' attr: 'b' }
        shape_binary: { fg: '#6f00dd' attr: 'b' }
        shape_block: { fg: '#006fdd' attr: 'b' }
        shape_bool: '#74ffb9'
        shape_closure: { fg: '#00dd6f' attr: 'b' }
        shape_custom: '#6fdd00'
        shape_datetime: { fg: '#00dd6f' attr: 'b' }
        shape_directory: '#00dd6f'
        shape_external: '#00dd6f'
        shape_external_resolved: '#74ffb9'
        shape_externalarg: { fg: '#6fdd00' attr: 'b' }
        shape_filepath: '#00dd6f'
        shape_flag: { fg: '#006fdd' attr: 'b' }
        shape_float: { fg: '#ff74b9' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00dd6f' attr: 'b' }
        shape_globpattern: { fg: '#00dd6f' attr: 'b' }
        shape_int: { fg: '#6f00dd' attr: 'b' }
        shape_internalcall: { fg: '#00dd6f' attr: 'b' }
        shape_keyword: { fg: '#6f00dd' attr: 'b' }
        shape_list: { fg: '#00dd6f' attr: 'b' }
        shape_literal: '#006fdd'
        shape_match_pattern: '#6fdd00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#dd006f'
        shape_operator: '#dd6f00'
        shape_or: { fg: '#6f00dd' attr: 'b' }
        shape_pipe: { fg: '#6f00dd' attr: 'b' }
        shape_range: { fg: '#dd6f00' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00dd6f' attr: 'b' }
        shape_redirection: { fg: '#6f00dd' attr: 'b' }
        shape_signature: { fg: '#6fdd00' attr: 'b' }
        shape_string: '#6fdd00'
        shape_string_interpolation: { fg: '#00dd6f' attr: 'b' }
        shape_table: { fg: '#006fdd' attr: 'b' }
        shape_vardecl: { fg: '#006fdd' attr: 'u' }
        shape_variable: '#6f00dd'

        foreground: '#23476a'
        background: '#758480'
        cursor: '#23476a'

        empty: '#006fdd'
        header: { fg: '#6fdd00' attr: 'b' }
        hints: '#7d7d7d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#6fdd00' attr: 'b' }
        search_result: { fg: '#dd006f' bg: '#f2f2f2' }
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