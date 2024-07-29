# Retrieve the theme settings
export def main [] {
    return {
        binary: '#dd006f'
        block: '#6f00dd'
        cell-path: '#f2f2f2'
        closure: '#006fdd'
        custom: '#ffffff'
        duration: '#6fdd00'
        float: '#ffb974'
        glob: '#ffffff'
        int: '#dd006f'
        list: '#006fdd'
        nothing: '#dd6f00'
        range: '#6fdd00'
        record: '#006fdd'
        string: '#00dd6f'

        bool: {|| if $in { '#74b9ff' } else { '#6fdd00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#dd6f00' attr: 'b' }
            } else if $in < 6hr {
                '#dd6f00'
            } else if $in < 1day {
                '#6fdd00'
            } else if $in < 3day {
                '#00dd6f'
            } else if $in < 1wk {
                { fg: '#00dd6f' attr: 'b' }
            } else if $in < 6wk {
                '#006fdd'
            } else if $in < 52wk {
                '#6f00dd'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f2f2f2'
            } else if $e < 1mb {
                '#006fdd'
            } else {{ fg: '#6f00dd' }}
        }

        shape_and: { fg: '#dd006f' attr: 'b' }
        shape_binary: { fg: '#dd006f' attr: 'b' }
        shape_block: { fg: '#6f00dd' attr: 'b' }
        shape_bool: '#74b9ff'
        shape_closure: { fg: '#006fdd' attr: 'b' }
        shape_custom: '#00dd6f'
        shape_datetime: { fg: '#006fdd' attr: 'b' }
        shape_directory: '#006fdd'
        shape_external: '#006fdd'
        shape_external_resolved: '#74b9ff'
        shape_externalarg: { fg: '#00dd6f' attr: 'b' }
        shape_filepath: '#006fdd'
        shape_flag: { fg: '#6f00dd' attr: 'b' }
        shape_float: { fg: '#ffb974' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#006fdd' attr: 'b' }
        shape_globpattern: { fg: '#006fdd' attr: 'b' }
        shape_int: { fg: '#dd006f' attr: 'b' }
        shape_internalcall: { fg: '#006fdd' attr: 'b' }
        shape_keyword: { fg: '#dd006f' attr: 'b' }
        shape_list: { fg: '#006fdd' attr: 'b' }
        shape_literal: '#6f00dd'
        shape_match_pattern: '#00dd6f'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#dd6f00'
        shape_operator: '#6fdd00'
        shape_or: { fg: '#dd006f' attr: 'b' }
        shape_pipe: { fg: '#dd006f' attr: 'b' }
        shape_range: { fg: '#6fdd00' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#006fdd' attr: 'b' }
        shape_redirection: { fg: '#dd006f' attr: 'b' }
        shape_signature: { fg: '#00dd6f' attr: 'b' }
        shape_string: '#00dd6f'
        shape_string_interpolation: { fg: '#006fdd' attr: 'b' }
        shape_table: { fg: '#6f00dd' attr: 'b' }
        shape_vardecl: { fg: '#6f00dd' attr: 'u' }
        shape_variable: '#dd006f'

        foreground: '#23476a'
        background: '#758480'
        cursor: '#23476a'

        empty: '#6f00dd'
        header: { fg: '#00dd6f' attr: 'b' }
        hints: '#7d7d7d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#00dd6f' attr: 'b' }
        search_result: { fg: '#dd6f00' bg: '#f2f2f2' }
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