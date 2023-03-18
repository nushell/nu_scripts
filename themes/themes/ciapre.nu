export def main [] {
    # extra desired values for the ciapre theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#191c27"
    # foreground: "#aea47a"
    # cursor: "#aea47a"

    {
        # color for nushell primitives
        separator: "#f4f4f4"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a6a75d"
        empty: "#576d8c"
        bool: "#f4f4f4"
        int: "#f4f4f4"
        filesize: "#f4f4f4"
        duration: "#f4f4f4"
        date: "#f4f4f4"
        range: "#f4f4f4"
        float: "#f4f4f4"
        string: "#f4f4f4"
        nothing: "#f4f4f4"
        binary: "#f4f4f4"
        cellpath: "#f4f4f4"
        row_index: "#a6a75d"
        record: "#f4f4f4"
        list: "#f4f4f4"
        block: "#f4f4f4"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d33061"
        shape_bool: "#f3dbb2"
        shape_int: "#d33061"
        shape_float: "#d33061"
        shape_range: "#dcdf7c"
        shape_internalcall: "#f3dbb2"
        shape_external: "#5c4f4b"
        shape_externalarg: "#a6a75d"
        shape_literal: "#576d8c"
        shape_operator: "#cc8b3f"
        shape_signature: "#a6a75d"
        shape_string: "#48513b"
        shape_string_interpolation: "#f3dbb2"
        shape_datetime: "#f3dbb2"
        shape_list: "#f3dbb2"
        shape_table: "#3097c6"
        shape_record: "#f3dbb2"
        shape_block: "#3097c6"
        shape_filepath: "#5c4f4b"
        shape_globpattern: "#f3dbb2"
        shape_variable: "#724d7c"
        shape_flag: "#3097c6"
        shape_custom: "#48513b"
        shape_nothing: "#f3dbb2"
    }
}
