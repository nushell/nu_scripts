export module "nova-theme" {
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
            separator: '#c5d4dd'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#7fc1ca' attr: 'b' }
            empty: '#83afe5'
            bool: {|| if $in { '#f2c38f' } else { 'light_gray' } }
            int: '#c5d4dd'
            filesize: {|e|
                if $e == 0b {
                    '#c5d4dd'
                } else if $e < 1mb {
                    '#f2c38f'
                } else {{ fg: '#83afe5' }}
            }
            duration: '#c5d4dd'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#83afe5' attr: 'b' }
                } else if $in < 6hr {
                    '#83afe5'
                } else if $in < 1day {
                    '#a8ce93'
                } else if $in < 3day {
                    '#7fc1ca'
                } else if $in < 1wk {
                    { fg: '#7fc1ca' attr: 'b' }
                } else if $in < 6wk {
                    '#f2c38f'
                } else if $in < 52wk {
                    '#83afe5'
                } else { 'dark_gray' }
            }
            range: '#c5d4dd'
            float: '#c5d4dd'
            string: '#c5d4dd'
            nothing: '#c5d4dd'
            binary: '#c5d4dd'
            cellpath: '#c5d4dd'
            row_index: { fg: '#7fc1ca' attr: 'b' }
            record: '#c5d4dd'
            list: '#c5d4dd'
            block: '#c5d4dd'
            hints: 'dark_gray'
            search_result: { fg: '#83afe5' bg: '#c5d4dd' }

            shape_and: { fg: '#9a93e1' attr: 'b' }
            shape_binary: { fg: '#9a93e1' attr: 'b' }
            shape_block: { fg: '#83afe5' attr: 'b' }
            shape_bool: '#f2c38f'
            shape_custom: '#7fc1ca'
            shape_datetime: { fg: '#f2c38f' attr: 'b' }
            shape_directory: '#f2c38f'
            shape_external: '#f2c38f'
            shape_externalarg: { fg: '#7fc1ca' attr: 'b' }
            shape_filepath: '#f2c38f'
            shape_flag: { fg: '#83afe5' attr: 'b' }
            shape_float: { fg: '#9a93e1' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#f2c38f' attr: 'b' }
            shape_int: { fg: '#9a93e1' attr: 'b' }
            shape_internalcall: { fg: '#f2c38f' attr: 'b' }
            shape_list: { fg: '#f2c38f' attr: 'b' }
            shape_literal: '#83afe5'
            shape_match_pattern: '#7fc1ca'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#f2c38f'
            shape_operator: '#a8ce93'
            shape_or: { fg: '#9a93e1' attr: 'b' }
            shape_pipe: { fg: '#9a93e1' attr: 'b' }
            shape_range: { fg: '#a8ce93' attr: 'b' }
            shape_record: { fg: '#f2c38f' attr: 'b' }
            shape_redirection: { fg: '#9a93e1' attr: 'b' }
            shape_signature: { fg: '#7fc1ca' attr: 'b' }
            shape_string: '#7fc1ca'
            shape_string_interpolation: { fg: '#f2c38f' attr: 'b' }
            shape_table: { fg: '#83afe5' attr: 'b' }
            shape_variable: '#9a93e1'

            background: '#3c4c55'
            foreground: '#c5d4dd'
            cursor: '#c5d4dd'
        }
    }
}

export module activate {
    export-env {
        use "nova-theme"

        nova-theme set color_config
        nova-theme update terminal
    }
}

# Activate the theme when sourced
use activate