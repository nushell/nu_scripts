export module "github-light-theme" {
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
            separator: '#6a737d'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#28a745' attr: 'b' }
            empty: '#0366d6'
            bool: {|| if $in { '#3192aa' } else { 'light_gray' } }
            int: '#6a737d'
            filesize: {|e|
                if $e == 0b {
                    '#6a737d'
                } else if $e < 1mb {
                    '#0598bc'
                } else {{ fg: '#0366d6' }}
            }
            duration: '#6a737d'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#d73a49' attr: 'b' }
                } else if $in < 6hr {
                    '#d73a49'
                } else if $in < 1day {
                    '#dbab09'
                } else if $in < 3day {
                    '#28a745'
                } else if $in < 1wk {
                    { fg: '#28a745' attr: 'b' }
                } else if $in < 6wk {
                    '#0598bc'
                } else if $in < 52wk {
                    '#0366d6'
                } else { 'dark_gray' }
            }
            range: '#6a737d'
            float: '#6a737d'
            string: '#6a737d'
            nothing: '#6a737d'
            binary: '#6a737d'
            cellpath: '#6a737d'
            row_index: { fg: '#28a745' attr: 'b' }
            record: '#6a737d'
            list: '#6a737d'
            block: '#6a737d'
            hints: 'dark_gray'
            search_result: { fg: '#d73a49' bg: '#6a737d' }

            shape_and: { fg: '#5a32a3' attr: 'b' }
            shape_binary: { fg: '#5a32a3' attr: 'b' }
            shape_block: { fg: '#0366d6' attr: 'b' }
            shape_bool: '#3192aa'
            shape_custom: '#28a745'
            shape_datetime: { fg: '#0598bc' attr: 'b' }
            shape_directory: '#0598bc'
            shape_external: '#0598bc'
            shape_externalarg: { fg: '#28a745' attr: 'b' }
            shape_filepath: '#0598bc'
            shape_flag: { fg: '#0366d6' attr: 'b' }
            shape_float: { fg: '#5a32a3' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#0598bc' attr: 'b' }
            shape_int: { fg: '#5a32a3' attr: 'b' }
            shape_internalcall: { fg: '#0598bc' attr: 'b' }
            shape_list: { fg: '#0598bc' attr: 'b' }
            shape_literal: '#0366d6'
            shape_match_pattern: '#28a745'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#3192aa'
            shape_operator: '#dbab09'
            shape_or: { fg: '#5a32a3' attr: 'b' }
            shape_pipe: { fg: '#5a32a3' attr: 'b' }
            shape_range: { fg: '#dbab09' attr: 'b' }
            shape_record: { fg: '#0598bc' attr: 'b' }
            shape_redirection: { fg: '#5a32a3' attr: 'b' }
            shape_signature: { fg: '#28a745' attr: 'b' }
            shape_string: '#28a745'
            shape_string_interpolation: { fg: '#0598bc' attr: 'b' }
            shape_table: { fg: '#0366d6' attr: 'b' }
            shape_variable: '#5a32a3'

            background: '#ffffff'
            foreground: '#24292f'
            cursor: '#044289'
        }
    }
}

export module activate {
    export-env {
        use "github-light-theme"

        github-light-theme set color_config
        github-light-theme update terminal
    }
}

# Activate the theme when sourced
use activate