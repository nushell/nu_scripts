export def main [] {
    # extra desired values for the rose_pine theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#191724"
    # foreground: "#e0def4"
    # cursor: "#e0def4"

    {
        # color for nushell primitives
        separator: "#c5c3ce"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ebbcba"
        empty: "#9ccfd8"
        bool: "#c5c3ce"
        int: "#c5c3ce"
        filesize: "#c5c3ce"
        duration: "#c5c3ce"
        date: "#c5c3ce"
        range: "#c5c3ce"
        float: "#c5c3ce"
        string: "#c5c3ce"
        nothing: "#c5c3ce"
        binary: "#c5c3ce"
        cellpath: "#c5c3ce"
        row_index: "#ebbcba"
        record: "#c5c3ce"
        list: "#c5c3ce"
        block: "#c5c3ce"
        hints: "#555169"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c4a7e7"
        shape_bool: "#31748f"
        shape_int: "#c4a7e7"
        shape_float: "#c4a7e7"
        shape_range: "#f6c177"
        shape_internalcall: "#31748f"
        shape_external: "#31748f"
        shape_externalarg: "#ebbcba"
        shape_literal: "#9ccfd8"
        shape_operator: "#f6c177"
        shape_signature: "#ebbcba"
        shape_string: "#ebbcba"
        shape_string_interpolation: "#31748f"
        shape_datetime: "#31748f"
        shape_list: "#31748f"
        shape_table: "#9ccfd8"
        shape_record: "#31748f"
        shape_block: "#9ccfd8"
        shape_filepath: "#31748f"
        shape_globpattern: "#31748f"
        shape_variable: "#c4a7e7"
        shape_flag: "#9ccfd8"
        shape_custom: "#ebbcba"
        shape_nothing: "#31748f"
    }
}
