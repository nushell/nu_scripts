export def main [] {
    # extra desired values for the equilibrium_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0c1118"
    # foreground: "#afaba2"
    # cursor: "#afaba2"

    {
        # color for nushell primitives
        separator: "#e7e2d9"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7f8b00"
        empty: "#008dd1"
        bool: "#e7e2d9"
        int: "#e7e2d9"
        filesize: "#e7e2d9"
        duration: "#e7e2d9"
        date: "#e7e2d9"
        range: "#e7e2d9"
        float: "#e7e2d9"
        string: "#e7e2d9"
        nothing: "#e7e2d9"
        binary: "#e7e2d9"
        cellpath: "#e7e2d9"
        row_index: "#7f8b00"
        record: "#e7e2d9"
        list: "#e7e2d9"
        block: "#e7e2d9"
        hints: "#7b776e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#6a7fd2"
        shape_bool: "#00948b"
        shape_int: "#6a7fd2"
        shape_float: "#6a7fd2"
        shape_range: "#bb8801"
        shape_internalcall: "#00948b"
        shape_external: "#00948b"
        shape_externalarg: "#7f8b00"
        shape_literal: "#008dd1"
        shape_operator: "#bb8801"
        shape_signature: "#7f8b00"
        shape_string: "#7f8b00"
        shape_string_interpolation: "#00948b"
        shape_datetime: "#00948b"
        shape_list: "#00948b"
        shape_table: "#008dd1"
        shape_record: "#00948b"
        shape_block: "#008dd1"
        shape_filepath: "#00948b"
        shape_globpattern: "#00948b"
        shape_variable: "#6a7fd2"
        shape_flag: "#008dd1"
        shape_custom: "#7f8b00"
        shape_nothing: "#00948b"
    }
}
