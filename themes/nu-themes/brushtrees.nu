export module "brushtrees-theme" {
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
            separator: '#6d828e'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#87b386' attr: 'b' }
            empty: '#868cb3'
            bool: {|| if $in { '#86b3b3' } else { 'light_gray' } }
            int: '#6d828e'
            filesize: {|e|
                if $e == 0b {
                    '#6d828e'
                } else if $e < 1mb {
                    '#86b3b3'
                } else {{ fg: '#868cb3' }}
            }
            duration: '#6d828e'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#b38686' attr: 'b' }
                } else if $in < 6hr {
                    '#b38686'
                } else if $in < 1day {
                    '#aab386'
                } else if $in < 3day {
                    '#87b386'
                } else if $in < 1wk {
                    { fg: '#87b386' attr: 'b' }
                } else if $in < 6wk {
                    '#86b3b3'
                } else if $in < 52wk {
                    '#868cb3'
                } else { 'dark_gray' }
            }
            range: '#6d828e'
            float: '#6d828e'
            string: '#6d828e'
            nothing: '#6d828e'
            binary: '#6d828e'
            cellpath: '#6d828e'
            row_index: { fg: '#87b386' attr: 'b' }
            record: '#6d828e'
            list: '#6d828e'
            block: '#6d828e'
            hints: 'dark_gray'
            search_result: { fg: '#b38686' bg: '#6d828e' }

            shape_and: { fg: '#b386b2' attr: 'b' }
            shape_binary: { fg: '#b386b2' attr: 'b' }
            shape_block: { fg: '#868cb3' attr: 'b' }
            shape_bool: '#86b3b3'
            shape_custom: '#87b386'
            shape_datetime: { fg: '#86b3b3' attr: 'b' }
            shape_directory: '#86b3b3'
            shape_external: '#86b3b3'
            shape_externalarg: { fg: '#87b386' attr: 'b' }
            shape_filepath: '#86b3b3'
            shape_flag: { fg: '#868cb3' attr: 'b' }
            shape_float: { fg: '#b386b2' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#86b3b3' attr: 'b' }
            shape_int: { fg: '#b386b2' attr: 'b' }
            shape_internalcall: { fg: '#86b3b3' attr: 'b' }
            shape_list: { fg: '#86b3b3' attr: 'b' }
            shape_literal: '#868cb3'
            shape_match_pattern: '#87b386'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#86b3b3'
            shape_operator: '#aab386'
            shape_or: { fg: '#b386b2' attr: 'b' }
            shape_pipe: { fg: '#b386b2' attr: 'b' }
            shape_range: { fg: '#aab386' attr: 'b' }
            shape_record: { fg: '#86b3b3' attr: 'b' }
            shape_redirection: { fg: '#b386b2' attr: 'b' }
            shape_signature: { fg: '#87b386' attr: 'b' }
            shape_string: '#87b386'
            shape_string_interpolation: { fg: '#86b3b3' attr: 'b' }
            shape_table: { fg: '#868cb3' attr: 'b' }
            shape_variable: '#b386b2'

            background: '#e3efef'
            foreground: '#6d828e'
            cursor: '#6d828e'
        }
    }
}

export module activate {
    export-env {
        use "brushtrees-theme"

        brushtrees-theme set color_config
        brushtrees-theme update terminal
    }
}

# Activate the theme when sourced
use activate