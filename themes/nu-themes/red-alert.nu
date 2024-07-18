export module "red-alert-theme" {
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
            header: { fg: '#71be6b' attr: 'b' }
            empty: '#489bee'
            bool: {|| if $in { '#b7dfdd' } else { 'light_gray' } }
            int: '#d6d6d6'
            filesize: {|e|
                if $e == 0b {
                    '#d6d6d6'
                } else if $e < 1mb {
                    '#6bbeb8'
                } else {{ fg: '#489bee' }}
            }
            duration: '#d6d6d6'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#d62e4e' attr: 'b' }
                } else if $in < 6hr {
                    '#d62e4e'
                } else if $in < 1day {
                    '#beb86b'
                } else if $in < 3day {
                    '#71be6b'
                } else if $in < 1wk {
                    { fg: '#71be6b' attr: 'b' }
                } else if $in < 6wk {
                    '#6bbeb8'
                } else if $in < 52wk {
                    '#489bee'
                } else { 'dark_gray' }
            }
            range: '#d6d6d6'
            float: '#d6d6d6'
            string: '#d6d6d6'
            nothing: '#d6d6d6'
            binary: '#d6d6d6'
            cellpath: '#d6d6d6'
            row_index: { fg: '#71be6b' attr: 'b' }
            record: '#d6d6d6'
            list: '#d6d6d6'
            block: '#d6d6d6'
            hints: 'dark_gray'
            search_result: { fg: '#d62e4e' bg: '#d6d6d6' }

            shape_and: { fg: '#e979d7' attr: 'b' }
            shape_binary: { fg: '#e979d7' attr: 'b' }
            shape_block: { fg: '#489bee' attr: 'b' }
            shape_bool: '#b7dfdd'
            shape_custom: '#71be6b'
            shape_datetime: { fg: '#6bbeb8' attr: 'b' }
            shape_directory: '#6bbeb8'
            shape_external: '#6bbeb8'
            shape_externalarg: { fg: '#71be6b' attr: 'b' }
            shape_filepath: '#6bbeb8'
            shape_flag: { fg: '#489bee' attr: 'b' }
            shape_float: { fg: '#e979d7' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#6bbeb8' attr: 'b' }
            shape_int: { fg: '#e979d7' attr: 'b' }
            shape_internalcall: { fg: '#6bbeb8' attr: 'b' }
            shape_list: { fg: '#6bbeb8' attr: 'b' }
            shape_literal: '#489bee'
            shape_match_pattern: '#71be6b'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#b7dfdd'
            shape_operator: '#beb86b'
            shape_or: { fg: '#e979d7' attr: 'b' }
            shape_pipe: { fg: '#e979d7' attr: 'b' }
            shape_range: { fg: '#beb86b' attr: 'b' }
            shape_record: { fg: '#6bbeb8' attr: 'b' }
            shape_redirection: { fg: '#e979d7' attr: 'b' }
            shape_signature: { fg: '#71be6b' attr: 'b' }
            shape_string: '#71be6b'
            shape_string_interpolation: { fg: '#6bbeb8' attr: 'b' }
            shape_table: { fg: '#489bee' attr: 'b' }
            shape_variable: '#e979d7'

            background: '#762423'
            foreground: '#ffffff'
            cursor: '#ffffff'
        }
    }
}

export module activate {
    export-env {
        use "red-alert-theme"

        red-alert-theme set color_config
        red-alert-theme update terminal
    }
}

# Activate the theme when sourced
use activate