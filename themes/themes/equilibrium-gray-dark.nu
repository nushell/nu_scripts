export def main [] {
    # extra desired values for the equilibrium_gray-dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#111111"
    # foreground: "#ababab"
    # cursor: "#ababab"

    {
        # color for nushell primitives
        separator: "#e2e2e2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7f8b00"
        empty: "#008dd1"
        bool: "#e2e2e2"
        int: "#e2e2e2"
        filesize: "#e2e2e2"
        duration: "#e2e2e2"
        date: "#e2e2e2"
        range: "#e2e2e2"
        float: "#e2e2e2"
        string: "#e2e2e2"
        nothing: "#e2e2e2"
        binary: "#e2e2e2"
        cellpath: "#e2e2e2"
        row_index: "#7f8b00"
        record: "#e2e2e2"
        list: "#e2e2e2"
        block: "#e2e2e2"
        hints: "#777777"

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
