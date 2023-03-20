export def main [] {
    # extra desired values for the atelier_lakeside theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#161b1d"
    # foreground: "#7ea2b4"
    # cursor: "#7ea2b4"

    {
        # color for nushell primitives
        separator: "#ebf8ff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#568c3b"
        empty: "#257fad"
        bool: "#ebf8ff"
        int: "#ebf8ff"
        filesize: "#ebf8ff"
        duration: "#ebf8ff"
        date: "#ebf8ff"
        range: "#ebf8ff"
        float: "#ebf8ff"
        string: "#ebf8ff"
        nothing: "#ebf8ff"
        binary: "#ebf8ff"
        cellpath: "#ebf8ff"
        row_index: "#568c3b"
        record: "#ebf8ff"
        list: "#ebf8ff"
        block: "#ebf8ff"
        hints: "#5a7b8c"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#6b6bb8"
        shape_bool: "#2d8f6f"
        shape_int: "#6b6bb8"
        shape_float: "#6b6bb8"
        shape_range: "#8a8a0f"
        shape_internalcall: "#2d8f6f"
        shape_external: "#2d8f6f"
        shape_externalarg: "#568c3b"
        shape_literal: "#257fad"
        shape_operator: "#8a8a0f"
        shape_signature: "#568c3b"
        shape_string: "#568c3b"
        shape_string_interpolation: "#2d8f6f"
        shape_datetime: "#2d8f6f"
        shape_list: "#2d8f6f"
        shape_table: "#257fad"
        shape_record: "#2d8f6f"
        shape_block: "#257fad"
        shape_filepath: "#2d8f6f"
        shape_globpattern: "#2d8f6f"
        shape_variable: "#6b6bb8"
        shape_flag: "#257fad"
        shape_custom: "#568c3b"
        shape_nothing: "#2d8f6f"
    }
}
