export def main [] {
    # extra desired values for the soft_server theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#242626"
    # foreground: "#99a3a2"
    # cursor: "#99a3a2"

    {
        # color for nushell primitives
        separator: "#d2e0de"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#bfdf55"
        empty: "#6b8fa3"
        bool: "#d2e0de"
        int: "#d2e0de"
        filesize: "#d2e0de"
        duration: "#d2e0de"
        date: "#d2e0de"
        range: "#d2e0de"
        float: "#d2e0de"
        string: "#d2e0de"
        nothing: "#d2e0de"
        binary: "#d2e0de"
        cellpath: "#d2e0de"
        row_index: "#bfdf55"
        record: "#d2e0de"
        list: "#d2e0de"
        block: "#d2e0de"
        hints: "#666c6c"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#606edf"
        shape_bool: "#64e39c"
        shape_int: "#606edf"
        shape_float: "#606edf"
        shape_range: "#deb360"
        shape_internalcall: "#64e39c"
        shape_external: "#6ba58f"
        shape_externalarg: "#bfdf55"
        shape_literal: "#6b8fa3"
        shape_operator: "#a3906a"
        shape_signature: "#bfdf55"
        shape_string: "#9aa56a"
        shape_string_interpolation: "#64e39c"
        shape_datetime: "#64e39c"
        shape_list: "#64e39c"
        shape_table: "#62b1df"
        shape_record: "#64e39c"
        shape_block: "#62b1df"
        shape_filepath: "#6ba58f"
        shape_globpattern: "#64e39c"
        shape_variable: "#6a71a3"
        shape_flag: "#62b1df"
        shape_custom: "#9aa56a"
        shape_nothing: "#64e39c"
    }
}
