export module "treehouse-theme" {
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
            separator: '#786b53'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#44a900' attr: 'b' }
            empty: '#58859a'
            bool: {|| if $in { '#f07d14' } else { 'light_gray' } }
            int: '#786b53'
            filesize: {|e|
                if $e == 0b {
                    '#786b53'
                } else if $e < 1mb {
                    '#b25a1e'
                } else {{ fg: '#58859a' }}
            }
            duration: '#786b53'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#b2270e' attr: 'b' }
                } else if $in < 6hr {
                    '#b2270e'
                } else if $in < 1day {
                    '#aa820c'
                } else if $in < 3day {
                    '#44a900'
                } else if $in < 1wk {
                    { fg: '#44a900' attr: 'b' }
                } else if $in < 6wk {
                    '#b25a1e'
                } else if $in < 52wk {
                    '#58859a'
                } else { 'dark_gray' }
            }
            range: '#786b53'
            float: '#786b53'
            string: '#786b53'
            nothing: '#786b53'
            binary: '#786b53'
            cellpath: '#786b53'
            row_index: { fg: '#44a900' attr: 'b' }
            record: '#786b53'
            list: '#786b53'
            block: '#786b53'
            hints: 'dark_gray'
            search_result: { fg: '#b2270e' bg: '#786b53' }

            shape_and: { fg: '#97363d' attr: 'b' }
            shape_binary: { fg: '#97363d' attr: 'b' }
            shape_block: { fg: '#58859a' attr: 'b' }
            shape_bool: '#f07d14'
            shape_custom: '#44a900'
            shape_datetime: { fg: '#b25a1e' attr: 'b' }
            shape_directory: '#b25a1e'
            shape_external: '#b25a1e'
            shape_externalarg: { fg: '#44a900' attr: 'b' }
            shape_filepath: '#b25a1e'
            shape_flag: { fg: '#58859a' attr: 'b' }
            shape_float: { fg: '#97363d' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#b25a1e' attr: 'b' }
            shape_int: { fg: '#97363d' attr: 'b' }
            shape_internalcall: { fg: '#b25a1e' attr: 'b' }
            shape_list: { fg: '#b25a1e' attr: 'b' }
            shape_literal: '#58859a'
            shape_match_pattern: '#44a900'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#f07d14'
            shape_operator: '#aa820c'
            shape_or: { fg: '#97363d' attr: 'b' }
            shape_pipe: { fg: '#97363d' attr: 'b' }
            shape_range: { fg: '#aa820c' attr: 'b' }
            shape_record: { fg: '#b25a1e' attr: 'b' }
            shape_redirection: { fg: '#97363d' attr: 'b' }
            shape_signature: { fg: '#44a900' attr: 'b' }
            shape_string: '#44a900'
            shape_string_interpolation: { fg: '#b25a1e' attr: 'b' }
            shape_table: { fg: '#58859a' attr: 'b' }
            shape_variable: '#97363d'

            background: '#191919'
            foreground: '#786b53'
            cursor: '#786b53'
        }
    }
}

export module activate {
    export-env {
        use "treehouse-theme"

        treehouse-theme set color_config
        treehouse-theme update terminal
    }
}

# Activate the theme when sourced
use activate