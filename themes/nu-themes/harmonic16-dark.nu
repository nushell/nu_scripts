# Retrieve the theme settings
export def main [] {
    return {
        binary: '#bf568b'
        block: '#8b56bf'
        cell-path: '#cbd6e2'
        closure: '#568bbf'
        custom: '#f7f9fb'
        duration: '#8bbf56'
        float: '#bf8b56'
        glob: '#f7f9fb'
        int: '#bf568b'
        list: '#568bbf'
        nothing: '#bf8b56'
        range: '#8bbf56'
        record: '#568bbf'
        string: '#56bf8b'

        bool: {|| if $in { '#568bbf' } else { '#8bbf56' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#bf8b56' attr: 'b' }
            } else if $in < 6hr {
                '#bf8b56'
            } else if $in < 1day {
                '#8bbf56'
            } else if $in < 3day {
                '#56bf8b'
            } else if $in < 1wk {
                { fg: '#56bf8b' attr: 'b' }
            } else if $in < 6wk {
                '#568bbf'
            } else if $in < 52wk {
                '#8b56bf'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#cbd6e2'
            } else if $e < 1mb {
                '#568bbf'
            } else {{ fg: '#8b56bf' }}
        }

        shape_and: { fg: '#bf568b' attr: 'b' }
        shape_binary: { fg: '#bf568b' attr: 'b' }
        shape_block: { fg: '#8b56bf' attr: 'b' }
        shape_bool: '#568bbf'
        shape_closure: { fg: '#568bbf' attr: 'b' }
        shape_custom: '#56bf8b'
        shape_datetime: { fg: '#568bbf' attr: 'b' }
        shape_directory: '#568bbf'
        shape_external: '#568bbf'
        shape_external_resolved: '#568bbf'
        shape_externalarg: { fg: '#56bf8b' attr: 'b' }
        shape_filepath: '#568bbf'
        shape_flag: { fg: '#8b56bf' attr: 'b' }
        shape_float: { fg: '#bf8b56' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#568bbf' attr: 'b' }
        shape_globpattern: { fg: '#568bbf' attr: 'b' }
        shape_int: { fg: '#bf568b' attr: 'b' }
        shape_internalcall: { fg: '#568bbf' attr: 'b' }
        shape_keyword: { fg: '#bf568b' attr: 'b' }
        shape_list: { fg: '#568bbf' attr: 'b' }
        shape_literal: '#8b56bf'
        shape_match_pattern: '#56bf8b'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#bf8b56'
        shape_operator: '#8bbf56'
        shape_or: { fg: '#bf568b' attr: 'b' }
        shape_pipe: { fg: '#bf568b' attr: 'b' }
        shape_range: { fg: '#8bbf56' attr: 'b' }
        shape_raw_string: { fg: '#f7f9fb' attr: 'b' }
        shape_record: { fg: '#568bbf' attr: 'b' }
        shape_redirection: { fg: '#bf568b' attr: 'b' }
        shape_signature: { fg: '#56bf8b' attr: 'b' }
        shape_string: '#56bf8b'
        shape_string_interpolation: { fg: '#568bbf' attr: 'b' }
        shape_table: { fg: '#8b56bf' attr: 'b' }
        shape_vardecl: { fg: '#8b56bf' attr: 'u' }
        shape_variable: '#bf568b'

        foreground: '#cbd6e2'
        background: '#0b1c2c'
        cursor: '#cbd6e2'

        empty: '#8b56bf'
        header: { fg: '#56bf8b' attr: 'b' }
        hints: '#627e99'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#56bf8b' attr: 'b' }
        search_result: { fg: '#bf8b56' bg: '#cbd6e2' }
        separator: '#cbd6e2'
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