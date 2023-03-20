export def main [] {
    # extra desired values for the atom theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#161719"
    # foreground: "#c5c8c6"
    # cursor: "#c5c8c6"

    {
        # color for nushell primitives
        separator: "#e0e0e0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#94fa36"
        empty: "#85befd"
        bool: "#e0e0e0"
        int: "#e0e0e0"
        filesize: "#e0e0e0"
        duration: "#e0e0e0"
        date: "#e0e0e0"
        range: "#e0e0e0"
        float: "#e0e0e0"
        string: "#e0e0e0"
        nothing: "#e0e0e0"
        binary: "#e0e0e0"
        cellpath: "#e0e0e0"
        row_index: "#94fa36"
        record: "#e0e0e0"
        list: "#e0e0e0"
        block: "#e0e0e0"
        hints: "#000000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b9b6fc"
        shape_bool: "#85befd"
        shape_int: "#b9b6fc"
        shape_float: "#b9b6fc"
        shape_range: "#f5ffa8"
        shape_internalcall: "#85befd"
        shape_external: "#85befd"
        shape_externalarg: "#94fa36"
        shape_literal: "#85befd"
        shape_operator: "#ffd7b1"
        shape_signature: "#94fa36"
        shape_string: "#87c38a"
        shape_string_interpolation: "#85befd"
        shape_datetime: "#85befd"
        shape_list: "#85befd"
        shape_table: "#96cbfe"
        shape_record: "#85befd"
        shape_block: "#96cbfe"
        shape_filepath: "#85befd"
        shape_globpattern: "#85befd"
        shape_variable: "#b9b6fc"
        shape_flag: "#96cbfe"
        shape_custom: "#87c38a"
        shape_nothing: "#85befd"
    }
}
