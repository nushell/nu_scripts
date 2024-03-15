# Build a color config for engine-q based on generated base16 file
#
# The input file is supposed to have 16 lines, each base16 colors on a separate
# line like this:
#
# ```
# #base00-hex
# #base01-hex
# ...etc.
# #base0f-hex
# ```
export def build-nu-config [base_txt: path] {
    let b16 = (from-file $base_txt)

    {
        separator: $b16.base03
        leading_trailing_space_bg: $b16.base04
        header: $b16.base0b
        date: $b16.base0e
        filesize: $b16.base0d
        row_index: $b16.base0c
        bool: $b16.base08
        int: $b16.base0b
        duration: $b16.base08
        range: $b16.base08
        float: $b16.base08
        string: $b16.base04
        nothing: $b16.base08
        binary: $b16.base08
        cellpath: $b16.base08
        hints: dark_gray

        # base16 white on red
        flatshape_garbage: { fg: $b16.base07 bg: $b16.base08 attr: b}
        # if you like the regular white on red for parse errors:
        # flatshape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        flatshape_bool: $b16.base0d
        flatshape_int: { fg: $b16.base0e attr: b}
        flatshape_float: { fg: $b16.base0e attr: b}
        flatshape_range: { fg: $b16.base0a attr: b}
        flatshape_internalcall: { fg: $b16.base0c attr: b}
        flatshape_external: $b16.base0c
        flatshape_externalarg: { fg: $b16.base0b attr: b}
        flatshape_literal: $b16.base0d
        flatshape_operator: $b16.base0a
        flatshape_signature: { fg: $b16.base0b attr: b}
        flatshape_string: $b16.base0b
        flatshape_filepath: $b16.base0d
        flatshape_globpattern: { fg: $b16.base0d attr: b}
        flatshape_variable: $b16.base0e
        flatshape_flag: { fg: $b16.base0d attr: b}
        flatshape_custom: {attr: b}
    }
}

# Generate Alacritty color config to be included in the main Alacritty config
#
# It injects the base16 colors into the Alacritty config template
export def build-alacritty-config [base_txt: path] {
    let base16 = (from-file-table $base_txt)
    let template = (
        open "~/.config/nushell/alacritty_colors.mustache" |
        decode utf-8
    )

    # TODO: need a save command:
    # | save --raw "~/.config/alacritty/alacritty_colors.yml"
    let conf = ($base16 | apply-base16-mustache $template)

    $env.ALACRITTY_CONFIG = $conf

    nu -c "$nu.env.ALACRITTY_CONFIG | save --raw '~/.config/alacritty/alacritty_colors.yml'"
}

# Generate LS_COLORS value
export def build-lscolors [base_txt: path] {
    # TODO
}

# Show the current base16 colors
export def show [base_txt: path] {
    from-file $base_txt | each { |it|
        { $it.column: $"(ansi -e { fg: ($it.value) bg: ($it.value) })($it.value)(ansi reset)" }
    }
}

# Regenerate the wallpaper, its base16 theme, and apply it to external tools
export def new-wallpaper [] {
    ~/.fehbg.nu
    ~/.auto_base16.nu
    build-alacritty-config $env.BASE16_TXT
}

# Get base16 as a record from an input file
export def from-file [base_txt: path] {
    let base16_lines = (open $base_txt | lines | where ($it | str length) > 0)

    {
        base00 : $base16_lines.0 # Default Background
        base01 : $base16_lines.1 # Lighter Background (Used for status bars, line number and folding marks)
        base02 : $base16_lines.2 # Selection Background
        base03 : $base16_lines.3 # Comments, Invisibles, Line Highlighting
        base04 : $base16_lines.4 # Dark Foreground (Used for status bars)
        base05 : $base16_lines.5 # Default Foreground, Caret, Delimiters, Operators
        base06 : $base16_lines.6 # Light Foreground (Not often used)
        base07 : $base16_lines.7 # Light Background (Not often used)
        base08 : $base16_lines.8 # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
        base09 : $base16_lines.9 # Integers, Boolean, Constants, XML Attributes, Markup Link Url
        base0a : $base16_lines.10 # Classes, Markup Bold, Search Text Background
        base0b : $base16_lines.11 # Strings, Inherited Class, Markup Code, Diff Inserted
        base0c : $base16_lines.12 # Support, Regular Expressions, Escape Characters, Markup Quotes
        base0d : $base16_lines.13 # Functions, Methods, Attribute IDs, Headings
        base0e : $base16_lines.14 # Keywords, Storage, Selector, Markup Italic, Diff Changed
        base0f : $base16_lines.15 # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
    }
}

# Get base16 as a table from an input file
export def from-file-table [base_txt: path] {
    let base16_lines = (open $base_txt | lines | where ($it | str length) > 0)

    [
        [ name     color             ];
        [ base00   $base16_lines.0   ] # Default Background
        [ base01   $base16_lines.1   ] # Lighter Background (Used for status bars, line number and folding marks)
        [ base02   $base16_lines.2   ] # Selection Background
        [ base03   $base16_lines.3   ] # Comments, Invisibles, Line Highlighting
        [ base04   $base16_lines.4   ] # Dark Foreground (Used for status bars)
        [ base05   $base16_lines.5   ] # Default Foreground, Caret, Delimiters, Operators
        [ base06   $base16_lines.6   ] # Light Foreground (Not often used)
        [ base07   $base16_lines.7   ] # Light Background (Not often used)
        [ base08   $base16_lines.8   ] # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
        [ base09   $base16_lines.9   ] # Integers, Boolean, Constants, XML Attributes, Markup Link Url
        [ base0a   $base16_lines.10  ] # Classes, Markup Bold, Search Text Background
        [ base0b   $base16_lines.11  ] # Strings, Inherited Class, Markup Code, Diff Inserted
        [ base0c   $base16_lines.12  ] # Support, Regular Expressions, Escape Characters, Markup Quotes
        [ base0d   $base16_lines.13  ] # Functions, Methods, Attribute IDs, Headings
        [ base0e   $base16_lines.14  ] # Keywords, Storage, Selector, Markup Italic, Diff Changed
        [ base0f   $base16_lines.15  ] # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
    ]
}

# Replace {{baseXX-hex}} with proper colors, such as #ffeedd
def apply-base16-mustache [template: string] {
    reduce -f $template { |it|
        let subs = $"\{\{($it.item.name)-hex\}\}"  # regex
        let color = $it.item.color
        $it.acc | str replace -a $subs $color
    }
}
