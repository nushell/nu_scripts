#!/usr/bin/env nu

def main [] {
    def preview [attr: string] {
        let color = $in
        $"(ansi -e {fg: $color attr: $attr})($color)(ansi reset)"
    }

    let colors = [
        [normal   rgb];

        [black   '#000000']
        [red     '#FF0000']
        [green   '#00FF00']
        [yellow  '#FFFF00']
        [blue    '#0000FF']
        [magenta '#FF00FF']
        [purple  '#FF00FF']
        [cyan    '#00FFFF']
        [white   '#FFFFFF']
    ]

    $colors | each {|color| {
        dimmed: ($color.normal | preview d)
        normal: ($color.normal | preview n)
        bold: ($color.normal | preview b)

        rgb_dimmed: ($color.rgb | preview d)
        rgb_normal: ($color.rgb | preview n)
        rgb_bold: ($color.rgb | preview b)
    }}
}
