export def main [] {
    # extra desired values for the pasque theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#271c3a"
    # foreground: "#dedcdf"
    # cursor: "#dedcdf"

    {
        # color for nushell primitives
        separator: "#bbaadd"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#c6914b"
        empty: "#8e7dc6"
        bool: "#bbaadd"
        int: "#bbaadd"
        filesize: "#bbaadd"
        duration: "#bbaadd"
        date: "#bbaadd"
        range: "#bbaadd"
        float: "#bbaadd"
        string: "#bbaadd"
        nothing: "#bbaadd"
        binary: "#bbaadd"
        cellpath: "#bbaadd"
        row_index: "#c6914b"
        record: "#bbaadd"
        list: "#bbaadd"
        block: "#bbaadd"
        hints: "#5d5766"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#953b9d"
        shape_bool: "#7263aa"
        shape_int: "#953b9d"
        shape_float: "#953b9d"
        shape_range: "#804ead"
        shape_internalcall: "#7263aa"
        shape_external: "#7263aa"
        shape_externalarg: "#c6914b"
        shape_literal: "#8e7dc6"
        shape_operator: "#804ead"
        shape_signature: "#c6914b"
        shape_string: "#c6914b"
        shape_string_interpolation: "#7263aa"
        shape_datetime: "#7263aa"
        shape_list: "#7263aa"
        shape_table: "#8e7dc6"
        shape_record: "#7263aa"
        shape_block: "#8e7dc6"
        shape_filepath: "#7263aa"
        shape_globpattern: "#7263aa"
        shape_variable: "#953b9d"
        shape_flag: "#8e7dc6"
        shape_custom: "#c6914b"
        shape_nothing: "#7263aa"
    }
}
