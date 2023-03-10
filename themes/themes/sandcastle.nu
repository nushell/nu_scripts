export def main [] {
    # extra desired values for the sandcastle theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#282c34"
    # foreground: "#a89984"
    # cursor: "#a89984"

    {
        # color for nushell primitives
        separator: "#fdf4c1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#528b8b"
        empty: "#83a598"
        bool: "#fdf4c1"
        int: "#fdf4c1"
        filesize: "#fdf4c1"
        duration: "#fdf4c1"
        date: "#fdf4c1"
        range: "#fdf4c1"
        float: "#fdf4c1"
        string: "#fdf4c1"
        nothing: "#fdf4c1"
        binary: "#fdf4c1"
        cellpath: "#fdf4c1"
        row_index: "#528b8b"
        record: "#fdf4c1"
        list: "#fdf4c1"
        block: "#fdf4c1"
        hints: "#665c54"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d75f5f"
        shape_bool: "#83a598"
        shape_int: "#d75f5f"
        shape_float: "#d75f5f"
        shape_range: "#a07e3b"
        shape_internalcall: "#83a598"
        shape_external: "#83a598"
        shape_externalarg: "#528b8b"
        shape_literal: "#83a598"
        shape_operator: "#a07e3b"
        shape_signature: "#528b8b"
        shape_string: "#528b8b"
        shape_string_interpolation: "#83a598"
        shape_datetime: "#83a598"
        shape_list: "#83a598"
        shape_table: "#83a598"
        shape_record: "#83a598"
        shape_block: "#83a598"
        shape_filepath: "#83a598"
        shape_globpattern: "#83a598"
        shape_variable: "#d75f5f"
        shape_flag: "#83a598"
        shape_custom: "#528b8b"
        shape_nothing: "#83a598"
    }
}
