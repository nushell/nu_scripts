# Retrieve the theme settings
export def main [] {
    return {
        binary: '#005faf'
        block: '#d75f00'
        cell-path: '#444444'
        closure: '#d75f00'
        custom: '#878787'
        duration: '#d70087'
        float: '#bcbcbc'
        glob: '#878787'
        int: '#005faf'
        list: '#d75f00'
        nothing: '#bcbcbc'
        range: '#d70087'
        record: '#d75f00'
        string: '#8700af'

        bool: {|| if $in { '#d75f00' } else { '#d70087' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#bcbcbc' attr: 'b' }
            } else if $in < 6hr {
                '#bcbcbc'
            } else if $in < 1day {
                '#d70087'
            } else if $in < 3day {
                '#8700af'
            } else if $in < 1wk {
                { fg: '#8700af' attr: 'b' }
            } else if $in < 6wk {
                '#d75f00'
            } else if $in < 52wk {
                '#d75f00'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#444444'
            } else if $e < 1mb {
                '#d75f00'
            } else {{ fg: '#d75f00' }}
        }

        shape_and: { fg: '#005faf' attr: 'b' }
        shape_binary: { fg: '#005faf' attr: 'b' }
        shape_block: { fg: '#d75f00' attr: 'b' }
        shape_bool: '#d75f00'
        shape_closure: { fg: '#d75f00' attr: 'b' }
        shape_custom: '#8700af'
        shape_datetime: { fg: '#d75f00' attr: 'b' }
        shape_directory: '#d75f00'
        shape_external: '#d75f00'
        shape_external_resolved: '#d75f00'
        shape_externalarg: { fg: '#8700af' attr: 'b' }
        shape_filepath: '#d75f00'
        shape_flag: { fg: '#d75f00' attr: 'b' }
        shape_float: { fg: '#bcbcbc' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#d75f00' attr: 'b' }
        shape_globpattern: { fg: '#d75f00' attr: 'b' }
        shape_int: { fg: '#005faf' attr: 'b' }
        shape_internalcall: { fg: '#d75f00' attr: 'b' }
        shape_keyword: { fg: '#005faf' attr: 'b' }
        shape_list: { fg: '#d75f00' attr: 'b' }
        shape_literal: '#d75f00'
        shape_match_pattern: '#8700af'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#bcbcbc'
        shape_operator: '#d70087'
        shape_or: { fg: '#005faf' attr: 'b' }
        shape_pipe: { fg: '#005faf' attr: 'b' }
        shape_range: { fg: '#d70087' attr: 'b' }
        shape_raw_string: { fg: '#878787' attr: 'b' }
        shape_record: { fg: '#d75f00' attr: 'b' }
        shape_redirection: { fg: '#005faf' attr: 'b' }
        shape_signature: { fg: '#8700af' attr: 'b' }
        shape_string: '#8700af'
        shape_string_interpolation: { fg: '#d75f00' attr: 'b' }
        shape_table: { fg: '#d75f00' attr: 'b' }
        shape_vardecl: { fg: '#d75f00' attr: 'u' }
        shape_variable: '#005faf'

        foreground: '#444444'
        background: '#eeeeee'
        cursor: '#444444'

        empty: '#d75f00'
        header: { fg: '#8700af' attr: 'b' }
        hints: '#5f8700'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8700af' attr: 'b' }
        search_result: { fg: '#bcbcbc' bg: '#444444' }
        separator: '#444444'
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