export def main [] {
    # extra desired values for the classic_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#151515"
    # foreground: "#d0d0d0"
    # cursor: "#d0d0d0"

    {
        # color for nushell primitives
        separator: "#f5f5f5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#90a959"
        empty: "#6a9fb5"
        bool: "#f5f5f5"
        int: "#f5f5f5"
        filesize: "#f5f5f5"
        duration: "#f5f5f5"
        date: "#f5f5f5"
        range: "#f5f5f5"
        float: "#f5f5f5"
        string: "#f5f5f5"
        nothing: "#f5f5f5"
        binary: "#f5f5f5"
        cellpath: "#f5f5f5"
        row_index: "#90a959"
        record: "#f5f5f5"
        list: "#f5f5f5"
        block: "#f5f5f5"
        hints: "#505050"

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
