export def main [] {
    # extra desired values for the classic_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f5f5f5"
    # foreground: "#303030"
    # cursor: "#303030"

    {
        # color for nushell primitives
        separator: "#151515"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#90a959"
        empty: "#6a9fb5"
        bool: "#151515"
        int: "#151515"
        filesize: "#151515"
        duration: "#151515"
        date: "#151515"
        range: "#151515"
        float: "#151515"
        string: "#151515"
        nothing: "#151515"
        binary: "#151515"
        cellpath: "#151515"
        row_index: "#90a959"
        record: "#151515"
        list: "#151515"
        block: "#151515"
        hints: "#b0b0b0"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#aa759f"
        shape_bool: "#75b5aa"
        shape_int: "#aa759f"
        shape_float: "#aa759f"
        shape_range: "#f4bf75"
        shape_internalcall: "#75b5aa"
        shape_external: "#75b5aa"
        shape_externalarg: "#90a959"
        shape_literal: "#6a9fb5"
        shape_operator: "#f4bf75"
        shape_signature: "#90a959"
        shape_string: "#90a959"
        shape_string_interpolation: "#75b5aa"
        shape_datetime: "#75b5aa"
        shape_list: "#75b5aa"
        shape_table: "#6a9fb5"
        shape_record: "#75b5aa"
        shape_block: "#6a9fb5"
        shape_filepath: "#75b5aa"
        shape_globpattern: "#75b5aa"
        shape_variable: "#aa759f"
        shape_flag: "#6a9fb5"
        shape_custom: "#90a959"
        shape_nothing: "#75b5aa"
    }
}
