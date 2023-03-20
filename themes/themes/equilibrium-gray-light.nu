export def main [] {
    # extra desired values for the equilibrium_gray-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f1f1f1"
    # foreground: "#474747"
    # cursor: "#474747"

    {
        # color for nushell primitives
        separator: "#1b1b1b"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#637200"
        empty: "#0073b5"
        bool: "#1b1b1b"
        int: "#1b1b1b"
        filesize: "#1b1b1b"
        duration: "#1b1b1b"
        date: "#1b1b1b"
        range: "#1b1b1b"
        float: "#1b1b1b"
        string: "#1b1b1b"
        nothing: "#1b1b1b"
        binary: "#1b1b1b"
        cellpath: "#1b1b1b"
        row_index: "#637200"
        record: "#1b1b1b"
        list: "#1b1b1b"
        block: "#1b1b1b"
        hints: "#777777"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#4e66b6"
        shape_bool: "#007a72"
        shape_int: "#4e66b6"
        shape_float: "#4e66b6"
        shape_range: "#9d6f00"
        shape_internalcall: "#007a72"
        shape_external: "#007a72"
        shape_externalarg: "#637200"
        shape_literal: "#0073b5"
        shape_operator: "#9d6f00"
        shape_signature: "#637200"
        shape_string: "#637200"
        shape_string_interpolation: "#007a72"
        shape_datetime: "#007a72"
        shape_list: "#007a72"
        shape_table: "#0073b5"
        shape_record: "#007a72"
        shape_block: "#0073b5"
        shape_filepath: "#007a72"
        shape_globpattern: "#007a72"
        shape_variable: "#4e66b6"
        shape_flag: "#0073b5"
        shape_custom: "#637200"
        shape_nothing: "#007a72"
    }
}
