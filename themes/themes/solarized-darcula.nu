export def main [] {
    # extra desired values for the solarized_darcula theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#3d3f41"
    # foreground: "#d2d8d9"
    # cursor: "#d2d8d9"

    {
        # color for nushell primitives
        separator: "#d2d8d9"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#629655"
        empty: "#2075c7"
        bool: "#d2d8d9"
        int: "#d2d8d9"
        filesize: "#d2d8d9"
        duration: "#d2d8d9"
        date: "#d2d8d9"
        range: "#d2d8d9"
        float: "#d2d8d9"
        string: "#d2d8d9"
        nothing: "#d2d8d9"
        binary: "#d2d8d9"
        cellpath: "#d2d8d9"
        row_index: "#629655"
        record: "#d2d8d9"
        list: "#d2d8d9"
        block: "#d2d8d9"
        hints: "#25292a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#797fd4"
        shape_bool: "#15968d"
        shape_int: "#797fd4"
        shape_float: "#797fd4"
        shape_range: "#b68800"
        shape_internalcall: "#15968d"
        shape_external: "#15968d"
        shape_externalarg: "#629655"
        shape_literal: "#2075c7"
        shape_operator: "#b68800"
        shape_signature: "#629655"
        shape_string: "#629655"
        shape_string_interpolation: "#15968d"
        shape_datetime: "#15968d"
        shape_list: "#15968d"
        shape_table: "#2075c7"
        shape_record: "#15968d"
        shape_block: "#2075c7"
        shape_filepath: "#15968d"
        shape_globpattern: "#15968d"
        shape_variable: "#797fd4"
        shape_flag: "#2075c7"
        shape_custom: "#629655"
        shape_nothing: "#15968d"
    }
}
