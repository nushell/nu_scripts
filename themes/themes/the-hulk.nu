export def main [] {
    # extra desired values for the the_hulk theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1b1d1e"
    # foreground: "#b4b4b4"
    # cursor: "#15b61a"

    {
        # color for nushell primitives
        separator: "#e5e5e0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#48ff76"
        empty: "#2424f4"
        bool: "#e5e5e0"
        int: "#e5e5e0"
        filesize: "#e5e5e0"
        duration: "#e5e5e0"
        date: "#e5e5e0"
        range: "#e5e5e0"
        float: "#e5e5e0"
        string: "#e5e5e0"
        nothing: "#e5e5e0"
        binary: "#e5e5e0"
        cellpath: "#e5e5e0"
        row_index: "#48ff76"
        record: "#e5e5e0"
        list: "#e5e5e0"
        block: "#e5e5e0"
        hints: "#505354"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#72579d"
        shape_bool: "#3f85a5"
        shape_int: "#72579d"
        shape_float: "#72579d"
        shape_range: "#3afe15"
        shape_internalcall: "#3f85a5"
        shape_external: "#378ca9"
        shape_externalarg: "#48ff76"
        shape_literal: "#2424f4"
        shape_operator: "#62e456"
        shape_signature: "#48ff76"
        shape_string: "#13ce2f"
        shape_string_interpolation: "#3f85a5"
        shape_datetime: "#3f85a5"
        shape_list: "#3f85a5"
        shape_table: "#4f6a95"
        shape_record: "#3f85a5"
        shape_block: "#4f6a95"
        shape_filepath: "#378ca9"
        shape_globpattern: "#3f85a5"
        shape_variable: "#641e73"
        shape_flag: "#4f6a95"
        shape_custom: "#13ce2f"
        shape_nothing: "#3f85a5"
    }
}
