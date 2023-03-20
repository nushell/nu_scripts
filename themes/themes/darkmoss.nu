export def main [] {
    # extra desired values for the darkmoss theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#171e1f"
    # foreground: "#c7c7a5"
    # cursor: "#c7c7a5"

    {
        # color for nushell primitives
        separator: "#e1eaef"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#499180"
        empty: "#498091"
        bool: "#e1eaef"
        int: "#e1eaef"
        filesize: "#e1eaef"
        duration: "#e1eaef"
        date: "#e1eaef"
        range: "#e1eaef"
        float: "#e1eaef"
        string: "#e1eaef"
        nothing: "#e1eaef"
        binary: "#e1eaef"
        cellpath: "#e1eaef"
        row_index: "#499180"
        record: "#e1eaef"
        list: "#e1eaef"
        block: "#e1eaef"
        hints: "#555e5f"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9bc0c8"
        shape_bool: "#66d9ef"
        shape_int: "#9bc0c8"
        shape_float: "#9bc0c8"
        shape_range: "#fdb11f"
        shape_internalcall: "#66d9ef"
        shape_external: "#66d9ef"
        shape_externalarg: "#499180"
        shape_literal: "#498091"
        shape_operator: "#fdb11f"
        shape_signature: "#499180"
        shape_string: "#499180"
        shape_string_interpolation: "#66d9ef"
        shape_datetime: "#66d9ef"
        shape_list: "#66d9ef"
        shape_table: "#498091"
        shape_record: "#66d9ef"
        shape_block: "#498091"
        shape_filepath: "#66d9ef"
        shape_globpattern: "#66d9ef"
        shape_variable: "#9bc0c8"
        shape_flag: "#498091"
        shape_custom: "#499180"
        shape_nothing: "#66d9ef"
    }
}
