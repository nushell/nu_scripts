export def main [] {
    # extra desired values for the woodland theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#231e18"
    # foreground: "#cabcb1"
    # cursor: "#cabcb1"

    {
        # color for nushell primitives
        separator: "#e4d4c8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b7ba53"
        empty: "#88a4d3"
        bool: "#e4d4c8"
        int: "#e4d4c8"
        filesize: "#e4d4c8"
        duration: "#e4d4c8"
        date: "#e4d4c8"
        range: "#e4d4c8"
        float: "#e4d4c8"
        string: "#e4d4c8"
        nothing: "#e4d4c8"
        binary: "#e4d4c8"
        cellpath: "#e4d4c8"
        row_index: "#b7ba53"
        record: "#e4d4c8"
        list: "#e4d4c8"
        block: "#e4d4c8"
        hints: "#9d8b70"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#bb90e2"
        shape_bool: "#6eb958"
        shape_int: "#bb90e2"
        shape_float: "#bb90e2"
        shape_range: "#e0ac16"
        shape_internalcall: "#6eb958"
        shape_external: "#6eb958"
        shape_externalarg: "#b7ba53"
        shape_literal: "#88a4d3"
        shape_operator: "#e0ac16"
        shape_signature: "#b7ba53"
        shape_string: "#b7ba53"
        shape_string_interpolation: "#6eb958"
        shape_datetime: "#6eb958"
        shape_list: "#6eb958"
        shape_table: "#88a4d3"
        shape_record: "#6eb958"
        shape_block: "#88a4d3"
        shape_filepath: "#6eb958"
        shape_globpattern: "#6eb958"
        shape_variable: "#bb90e2"
        shape_flag: "#88a4d3"
        shape_custom: "#b7ba53"
        shape_nothing: "#6eb958"
    }
}
