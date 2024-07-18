export module "tempus-tempest-theme" {
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
            separator: '#b0c8ca'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#7ad67a' attr: 'b' }
            empty: '#60d4cd'
            bool: {|| if $in { '#9bdfc4' } else { 'light_gray' } }
            int: '#b0c8ca'
            filesize: {|e|
                if $e == 0b {
                    '#b0c8ca'
                } else if $e < 1mb {
                    '#8ad0b0'
                } else {{ fg: '#60d4cd' }}
            }
            duration: '#b0c8ca'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#c6c80a' attr: 'b' }
                } else if $in < 6hr {
                    '#c6c80a'
                } else if $in < 1day {
                    '#bfc94a'
                } else if $in < 3day {
                    '#7ad67a'
                } else if $in < 1wk {
                    { fg: '#7ad67a' attr: 'b' }
                } else if $in < 6wk {
                    '#8ad0b0'
                } else if $in < 52wk {
                    '#60d4cd'
                } else { 'dark_gray' }
            }
            range: '#b0c8ca'
            float: '#b0c8ca'
            string: '#b0c8ca'
            nothing: '#b0c8ca'
            binary: '#b0c8ca'
            cellpath: '#b0c8ca'
            row_index: { fg: '#7ad67a' attr: 'b' }
            record: '#b0c8ca'
            list: '#b0c8ca'
            block: '#b0c8ca'
            hints: 'dark_gray'
            search_result: { fg: '#c6c80a' bg: '#b0c8ca' }

            shape_and: { fg: '#c0c4aa' attr: 'b' }
            shape_binary: { fg: '#c0c4aa' attr: 'b' }
            shape_block: { fg: '#60d4cd' attr: 'b' }
            shape_bool: '#9bdfc4'
            shape_custom: '#7ad67a'
            shape_datetime: { fg: '#8ad0b0' attr: 'b' }
            shape_directory: '#8ad0b0'
            shape_external: '#8ad0b0'
            shape_externalarg: { fg: '#7ad67a' attr: 'b' }
            shape_filepath: '#8ad0b0'
            shape_flag: { fg: '#60d4cd' attr: 'b' }
            shape_float: { fg: '#c0c4aa' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#8ad0b0' attr: 'b' }
            shape_int: { fg: '#c0c4aa' attr: 'b' }
            shape_internalcall: { fg: '#8ad0b0' attr: 'b' }
            shape_list: { fg: '#8ad0b0' attr: 'b' }
            shape_literal: '#60d4cd'
            shape_match_pattern: '#7ad67a'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#9bdfc4'
            shape_operator: '#bfc94a'
            shape_or: { fg: '#c0c4aa' attr: 'b' }
            shape_pipe: { fg: '#c0c4aa' attr: 'b' }
            shape_range: { fg: '#bfc94a' attr: 'b' }
            shape_record: { fg: '#8ad0b0' attr: 'b' }
            shape_redirection: { fg: '#c0c4aa' attr: 'b' }
            shape_signature: { fg: '#7ad67a' attr: 'b' }
            shape_string: '#7ad67a'
            shape_string_interpolation: { fg: '#8ad0b0' attr: 'b' }
            shape_table: { fg: '#60d4cd' attr: 'b' }
            shape_variable: '#c0c4aa'

            background: '#282b2b'
            foreground: '#b6e0ca'
            cursor: '#b6e0ca'
        }
    }
}

export module activate {
    export-env {
        use "tempus-tempest-theme"

        tempus-tempest-theme set color_config
        tempus-tempest-theme update terminal
    }
}

# Activate the theme when sourced
use activate