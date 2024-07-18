export module "github-dimmed-theme" {
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
            separator: '#909dab'
            leading_trailing_space_bg: { attr: 'n' }
            header: { fg: '#57ab5a' attr: 'b' }
            empty: '#539bf5'
            bool: {|| if $in { '#56d4dd' } else { 'light_gray' } }
            int: '#909dab'
            filesize: {|e|
                if $e == 0b {
                    '#909dab'
                } else if $e < 1mb {
                    '#39c5cf'
                } else {{ fg: '#539bf5' }}
            }
            duration: '#909dab'
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: '#f47067' attr: 'b' }
                } else if $in < 6hr {
                    '#f47067'
                } else if $in < 1day {
                    '#c69026'
                } else if $in < 3day {
                    '#57ab5a'
                } else if $in < 1wk {
                    { fg: '#57ab5a' attr: 'b' }
                } else if $in < 6wk {
                    '#39c5cf'
                } else if $in < 52wk {
                    '#539bf5'
                } else { 'dark_gray' }
            }
            range: '#909dab'
            float: '#909dab'
            string: '#909dab'
            nothing: '#909dab'
            binary: '#909dab'
            cellpath: '#909dab'
            row_index: { fg: '#57ab5a' attr: 'b' }
            record: '#909dab'
            list: '#909dab'
            block: '#909dab'
            hints: 'dark_gray'
            search_result: { fg: '#f47067' bg: '#909dab' }

            shape_and: { fg: '#b083f0' attr: 'b' }
            shape_binary: { fg: '#b083f0' attr: 'b' }
            shape_block: { fg: '#539bf5' attr: 'b' }
            shape_bool: '#56d4dd'
            shape_custom: '#57ab5a'
            shape_datetime: { fg: '#39c5cf' attr: 'b' }
            shape_directory: '#39c5cf'
            shape_external: '#39c5cf'
            shape_externalarg: { fg: '#57ab5a' attr: 'b' }
            shape_filepath: '#39c5cf'
            shape_flag: { fg: '#539bf5' attr: 'b' }
            shape_float: { fg: '#b083f0' attr: 'b' }
            shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
            shape_globpattern: { fg: '#39c5cf' attr: 'b' }
            shape_int: { fg: '#b083f0' attr: 'b' }
            shape_internalcall: { fg: '#39c5cf' attr: 'b' }
            shape_list: { fg: '#39c5cf' attr: 'b' }
            shape_literal: '#539bf5'
            shape_match_pattern: '#57ab5a'
            shape_matching_brackets: { attr: 'u' }
            shape_nothing: '#56d4dd'
            shape_operator: '#c69026'
            shape_or: { fg: '#b083f0' attr: 'b' }
            shape_pipe: { fg: '#b083f0' attr: 'b' }
            shape_range: { fg: '#c69026' attr: 'b' }
            shape_record: { fg: '#39c5cf' attr: 'b' }
            shape_redirection: { fg: '#b083f0' attr: 'b' }
            shape_signature: { fg: '#57ab5a' attr: 'b' }
            shape_string: '#57ab5a'
            shape_string_interpolation: { fg: '#39c5cf' attr: 'b' }
            shape_table: { fg: '#539bf5' attr: 'b' }
            shape_variable: '#b083f0'

            background: '#22272e'
            foreground: '#768390'
            cursor: '#6cb6ff'
        }
    }
}

export module activate {
    export-env {
        use "github-dimmed-theme"

        github-dimmed-theme set color_config
        github-dimmed-theme update terminal
    }
}

# Activate the theme when sourced
use activate