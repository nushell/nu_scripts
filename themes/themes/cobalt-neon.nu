export def main [] {
    # extra desired values for the cobalt_neon theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#142838"
    # foreground: "#8ff586"
    # cursor: "#8ff586"

    {
        # color for nushell primitives
        separator: "#8ff586"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8ff586"
        empty: "#8ff586"
        bool: "#8ff586"
        int: "#8ff586"
        filesize: "#8ff586"
        duration: "#8ff586"
        date: "#8ff586"
        range: "#8ff586"
        float: "#8ff586"
        string: "#8ff586"
        nothing: "#8ff586"
        binary: "#8ff586"
        cellpath: "#8ff586"
        row_index: "#8ff586"
        record: "#8ff586"
        list: "#8ff586"
        block: "#8ff586"
        hints: "#fff688"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8230a7"
        shape_bool: "#6cbc67"
        shape_int: "#8230a7"
        shape_float: "#8230a7"
        shape_range: "#e9f06d"
        shape_internalcall: "#6cbc67"
        shape_external: "#8ff586"
        shape_externalarg: "#8ff586"
        shape_literal: "#8ff586"
        shape_operator: "#e9e75c"
        shape_signature: "#8ff586"
        shape_string: "#3ba5ff"
        shape_string_interpolation: "#6cbc67"
        shape_datetime: "#6cbc67"
        shape_list: "#6cbc67"
        shape_table: "#3c7dd2"
        shape_record: "#6cbc67"
        shape_block: "#3c7dd2"
        shape_filepath: "#8ff586"
        shape_globpattern: "#6cbc67"
        shape_variable: "#781aa0"
        shape_flag: "#3c7dd2"
        shape_custom: "#3ba5ff"
        shape_nothing: "#6cbc67"
    }
}
