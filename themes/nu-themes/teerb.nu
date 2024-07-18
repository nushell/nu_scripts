export module "teerb-theme" {
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
            separator: '#d0d0d0'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#aed686' attr: 'b' }
            empty: '#86aed6'
            bool: {|| if $in { '#b1e7dd' } else { 'light_gray' } }
            int: '#d0d0d0'
            filesize: {|e|
                if $e == 0b {
                    '#d0d0d0'
                } else if $e < 1mb {
                    '#8adbb4'
                } else {{ fg: '#86aed6' }}
            }
            duration: '#d0d0d0'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#d68686' attr: 'b' }
                } else if $in < 6hr {
                    '#d68686'
                } else if $in < 1day {
                    '#d7af87'
                } else if $in < 3day {
                    '#aed686'
                } else if $in < 1wk {
                    { fg: '#aed686' attr: 'b' }
                } else if $in < 6wk {
                    '#8adbb4'
                } else if $in < 52wk {
                    '#86aed6'
                } else { 'dark_gray' }
            }
            range: '#d0d0d0'
            float: '#d0d0d0'
            string: '#d0d0d0'
            nothing: '#d0d0d0'
            binary: '#d0d0d0'
            cellpath: '#d0d0d0'
            row_index: { fg: '#aed686' attr: 'b' }
            record: '#d0d0d0'
            list: '#d0d0d0'
            block: '#d0d0d0'
            hints: 'dark_gray'
            search_result: { fg: '#d68686' bg: '#d0d0d0' }

            shape_and: { fg: '#d6aed6' attr: 'b' }
            shape_binary: { fg: '#d6aed6' attr: 'b' }
            shape_block: { fg: '#86aed6' attr: 'b' }
            shape_bool: '#b1e7dd'
            shape_custom: '#aed686'
            shape_datetime: { fg: '#8adbb4' attr: 'b' }
            shape_directory: '#8adbb4'
            shape_external: '#8adbb4'
            shape_externalarg: { fg: '#aed686' attr: 'b' }
            shape_filepath: '#8adbb4'
            shape_flag: { fg: '#86aed6' attr: 'b' }
            shape_float: { fg: '#d6aed6' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#8adbb4' attr: 'b' }
            shape_int: { fg: '#d6aed6' attr: 'b' }
            shape_internalcall: { fg: '#8adbb4' attr: 'b' }
            shape_list: { fg: '#8adbb4' attr: 'b' }
            shape_literal: '#86aed6'
            shape_match_pattern: '#aed686'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#b1e7dd'
            shape_operator: '#d7af87'
            shape_or: { fg: '#d6aed6' attr: 'b' }
            shape_pipe: { fg: '#d6aed6' attr: 'b' }
            shape_range: { fg: '#d7af87' attr: 'b' }
            shape_record: { fg: '#8adbb4' attr: 'b' }
            shape_redirection: { fg: '#d6aed6' attr: 'b' }
            shape_signature: { fg: '#aed686' attr: 'b' }
            shape_string: '#aed686'
            shape_string_interpolation: { fg: '#8adbb4' attr: 'b' }
            shape_table: { fg: '#86aed6' attr: 'b' }
            shape_variable: '#d6aed6'

            background: '#262626'
            foreground: '#d0d0d0'
            cursor: '#d0d0d0'
        }
    }
}

export module activate {
    export-env {
        use "teerb-theme"

        teerb-theme set color_config
        teerb-theme update terminal
    }
}

# Activate the theme when sourced
use activate