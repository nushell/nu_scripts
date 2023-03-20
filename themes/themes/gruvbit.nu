export def main [] {
    # extra desired values for the gruvbit theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1d1f21"
    # foreground: "#ebdbb2"
    # cursor: "#ebdbb2"

    {
        # color for nushell primitives
        separator: "#e9593d"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8ec07c"
        empty: "#83a598"
        bool: "#e9593d"
        int: "#e9593d"
        filesize: "#e9593d"
        duration: "#e9593d"
        date: "#e9593d"
        range: "#e9593d"
        float: "#e9593d"
        string: "#e9593d"
        nothing: "#e9593d"
        binary: "#e9593d"
        cellpath: "#e9593d"
        row_index: "#8ec07c"
        record: "#e9593d"
        list: "#e9593d"
        block: "#e9593d"
        hints: "#968772"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fe8019"
        shape_bool: "#e9593d"
        shape_int: "#fe8019"
        shape_float: "#fe8019"
        shape_range: "#dc9656"
        shape_internalcall: "#e9593d"
        shape_external: "#e9593d"
        shape_externalarg: "#8ec07c"
        shape_literal: "#83a598"
        shape_operator: "#dc9656"
        shape_signature: "#8ec07c"
        shape_string: "#8ec07c"
        shape_string_interpolation: "#e9593d"
        shape_datetime: "#e9593d"
        shape_list: "#e9593d"
        shape_table: "#83a598"
        shape_record: "#e9593d"
        shape_block: "#83a598"
        shape_filepath: "#e9593d"
        shape_globpattern: "#e9593d"
        shape_variable: "#fe8019"
        shape_flag: "#83a598"
        shape_custom: "#8ec07c"
        shape_nothing: "#e9593d"
    }
}
