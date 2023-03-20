export def main [] {
    # extra desired values for the forest_night theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#3c4c55"
    # foreground: "#ffebc3"
    # cursor: "#ffebc3"

    {
        # color for nushell primitives
        separator: "#ffebc3"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a9dd9d"
        empty: "#bdd0e5"
        bool: "#ffebc3"
        int: "#ffebc3"
        filesize: "#ffebc3"
        duration: "#ffebc3"
        date: "#ffebc3"
        range: "#ffebc3"
        float: "#ffebc3"
        string: "#ffebc3"
        nothing: "#ffebc3"
        binary: "#ffebc3"
        cellpath: "#ffebc3"
        row_index: "#a9dd9d"
        record: "#ffebc3"
        list: "#ffebc3"
        block: "#ffebc3"
        hints: "#7f8f9f"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#daccf0"
        shape_bool: "#a9dd9d"
        shape_int: "#daccf0"
        shape_float: "#daccf0"
        shape_range: "#eed094"
        shape_internalcall: "#a9dd9d"
        shape_external: "#a9dd9d"
        shape_externalarg: "#a9dd9d"
        shape_literal: "#bdd0e5"
        shape_operator: "#f0aa8a"
        shape_signature: "#a9dd9d"
        shape_string: "#a9dd9d"
        shape_string_interpolation: "#a9dd9d"
        shape_datetime: "#a9dd9d"
        shape_list: "#a9dd9d"
        shape_table: "#bdd0e5"
        shape_record: "#a9dd9d"
        shape_block: "#bdd0e5"
        shape_filepath: "#a9dd9d"
        shape_globpattern: "#a9dd9d"
        shape_variable: "#daccf0"
        shape_flag: "#bdd0e5"
        shape_custom: "#a9dd9d"
        shape_nothing: "#a9dd9d"
    }
}
