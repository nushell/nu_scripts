export module "seti-ui-theme" {
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
            separator: '#d6d6d6'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#9fca56' attr: 'b' }
            empty: '#55b5db'
            bool: {|| if $in { '#55dbbe' } else { 'light_gray' } }
            int: '#d6d6d6'
            filesize: {|e|
                if $e == 0b {
                    '#d6d6d6'
                } else if $e < 1mb {
                    '#55dbbe'
                } else {{ fg: '#55b5db' }}
            }
            duration: '#d6d6d6'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#Cd3f45' attr: 'b' }
                } else if $in < 6hr {
                    '#Cd3f45'
                } else if $in < 1day {
                    '#e6cd69'
                } else if $in < 3day {
                    '#9fca56'
                } else if $in < 1wk {
                    { fg: '#9fca56' attr: 'b' }
                } else if $in < 6wk {
                    '#55dbbe'
                } else if $in < 52wk {
                    '#55b5db'
                } else { 'dark_gray' }
            }
            range: '#d6d6d6'
            float: '#d6d6d6'
            string: '#d6d6d6'
            nothing: '#d6d6d6'
            binary: '#d6d6d6'
            cellpath: '#d6d6d6'
            row_index: { fg: '#9fca56' attr: 'b' }
            record: '#d6d6d6'
            list: '#d6d6d6'
            block: '#d6d6d6'
            hints: 'dark_gray'
            search_result: { fg: '#Cd3f45' bg: '#d6d6d6' }

            shape_and: { fg: '#a074c4' attr: 'b' }
            shape_binary: { fg: '#a074c4' attr: 'b' }
            shape_block: { fg: '#55b5db' attr: 'b' }
            shape_bool: '#55dbbe'
            shape_custom: '#9fca56'
            shape_datetime: { fg: '#55dbbe' attr: 'b' }
            shape_directory: '#55dbbe'
            shape_external: '#55dbbe'
            shape_externalarg: { fg: '#9fca56' attr: 'b' }
            shape_filepath: '#55dbbe'
            shape_flag: { fg: '#55b5db' attr: 'b' }
            shape_float: { fg: '#a074c4' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#55dbbe' attr: 'b' }
            shape_int: { fg: '#a074c4' attr: 'b' }
            shape_internalcall: { fg: '#55dbbe' attr: 'b' }
            shape_list: { fg: '#55dbbe' attr: 'b' }
            shape_literal: '#55b5db'
            shape_match_pattern: '#9fca56'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#55dbbe'
            shape_operator: '#e6cd69'
            shape_or: { fg: '#a074c4' attr: 'b' }
            shape_pipe: { fg: '#a074c4' attr: 'b' }
            shape_range: { fg: '#e6cd69' attr: 'b' }
            shape_record: { fg: '#55dbbe' attr: 'b' }
            shape_redirection: { fg: '#a074c4' attr: 'b' }
            shape_signature: { fg: '#9fca56' attr: 'b' }
            shape_string: '#9fca56'
            shape_string_interpolation: { fg: '#55dbbe' attr: 'b' }
            shape_table: { fg: '#55b5db' attr: 'b' }
            shape_variable: '#a074c4'

            background: '#151718'
            foreground: '#d6d6d6'
            cursor: '#d6d6d6'
        }
    }
}

export module activate {
    export-env {
        use "seti-ui-theme"

        seti-ui-theme set color_config
        seti-ui-theme update terminal
    }
}

# Activate the theme when sourced
use activate