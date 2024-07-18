export module "duotone-dark-theme" {
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
            separator: '#b6a0ff'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#2dcc72' attr: 'b' }
            empty: '#ffc183'
            bool: {|| if $in { '#2388ff' } else { 'light_gray' } }
            int: '#b6a0ff'
            filesize: {|e|
                if $e == 0b {
                    '#b6a0ff'
                } else if $e < 1mb {
                    '#2388ff'
                } else {{ fg: '#ffc183' }}
            }
            duration: '#b6a0ff'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#d8393d' attr: 'b' }
                } else if $in < 6hr {
                    '#d8393d'
                } else if $in < 1day {
                    '#d8b76e'
                } else if $in < 3day {
                    '#2dcc72'
                } else if $in < 1wk {
                    { fg: '#2dcc72' attr: 'b' }
                } else if $in < 6wk {
                    '#2388ff'
                } else if $in < 52wk {
                    '#ffc183'
                } else { 'dark_gray' }
            }
            range: '#b6a0ff'
            float: '#b6a0ff'
            string: '#b6a0ff'
            nothing: '#b6a0ff'
            binary: '#b6a0ff'
            cellpath: '#b6a0ff'
            row_index: { fg: '#2dcc72' attr: 'b' }
            record: '#b6a0ff'
            list: '#b6a0ff'
            block: '#b6a0ff'
            hints: 'dark_gray'
            search_result: { fg: '#d8393d' bg: '#b6a0ff' }

            shape_and: { fg: '#dd8d40' attr: 'b' }
            shape_binary: { fg: '#dd8d40' attr: 'b' }
            shape_block: { fg: '#ffc183' attr: 'b' }
            shape_bool: '#2388ff'
            shape_custom: '#2dcc72'
            shape_datetime: { fg: '#2388ff' attr: 'b' }
            shape_directory: '#2388ff'
            shape_external: '#2388ff'
            shape_externalarg: { fg: '#2dcc72' attr: 'b' }
            shape_filepath: '#2388ff'
            shape_flag: { fg: '#ffc183' attr: 'b' }
            shape_float: { fg: '#dd8d40' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#2388ff' attr: 'b' }
            shape_int: { fg: '#dd8d40' attr: 'b' }
            shape_internalcall: { fg: '#2388ff' attr: 'b' }
            shape_list: { fg: '#2388ff' attr: 'b' }
            shape_literal: '#ffc183'
            shape_match_pattern: '#2dcc72'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#2388ff'
            shape_operator: '#d8b76e'
            shape_or: { fg: '#dd8d40' attr: 'b' }
            shape_pipe: { fg: '#dd8d40' attr: 'b' }
            shape_range: { fg: '#d8b76e' attr: 'b' }
            shape_record: { fg: '#2388ff' attr: 'b' }
            shape_redirection: { fg: '#dd8d40' attr: 'b' }
            shape_signature: { fg: '#2dcc72' attr: 'b' }
            shape_string: '#2dcc72'
            shape_string_interpolation: { fg: '#2388ff' attr: 'b' }
            shape_table: { fg: '#ffc183' attr: 'b' }
            shape_variable: '#dd8d40'

            background: '#1f1c27'
            foreground: '#b6a0ff'
            cursor: '#ff9738'
        }
    }
}

export module activate {
    export-env {
        use "duotone-dark-theme"

        duotone-dark-theme set color_config
        duotone-dark-theme update terminal
    }
}

# Activate the theme when sourced
use activate