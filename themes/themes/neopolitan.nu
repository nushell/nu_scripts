export def main [] {
    # extra desired values for the neopolitan theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#271f19"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#f8f8f8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#61ce3c"
        empty: "#253b76"
        bool: "#f8f8f8"
        int: "#f8f8f8"
        filesize: "#f8f8f8"
        duration: "#f8f8f8"
        date: "#f8f8f8"
        range: "#f8f8f8"
        float: "#f8f8f8"
        string: "#f8f8f8"
        nothing: "#f8f8f8"
        binary: "#f8f8f8"
        cellpath: "#f8f8f8"
        row_index: "#61ce3c"
        record: "#f8f8f8"
        list: "#f8f8f8"
        block: "#f8f8f8"
        hints: "#000000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff0080"
        shape_bool: "#8da6ce"
        shape_int: "#ff0080"
        shape_float: "#ff0080"
        shape_range: "#fbde2d"
        shape_internalcall: "#8da6ce"
        shape_external: "#8da6ce"
        shape_externalarg: "#61ce3c"
        shape_literal: "#253b76"
        shape_operator: "#fbde2d"
        shape_signature: "#61ce3c"
        shape_string: "#61ce3c"
        shape_string_interpolation: "#8da6ce"
        shape_datetime: "#8da6ce"
        shape_list: "#8da6ce"
        shape_table: "#253b76"
        shape_record: "#8da6ce"
        shape_block: "#253b76"
        shape_filepath: "#8da6ce"
        shape_globpattern: "#8da6ce"
        shape_variable: "#ff0080"
        shape_flag: "#253b76"
        shape_custom: "#61ce3c"
        shape_nothing: "#8da6ce"
    }
}
