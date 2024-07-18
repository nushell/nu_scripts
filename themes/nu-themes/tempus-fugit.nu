export module "tempus-fugit-theme" {
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
            separator: '#f2ebe9'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#357200' attr: 'b' }
            empty: '#1666b0'
            bool: {|| if $in { '#00786a' } else { 'light_gray' } }
            int: '#f2ebe9'
            filesize: {|e|
                if $e == 0b {
                    '#f2ebe9'
                } else if $e < 1mb {
                    '#007072'
                } else {{ fg: '#1666b0' }}
            }
            duration: '#f2ebe9'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#c61a14' attr: 'b' }
                } else if $in < 6hr {
                    '#c61a14'
                } else if $in < 1day {
                    '#825e00'
                } else if $in < 3day {
                    '#357200'
                } else if $in < 1wk {
                    { fg: '#357200' attr: 'b' }
                } else if $in < 6wk {
                    '#007072'
                } else if $in < 52wk {
                    '#1666b0'
                } else { 'dark_gray' }
            }
            range: '#f2ebe9'
            float: '#f2ebe9'
            string: '#f2ebe9'
            nothing: '#f2ebe9'
            binary: '#f2ebe9'
            cellpath: '#f2ebe9'
            row_index: { fg: '#357200' attr: 'b' }
            record: '#f2ebe9'
            list: '#f2ebe9'
            block: '#f2ebe9'
            hints: 'dark_gray'
            search_result: { fg: '#c61a14' bg: '#f2ebe9' }

            shape_and: { fg: '#a83884' attr: 'b' }
            shape_binary: { fg: '#a83884' attr: 'b' }
            shape_block: { fg: '#1666b0' attr: 'b' }
            shape_bool: '#00786a'
            shape_custom: '#357200'
            shape_datetime: { fg: '#007072' attr: 'b' }
            shape_directory: '#007072'
            shape_external: '#007072'
            shape_externalarg: { fg: '#357200' attr: 'b' }
            shape_filepath: '#007072'
            shape_flag: { fg: '#1666b0' attr: 'b' }
            shape_float: { fg: '#a83884' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#007072' attr: 'b' }
            shape_int: { fg: '#a83884' attr: 'b' }
            shape_internalcall: { fg: '#007072' attr: 'b' }
            shape_list: { fg: '#007072' attr: 'b' }
            shape_literal: '#1666b0'
            shape_match_pattern: '#357200'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#00786a'
            shape_operator: '#825e00'
            shape_or: { fg: '#a83884' attr: 'b' }
            shape_pipe: { fg: '#a83884' attr: 'b' }
            shape_range: { fg: '#825e00' attr: 'b' }
            shape_record: { fg: '#007072' attr: 'b' }
            shape_redirection: { fg: '#a83884' attr: 'b' }
            shape_signature: { fg: '#357200' attr: 'b' }
            shape_string: '#357200'
            shape_string_interpolation: { fg: '#007072' attr: 'b' }
            shape_table: { fg: '#1666b0' attr: 'b' }
            shape_variable: '#a83884'

            background: '#fff5f3'
            foreground: '#4d595f'
            cursor: '#4d595f'
        }
    }
}

export module activate {
    export-env {
        use "tempus-fugit-theme"

        tempus-fugit-theme set color_config
        tempus-fugit-theme update terminal
    }
}

# Activate the theme when sourced
use activate