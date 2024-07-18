export module "atelier-plateau-light-theme" {
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
            separator: '#585050'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#4b8b8b' attr: 'b' }
            empty: '#7272ca'
            bool: {|| if $in { '#5485b6' } else { 'light_gray' } }
            int: '#585050'
            filesize: {|e|
                if $e == 0b {
                    '#585050'
                } else if $e < 1mb {
                    '#5485b6'
                } else {{ fg: '#7272ca' }}
            }
            duration: '#585050'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#ca4949' attr: 'b' }
                } else if $in < 6hr {
                    '#ca4949'
                } else if $in < 1day {
                    '#a06e3b'
                } else if $in < 3day {
                    '#4b8b8b'
                } else if $in < 1wk {
                    { fg: '#4b8b8b' attr: 'b' }
                } else if $in < 6wk {
                    '#5485b6'
                } else if $in < 52wk {
                    '#7272ca'
                } else { 'dark_gray' }
            }
            range: '#585050'
            float: '#585050'
            string: '#585050'
            nothing: '#585050'
            binary: '#585050'
            cellpath: '#585050'
            row_index: { fg: '#4b8b8b' attr: 'b' }
            record: '#585050'
            list: '#585050'
            block: '#585050'
            hints: 'dark_gray'
            search_result: { fg: '#ca4949' bg: '#585050' }

            shape_and: { fg: '#8464c4' attr: 'b' }
            shape_binary: { fg: '#8464c4' attr: 'b' }
            shape_block: { fg: '#7272ca' attr: 'b' }
            shape_bool: '#5485b6'
            shape_custom: '#4b8b8b'
            shape_datetime: { fg: '#5485b6' attr: 'b' }
            shape_directory: '#5485b6'
            shape_external: '#5485b6'
            shape_externalarg: { fg: '#4b8b8b' attr: 'b' }
            shape_filepath: '#5485b6'
            shape_flag: { fg: '#7272ca' attr: 'b' }
            shape_float: { fg: '#8464c4' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#5485b6' attr: 'b' }
            shape_int: { fg: '#8464c4' attr: 'b' }
            shape_internalcall: { fg: '#5485b6' attr: 'b' }
            shape_list: { fg: '#5485b6' attr: 'b' }
            shape_literal: '#7272ca'
            shape_match_pattern: '#4b8b8b'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#5485b6'
            shape_operator: '#a06e3b'
            shape_or: { fg: '#8464c4' attr: 'b' }
            shape_pipe: { fg: '#8464c4' attr: 'b' }
            shape_range: { fg: '#a06e3b' attr: 'b' }
            shape_record: { fg: '#5485b6' attr: 'b' }
            shape_redirection: { fg: '#8464c4' attr: 'b' }
            shape_signature: { fg: '#4b8b8b' attr: 'b' }
            shape_string: '#4b8b8b'
            shape_string_interpolation: { fg: '#5485b6' attr: 'b' }
            shape_table: { fg: '#7272ca' attr: 'b' }
            shape_variable: '#8464c4'

            background: '#f4ecec'
            foreground: '#585050'
            cursor: '#585050'
        }
    }
}

export module activate {
    export-env {
        use "atelier-plateau-light-theme"

        atelier-plateau-light-theme set color_config
        atelier-plateau-light-theme update terminal
    }
}

# Activate the theme when sourced
use activate