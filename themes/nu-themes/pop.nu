# Retrieve the theme settings
export def main [] {
    return {
        binary: '#b31e8d'
        block: '#0e5a94'
        cell-path: '#d0d0d0'
        closure: '#00aabb'
        custom: '#ffffff'
        duration: '#f8ca12'
        float: '#eb008a'
        glob: '#ffffff'
        int: '#b31e8d'
        list: '#00aabb'
        nothing: '#eb008a'
        range: '#f8ca12'
        record: '#00aabb'
        string: '#37b349'

        bool: {|| if $in { '#00aabb' } else { '#f8ca12' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#eb008a' attr: 'b' }
            } else if $in < 6hr {
                '#eb008a'
            } else if $in < 1day {
                '#f8ca12'
            } else if $in < 3day {
                '#37b349'
            } else if $in < 1wk {
                { fg: '#37b349' attr: 'b' }
            } else if $in < 6wk {
                '#00aabb'
            } else if $in < 52wk {
                '#0e5a94'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#d0d0d0'
            } else if $e < 1mb {
                '#00aabb'
            } else {{ fg: '#0e5a94' }}
        }

        shape_and: { fg: '#b31e8d' attr: 'b' }
        shape_binary: { fg: '#b31e8d' attr: 'b' }
        shape_block: { fg: '#0e5a94' attr: 'b' }
        shape_bool: '#00aabb'
        shape_closure: { fg: '#00aabb' attr: 'b' }
        shape_custom: '#37b349'
        shape_datetime: { fg: '#00aabb' attr: 'b' }
        shape_directory: '#00aabb'
        shape_external: '#00aabb'
        shape_external_resolved: '#00aabb'
        shape_externalarg: { fg: '#37b349' attr: 'b' }
        shape_filepath: '#00aabb'
        shape_flag: { fg: '#0e5a94' attr: 'b' }
        shape_float: { fg: '#eb008a' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00aabb' attr: 'b' }
        shape_globpattern: { fg: '#00aabb' attr: 'b' }
        shape_int: { fg: '#b31e8d' attr: 'b' }
        shape_internalcall: { fg: '#00aabb' attr: 'b' }
        shape_keyword: { fg: '#b31e8d' attr: 'b' }
        shape_list: { fg: '#00aabb' attr: 'b' }
        shape_literal: '#0e5a94'
        shape_match_pattern: '#37b349'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#eb008a'
        shape_operator: '#f8ca12'
        shape_or: { fg: '#b31e8d' attr: 'b' }
        shape_pipe: { fg: '#b31e8d' attr: 'b' }
        shape_range: { fg: '#f8ca12' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00aabb' attr: 'b' }
        shape_redirection: { fg: '#b31e8d' attr: 'b' }
        shape_signature: { fg: '#37b349' attr: 'b' }
        shape_string: '#37b349'
        shape_string_interpolation: { fg: '#00aabb' attr: 'b' }
        shape_table: { fg: '#0e5a94' attr: 'b' }
        shape_vardecl: { fg: '#0e5a94' attr: 'u' }
        shape_variable: '#b31e8d'

        foreground: '#d0d0d0'
        background: '#000000'
        cursor: '#d0d0d0'

        empty: '#0e5a94'
        header: { fg: '#37b349' attr: 'b' }
        hints: '#505050'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#37b349' attr: 'b' }
        search_result: { fg: '#eb008a' bg: '#d0d0d0' }
        separator: '#d0d0d0'
    }
}

# Update the Nushell configuration
export def --env "set color_config" [] {
    $env.config.color_config = (main)
}

# Update terminal colors
export def "update terminal" [] {
    let theme = (main)

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
    # to one line and print with no-newline
    | str replace --all "\n" ''
    | print -n $"($in)\r"
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

# Activate the theme when sourced
use activate