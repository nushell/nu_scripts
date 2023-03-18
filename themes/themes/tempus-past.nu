export def main [] {
    # extra desired values for the tempus_past theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f3f2f4"
    # foreground: "#53545b"
    # cursor: "#53545b"

    {
        # color for nushell primitives
        separator: "#f3f2f4"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#407343"
        empty: "#1763aa"
        bool: "#f3f2f4"
        int: "#f3f2f4"
        filesize: "#f3f2f4"
        duration: "#f3f2f4"
        date: "#f3f2f4"
        range: "#f3f2f4"
        float: "#f3f2f4"
        string: "#f3f2f4"
        nothing: "#f3f2f4"
        binary: "#f3f2f4"
        cellpath: "#f3f2f4"
        row_index: "#407343"
        record: "#f3f2f4"
        list: "#f3f2f4"
        block: "#f3f2f4"
        hints: "#80565d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b225ab"
        shape_bool: "#07737a"
        shape_int: "#b225ab"
        shape_float: "#b225ab"
        shape_range: "#9d524a"
        shape_internalcall: "#07737a"
        shape_external: "#096a83"
        shape_externalarg: "#407343"
        shape_literal: "#1763aa"
        shape_operator: "#a6403a"
        shape_signature: "#407343"
        shape_string: "#0a7040"
        shape_string_interpolation: "#07737a"
        shape_datetime: "#07737a"
        shape_list: "#07737a"
        shape_table: "#5a5ebb"
        shape_record: "#07737a"
        shape_block: "#5a5ebb"
        shape_filepath: "#096a83"
        shape_globpattern: "#07737a"
        shape_variable: "#b02874"
        shape_flag: "#5a5ebb"
        shape_custom: "#0a7040"
        shape_nothing: "#07737a"
    }
}
