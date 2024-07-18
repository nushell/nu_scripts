export module "c64-theme" {
    # Update terminal colors
    export def "update terminal" [] {
        let theme = (get color_config)

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
        # to one line
        | str replace --all "\n" ''
        | print $in
    }

    # Update the Nushell configuration
    export def --env "set color_config" [] {
        $env.config.color_config = (get color_config)
    }

    # Retrieve the color settings
    export def "get color_config" [] {
        return {
            separator: '#ffffff'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#55a049' attr: 'b' }
            empty: '#40318d'
            bool: {|| if $in { '#67b6bd' } else { 'light_gray' } }
            int: '#ffffff'
            filesize: {|e|
                if $e == 0b {
                    '#ffffff'
                } else if $e < 1mb {
                    '#67b6bd'
                } else {{ fg: '#40318d' }}
            }
            duration: '#ffffff'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#883932' attr: 'b' }
                } else if $in < 6hr {
                    '#883932'
                } else if $in < 1day {
                    '#bfce72'
                } else if $in < 3day {
                    '#55a049'
                } else if $in < 1wk {
                    { fg: '#55a049' attr: 'b' }
                } else if $in < 6wk {
                    '#67b6bd'
                } else if $in < 52wk {
                    '#40318d'
                } else { 'dark_gray' }
            }
            range: '#ffffff'
            float: '#ffffff'
            string: '#ffffff'
            nothing: '#ffffff'
            binary: '#ffffff'
            cellpath: '#ffffff'
            row_index: { fg: '#55a049' attr: 'b' }
            record: '#ffffff'
            list: '#ffffff'
            block: '#ffffff'
            hints: 'dark_gray'
            search_result: { fg: '#883932' bg: '#ffffff' }

            shape_and: { fg: '#8b3f96' attr: 'b' }
            shape_binary: { fg: '#8b3f96' attr: 'b' }
            shape_block: { fg: '#40318d' attr: 'b' }
            shape_bool: '#67b6bd'
            shape_custom: '#55a049'
            shape_datetime: { fg: '#67b6bd' attr: 'b' }
            shape_directory: '#67b6bd'
            shape_external: '#67b6bd'
            shape_externalarg: { fg: '#55a049' attr: 'b' }
            shape_filepath: '#67b6bd'
            shape_flag: { fg: '#40318d' attr: 'b' }
            shape_float: { fg: '#8b3f96' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#67b6bd' attr: 'b' }
            shape_int: { fg: '#8b3f96' attr: 'b' }
            shape_internalcall: { fg: '#67b6bd' attr: 'b' }
            shape_list: { fg: '#67b6bd' attr: 'b' }
            shape_literal: '#40318d'
            shape_match_pattern: '#55a049'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#67b6bd'
            shape_operator: '#bfce72'
            shape_or: { fg: '#8b3f96' attr: 'b' }
            shape_pipe: { fg: '#8b3f96' attr: 'b' }
            shape_range: { fg: '#bfce72' attr: 'b' }
            shape_record: { fg: '#67b6bd' attr: 'b' }
            shape_redirection: { fg: '#8b3f96' attr: 'b' }
            shape_signature: { fg: '#55a049' attr: 'b' }
            shape_string: '#55a049'
            shape_string_interpolation: { fg: '#67b6bd' attr: 'b' }
            shape_table: { fg: '#40318d' attr: 'b' }
            shape_variable: '#8b3f96'

            background: '#40318d'
            foreground: '#7869c4'
            cursor: '#7869c4'
        }
    }
}

export module activate {
    export-env {
        use "c64-theme"

        c64-theme set color_config
        c64-theme update terminal
    }
}

# Activate the theme when sourced
use activate