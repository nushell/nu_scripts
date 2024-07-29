# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d600dd'
        block: '#0007dd'
        cell-path: '#f2f2f2'
        closure: '#00ddd6'
        custom: '#ffffff'
        duration: '#ddd600'
        float: '#ff7478'
        glob: '#ffffff'
        int: '#d600dd'
        list: '#00ddd6'
        nothing: '#dd0007'
        range: '#ddd600'
        record: '#00ddd6'
        string: '#07dd00'

        bool: {|| if $in { '#74fffa' } else { '#ddd600' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#dd0007' attr: 'b' }
            } else if $in < 6hr {
                '#dd0007'
            } else if $in < 1day {
                '#ddd600'
            } else if $in < 3day {
                '#07dd00'
            } else if $in < 1wk {
                { fg: '#07dd00' attr: 'b' }
            } else if $in < 6wk {
                '#00ddd6'
            } else if $in < 52wk {
                '#0007dd'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f2f2f2'
            } else if $e < 1mb {
                '#00ddd6'
            } else {{ fg: '#0007dd' }}
        }

        shape_and: { fg: '#d600dd' attr: 'b' }
        shape_binary: { fg: '#d600dd' attr: 'b' }
        shape_block: { fg: '#0007dd' attr: 'b' }
        shape_bool: '#74fffa'
        shape_closure: { fg: '#00ddd6' attr: 'b' }
        shape_custom: '#07dd00'
        shape_datetime: { fg: '#00ddd6' attr: 'b' }
        shape_directory: '#00ddd6'
        shape_external: '#00ddd6'
        shape_external_resolved: '#74fffa'
        shape_externalarg: { fg: '#07dd00' attr: 'b' }
        shape_filepath: '#00ddd6'
        shape_flag: { fg: '#0007dd' attr: 'b' }
        shape_float: { fg: '#ff7478' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00ddd6' attr: 'b' }
        shape_globpattern: { fg: '#00ddd6' attr: 'b' }
        shape_int: { fg: '#d600dd' attr: 'b' }
        shape_internalcall: { fg: '#00ddd6' attr: 'b' }
        shape_keyword: { fg: '#d600dd' attr: 'b' }
        shape_list: { fg: '#00ddd6' attr: 'b' }
        shape_literal: '#0007dd'
        shape_match_pattern: '#07dd00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#dd0007'
        shape_operator: '#ddd600'
        shape_or: { fg: '#d600dd' attr: 'b' }
        shape_pipe: { fg: '#d600dd' attr: 'b' }
        shape_range: { fg: '#ddd600' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00ddd6' attr: 'b' }
        shape_redirection: { fg: '#d600dd' attr: 'b' }
        shape_signature: { fg: '#07dd00' attr: 'b' }
        shape_string: '#07dd00'
        shape_string_interpolation: { fg: '#00ddd6' attr: 'b' }
        shape_table: { fg: '#0007dd' attr: 'b' }
        shape_vardecl: { fg: '#0007dd' attr: 'u' }
        shape_variable: '#d600dd'

        foreground: '#23476a'
        background: '#758480'
        cursor: '#23476a'

        empty: '#0007dd'
        header: { fg: '#07dd00' attr: 'b' }
        hints: '#7d7d7d'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#07dd00' attr: 'b' }
        search_result: { fg: '#dd0007' bg: '#f2f2f2' }
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