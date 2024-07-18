export module "mono-cyan-theme" {
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
            separator: '#00ccff'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#00ccff' attr: 'b' }
            empty: '#00ccff'
            bool: {|| if $in { '#00ccff' } else { 'light_gray' } }
            int: '#00ccff'
            filesize: {|e|
                if $e == 0b {
                    '#00ccff'
                } else if $e < 1mb {
                    '#00ccff'
                } else {{ fg: '#00ccff' }}
            }
            duration: '#00ccff'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#00ccff' attr: 'b' }
                } else if $in < 6hr {
                    '#00ccff'
                } else if $in < 1day {
                    '#00ccff'
                } else if $in < 3day {
                    '#00ccff'
                } else if $in < 1wk {
                    { fg: '#00ccff' attr: 'b' }
                } else if $in < 6wk {
                    '#00ccff'
                } else if $in < 52wk {
                    '#00ccff'
                } else { 'dark_gray' }
            }
            range: '#00ccff'
            float: '#00ccff'
            string: '#00ccff'
            nothing: '#00ccff'
            binary: '#00ccff'
            cellpath: '#00ccff'
            row_index: { fg: '#00ccff' attr: 'b' }
            record: '#00ccff'
            list: '#00ccff'
            block: '#00ccff'
            hints: 'dark_gray'
            search_result: { fg: '#00ccff' bg: '#00ccff' }

            shape_and: { fg: '#00ccff' attr: 'b' }
            shape_binary: { fg: '#00ccff' attr: 'b' }
            shape_block: { fg: '#00ccff' attr: 'b' }
            shape_bool: '#00ccff'
            shape_custom: '#00ccff'
            shape_datetime: { fg: '#00ccff' attr: 'b' }
            shape_directory: '#00ccff'
            shape_external: '#00ccff'
            shape_externalarg: { fg: '#00ccff' attr: 'b' }
            shape_filepath: '#00ccff'
            shape_flag: { fg: '#00ccff' attr: 'b' }
            shape_float: { fg: '#00ccff' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#00ccff' attr: 'b' }
            shape_int: { fg: '#00ccff' attr: 'b' }
            shape_internalcall: { fg: '#00ccff' attr: 'b' }
            shape_list: { fg: '#00ccff' attr: 'b' }
            shape_literal: '#00ccff'
            shape_match_pattern: '#00ccff'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#00ccff'
            shape_operator: '#00ccff'
            shape_or: { fg: '#00ccff' attr: 'b' }
            shape_pipe: { fg: '#00ccff' attr: 'b' }
            shape_range: { fg: '#00ccff' attr: 'b' }
            shape_record: { fg: '#00ccff' attr: 'b' }
            shape_redirection: { fg: '#00ccff' attr: 'b' }
            shape_signature: { fg: '#00ccff' attr: 'b' }
            shape_string: '#00ccff'
            shape_string_interpolation: { fg: '#00ccff' attr: 'b' }
            shape_table: { fg: '#00ccff' attr: 'b' }
            shape_variable: '#00ccff'

            background: '#00222b'
            foreground: '#00ccff'
            cursor: '#00ccff'
        }
    }
}

export module activate {
    export-env {
        use "mono-cyan-theme"

        mono-cyan-theme set color_config
        mono-cyan-theme update terminal
    }
}

# Activate the theme when sourced
use activate