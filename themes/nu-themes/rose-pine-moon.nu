export module "rose-pine-moon-theme" {
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
            separator: '#e0def4'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#ea9a97' attr: 'b' }
            empty: '#9ccfd8'
            bool: {|| if $in { '#3e8fb0' } else { 'light_gray' } }
            int: '#e0def4'
            filesize: {|e|
                if $e == 0b {
                    '#e0def4'
                } else if $e < 1mb {
                    '#3e8fb0'
                } else {{ fg: '#9ccfd8' }}
            }
            duration: '#e0def4'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#ecebf0' attr: 'b' }
                } else if $in < 6hr {
                    '#ecebf0'
                } else if $in < 1day {
                    '#f6c177'
                } else if $in < 3day {
                    '#ea9a97'
                } else if $in < 1wk {
                    { fg: '#ea9a97' attr: 'b' }
                } else if $in < 6wk {
                    '#3e8fb0'
                } else if $in < 52wk {
                    '#9ccfd8'
                } else { 'dark_gray' }
            }
            range: '#e0def4'
            float: '#e0def4'
            string: '#e0def4'
            nothing: '#e0def4'
            binary: '#e0def4'
            cellpath: '#e0def4'
            row_index: { fg: '#ea9a97' attr: 'b' }
            record: '#e0def4'
            list: '#e0def4'
            block: '#e0def4'
            hints: 'dark_gray'
            search_result: { fg: '#ecebf0' bg: '#e0def4' }

            shape_and: { fg: '#c4a7e7' attr: 'b' }
            shape_binary: { fg: '#c4a7e7' attr: 'b' }
            shape_block: { fg: '#9ccfd8' attr: 'b' }
            shape_bool: '#3e8fb0'
            shape_custom: '#ea9a97'
            shape_datetime: { fg: '#3e8fb0' attr: 'b' }
            shape_directory: '#3e8fb0'
            shape_external: '#3e8fb0'
            shape_externalarg: { fg: '#ea9a97' attr: 'b' }
            shape_filepath: '#3e8fb0'
            shape_flag: { fg: '#9ccfd8' attr: 'b' }
            shape_float: { fg: '#c4a7e7' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#3e8fb0' attr: 'b' }
            shape_int: { fg: '#c4a7e7' attr: 'b' }
            shape_internalcall: { fg: '#3e8fb0' attr: 'b' }
            shape_list: { fg: '#3e8fb0' attr: 'b' }
            shape_literal: '#9ccfd8'
            shape_match_pattern: '#ea9a97'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#3e8fb0'
            shape_operator: '#f6c177'
            shape_or: { fg: '#c4a7e7' attr: 'b' }
            shape_pipe: { fg: '#c4a7e7' attr: 'b' }
            shape_range: { fg: '#f6c177' attr: 'b' }
            shape_record: { fg: '#3e8fb0' attr: 'b' }
            shape_redirection: { fg: '#c4a7e7' attr: 'b' }
            shape_signature: { fg: '#ea9a97' attr: 'b' }
            shape_string: '#ea9a97'
            shape_string_interpolation: { fg: '#3e8fb0' attr: 'b' }
            shape_table: { fg: '#9ccfd8' attr: 'b' }
            shape_variable: '#c4a7e7'

            background: '#232136'
            foreground: '#e0def4'
            cursor: '#e0def4'
        }
    }
}

export module activate {
    export-env {
        use "rose-pine-moon-theme"

        rose-pine-moon-theme set color_config
        rose-pine-moon-theme update terminal
    }
}

# Activate the theme when sourced
use activate