export def main [] {
    # extra desired values for the spaceduck theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0f111b"
    # foreground: "#ecf0c1"
    # cursor: "#ecf0c1"

    {
        # color for nushell primitives
        separator: "#f0f1ce"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#5ccc96"
        empty: "#00a3cc"
        bool: "#f0f1ce"
        int: "#f0f1ce"
        filesize: "#f0f1ce"
        duration: "#f0f1ce"
        date: "#f0f1ce"
        range: "#f0f1ce"
        float: "#f0f1ce"
        string: "#f0f1ce"
        nothing: "#f0f1ce"
        binary: "#f0f1ce"
        cellpath: "#f0f1ce"
        row_index: "#5ccc96"
        record: "#f0f1ce"
        list: "#f0f1ce"
        block: "#f0f1ce"
        hints: "#686f9a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#f2ce00"
        shape_bool: "#7a5ccc"
        shape_int: "#f2ce00"
        shape_float: "#f2ce00"
        shape_range: "#b3a1e6"
        shape_internalcall: "#7a5ccc"
        shape_external: "#7a5ccc"
        shape_externalarg: "#5ccc96"
        shape_literal: "#00a3cc"
        shape_operator: "#b3a1e6"
        shape_signature: "#5ccc96"
        shape_string: "#5ccc96"
        shape_string_interpolation: "#7a5ccc"
        shape_datetime: "#7a5ccc"
        shape_list: "#7a5ccc"
        shape_table: "#00a3cc"
        shape_record: "#7a5ccc"
        shape_block: "#00a3cc"
        shape_filepath: "#7a5ccc"
        shape_globpattern: "#7a5ccc"
        shape_variable: "#f2ce00"
        shape_flag: "#00a3cc"
        shape_custom: "#5ccc96"
        shape_nothing: "#7a5ccc"
    }
}
