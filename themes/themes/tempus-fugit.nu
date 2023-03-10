export def main [] {
    # extra desired values for the tempus_fugit theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fff5f3"
    # foreground: "#4d595f"
    # cursor: "#4d595f"

    {
        # color for nushell primitives
        separator: "#fff5f3"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#447720"
        empty: "#1666b0"
        bool: "#fff5f3"
        int: "#fff5f3"
        filesize: "#fff5f3"
        duration: "#fff5f3"
        date: "#fff5f3"
        range: "#fff5f3"
        float: "#fff5f3"
        string: "#fff5f3"
        nothing: "#fff5f3"
        binary: "#fff5f3"
        cellpath: "#fff5f3"
        row_index: "#447720"
        record: "#fff5f3"
        list: "#fff5f3"
        block: "#fff5f3"
        hints: "#7b6471"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a438c0"
        shape_bool: "#00786a"
        shape_int: "#a438c0"
        shape_float: "#a438c0"
        shape_range: "#985d00"
        shape_internalcall: "#00786a"
        shape_external: "#007072"
        shape_externalarg: "#447720"
        shape_literal: "#1666b0"
        shape_operator: "#825e00"
        shape_signature: "#447720"
        shape_string: "#357200"
        shape_string_interpolation: "#00786a"
        shape_datetime: "#00786a"
        shape_list: "#00786a"
        shape_table: "#485ddf"
        shape_record: "#00786a"
        shape_block: "#485ddf"
        shape_filepath: "#007072"
        shape_globpattern: "#00786a"
        shape_variable: "#a83884"
        shape_flag: "#485ddf"
        shape_custom: "#357200"
        shape_nothing: "#00786a"
    }
}
