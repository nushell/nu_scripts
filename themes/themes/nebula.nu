export def main [] {
    # extra desired values for the nebula theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#22273b"
    # foreground: "#a4a6a9"
    # cursor: "#a4a6a9"

    {
        # color for nushell primitives
        separator: "#8dbdaa"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#6562a8"
        empty: "#4d6bb6"
        bool: "#8dbdaa"
        int: "#8dbdaa"
        filesize: "#8dbdaa"
        duration: "#8dbdaa"
        date: "#8dbdaa"
        range: "#8dbdaa"
        float: "#8dbdaa"
        string: "#8dbdaa"
        nothing: "#8dbdaa"
        binary: "#8dbdaa"
        cellpath: "#8dbdaa"
        row_index: "#6562a8"
        record: "#8dbdaa"
        list: "#8dbdaa"
        block: "#8dbdaa"
        hints: "#6e6f72"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#716cae"
        shape_bool: "#226f68"
        shape_int: "#716cae"
        shape_float: "#716cae"
        shape_range: "#4f9062"
        shape_internalcall: "#226f68"
        shape_external: "#226f68"
        shape_externalarg: "#6562a8"
        shape_literal: "#4d6bb6"
        shape_operator: "#4f9062"
        shape_signature: "#6562a8"
        shape_string: "#6562a8"
        shape_string_interpolation: "#226f68"
        shape_datetime: "#226f68"
        shape_list: "#226f68"
        shape_table: "#4d6bb6"
        shape_record: "#226f68"
        shape_block: "#4d6bb6"
        shape_filepath: "#226f68"
        shape_globpattern: "#226f68"
        shape_variable: "#716cae"
        shape_flag: "#4d6bb6"
        shape_custom: "#6562a8"
        shape_nothing: "#226f68"
    }
}
