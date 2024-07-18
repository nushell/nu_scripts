export module "frontend-fun-forrest-theme" {
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
            separator: '#ddc265'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#919c00' attr: 'b' }
            empty: '#4699a3'
            bool: {|| if $in { '#e6a96b' } else { 'light_gray' } }
            int: '#ddc265'
            filesize: {|e|
                if $e == 0b {
                    '#ddc265'
                } else if $e < 1mb {
                    '#da8213'
                } else {{ fg: '#4699a3' }}
            }
            duration: '#ddc265'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#d6262b' attr: 'b' }
                } else if $in < 6hr {
                    '#d6262b'
                } else if $in < 1day {
                    '#be8a13'
                } else if $in < 3day {
                    '#919c00'
                } else if $in < 1wk {
                    { fg: '#919c00' attr: 'b' }
                } else if $in < 6wk {
                    '#da8213'
                } else if $in < 52wk {
                    '#4699a3'
                } else { 'dark_gray' }
            }
            range: '#ddc265'
            float: '#ddc265'
            string: '#ddc265'
            nothing: '#ddc265'
            binary: '#ddc265'
            cellpath: '#ddc265'
            row_index: { fg: '#919c00' attr: 'b' }
            record: '#ddc265'
            list: '#ddc265'
            block: '#ddc265'
            hints: 'dark_gray'
            search_result: { fg: '#d6262b' bg: '#ddc265' }

            shape_and: { fg: '#8d4331' attr: 'b' }
            shape_binary: { fg: '#8d4331' attr: 'b' }
            shape_block: { fg: '#4699a3' attr: 'b' }
            shape_bool: '#e6a96b'
            shape_custom: '#919c00'
            shape_datetime: { fg: '#da8213' attr: 'b' }
            shape_directory: '#da8213'
            shape_external: '#da8213'
            shape_externalarg: { fg: '#919c00' attr: 'b' }
            shape_filepath: '#da8213'
            shape_flag: { fg: '#4699a3' attr: 'b' }
            shape_float: { fg: '#8d4331' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#da8213' attr: 'b' }
            shape_int: { fg: '#8d4331' attr: 'b' }
            shape_internalcall: { fg: '#da8213' attr: 'b' }
            shape_list: { fg: '#da8213' attr: 'b' }
            shape_literal: '#4699a3'
            shape_match_pattern: '#919c00'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#e6a96b'
            shape_operator: '#be8a13'
            shape_or: { fg: '#8d4331' attr: 'b' }
            shape_pipe: { fg: '#8d4331' attr: 'b' }
            shape_range: { fg: '#be8a13' attr: 'b' }
            shape_record: { fg: '#da8213' attr: 'b' }
            shape_redirection: { fg: '#8d4331' attr: 'b' }
            shape_signature: { fg: '#919c00' attr: 'b' }
            shape_string: '#919c00'
            shape_string_interpolation: { fg: '#da8213' attr: 'b' }
            shape_table: { fg: '#4699a3' attr: 'b' }
            shape_variable: '#8d4331'

            background: '#251200'
            foreground: '#dec165'
            cursor: '#dec165'
        }
    }
}

export module activate {
    export-env {
        use "frontend-fun-forrest-theme"

        frontend-fun-forrest-theme set color_config
        frontend-fun-forrest-theme update terminal
    }
}

# Activate the theme when sourced
use activate