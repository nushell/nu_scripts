export module "black-metal-dark-funeral-theme" {
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
            separator: '#c1c1c1'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#d0dfee' attr: 'b' }
            empty: '#888888'
            bool: {|| if $in { '#aaaaaa' } else { 'light_gray' } }
            int: '#c1c1c1'
            filesize: {|e|
                if $e == 0b {
                    '#c1c1c1'
                } else if $e < 1mb {
                    '#aaaaaa'
                } else {{ fg: '#888888' }}
            }
            duration: '#c1c1c1'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#5f8787' attr: 'b' }
                } else if $in < 6hr {
                    '#5f8787'
                } else if $in < 1day {
                    '#5f81a5'
                } else if $in < 3day {
                    '#d0dfee'
                } else if $in < 1wk {
                    { fg: '#d0dfee' attr: 'b' }
                } else if $in < 6wk {
                    '#aaaaaa'
                } else if $in < 52wk {
                    '#888888'
                } else { 'dark_gray' }
            }
            range: '#c1c1c1'
            float: '#c1c1c1'
            string: '#c1c1c1'
            nothing: '#c1c1c1'
            binary: '#c1c1c1'
            cellpath: '#c1c1c1'
            row_index: { fg: '#d0dfee' attr: 'b' }
            record: '#c1c1c1'
            list: '#c1c1c1'
            block: '#c1c1c1'
            hints: 'dark_gray'
            search_result: { fg: '#5f8787' bg: '#c1c1c1' }

            shape_and: { fg: '#999999' attr: 'b' }
            shape_binary: { fg: '#999999' attr: 'b' }
            shape_block: { fg: '#888888' attr: 'b' }
            shape_bool: '#aaaaaa'
            shape_custom: '#d0dfee'
            shape_datetime: { fg: '#aaaaaa' attr: 'b' }
            shape_directory: '#aaaaaa'
            shape_external: '#aaaaaa'
            shape_externalarg: { fg: '#d0dfee' attr: 'b' }
            shape_filepath: '#aaaaaa'
            shape_flag: { fg: '#888888' attr: 'b' }
            shape_float: { fg: '#999999' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#aaaaaa' attr: 'b' }
            shape_int: { fg: '#999999' attr: 'b' }
            shape_internalcall: { fg: '#aaaaaa' attr: 'b' }
            shape_list: { fg: '#aaaaaa' attr: 'b' }
            shape_literal: '#888888'
            shape_match_pattern: '#d0dfee'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#aaaaaa'
            shape_operator: '#5f81a5'
            shape_or: { fg: '#999999' attr: 'b' }
            shape_pipe: { fg: '#999999' attr: 'b' }
            shape_range: { fg: '#5f81a5' attr: 'b' }
            shape_record: { fg: '#aaaaaa' attr: 'b' }
            shape_redirection: { fg: '#999999' attr: 'b' }
            shape_signature: { fg: '#d0dfee' attr: 'b' }
            shape_string: '#d0dfee'
            shape_string_interpolation: { fg: '#aaaaaa' attr: 'b' }
            shape_table: { fg: '#888888' attr: 'b' }
            shape_variable: '#999999'

            background: '#000000'
            foreground: '#c1c1c1'
            cursor: '#c1c1c1'
        }
    }
}

export module activate {
    export-env {
        use "black-metal-dark-funeral-theme"

        black-metal-dark-funeral-theme set color_config
        black-metal-dark-funeral-theme update terminal
    }
}

# Activate the theme when sourced
use activate