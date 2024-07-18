export module "ic-green-ppl-theme" {
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
            separator: '#e0ffef'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#339c24' attr: 'b' }
            empty: '#149b45'
            bool: {|| if $in { '#22ff71' } else { 'light_gray' } }
            int: '#e0ffef'
            filesize: {|e|
                if $e == 0b {
                    '#e0ffef'
                } else if $e < 1mb {
                    '#2cb868'
                } else {{ fg: '#149b45' }}
            }
            duration: '#e0ffef'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#fb002a' attr: 'b' }
                } else if $in < 6hr {
                    '#fb002a'
                } else if $in < 1day {
                    '#659b25'
                } else if $in < 3day {
                    '#339c24'
                } else if $in < 1wk {
                    { fg: '#339c24' attr: 'b' }
                } else if $in < 6wk {
                    '#2cb868'
                } else if $in < 52wk {
                    '#149b45'
                } else { 'dark_gray' }
            }
            range: '#e0ffef'
            float: '#e0ffef'
            string: '#e0ffef'
            nothing: '#e0ffef'
            binary: '#e0ffef'
            cellpath: '#e0ffef'
            row_index: { fg: '#339c24' attr: 'b' }
            record: '#e0ffef'
            list: '#e0ffef'
            block: '#e0ffef'
            hints: 'dark_gray'
            search_result: { fg: '#fb002a' bg: '#e0ffef' }

            shape_and: { fg: '#53b82c' attr: 'b' }
            shape_binary: { fg: '#53b82c' attr: 'b' }
            shape_block: { fg: '#149b45' attr: 'b' }
            shape_bool: '#22ff71'
            shape_custom: '#339c24'
            shape_datetime: { fg: '#2cb868' attr: 'b' }
            shape_directory: '#2cb868'
            shape_external: '#2cb868'
            shape_externalarg: { fg: '#339c24' attr: 'b' }
            shape_filepath: '#2cb868'
            shape_flag: { fg: '#149b45' attr: 'b' }
            shape_float: { fg: '#53b82c' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#2cb868' attr: 'b' }
            shape_int: { fg: '#53b82c' attr: 'b' }
            shape_internalcall: { fg: '#2cb868' attr: 'b' }
            shape_list: { fg: '#2cb868' attr: 'b' }
            shape_literal: '#149b45'
            shape_match_pattern: '#339c24'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#22ff71'
            shape_operator: '#659b25'
            shape_or: { fg: '#53b82c' attr: 'b' }
            shape_pipe: { fg: '#53b82c' attr: 'b' }
            shape_range: { fg: '#659b25' attr: 'b' }
            shape_record: { fg: '#2cb868' attr: 'b' }
            shape_redirection: { fg: '#53b82c' attr: 'b' }
            shape_signature: { fg: '#339c24' attr: 'b' }
            shape_string: '#339c24'
            shape_string_interpolation: { fg: '#2cb868' attr: 'b' }
            shape_table: { fg: '#149b45' attr: 'b' }
            shape_variable: '#53b82c'

            background: '#3a3d3f'
            foreground: '#d9efd3'
            cursor: '#d9efd3'
        }
    }
}

export module activate {
    export-env {
        use "ic-green-ppl-theme"

        ic-green-ppl-theme set color_config
        ic-green-ppl-theme update terminal
    }
}

# Activate the theme when sourced
use activate