export module "selenized-black-theme" {
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
            separator: '#777777'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#70b433' attr: 'b' }
            empty: '#368aeb'
            bool: {|| if $in { '#56d8c9' } else { 'light_gray' } }
            int: '#777777'
            filesize: {|e|
                if $e == 0b {
                    '#777777'
                } else if $e < 1mb {
                    '#3fc5b7'
                } else {{ fg: '#368aeb' }}
            }
            duration: '#777777'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#ed4a46' attr: 'b' }
                } else if $in < 6hr {
                    '#ed4a46'
                } else if $in < 1day {
                    '#dbb32d'
                } else if $in < 3day {
                    '#70b433'
                } else if $in < 1wk {
                    { fg: '#70b433' attr: 'b' }
                } else if $in < 6wk {
                    '#3fc5b7'
                } else if $in < 52wk {
                    '#368aeb'
                } else { 'dark_gray' }
            }
            range: '#777777'
            float: '#777777'
            string: '#777777'
            nothing: '#777777'
            binary: '#777777'
            cellpath: '#777777'
            row_index: { fg: '#70b433' attr: 'b' }
            record: '#777777'
            list: '#777777'
            block: '#777777'
            hints: 'dark_gray'
            search_result: { fg: '#ed4a46' bg: '#777777' }

            shape_and: { fg: '#eb6eb7' attr: 'b' }
            shape_binary: { fg: '#eb6eb7' attr: 'b' }
            shape_block: { fg: '#368aeb' attr: 'b' }
            shape_bool: '#56d8c9'
            shape_custom: '#70b433'
            shape_datetime: { fg: '#3fc5b7' attr: 'b' }
            shape_directory: '#3fc5b7'
            shape_external: '#3fc5b7'
            shape_externalarg: { fg: '#70b433' attr: 'b' }
            shape_filepath: '#3fc5b7'
            shape_flag: { fg: '#368aeb' attr: 'b' }
            shape_float: { fg: '#eb6eb7' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#3fc5b7' attr: 'b' }
            shape_int: { fg: '#eb6eb7' attr: 'b' }
            shape_internalcall: { fg: '#3fc5b7' attr: 'b' }
            shape_list: { fg: '#3fc5b7' attr: 'b' }
            shape_literal: '#368aeb'
            shape_match_pattern: '#70b433'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#56d8c9'
            shape_operator: '#dbb32d'
            shape_or: { fg: '#eb6eb7' attr: 'b' }
            shape_pipe: { fg: '#eb6eb7' attr: 'b' }
            shape_range: { fg: '#dbb32d' attr: 'b' }
            shape_record: { fg: '#3fc5b7' attr: 'b' }
            shape_redirection: { fg: '#eb6eb7' attr: 'b' }
            shape_signature: { fg: '#70b433' attr: 'b' }
            shape_string: '#70b433'
            shape_string_interpolation: { fg: '#3fc5b7' attr: 'b' }
            shape_table: { fg: '#368aeb' attr: 'b' }
            shape_variable: '#eb6eb7'

            background: '#181818'
            foreground: '#b9b9b9'
            cursor: '#b9b9b9'
        }
    }
}

export module activate {
    export-env {
        use "selenized-black-theme"

        selenized-black-theme set color_config
        selenized-black-theme update terminal
    }
}

# Activate the theme when sourced
use activate