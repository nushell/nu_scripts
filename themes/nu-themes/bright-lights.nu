export module "bright-lights-theme" {
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
            separator: '#c1c8d6'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#b6e875' attr: 'b' }
            empty: '#75d3ff'
            bool: {|| if $in { '#6cbeb5' } else { 'light_gray' } }
            int: '#c1c8d6'
            filesize: {|e|
                if $e == 0b {
                    '#c1c8d6'
                } else if $e < 1mb {
                    '#6cbeb5'
                } else {{ fg: '#75d3ff' }}
            }
            duration: '#c1c8d6'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#ff355b' attr: 'b' }
                } else if $in < 6hr {
                    '#ff355b'
                } else if $in < 1day {
                    '#ffc150'
                } else if $in < 3day {
                    '#b6e875'
                } else if $in < 1wk {
                    { fg: '#b6e875' attr: 'b' }
                } else if $in < 6wk {
                    '#6cbeb5'
                } else if $in < 52wk {
                    '#75d3ff'
                } else { 'dark_gray' }
            }
            range: '#c1c8d6'
            float: '#c1c8d6'
            string: '#c1c8d6'
            nothing: '#c1c8d6'
            binary: '#c1c8d6'
            cellpath: '#c1c8d6'
            row_index: { fg: '#b6e875' attr: 'b' }
            record: '#c1c8d6'
            list: '#c1c8d6'
            block: '#c1c8d6'
            hints: 'dark_gray'
            search_result: { fg: '#ff355b' bg: '#c1c8d6' }

            shape_and: { fg: '#b975e6' attr: 'b' }
            shape_binary: { fg: '#b975e6' attr: 'b' }
            shape_block: { fg: '#75d3ff' attr: 'b' }
            shape_bool: '#6cbeb5'
            shape_custom: '#b6e875'
            shape_datetime: { fg: '#6cbeb5' attr: 'b' }
            shape_directory: '#6cbeb5'
            shape_external: '#6cbeb5'
            shape_externalarg: { fg: '#b6e875' attr: 'b' }
            shape_filepath: '#6cbeb5'
            shape_flag: { fg: '#75d3ff' attr: 'b' }
            shape_float: { fg: '#b975e6' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#6cbeb5' attr: 'b' }
            shape_int: { fg: '#b975e6' attr: 'b' }
            shape_internalcall: { fg: '#6cbeb5' attr: 'b' }
            shape_list: { fg: '#6cbeb5' attr: 'b' }
            shape_literal: '#75d3ff'
            shape_match_pattern: '#b6e875'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#6cbeb5'
            shape_operator: '#ffc150'
            shape_or: { fg: '#b975e6' attr: 'b' }
            shape_pipe: { fg: '#b975e6' attr: 'b' }
            shape_range: { fg: '#ffc150' attr: 'b' }
            shape_record: { fg: '#6cbeb5' attr: 'b' }
            shape_redirection: { fg: '#b975e6' attr: 'b' }
            shape_signature: { fg: '#b6e875' attr: 'b' }
            shape_string: '#b6e875'
            shape_string_interpolation: { fg: '#6cbeb5' attr: 'b' }
            shape_table: { fg: '#75d3ff' attr: 'b' }
            shape_variable: '#b975e6'

            background: '#191919'
            foreground: '#b2c8d6'
            cursor: '#f34a00'
        }
    }
}

export module activate {
    export-env {
        use "bright-lights-theme"

        bright-lights-theme set color_config
        bright-lights-theme update terminal
    }
}

# Activate the theme when sourced
use activate