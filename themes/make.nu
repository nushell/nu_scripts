#!/usr/bin/env nu

let current_dir = ($env.CURRENT_FILE | path dirname)

let SOURCE = {
    dir: ($current_dir | path join "lemnos" "themes")
    local: ($current_dir | path join "lemnos")
    remote: "https://github.com/lemnos/theme.sh"
}
let THEMES = ($current_dir | path join "themes")

def make-theme [name: string] {
    let colors = (
        open ($SOURCE.dir | path join $name)
        | lines --skip-empty
        | find --invert --regex '^#'
        | split column " "
        | rename name rgb
        | transpose -r
        | into record
    )

    $'export def main [] { return {
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
}}'
    | save --force ({
        parent: $THEMES
        stem: $name
        extension: "nu"
    } | path join)
}

def main [] {
    mkdir $THEMES

    try { git clone $SOURCE.remote $SOURCE.local }

    ls $SOURCE.dir
    | get name
    | path parse
    | get stem
    | each {|theme|
        print -n $"(ansi erase_line)($theme)\r"
        make-theme $theme
    }
    | ignore

    print "all done"
}
