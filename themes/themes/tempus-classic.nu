export def main [] {
    # extra desired values for the tempus_classic theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#232323"
    # foreground: "#aeadaf"
    # cursor: "#aeadaf"

    {
        # color for nushell primitives
        separator: "#aeadaf"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#96a42d"
        empty: "#6e9cb0"
        bool: "#aeadaf"
        int: "#aeadaf"
        filesize: "#aeadaf"
        duration: "#aeadaf"
        date: "#aeadaf"
        range: "#aeadaf"
        float: "#aeadaf"
        string: "#aeadaf"
        nothing: "#aeadaf"
        binary: "#aeadaf"
        cellpath: "#aeadaf"
        row_index: "#96a42d"
        record: "#aeadaf"
        list: "#aeadaf"
        block: "#aeadaf"
        hints: "#312e30"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d58888"
        shape_bool: "#7aa880"
        shape_int: "#d58888"
        shape_float: "#d58888"
        shape_range: "#a8a030"
        shape_internalcall: "#7aa880"
        shape_external: "#6da280"
        shape_externalarg: "#96a42d"
        shape_literal: "#6e9cb0"
        shape_operator: "#b1942b"
        shape_signature: "#96a42d"
        shape_string: "#8c9e3d"
        shape_string_interpolation: "#7aa880"
        shape_datetime: "#7aa880"
        shape_list: "#7aa880"
        shape_table: "#8e9cc0"
        shape_record: "#7aa880"
        shape_block: "#8e9cc0"
        shape_filepath: "#6da280"
        shape_globpattern: "#7aa880"
        shape_variable: "#b58d88"
        shape_flag: "#8e9cc0"
        shape_custom: "#8c9e3d"
        shape_nothing: "#7aa880"
    }
}
