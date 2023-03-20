export def main [] {
    # extra desired values for the {{theme}} theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#22272e"
    # foreground: "#768390"
    # cursor: "#6cb6ff"

    {
        # color for nushell primitives
        separator: "#cdd9e5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#6bc46d"
        empty: "#539bf5"
        bool: "#cdd9e5"
        int: "#cdd9e5"
        filesize: "#cdd9e5"
        duration: "#cdd9e5"
        date: "#cdd9e5"
        range: "#cdd9e5"
        float: "#cdd9e5"
        string: "#cdd9e5"
        nothing: "#cdd9e5"
        binary: "#cdd9e5"
        cellpath: "#cdd9e5"
        row_index: "#6bc46d"
        record: "#cdd9e5"
        list: "#cdd9e5"
        block: "#cdd9e5"
        hints: "#636e7b"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#dcbdfb"
        shape_bool: "#56d4dd"
        shape_int: "#dcbdfb"
        shape_float: "#dcbdfb"
        shape_range: "#daaa3f"
        shape_internalcall: "#56d4dd"
        shape_external: "#39c5cf"
        shape_externalarg: "#6bc46d"
        shape_literal: "#539bf5"
        shape_operator: "#c69026"
        shape_signature: "#6bc46d"
        shape_string: "#57ab5a"
        shape_string_interpolation: "#56d4dd"
        shape_datetime: "#56d4dd"
        shape_list: "#56d4dd"
        shape_table: "#6cb6ff"
        shape_record: "#56d4dd"
        shape_block: "#6cb6ff"
        shape_filepath: "#39c5cf"
        shape_globpattern: "#56d4dd"
        shape_variable: "#b083f0"
        shape_flag: "#6cb6ff"
        shape_custom: "#57ab5a"
        shape_nothing: "#56d4dd"
    }
}
