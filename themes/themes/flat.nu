export def main [] {
    # extra desired values for the flat theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2c3e50"
    # foreground: "#e0e0e0"
    # cursor: "#e0e0e0"

    {
        # color for nushell primitives
        separator: "#ecf0f1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#2ecc71"
        empty: "#3498db"
        bool: "#ecf0f1"
        int: "#ecf0f1"
        filesize: "#ecf0f1"
        duration: "#ecf0f1"
        date: "#ecf0f1"
        range: "#ecf0f1"
        float: "#ecf0f1"
        string: "#ecf0f1"
        nothing: "#ecf0f1"
        binary: "#ecf0f1"
        cellpath: "#ecf0f1"
        row_index: "#2ecc71"
        record: "#ecf0f1"
        list: "#ecf0f1"
        block: "#ecf0f1"
        hints: "#95a5a6"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9b59b6"
        shape_bool: "#1abc9c"
        shape_int: "#9b59b6"
        shape_float: "#9b59b6"
        shape_range: "#f1c40f"
        shape_internalcall: "#1abc9c"
        shape_external: "#1abc9c"
        shape_externalarg: "#2ecc71"
        shape_literal: "#3498db"
        shape_operator: "#f1c40f"
        shape_signature: "#2ecc71"
        shape_string: "#2ecc71"
        shape_string_interpolation: "#1abc9c"
        shape_datetime: "#1abc9c"
        shape_list: "#1abc9c"
        shape_table: "#3498db"
        shape_record: "#1abc9c"
        shape_block: "#3498db"
        shape_filepath: "#1abc9c"
        shape_globpattern: "#1abc9c"
        shape_variable: "#9b59b6"
        shape_flag: "#3498db"
        shape_custom: "#2ecc71"
        shape_nothing: "#1abc9c"
    }
}
