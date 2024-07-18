export module "hipster-green-theme" {
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
            separator: '#bfbfbf'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#00a600' attr: 'b' }
            empty: '#246eb2'
            bool: {|| if $in { '#00e5e5' } else { 'light_gray' } }
            int: '#bfbfbf'
            filesize: {|e|
                if $e == 0b {
                    '#bfbfbf'
                } else if $e < 1mb {
                    '#00a6b2'
                } else {{ fg: '#246eb2' }}
            }
            duration: '#bfbfbf'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#b6214a' attr: 'b' }
                } else if $in < 6hr {
                    '#b6214a'
                } else if $in < 1day {
                    '#bfbf00'
                } else if $in < 3day {
                    '#00a600'
                } else if $in < 1wk {
                    { fg: '#00a600' attr: 'b' }
                } else if $in < 6wk {
                    '#00a6b2'
                } else if $in < 52wk {
                    '#246eb2'
                } else { 'dark_gray' }
            }
            range: '#bfbfbf'
            float: '#bfbfbf'
            string: '#bfbfbf'
            nothing: '#bfbfbf'
            binary: '#bfbfbf'
            cellpath: '#bfbfbf'
            row_index: { fg: '#00a600' attr: 'b' }
            record: '#bfbfbf'
            list: '#bfbfbf'
            block: '#bfbfbf'
            hints: 'dark_gray'
            search_result: { fg: '#b6214a' bg: '#bfbfbf' }

            shape_and: { fg: '#b200b2' attr: 'b' }
            shape_binary: { fg: '#b200b2' attr: 'b' }
            shape_block: { fg: '#246eb2' attr: 'b' }
            shape_bool: '#00e5e5'
            shape_custom: '#00a600'
            shape_datetime: { fg: '#00a6b2' attr: 'b' }
            shape_directory: '#00a6b2'
            shape_external: '#00a6b2'
            shape_externalarg: { fg: '#00a600' attr: 'b' }
            shape_filepath: '#00a6b2'
            shape_flag: { fg: '#246eb2' attr: 'b' }
            shape_float: { fg: '#b200b2' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#00a6b2' attr: 'b' }
            shape_int: { fg: '#b200b2' attr: 'b' }
            shape_internalcall: { fg: '#00a6b2' attr: 'b' }
            shape_list: { fg: '#00a6b2' attr: 'b' }
            shape_literal: '#246eb2'
            shape_match_pattern: '#00a600'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#00e5e5'
            shape_operator: '#bfbf00'
            shape_or: { fg: '#b200b2' attr: 'b' }
            shape_pipe: { fg: '#b200b2' attr: 'b' }
            shape_range: { fg: '#bfbf00' attr: 'b' }
            shape_record: { fg: '#00a6b2' attr: 'b' }
            shape_redirection: { fg: '#b200b2' attr: 'b' }
            shape_signature: { fg: '#00a600' attr: 'b' }
            shape_string: '#00a600'
            shape_string_interpolation: { fg: '#00a6b2' attr: 'b' }
            shape_table: { fg: '#246eb2' attr: 'b' }
            shape_variable: '#b200b2'

            background: '#100b05'
            foreground: '#84c138'
            cursor: '#84c138'
        }
    }
}

export module activate {
    export-env {
        use "hipster-green-theme"

        hipster-green-theme set color_config
        hipster-green-theme update terminal
    }
}

# Activate the theme when sourced
use activate