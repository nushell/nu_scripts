# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ce6fdb'
        block: '#64d0f0'
        cell-path: '#bbbbbb'
        closure: '#00dadf'
        custom: '#ffffff'
        duration: '#f3f167'
        float: '#ff5555'
        glob: '#ffffff'
        int: '#ce6fdb'
        list: '#00dadf'
        nothing: '#bb0000'
        range: '#f3f167'
        record: '#00dadf'
        string: '#04f623'

        bool: {|| if $in { '#00ccd8' } else { '#f3f167' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#bb0000' attr: 'b' }
            } else if $in < 6hr {
                '#bb0000'
            } else if $in < 1day {
                '#f3f167'
            } else if $in < 3day {
                '#04f623'
            } else if $in < 1wk {
                { fg: '#04f623' attr: 'b' }
            } else if $in < 6wk {
                '#00dadf'
            } else if $in < 52wk {
                '#64d0f0'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#bbbbbb'
            } else if $e < 1mb {
                '#00dadf'
            } else {{ fg: '#64d0f0' }}
        }

        shape_and: { fg: '#ce6fdb' attr: 'b' }
        shape_binary: { fg: '#ce6fdb' attr: 'b' }
        shape_block: { fg: '#64d0f0' attr: 'b' }
        shape_bool: '#00ccd8'
        shape_closure: { fg: '#00dadf' attr: 'b' }
        shape_custom: '#04f623'
        shape_datetime: { fg: '#00dadf' attr: 'b' }
        shape_directory: '#00dadf'
        shape_external: '#00dadf'
        shape_external_resolved: '#00ccd8'
        shape_externalarg: { fg: '#04f623' attr: 'b' }
        shape_filepath: '#00dadf'
        shape_flag: { fg: '#64d0f0' attr: 'b' }
        shape_float: { fg: '#ff5555' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#00dadf' attr: 'b' }
        shape_globpattern: { fg: '#00dadf' attr: 'b' }
        shape_int: { fg: '#ce6fdb' attr: 'b' }
        shape_internalcall: { fg: '#00dadf' attr: 'b' }
        shape_keyword: { fg: '#ce6fdb' attr: 'b' }
        shape_list: { fg: '#00dadf' attr: 'b' }
        shape_literal: '#64d0f0'
        shape_match_pattern: '#04f623'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#bb0000'
        shape_operator: '#f3f167'
        shape_or: { fg: '#ce6fdb' attr: 'b' }
        shape_pipe: { fg: '#ce6fdb' attr: 'b' }
        shape_range: { fg: '#f3f167' attr: 'b' }
        shape_raw_string: { fg: '#ffffff' attr: 'b' }
        shape_record: { fg: '#00dadf' attr: 'b' }
        shape_redirection: { fg: '#ce6fdb' attr: 'b' }
        shape_signature: { fg: '#04f623' attr: 'b' }
        shape_string: '#04f623'
        shape_string_interpolation: { fg: '#00dadf' attr: 'b' }
        shape_table: { fg: '#64d0f0' attr: 'b' }
        shape_vardecl: { fg: '#64d0f0' attr: 'u' }
        shape_variable: '#ce6fdb'

        foreground: '#bbbbbb'
        background: '#171717'
        cursor: '#bbbbbb'

        empty: '#64d0f0'
        header: { fg: '#04f623' attr: 'b' }
        hints: '#555555'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#04f623' attr: 'b' }
        search_result: { fg: '#bb0000' bg: '#bbbbbb' }
        separator: '#bbbbbb'
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