#!/usr/bin/env nu

let RAW = "lemnos/themes"
let THEMES = "themes"


def make-theme [theme: string] {
    let colors = (
        open $"($RAW)/($theme)" |
        lines |
        split column " " |
        rename name rgb
    )
    let theme_file = $"($THEMES)/($theme).nu"

    cp template.nu $theme_file

    $colors |
        each {
            |it|
            open $theme_file --raw |
            str replace $"{{($it.name)}}" $it.rgb --all |
            save $theme_file
        }

    open $theme_file --raw |
    str replace "{{theme}}" ($theme | str replace '-' '_') --all |
    save $theme_file
}


mkdir $THEMES

ls $RAW |
    get name |
    str replace $"($RAW)/" "" |
    each {
        |it|
        print $it
        make-theme $it
    }
