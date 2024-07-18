export module "sierra-theme" {
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
            separator: '#bb7774'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#68694f' attr: 'b' }
            empty: '#989876'
            bool: {|| if $in { '#a17140' } else { 'light_gray' } }
            int: '#bb7774'
            filesize: {|e|
                if $e == 0b {
                    '#bb7774'
                } else if $e < 1mb {
                    '#a18e60'
                } else {{ fg: '#989876' }}
            }
            duration: '#bb7774'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#515a45' attr: 'b' }
                } else if $in < 6hr {
                    '#515a45'
                } else if $in < 1day {
                    '#7f7f60'
                } else if $in < 3day {
                    '#68694f'
                } else if $in < 1wk {
                    { fg: '#68694f' attr: 'b' }
                } else if $in < 6wk {
                    '#a18e60'
                } else if $in < 52wk {
                    '#989876'
                } else { 'dark_gray' }
            }
            range: '#bb7774'
            float: '#bb7774'
            string: '#bb7774'
            nothing: '#bb7774'
            binary: '#bb7774'
            cellpath: '#bb7774'
            row_index: { fg: '#68694f' attr: 'b' }
            record: '#bb7774'
            list: '#bb7774'
            block: '#bb7774'
            hints: 'dark_gray'
            search_result: { fg: '#515a45' bg: '#bb7774' }

            shape_and: { fg: '#897c5b' attr: 'b' }
            shape_binary: { fg: '#897c5b' attr: 'b' }
            shape_block: { fg: '#989876' attr: 'b' }
            shape_bool: '#a17140'
            shape_custom: '#68694f'
            shape_datetime: { fg: '#a18e60' attr: 'b' }
            shape_directory: '#a18e60'
            shape_external: '#a18e60'
            shape_externalarg: { fg: '#68694f' attr: 'b' }
            shape_filepath: '#a18e60'
            shape_flag: { fg: '#989876' attr: 'b' }
            shape_float: { fg: '#897c5b' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#a18e60' attr: 'b' }
            shape_int: { fg: '#897c5b' attr: 'b' }
            shape_internalcall: { fg: '#a18e60' attr: 'b' }
            shape_list: { fg: '#a18e60' attr: 'b' }
            shape_literal: '#989876'
            shape_match_pattern: '#68694f'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#a17140'
            shape_operator: '#7f7f60'
            shape_or: { fg: '#897c5b' attr: 'b' }
            shape_pipe: { fg: '#897c5b' attr: 'b' }
            shape_range: { fg: '#7f7f60' attr: 'b' }
            shape_record: { fg: '#a18e60' attr: 'b' }
            shape_redirection: { fg: '#897c5b' attr: 'b' }
            shape_signature: { fg: '#68694f' attr: 'b' }
            shape_string: '#68694f'
            shape_string_interpolation: { fg: '#a18e60' attr: 'b' }
            shape_table: { fg: '#989876' attr: 'b' }
            shape_variable: '#897c5b'

            background: '#1c1a14'
            foreground: '#cacbb9'
            cursor: '#cacbb9'
        }
    }
}

export module activate {
    export-env {
        use "sierra-theme"

        sierra-theme set color_config
        sierra-theme update terminal
    }
}

# Activate the theme when sourced
use activate