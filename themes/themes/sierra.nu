export def main [] {
    # extra desired values for the sierra theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c1a14"
    # foreground: "#cacbb9"
    # cursor: "#cacbb9"

    {
        # color for nushell primitives
        separator: "#c9cbac"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#676938"
        empty: "#989876"
        bool: "#c9cbac"
        int: "#c9cbac"
        filesize: "#c9cbac"
        duration: "#c9cbac"
        date: "#c9cbac"
        range: "#c9cbac"
        float: "#c9cbac"
        string: "#c9cbac"
        nothing: "#c9cbac"
        binary: "#c9cbac"
        cellpath: "#c9cbac"
        row_index: "#676938"
        record: "#c9cbac"
        list: "#c9cbac"
        block: "#c9cbac"
        hints: "#a85e5d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#897645"
        shape_bool: "#a17140"
        shape_int: "#897645"
        shape_float: "#897645"
        shape_range: "#7f7f41"
        shape_internalcall: "#a17140"
        shape_external: "#a18e60"
        shape_externalarg: "#676938"
        shape_literal: "#989876"
        shape_operator: "#7f7f60"
        shape_signature: "#676938"
        shape_string: "#68694f"
        shape_string_interpolation: "#a17140"
        shape_datetime: "#a17140"
        shape_list: "#a17140"
        shape_table: "#98984e"
        shape_record: "#a17140"
        shape_block: "#98984e"
        shape_filepath: "#a18e60"
        shape_globpattern: "#a17140"
        shape_variable: "#897c5b"
        shape_flag: "#98984e"
        shape_custom: "#68694f"
        shape_nothing: "#a17140"
    }
}
