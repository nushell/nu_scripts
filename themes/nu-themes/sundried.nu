export module "sundried-theme" {
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
            separator: '#c9c9c9'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#587744' attr: 'b' }
            empty: '#485b98'
            bool: {|| if $in { '#fad484' } else { 'light_gray' } }
            int: '#c9c9c9'
            filesize: {|e|
                if $e == 0b {
                    '#c9c9c9'
                } else if $e < 1mb {
                    '#9c814f'
                } else {{ fg: '#485b98' }}
            }
            duration: '#c9c9c9'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#a7463d' attr: 'b' }
                } else if $in < 6hr {
                    '#a7463d'
                } else if $in < 1day {
                    '#9d602a'
                } else if $in < 3day {
                    '#587744'
                } else if $in < 1wk {
                    { fg: '#587744' attr: 'b' }
                } else if $in < 6wk {
                    '#9c814f'
                } else if $in < 52wk {
                    '#485b98'
                } else { 'dark_gray' }
            }
            range: '#c9c9c9'
            float: '#c9c9c9'
            string: '#c9c9c9'
            nothing: '#c9c9c9'
            binary: '#c9c9c9'
            cellpath: '#c9c9c9'
            row_index: { fg: '#587744' attr: 'b' }
            record: '#c9c9c9'
            list: '#c9c9c9'
            block: '#c9c9c9'
            hints: 'dark_gray'
            search_result: { fg: '#a7463d' bg: '#c9c9c9' }

            shape_and: { fg: '#864651' attr: 'b' }
            shape_binary: { fg: '#864651' attr: 'b' }
            shape_block: { fg: '#485b98' attr: 'b' }
            shape_bool: '#fad484'
            shape_custom: '#587744'
            shape_datetime: { fg: '#9c814f' attr: 'b' }
            shape_directory: '#9c814f'
            shape_external: '#9c814f'
            shape_externalarg: { fg: '#587744' attr: 'b' }
            shape_filepath: '#9c814f'
            shape_flag: { fg: '#485b98' attr: 'b' }
            shape_float: { fg: '#864651' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#9c814f' attr: 'b' }
            shape_int: { fg: '#864651' attr: 'b' }
            shape_internalcall: { fg: '#9c814f' attr: 'b' }
            shape_list: { fg: '#9c814f' attr: 'b' }
            shape_literal: '#485b98'
            shape_match_pattern: '#587744'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#fad484'
            shape_operator: '#9d602a'
            shape_or: { fg: '#864651' attr: 'b' }
            shape_pipe: { fg: '#864651' attr: 'b' }
            shape_range: { fg: '#9d602a' attr: 'b' }
            shape_record: { fg: '#9c814f' attr: 'b' }
            shape_redirection: { fg: '#864651' attr: 'b' }
            shape_signature: { fg: '#587744' attr: 'b' }
            shape_string: '#587744'
            shape_string_interpolation: { fg: '#9c814f' attr: 'b' }
            shape_table: { fg: '#485b98' attr: 'b' }
            shape_variable: '#864651'

            background: '#1a1818'
            foreground: '#c9c9c9'
            cursor: '#c9c9c9'
        }
    }
}

export module activate {
    export-env {
        use "sundried-theme"

        sundried-theme set color_config
        sundried-theme update terminal
    }
}

# Activate the theme when sourced
use activate