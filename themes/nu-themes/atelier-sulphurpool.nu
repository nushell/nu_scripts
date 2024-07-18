export module "atelier-sulphurpool-theme" {
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
            separator: '#979db4'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#ac9739' attr: 'b' }
            empty: '#3d8fd1'
            bool: {|| if $in { '#22a2c9' } else { 'light_gray' } }
            int: '#979db4'
            filesize: {|e|
                if $e == 0b {
                    '#979db4'
                } else if $e < 1mb {
                    '#22a2c9'
                } else {{ fg: '#3d8fd1' }}
            }
            duration: '#979db4'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#c94922' attr: 'b' }
                } else if $in < 6hr {
                    '#c94922'
                } else if $in < 1day {
                    '#c08b30'
                } else if $in < 3day {
                    '#ac9739'
                } else if $in < 1wk {
                    { fg: '#ac9739' attr: 'b' }
                } else if $in < 6wk {
                    '#22a2c9'
                } else if $in < 52wk {
                    '#3d8fd1'
                } else { 'dark_gray' }
            }
            range: '#979db4'
            float: '#979db4'
            string: '#979db4'
            nothing: '#979db4'
            binary: '#979db4'
            cellpath: '#979db4'
            row_index: { fg: '#ac9739' attr: 'b' }
            record: '#979db4'
            list: '#979db4'
            block: '#979db4'
            hints: 'dark_gray'
            search_result: { fg: '#c94922' bg: '#979db4' }

            shape_and: { fg: '#6679cc' attr: 'b' }
            shape_binary: { fg: '#6679cc' attr: 'b' }
            shape_block: { fg: '#3d8fd1' attr: 'b' }
            shape_bool: '#22a2c9'
            shape_custom: '#ac9739'
            shape_datetime: { fg: '#22a2c9' attr: 'b' }
            shape_directory: '#22a2c9'
            shape_external: '#22a2c9'
            shape_externalarg: { fg: '#ac9739' attr: 'b' }
            shape_filepath: '#22a2c9'
            shape_flag: { fg: '#3d8fd1' attr: 'b' }
            shape_float: { fg: '#6679cc' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#22a2c9' attr: 'b' }
            shape_int: { fg: '#6679cc' attr: 'b' }
            shape_internalcall: { fg: '#22a2c9' attr: 'b' }
            shape_list: { fg: '#22a2c9' attr: 'b' }
            shape_literal: '#3d8fd1'
            shape_match_pattern: '#ac9739'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#22a2c9'
            shape_operator: '#c08b30'
            shape_or: { fg: '#6679cc' attr: 'b' }
            shape_pipe: { fg: '#6679cc' attr: 'b' }
            shape_range: { fg: '#c08b30' attr: 'b' }
            shape_record: { fg: '#22a2c9' attr: 'b' }
            shape_redirection: { fg: '#6679cc' attr: 'b' }
            shape_signature: { fg: '#ac9739' attr: 'b' }
            shape_string: '#ac9739'
            shape_string_interpolation: { fg: '#22a2c9' attr: 'b' }
            shape_table: { fg: '#3d8fd1' attr: 'b' }
            shape_variable: '#6679cc'

            background: '#202746'
            foreground: '#979db4'
            cursor: '#979db4'
        }
    }
}

export module activate {
    export-env {
        use "atelier-sulphurpool-theme"

        atelier-sulphurpool-theme set color_config
        atelier-sulphurpool-theme update terminal
    }
}

# Activate the theme when sourced
use activate