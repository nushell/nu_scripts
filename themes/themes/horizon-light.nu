export def main [] {
    # extra desired values for the horizon_light theme
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
        header: "#94e1b0"
        empty: "#da103f"
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
        row_index: "#94e1b0"
        record: "#201c1d"
        list: "#201c1d"
        block: "#201c1d"
        hints: "#bdb3b1"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#1d8991"
        shape_bool: "#dc3318"
        shape_int: "#1d8991"
        shape_float: "#1d8991"
        shape_range: "#fbe0d9"
        shape_internalcall: "#dc3318"
        shape_external: "#dc3318"
        shape_externalarg: "#94e1b0"
        shape_literal: "#da103f"
        shape_operator: "#fbe0d9"
        shape_signature: "#94e1b0"
        shape_string: "#94e1b0"
        shape_string_interpolation: "#dc3318"
        shape_datetime: "#dc3318"
        shape_list: "#dc3318"
        shape_table: "#da103f"
        shape_record: "#dc3318"
        shape_block: "#da103f"
        shape_filepath: "#dc3318"
        shape_globpattern: "#dc3318"
        shape_variable: "#1d8991"
        shape_flag: "#da103f"
        shape_custom: "#94e1b0"
        shape_nothing: "#dc3318"
    }
}
