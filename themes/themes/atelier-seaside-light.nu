export def main [] {
    # extra desired values for the atelier_seaside-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f4fbf4"
    # foreground: "#5e6e5e"
    # cursor: "#5e6e5e"

    {
        # color for nushell primitives
        separator: "#131513"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#29a329"
        empty: "#3d62f5"
        bool: "#131513"
        int: "#131513"
        filesize: "#131513"
        duration: "#131513"
        date: "#131513"
        range: "#131513"
        float: "#131513"
        string: "#131513"
        nothing: "#131513"
        binary: "#131513"
        cellpath: "#131513"
        row_index: "#29a329"
        record: "#131513"
        list: "#131513"
        block: "#131513"
        hints: "#809980"

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
