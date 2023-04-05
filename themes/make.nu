#!/usr/bin/env nu

let SOURCE = {
    dir: ([lemnos themes] | path join)
    local: "lemnos"
    remote: "https://github.com/lemnos/theme.sh"
}
let THEMES = "themes"

def make-theme [name: string] {
    let colors = (
        open ($SOURCE.dir | path join $name)
        | lines
        | split column " "
        | rename name rgb
        | transpose -r
        | into record
    )

    let theme = ({
        separator: $colors.color15
        leading_trailing_space_bg: { attr: n }
        header: $colors.color10
        empty: $colors.color4
        bool: $colors.color15
        int: $colors.color15
        filesize: $colors.color15
        duration: $colors.color15
        date: $colors.color15
        range: $colors.color15
        float: $colors.color15
        string: $colors.color15
        nothing: $colors.color15
        binary: $colors.color15
        cellpath: $colors.color15
        row_index: $colors.color10
        record: $colors.color15
        list: $colors.color15
        block: $colors.color15
        hints: $colors.color8

        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: $colors.color13
        shape_bool: $colors.color14
        shape_int: $colors.color13
        shape_float: $colors.color13
        shape_range: $colors.color11
        shape_internalcall: $colors.color14
        shape_external: $colors.color6
        shape_externalarg: $colors.color10
        shape_literal: $colors.color4
        shape_operator: $colors.color3
        shape_signature: $colors.color10
        shape_string: $colors.color2
        shape_string_interpolation: $colors.color14
        shape_datetime: $colors.color14
        shape_list: $colors.color14
        shape_table: $colors.color12
        shape_record: $colors.color14
        shape_block: $colors.color12
        shape_filepath: $colors.color6
        shape_globpattern: $colors.color14
        shape_variable: $colors.color5
        shape_flag: $colors.color12
        shape_custom: $colors.color2
        shape_nothing: $colors.color14

        background: $colors.background
        foreground: $colors.foreground
        cursor: $colors.cursor
    }
    | to nuon -i 4)

    $"export def main [] { return ($theme)}"
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
