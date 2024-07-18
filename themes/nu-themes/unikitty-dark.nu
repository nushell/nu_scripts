export module "unikitty-dark-theme" {
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
            separator: '#bcbabe'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#17ad98' attr: 'b' }
            empty: '#796af5'
            bool: {|| if $in { '#149bda' } else { 'light_gray' } }
            int: '#bcbabe'
            filesize: {|e|
                if $e == 0b {
                    '#bcbabe'
                } else if $e < 1mb {
                    '#149bda'
                } else {{ fg: '#796af5' }}
            }
            duration: '#bcbabe'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#d8137f' attr: 'b' }
                } else if $in < 6hr {
                    '#d8137f'
                } else if $in < 1day {
                    '#dc8a0e'
                } else if $in < 3day {
                    '#17ad98'
                } else if $in < 1wk {
                    { fg: '#17ad98' attr: 'b' }
                } else if $in < 6wk {
                    '#149bda'
                } else if $in < 52wk {
                    '#796af5'
                } else { 'dark_gray' }
            }
            range: '#bcbabe'
            float: '#bcbabe'
            string: '#bcbabe'
            nothing: '#bcbabe'
            binary: '#bcbabe'
            cellpath: '#bcbabe'
            row_index: { fg: '#17ad98' attr: 'b' }
            record: '#bcbabe'
            list: '#bcbabe'
            block: '#bcbabe'
            hints: 'dark_gray'
            search_result: { fg: '#d8137f' bg: '#bcbabe' }

            shape_and: { fg: '#bb60ea' attr: 'b' }
            shape_binary: { fg: '#bb60ea' attr: 'b' }
            shape_block: { fg: '#796af5' attr: 'b' }
            shape_bool: '#149bda'
            shape_custom: '#17ad98'
            shape_datetime: { fg: '#149bda' attr: 'b' }
            shape_directory: '#149bda'
            shape_external: '#149bda'
            shape_externalarg: { fg: '#17ad98' attr: 'b' }
            shape_filepath: '#149bda'
            shape_flag: { fg: '#796af5' attr: 'b' }
            shape_float: { fg: '#bb60ea' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#149bda' attr: 'b' }
            shape_int: { fg: '#bb60ea' attr: 'b' }
            shape_internalcall: { fg: '#149bda' attr: 'b' }
            shape_list: { fg: '#149bda' attr: 'b' }
            shape_literal: '#796af5'
            shape_match_pattern: '#17ad98'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#149bda'
            shape_operator: '#dc8a0e'
            shape_or: { fg: '#bb60ea' attr: 'b' }
            shape_pipe: { fg: '#bb60ea' attr: 'b' }
            shape_range: { fg: '#dc8a0e' attr: 'b' }
            shape_record: { fg: '#149bda' attr: 'b' }
            shape_redirection: { fg: '#bb60ea' attr: 'b' }
            shape_signature: { fg: '#17ad98' attr: 'b' }
            shape_string: '#17ad98'
            shape_string_interpolation: { fg: '#149bda' attr: 'b' }
            shape_table: { fg: '#796af5' attr: 'b' }
            shape_variable: '#bb60ea'

            background: '#2e2a31'
            foreground: '#bcbabe'
            cursor: '#bcbabe'
        }
    }
}

export module activate {
    export-env {
        use "unikitty-dark-theme"

        unikitty-dark-theme set color_config
        unikitty-dark-theme update terminal
    }
}

# Activate the theme when sourced
use activate