# Retrieve the theme settings
export def main [] {
    return {
        binary: '#d485ad'
        block: '#83adad'
        cell-path: '#dab997'
        closure: '#85ad85'
        custom: '#ebdbb2'
        duration: '#ffaf00'
        float: '#d75f5f'
        glob: '#ebdbb2'
        int: '#d485ad'
        list: '#85ad85'
        nothing: '#d75f5f'
        range: '#ffaf00'
        record: '#85ad85'
        string: '#afaf00'

        bool: {|| if $in { '#85ad85' } else { '#ffaf00' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d75f5f' attr: 'b' }
            } else if $in < 6hr {
                '#d75f5f'
            } else if $in < 1day {
                '#ffaf00'
            } else if $in < 3day {
                '#afaf00'
            } else if $in < 1wk {
                { fg: '#afaf00' attr: 'b' }
            } else if $in < 6wk {
                '#85ad85'
            } else if $in < 52wk {
                '#83adad'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#dab997'
            } else if $e < 1mb {
                '#85ad85'
            } else {{ fg: '#83adad' }}
        }

        shape_and: { fg: '#d485ad' attr: 'b' }
        shape_binary: { fg: '#d485ad' attr: 'b' }
        shape_block: { fg: '#83adad' attr: 'b' }
        shape_bool: '#85ad85'
        shape_closure: { fg: '#85ad85' attr: 'b' }
        shape_custom: '#afaf00'
        shape_datetime: { fg: '#85ad85' attr: 'b' }
        shape_directory: '#85ad85'
        shape_external: '#85ad85'
        shape_external_resolved: '#85ad85'
        shape_externalarg: { fg: '#afaf00' attr: 'b' }
        shape_filepath: '#85ad85'
        shape_flag: { fg: '#83adad' attr: 'b' }
        shape_float: { fg: '#d75f5f' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#85ad85' attr: 'b' }
        shape_globpattern: { fg: '#85ad85' attr: 'b' }
        shape_int: { fg: '#d485ad' attr: 'b' }
        shape_internalcall: { fg: '#85ad85' attr: 'b' }
        shape_keyword: { fg: '#d485ad' attr: 'b' }
        shape_list: { fg: '#85ad85' attr: 'b' }
        shape_literal: '#83adad'
        shape_match_pattern: '#afaf00'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d75f5f'
        shape_operator: '#ffaf00'
        shape_or: { fg: '#d485ad' attr: 'b' }
        shape_pipe: { fg: '#d485ad' attr: 'b' }
        shape_range: { fg: '#ffaf00' attr: 'b' }
        shape_raw_string: { fg: '#ebdbb2' attr: 'b' }
        shape_record: { fg: '#85ad85' attr: 'b' }
        shape_redirection: { fg: '#d485ad' attr: 'b' }
        shape_signature: { fg: '#afaf00' attr: 'b' }
        shape_string: '#afaf00'
        shape_string_interpolation: { fg: '#85ad85' attr: 'b' }
        shape_table: { fg: '#83adad' attr: 'b' }
        shape_vardecl: { fg: '#83adad' attr: 'u' }
        shape_variable: '#d485ad'

        foreground: '#dab997'
        background: '#262626'
        cursor: '#dab997'

        empty: '#83adad'
        header: { fg: '#afaf00' attr: 'b' }
        hints: '#8a8a8a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#afaf00' attr: 'b' }
        search_result: { fg: '#d75f5f' bg: '#dab997' }
        separator: '#dab997'
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