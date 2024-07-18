export module "vs-code-dark-plus-theme" {
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
            separator: '#c3dde1'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#39e9a8' attr: 'b' }
            empty: '#44aae6'
            bool: {|| if $in { '#5fffff' } else { 'light_gray' } }
            int: '#c3dde1'
            filesize: {|e|
                if $e == 0b {
                    '#c3dde1'
                } else if $e < 1mb {
                    '#3dd5e7'
                } else {{ fg: '#44aae6' }}
            }
            duration: '#c3dde1'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#e9653b' attr: 'b' }
                } else if $in < 6hr {
                    '#e9653b'
                } else if $in < 1day {
                    '#e5b684'
                } else if $in < 3day {
                    '#39e9a8'
                } else if $in < 1wk {
                    { fg: '#39e9a8' attr: 'b' }
                } else if $in < 6wk {
                    '#3dd5e7'
                } else if $in < 52wk {
                    '#44aae6'
                } else { 'dark_gray' }
            }
            range: '#c3dde1'
            float: '#c3dde1'
            string: '#c3dde1'
            nothing: '#c3dde1'
            binary: '#c3dde1'
            cellpath: '#c3dde1'
            row_index: { fg: '#39e9a8' attr: 'b' }
            record: '#c3dde1'
            list: '#c3dde1'
            block: '#c3dde1'
            hints: 'dark_gray'
            search_result: { fg: '#e9653b' bg: '#c3dde1' }

            shape_and: { fg: '#e17599' attr: 'b' }
            shape_binary: { fg: '#e17599' attr: 'b' }
            shape_block: { fg: '#44aae6' attr: 'b' }
            shape_bool: '#5fffff'
            shape_custom: '#39e9a8'
            shape_datetime: { fg: '#3dd5e7' attr: 'b' }
            shape_directory: '#3dd5e7'
            shape_external: '#3dd5e7'
            shape_externalarg: { fg: '#39e9a8' attr: 'b' }
            shape_filepath: '#3dd5e7'
            shape_flag: { fg: '#44aae6' attr: 'b' }
            shape_float: { fg: '#e17599' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#3dd5e7' attr: 'b' }
            shape_int: { fg: '#e17599' attr: 'b' }
            shape_internalcall: { fg: '#3dd5e7' attr: 'b' }
            shape_list: { fg: '#3dd5e7' attr: 'b' }
            shape_literal: '#44aae6'
            shape_match_pattern: '#39e9a8'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#5fffff'
            shape_operator: '#e5b684'
            shape_or: { fg: '#e17599' attr: 'b' }
            shape_pipe: { fg: '#e17599' attr: 'b' }
            shape_range: { fg: '#e5b684' attr: 'b' }
            shape_record: { fg: '#3dd5e7' attr: 'b' }
            shape_redirection: { fg: '#e17599' attr: 'b' }
            shape_signature: { fg: '#39e9a8' attr: 'b' }
            shape_string: '#39e9a8'
            shape_string_interpolation: { fg: '#3dd5e7' attr: 'b' }
            shape_table: { fg: '#44aae6' attr: 'b' }
            shape_variable: '#e17599'

            background: '#1e1e1e'
            foreground: '#cccccc'
            cursor: '#cccccc'
        }
    }
}

export module activate {
    export-env {
        use "vs-code-dark-plus-theme"

        vs-code-dark-plus-theme set color_config
        vs-code-dark-plus-theme update terminal
    }
}

# Activate the theme when sourced
use activate