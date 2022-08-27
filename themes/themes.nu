use colors.nu *

# for more information on themes see
# https://www.nushell.sh/book/coloring_and_theming.html
export def dark [] {
    {
        # color for nushell primitives
        separator: white
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: green_bold
        empty: blue
        bool: white
        int: white
        filesize: white
        duration: white
        date: white
        range: white
        float: white
        string: white
        nothing: white
        binary: white
        cellpath: white
        row_index: green_bold
        record: white
        list: white
        block: white
        hints: dark_gray

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: purple_bold
        shape_bool: light_cyan
        shape_int: purple_bold
        shape_float: purple_bold
        shape_range: yellow_bold
        shape_internalcall: cyan_bold
        shape_external: cyan
        shape_externalarg: green_bold
        shape_literal: blue
        shape_operator: yellow
        shape_signature: green_bold
        shape_string: green
        shape_string_interpolation: cyan_bold
        shape_datetime: cyan_bold
        shape_list: cyan_bold
        shape_table: blue_bold
        shape_record: cyan_bold
        shape_block: blue_bold
        shape_filepath: cyan
        shape_globpattern: cyan_bold
        shape_variable: purple
        shape_flag: blue_bold
        shape_custom: green
        shape_nothing: light_cyan
    }
}

export def light [] {
    {
        # color for nushell primitives
        separator: dark_gray
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: green_bold
        empty: blue
        bool: dark_gray
        int: dark_gray
        filesize: dark_gray
        duration: dark_gray
        date: dark_gray
        range: dark_gray
        float: dark_gray
        string: dark_gray
        nothing: dark_gray
        binary: dark_gray
        cellpath: dark_gray
        row_index: green_bold
        record: white
        list: white
        block: white
        hints: dark_gray

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: purple_bold
        shape_bool: light_cyan
        shape_int: purple_bold
        shape_float: purple_bold
        shape_range: yellow_bold
        shape_internalcall: cyan_bold
        shape_external: cyan
        shape_externalarg: green_bold
        shape_literal: blue
        shape_operator: yellow
        shape_signature: green_bold
        shape_string: green
        shape_string_interpolation: cyan_bold
        shape_datetime: cyan_bold
        shape_list: cyan_bold
        shape_table: blue_bold
        shape_record: cyan_bold
        shape_block: blue_bold
        shape_filepath: cyan
        shape_globpattern: cyan_bold
        shape_variable: purple
        shape_flag: blue_bold
        shape_custom: green
        shape_nothing: light_cyan
    }
}

export def base16 [] {
    {
        separator: (base03)
        leading_trailing_space_bg: (base04)
        header: (base0b)
        date: (base0e)
        filesize: (base0d)
        row_index: (base0c)
        bool: (base08)
        int: (base0b)
        duration: (base08)
        range: (base08)
        float: (base08)
        string: (base04)
        nothing: (base08)
        binary: (base08)
        cellpath: (base08)
        hints: dark_gray

        # shape_garbage: { fg: (base07) bg: (base08) attr: b} # base16 white on red
        # but i like the regular white on red for parse errors
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_bool: (base0d)
        shape_int: { fg: (base0e) attr: b}
        shape_float: { fg: (base0e) attr: b}
        shape_range: { fg: (base0a) attr: b}
        shape_internalcall: { fg: (base0c) attr: b}
        shape_external: (base0c)
        shape_externalarg: { fg: (base0b) attr: b}
        shape_literal: (base0d)
        shape_operator: (base0a)
        shape_signature: { fg: (base0b) attr: b}
        shape_string: (base0b)
        shape_filepath: (base0d)
        shape_globpattern: { fg: (base0d) attr: b}
        shape_variable: (base0e)
        shape_flag: { fg: (base0d) attr: b}
        shape_custom: {attr: b}
    }
}
