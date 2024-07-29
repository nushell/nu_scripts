# Retrieve the theme settings
export def main [] {
    const color_palette = {
        rosewater: "#f5e0dc"
        flamingo: "#f2cdcd"
        pink: "#f5c2e7"
        mauve: "#cba6f7"
        red: "#f38ba8"
        maroon: "#eba0ac"
        peach: "#fab387"
        yellow: "#f9e2af"
        green: "#a6e3a1"
        teal: "#94e2d5"
        sky: "#89dceb"
        sapphire: "#74c7ec"
        blue: "#89b4fa"
        lavender: "#b4befe"
        text: "#cdd6f4"
        subtext1: "#bac2de"
        subtext0: "#a6adc8"
        overlay2: "#9399b2"
        overlay1: "#7f849c"
        overlay0: "#6c7086"
        surface2: "#585b70"
        surface1: "#45475a"
        surface0: "#313244"
        base: "#1e1e2e"
        mantle: "#181825"
        crust: "#11111b"
    }

    return {
        separator: $color_palette.overlay0
        leading_trailing_space_bg: { attr: "n" }
        header: { fg: $color_palette.blue attr: "b" }
        empty: $color_palette.lavender
        bool: $color_palette.lavender
        int: $color_palette.peach
        duration: $color_palette.text
        filesize: {|e|
            if $e < 1mb {
                $color_palette.green
            } else if $e < 100mb {
                $color_palette.yellow
            } else if $e < 500mb {
                $color_palette.peach
            } else if $e < 800mb {
                $color_palette.maroon
            } else if $e > 800mb {
                $color_palette.red
            }
        }
        date: {|| (date now) - $in |
            if $in < 1hr {
                $color_palette.green
            } else if $in < 1day {
                $color_palette.yellow
            } else if $in < 3day {
                $color_palette.peach
            } else if $in < 1wk {
                $color_palette.maroon
            } else if $in > 1wk {
                $color_palette.red
            }
        }
        range: $color_palette.text
        float: $color_palette.text
        string: $color_palette.text
        nothing: $color_palette.text
        binary: $color_palette.text
        'cell-path': $color_palette.text
        row_index: { fg: $color_palette.mauve attr: "b" }
        record: $color_palette.text
        list: $color_palette.text
        block: $color_palette.text
        hints: $color_palette.overlay1
        search_result: { fg: $color_palette.red bg: $color_palette.text }

        shape_and: { fg: $color_palette.pink attr: "b" }
        shape_binary: { fg: $color_palette.pink attr: "b" }
        shape_block: { fg: $color_palette.blue attr: "b" }
        shape_bool: $color_palette.teal
        shape_custom: $color_palette.green
        shape_datetime: { fg: $color_palette.teal attr: "b" }
        shape_directory: $color_palette.teal
        shape_external: $color_palette.teal
        shape_externalarg: { fg: $color_palette.green attr: "b" }
        shape_filepath: $color_palette.teal
        shape_flag: { fg: $color_palette.blue attr: "b" }
        shape_float: { fg: $color_palette.pink attr: "b" }
        shape_garbage: { fg: $color_palette.text bg: $color_palette.red attr: "b" }
        shape_globpattern: { fg: $color_palette.teal attr: "b" }
        shape_int: { fg: $color_palette.pink attr: "b" }
        shape_internalcall: { fg: $color_palette.teal attr: "b" }
        shape_list: { fg: $color_palette.teal attr: "b" }
        shape_literal: $color_palette.blue
        shape_match_pattern: $color_palette.green
        shape_matching_brackets: { attr: "u" }
        shape_nothing: $color_palette.teal
        shape_operator: $color_palette.peach
        shape_or: { fg: $color_palette.pink attr: "b" }
        shape_pipe: { fg: $color_palette.pink attr: "b" }
        shape_range: { fg: $color_palette.peach attr: "b" }
        shape_record: { fg: $color_palette.teal attr: "b" }
        shape_redirection: { fg: $color_palette.pink attr: "b" }
        shape_signature: { fg: $color_palette.green attr: "b" }
        shape_string: $color_palette.green
        shape_string_interpolation: { fg: $color_palette.teal attr: "b" }
        shape_table: { fg: $color_palette.blue attr: "b" }
        shape_variable: $color_palette.pink

        background: $color_palette.base
        foreground: $color_palette.text
        cursor: $color_palette.blue
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