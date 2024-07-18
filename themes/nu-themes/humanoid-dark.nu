export module "humanoid-dark-theme" {
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
            separator: '#f8f8f2'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#02d849' attr: 'b' }
            empty: '#00a6fb'
            bool: {|| if $in { '#0dd9d6' } else { 'light_gray' } }
            int: '#f8f8f2'
            filesize: {|e|
                if $e == 0b {
                    '#f8f8f2'
                } else if $e < 1mb {
                    '#0dd9d6'
                } else {{ fg: '#00a6fb' }}
            }
            duration: '#f8f8f2'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#f11235' attr: 'b' }
                } else if $in < 6hr {
                    '#f11235'
                } else if $in < 1day {
                    '#ffb627'
                } else if $in < 3day {
                    '#02d849'
                } else if $in < 1wk {
                    { fg: '#02d849' attr: 'b' }
                } else if $in < 6wk {
                    '#0dd9d6'
                } else if $in < 52wk {
                    '#00a6fb'
                } else { 'dark_gray' }
            }
            range: '#f8f8f2'
            float: '#f8f8f2'
            string: '#f8f8f2'
            nothing: '#f8f8f2'
            binary: '#f8f8f2'
            cellpath: '#f8f8f2'
            row_index: { fg: '#02d849' attr: 'b' }
            record: '#f8f8f2'
            list: '#f8f8f2'
            block: '#f8f8f2'
            hints: 'dark_gray'
            search_result: { fg: '#f11235' bg: '#f8f8f2' }

            shape_and: { fg: '#f15ee3' attr: 'b' }
            shape_binary: { fg: '#f15ee3' attr: 'b' }
            shape_block: { fg: '#00a6fb' attr: 'b' }
            shape_bool: '#0dd9d6'
            shape_custom: '#02d849'
            shape_datetime: { fg: '#0dd9d6' attr: 'b' }
            shape_directory: '#0dd9d6'
            shape_external: '#0dd9d6'
            shape_externalarg: { fg: '#02d849' attr: 'b' }
            shape_filepath: '#0dd9d6'
            shape_flag: { fg: '#00a6fb' attr: 'b' }
            shape_float: { fg: '#f15ee3' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#0dd9d6' attr: 'b' }
            shape_int: { fg: '#f15ee3' attr: 'b' }
            shape_internalcall: { fg: '#0dd9d6' attr: 'b' }
            shape_list: { fg: '#0dd9d6' attr: 'b' }
            shape_literal: '#00a6fb'
            shape_match_pattern: '#02d849'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#0dd9d6'
            shape_operator: '#ffb627'
            shape_or: { fg: '#f15ee3' attr: 'b' }
            shape_pipe: { fg: '#f15ee3' attr: 'b' }
            shape_range: { fg: '#ffb627' attr: 'b' }
            shape_record: { fg: '#0dd9d6' attr: 'b' }
            shape_redirection: { fg: '#f15ee3' attr: 'b' }
            shape_signature: { fg: '#02d849' attr: 'b' }
            shape_string: '#02d849'
            shape_string_interpolation: { fg: '#0dd9d6' attr: 'b' }
            shape_table: { fg: '#00a6fb' attr: 'b' }
            shape_variable: '#f15ee3'

            background: '#232629'
            foreground: '#f8f8f2'
            cursor: '#f8f8f2'
        }
    }
}

export module activate {
    export-env {
        use "humanoid-dark-theme"

        humanoid-dark-theme set color_config
        humanoid-dark-theme update terminal
    }
}

# Activate the theme when sourced
use activate