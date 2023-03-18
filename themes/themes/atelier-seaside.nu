export def main [] {
    # extra desired values for the atelier_seaside theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#131513"
    # foreground: "#8ca68c"
    # cursor: "#8ca68c"

    {
        # color for nushell primitives
        separator: "#f4fbf4"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#29a329"
        empty: "#3d62f5"
        bool: "#f4fbf4"
        int: "#f4fbf4"
        filesize: "#f4fbf4"
        duration: "#f4fbf4"
        date: "#f4fbf4"
        range: "#f4fbf4"
        float: "#f4fbf4"
        string: "#f4fbf4"
        nothing: "#f4fbf4"
        binary: "#f4fbf4"
        cellpath: "#f4fbf4"
        row_index: "#29a329"
        record: "#f4fbf4"
        list: "#f4fbf4"
        block: "#f4fbf4"
        hints: "#687d68"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ad2bee"
        shape_bool: "#1999b3"
        shape_int: "#ad2bee"
        shape_float: "#ad2bee"
        shape_range: "#98981b"
        shape_internalcall: "#1999b3"
        shape_external: "#1999b3"
        shape_externalarg: "#29a329"
        shape_literal: "#3d62f5"
        shape_operator: "#98981b"
        shape_signature: "#29a329"
        shape_string: "#29a329"
        shape_string_interpolation: "#1999b3"
        shape_datetime: "#1999b3"
        shape_list: "#1999b3"
        shape_table: "#3d62f5"
        shape_record: "#1999b3"
        shape_block: "#3d62f5"
        shape_filepath: "#1999b3"
        shape_globpattern: "#1999b3"
        shape_variable: "#ad2bee"
        shape_flag: "#3d62f5"
        shape_custom: "#29a329"
        shape_nothing: "#1999b3"
    }
}
