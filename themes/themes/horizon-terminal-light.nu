export def main [] {
    # extra desired values for the horizon_terminal-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fdf0ed"
    # foreground: "#403c3d"
    # cursor: "#403c3d"

    {
        # color for nushell primitives
        separator: "#201c1d"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#29d398"
        empty: "#26bbd9"
        bool: "#201c1d"
        int: "#201c1d"
        filesize: "#201c1d"
        duration: "#201c1d"
        date: "#201c1d"
        range: "#201c1d"
        float: "#201c1d"
        string: "#201c1d"
        nothing: "#201c1d"
        binary: "#201c1d"
        cellpath: "#201c1d"
        row_index: "#29d398"
        record: "#201c1d"
        list: "#201c1d"
        block: "#201c1d"
        hints: "#bdb3b1"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ee64ac"
        shape_bool: "#59e1e3"
        shape_int: "#ee64ac"
        shape_float: "#ee64ac"
        shape_range: "#fadad1"
        shape_internalcall: "#59e1e3"
        shape_external: "#59e1e3"
        shape_externalarg: "#29d398"
        shape_literal: "#26bbd9"
        shape_operator: "#fadad1"
        shape_signature: "#29d398"
        shape_string: "#29d398"
        shape_string_interpolation: "#59e1e3"
        shape_datetime: "#59e1e3"
        shape_list: "#59e1e3"
        shape_table: "#26bbd9"
        shape_record: "#59e1e3"
        shape_block: "#26bbd9"
        shape_filepath: "#59e1e3"
        shape_globpattern: "#59e1e3"
        shape_variable: "#ee64ac"
        shape_flag: "#26bbd9"
        shape_custom: "#29d398"
        shape_nothing: "#59e1e3"
    }
}
