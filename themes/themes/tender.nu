export def main [] {
    # extra desired values for the tender theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#282828"
    # foreground: "#eeeeee"
    # cursor: "#eeeeee"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#c9d05c"
        empty: "#b3deef"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#c9d05c"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#1d1d1d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d3b987"
        shape_bool: "#73cef4"
        shape_int: "#d3b987"
        shape_float: "#d3b987"
        shape_range: "#ffc24b"
        shape_internalcall: "#73cef4"
        shape_external: "#73cef4"
        shape_externalarg: "#c9d05c"
        shape_literal: "#b3deef"
        shape_operator: "#ffc24b"
        shape_signature: "#c9d05c"
        shape_string: "#c9d05c"
        shape_string_interpolation: "#73cef4"
        shape_datetime: "#73cef4"
        shape_list: "#73cef4"
        shape_table: "#b3deef"
        shape_record: "#73cef4"
        shape_block: "#b3deef"
        shape_filepath: "#73cef4"
        shape_globpattern: "#73cef4"
        shape_variable: "#d3b987"
        shape_flag: "#b3deef"
        shape_custom: "#c9d05c"
        shape_nothing: "#73cef4"
    }
}
