# Retrieve the theme settings
export def main [] {
    return {
        binary: '#8a5edc'
        block: '#325d96'
        cell-path: '#23d183'
        closure: '#35a08f'
        custom: '#d5d5d5'
        duration: '#db8e27'
        float: '#dd5944'
        glob: '#d5d5d5'
        int: '#8a5edc'
        list: '#35a08f'
        nothing: '#be2d26'
        range: '#db8e27'
        record: '#35a08f'
        string: '#1a9172'

        bool: {|| if $in { '#42c3ae' } else { '#db8e27' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#be2d26' attr: 'b' }
            } else if $in < 6hr {
                '#be2d26'
            } else if $in < 1day {
                '#db8e27'
            } else if $in < 3day {
                '#1a9172'
            } else if $in < 1wk {
                { fg: '#1a9172' attr: 'b' }
            } else if $in < 6wk {
                '#35a08f'
            } else if $in < 52wk {
                '#325d96'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#23d183'
            } else if $e < 1mb {
                '#35a08f'
            } else {{ fg: '#325d96' }}
        }

        shape_and: { fg: '#8a5edc' attr: 'b' }
        shape_binary: { fg: '#8a5edc' attr: 'b' }
        shape_block: { fg: '#325d96' attr: 'b' }
        shape_bool: '#42c3ae'
        shape_closure: { fg: '#35a08f' attr: 'b' }
        shape_custom: '#1a9172'
        shape_datetime: { fg: '#35a08f' attr: 'b' }
        shape_directory: '#35a08f'
        shape_external: '#35a08f'
        shape_external_resolved: '#42c3ae'
        shape_externalarg: { fg: '#1a9172' attr: 'b' }
        shape_filepath: '#35a08f'
        shape_flag: { fg: '#325d96' attr: 'b' }
        shape_float: { fg: '#dd5944' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#35a08f' attr: 'b' }
        shape_globpattern: { fg: '#35a08f' attr: 'b' }
        shape_int: { fg: '#8a5edc' attr: 'b' }
        shape_internalcall: { fg: '#35a08f' attr: 'b' }
        shape_keyword: { fg: '#8a5edc' attr: 'b' }
        shape_list: { fg: '#35a08f' attr: 'b' }
        shape_literal: '#325d96'
        shape_match_pattern: '#1a9172'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#be2d26'
        shape_operator: '#db8e27'
        shape_or: { fg: '#8a5edc' attr: 'b' }
        shape_pipe: { fg: '#8a5edc' attr: 'b' }
        shape_range: { fg: '#db8e27' attr: 'b' }
        shape_raw_string: { fg: '#d5d5d5' attr: 'b' }
        shape_record: { fg: '#35a08f' attr: 'b' }
        shape_redirection: { fg: '#8a5edc' attr: 'b' }
        shape_signature: { fg: '#1a9172' attr: 'b' }
        shape_string: '#1a9172'
        shape_string_interpolation: { fg: '#35a08f' attr: 'b' }
        shape_table: { fg: '#325d96' attr: 'b' }
        shape_vardecl: { fg: '#325d96' attr: 'u' }
        shape_variable: '#8a5edc'

        foreground: '#31d07b'
        background: '#24364b'
        cursor: '#31d07b'

        empty: '#325d96'
        header: { fg: '#1a9172' attr: 'b' }
        hints: '#336889'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#1a9172' attr: 'b' }
        search_result: { fg: '#be2d26' bg: '#23d183' }
        separator: '#23d183'
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