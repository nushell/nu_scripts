export module "framer-theme" {
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
            header: { fg: '#32ccdc' attr: 'b' }
            empty: '#20bcfc'
            bool: {|| if $in { '#acddfd' } else { 'light_gray' } }
            int: '#d0d0d0'
            filesize: {|e|
                if $e == 0b {
                    '#d0d0d0'
                } else if $e < 1mb {
                    '#acddfd'
                } else {{ fg: '#20bcfc' }}
            }
            duration: '#d0d0d0'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#fd886b' attr: 'b' }
                } else if $in < 6hr {
                    '#fd886b'
                } else if $in < 1day {
                    '#fecb6e'
                } else if $in < 3day {
                    '#32ccdc'
                } else if $in < 1wk {
                    { fg: '#32ccdc' attr: 'b' }
                } else if $in < 6wk {
                    '#acddfd'
                } else if $in < 52wk {
                    '#20bcfc'
                } else { 'dark_gray' }
            }
            range: '#d0d0d0'
            float: '#d0d0d0'
            string: '#d0d0d0'
            nothing: '#d0d0d0'
            binary: '#d0d0d0'
            cellpath: '#d0d0d0'
            row_index: { fg: '#32ccdc' attr: 'b' }
            record: '#d0d0d0'
            list: '#d0d0d0'
            block: '#d0d0d0'
            hints: 'dark_gray'
            search_result: { fg: '#fd886b' bg: '#d0d0d0' }

            shape_and: { fg: '#ba8cfc' attr: 'b' }
            shape_binary: { fg: '#ba8cfc' attr: 'b' }
            shape_block: { fg: '#20bcfc' attr: 'b' }
            shape_bool: '#acddfd'
            shape_custom: '#32ccdc'
            shape_datetime: { fg: '#acddfd' attr: 'b' }
            shape_directory: '#acddfd'
            shape_external: '#acddfd'
            shape_externalarg: { fg: '#32ccdc' attr: 'b' }
            shape_filepath: '#acddfd'
            shape_flag: { fg: '#20bcfc' attr: 'b' }
            shape_float: { fg: '#ba8cfc' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#acddfd' attr: 'b' }
            shape_int: { fg: '#ba8cfc' attr: 'b' }
            shape_internalcall: { fg: '#acddfd' attr: 'b' }
            shape_list: { fg: '#acddfd' attr: 'b' }
            shape_literal: '#20bcfc'
            shape_match_pattern: '#32ccdc'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#acddfd'
            shape_operator: '#fecb6e'
            shape_or: { fg: '#ba8cfc' attr: 'b' }
            shape_pipe: { fg: '#ba8cfc' attr: 'b' }
            shape_range: { fg: '#fecb6e' attr: 'b' }
            shape_record: { fg: '#acddfd' attr: 'b' }
            shape_redirection: { fg: '#ba8cfc' attr: 'b' }
            shape_signature: { fg: '#32ccdc' attr: 'b' }
            shape_string: '#32ccdc'
            shape_string_interpolation: { fg: '#acddfd' attr: 'b' }
            shape_table: { fg: '#20bcfc' attr: 'b' }
            shape_variable: '#ba8cfc'

            background: '#181818'
            foreground: '#d0d0d0'
            cursor: '#d0d0d0'
        }
    }
}

export module activate {
    export-env {
        use "framer-theme"

        framer-theme set color_config
        framer-theme update terminal
    }
}

# Activate the theme when sourced
use activate