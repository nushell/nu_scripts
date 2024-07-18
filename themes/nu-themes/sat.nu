export module "sat-theme" {
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
            separator: '#f2f2f2'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#07dd00' attr: 'b' }
            empty: '#0007dd'
            bool: {|| if $in { '#74fffa' } else { 'light_gray' } }
            int: '#f2f2f2'
            filesize: {|e|
                if $e == 0b {
                    '#f2f2f2'
                } else if $e < 1mb {
                    '#00ddd6'
                } else {{ fg: '#0007dd' }}
            }
            duration: '#f2f2f2'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#dd0007' attr: 'b' }
                } else if $in < 6hr {
                    '#dd0007'
                } else if $in < 1day {
                    '#ddd600'
                } else if $in < 3day {
                    '#07dd00'
                } else if $in < 1wk {
                    { fg: '#07dd00' attr: 'b' }
                } else if $in < 6wk {
                    '#00ddd6'
                } else if $in < 52wk {
                    '#0007dd'
                } else { 'dark_gray' }
            }
            range: '#f2f2f2'
            float: '#f2f2f2'
            string: '#f2f2f2'
            nothing: '#f2f2f2'
            binary: '#f2f2f2'
            cellpath: '#f2f2f2'
            row_index: { fg: '#07dd00' attr: 'b' }
            record: '#f2f2f2'
            list: '#f2f2f2'
            block: '#f2f2f2'
            hints: 'dark_gray'
            search_result: { fg: '#dd0007' bg: '#f2f2f2' }

            shape_and: { fg: '#d600dd' attr: 'b' }
            shape_binary: { fg: '#d600dd' attr: 'b' }
            shape_block: { fg: '#0007dd' attr: 'b' }
            shape_bool: '#74fffa'
            shape_custom: '#07dd00'
            shape_datetime: { fg: '#00ddd6' attr: 'b' }
            shape_directory: '#00ddd6'
            shape_external: '#00ddd6'
            shape_externalarg: { fg: '#07dd00' attr: 'b' }
            shape_filepath: '#00ddd6'
            shape_flag: { fg: '#0007dd' attr: 'b' }
            shape_float: { fg: '#d600dd' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#00ddd6' attr: 'b' }
            shape_int: { fg: '#d600dd' attr: 'b' }
            shape_internalcall: { fg: '#00ddd6' attr: 'b' }
            shape_list: { fg: '#00ddd6' attr: 'b' }
            shape_literal: '#0007dd'
            shape_match_pattern: '#07dd00'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#74fffa'
            shape_operator: '#ddd600'
            shape_or: { fg: '#d600dd' attr: 'b' }
            shape_pipe: { fg: '#d600dd' attr: 'b' }
            shape_range: { fg: '#ddd600' attr: 'b' }
            shape_record: { fg: '#00ddd6' attr: 'b' }
            shape_redirection: { fg: '#d600dd' attr: 'b' }
            shape_signature: { fg: '#07dd00' attr: 'b' }
            shape_string: '#07dd00'
            shape_string_interpolation: { fg: '#00ddd6' attr: 'b' }
            shape_table: { fg: '#0007dd' attr: 'b' }
            shape_variable: '#d600dd'

            background: '#758480'
            foreground: '#23476a'
            cursor: '#23476a'
        }
    }
}

export module activate {
    export-env {
        use "sat-theme"

        sat-theme set color_config
        sat-theme update terminal
    }
}

# Activate the theme when sourced
use activate