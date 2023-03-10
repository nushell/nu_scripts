export def main [] {
    # extra desired values for the atelier_lakeside-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ebf8ff"
    # foreground: "#516d7b"
    # cursor: "#516d7b"

    {
        # color for nushell primitives
        separator: "#161b1d"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#568c3b"
        empty: "#257fad"
        bool: "#161b1d"
        int: "#161b1d"
        filesize: "#161b1d"
        duration: "#161b1d"
        date: "#161b1d"
        range: "#161b1d"
        float: "#161b1d"
        string: "#161b1d"
        nothing: "#161b1d"
        binary: "#161b1d"
        cellpath: "#161b1d"
        row_index: "#568c3b"
        record: "#161b1d"
        list: "#161b1d"
        block: "#161b1d"
        hints: "#7195a8"

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
