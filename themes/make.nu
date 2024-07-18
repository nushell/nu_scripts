#!/usr/bin/env nu
use ../stdlib-candidate/std-rfc str

let current_dir = ($env.CURRENT_FILE | path dirname)

let SOURCE = {
    dir: ($current_dir | path join "lemnos" "themes")
    local: ($current_dir | path join "lemnos")
    remote: "https://github.com/lemnos/theme.sh"
}
let themes_dir = ($current_dir | path join "nu-themes")
let color_defs_dir = ($current_dir | path join $themes_dir | path join "theme-colors")

def make_theme [ name: string ] {
    $"
        export-env {
            use ./theme-colors/($name).nu *

            ($name)-theme set color_config
            ($name)-theme update terminal
        }
        "
    | str dedent
    | save --force ({
        parent: $themes_dir
        stem: $"($name)"
        extension: "nu"
    } | path join)

}
def make_theme_commands [name: string] {
    let colors = (
        open ($SOURCE.dir | path join $name)
        | lines --skip-empty
        | find --invert --regex '^#'
        | split column " "
        | rename name rgb
        | transpose -r
        | into record
    )

    let update_terminal_command = $"
        export def \"update terminal\" [] {
            let theme = \(get color_config)

            # Set terminal colors
            let osc_screen_foreground_color = '10;'
            let osc_screen_background_color = '11;'
            let osc_cursor_color = '12;'
            
            $\"
                \(ansi -o $osc_screen_foreground_color)\($theme.foreground)\(char bel)
                \(ansi -o $osc_screen_background_color)\($theme.background)\(char bel)
                \(ansi -o $osc_cursor_color)\($theme.cursor)\(char bel)
            \"
            | str replace --all \"\\n\" ''
            | print $in
        }
        "
        | str dedent

    let set_color_config_command = $"
        export def --env \"set color_config\" [] {
            $env.config.color_config = \(get color_config)
        }
        "
        | str dedent

    let get_color_config_command = $'
        export def "get color_config" [] {
            return {
                separator: "($colors.color7)"
                leading_trailing_space_bg: { attr: "n" }
                header: { fg: "($colors.color2)" attr: "b" }
                empty: "($colors.color4)"
                bool: {|| if $in { "($colors.color14)" } else { "light_gray" } }
                int: "($colors.color7)"
                filesize: {|e|
                    if $e == 0b {
                        "($colors.color7)"
                    } else if $e < 1mb {
                        "($colors.color6)"
                    } else {{ fg: "($colors.color4)" }}
                }
                duration: "($colors.color7)"
                date: {|| (char lparen)date now(char rparen) - $in |
                    if $in < 1hr {
                        { fg: "($colors.color1)" attr: "b" }
                    } else if $in < 6hr {
                        "($colors.color1)"
                    } else if $in < 1day {
                        "($colors.color3)"
                    } else if $in < 3day {
                        "($colors.color2)"
                    } else if $in < 1wk {
                        { fg: "($colors.color2)" attr: "b" }
                    } else if $in < 6wk {
                        "($colors.color6)"
                    } else if $in < 52wk {
                        "($colors.color4)"
                    } else { "dark_gray" }
                }
                range: "($colors.color7)"
                float: "($colors.color7)"
                string: "($colors.color7)"
                nothing: "($colors.color7)"
                binary: "($colors.color7)"
                cellpath: "($colors.color7)"
                row_index: { fg: "($colors.color2)" attr: "b" }
                record: "($colors.color7)"
                list: "($colors.color7)"
                block: "($colors.color7)"
                hints: "dark_gray"
                search_result: { fg: "($colors.color1)" bg: "($colors.color7)" }

                shape_and: { fg: "($colors.color5)" attr: "b" }
                shape_binary: { fg: "($colors.color5)" attr: "b" }
                shape_block: { fg: "($colors.color4)" attr: "b" }
                shape_bool: "($colors.color14)"
                shape_custom: "($colors.color2)"
                shape_datetime: { fg: "($colors.color6)" attr: "b" }
                shape_directory: "($colors.color6)"
                shape_external: "($colors.color6)"
                shape_externalarg: { fg: "($colors.color2)" attr: "b" }
                shape_filepath: "($colors.color6)"
                shape_flag: { fg: "($colors.color4)" attr: "b" }
                shape_float: { fg: "($colors.color5)" attr: "b" }
                shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
                shape_globpattern: { fg: "($colors.color6)" attr: "b" }
                shape_int: { fg: "($colors.color5)" attr: "b" }
                shape_internalcall: { fg: "($colors.color6)" attr: "b" }
                shape_list: { fg: "($colors.color6)" attr: "b" }
                shape_literal: "($colors.color4)"
                shape_match_pattern: "($colors.color2)"
                shape_matching_brackets: { attr: "u" }
                shape_nothing: "($colors.color14)"
                shape_operator: "($colors.color3)"
                shape_or: { fg: "($colors.color5)" attr: "b" }
                shape_pipe: { fg: "($colors.color5)" attr: "b" }
                shape_range: { fg: "($colors.color3)" attr: "b" }
                shape_record: { fg: "($colors.color6)" attr: "b" }
                shape_redirection: { fg: "($colors.color5)" attr: "b" }
                shape_signature: { fg: "($colors.color2)" attr: "b" }
                shape_string: "($colors.color2)"
                shape_string_interpolation: { fg: "($colors.color6)" attr: "b" }
                shape_table: { fg: "($colors.color4)" attr: "b" }
                shape_variable: "($colors.color5)"

                background: "($colors.background)"
                foreground: "($colors.foreground)"
                cursor: "($colors.cursor)"
            }
        }
        '
        | str dedent

    let fix_indent = {
        str replace -ra '(.*)' '        $1'
        | str replace -r '(?m)^        ' ''
    }

    $"
    export module \"($name)-theme\" {
        ($update_terminal_command | do $fix_indent)
        ($get_color_config_command | do $fix_indent)
        ($set_color_config_command | do $fix_indent)
    }
    "
    | str dedent
    | save --force ({
        parent: $color_defs_dir
        stem: $"($name)"
        extension: "nu"
    } | path join)
}

def main [] {
    mkdir $themes_dir
    mkdir $color_defs_dir

    try { git clone $SOURCE.remote $SOURCE.local }

    ls $SOURCE.dir
    | get name
    | path parse
    | get stem
    | each {|theme|
        print $"Converting ($theme)"
        try {
            make_theme_commands $theme
            make_theme $theme
        } catch {|e|
            print -e $"Error converting ($theme)"
            print -e $e.debug 
        }
    }
    | ignore

    print "all done"
}
