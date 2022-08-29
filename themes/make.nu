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
            sed -i $"s/{{($it.name)}}/($it.rgb)/g" $theme_file
        }
    sed -i $"s/{{theme}}/($theme | str replace '-' '_')/" $theme_file
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
