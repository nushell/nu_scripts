export def main [] {
    # extra desired values for the desert_night theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#24221c"
    # foreground: "#d4b07b"
    # cursor: "#d4b07b"

    {
        # color for nushell primitives
        separator: "#87765d"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#99b05f"
        empty: "#949fb4"
        bool: "#87765d"
        int: "#87765d"
        filesize: "#87765d"
        duration: "#87765d"
        date: "#87765d"
        range: "#87765d"
        float: "#87765d"
        string: "#87765d"
        nothing: "#87765d"
        binary: "#87765d"
        cellpath: "#87765d"
        row_index: "#99b05f"
        record: "#87765d"
        list: "#87765d"
        block: "#87765d"
        hints: "#473f31"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d261a5"
        shape_bool: "#bfab36"
        shape_int: "#d261a5"
        shape_float: "#d261a5"
        shape_range: "#e5a440"
        shape_internalcall: "#bfab36"
        shape_external: "#bfab36"
        shape_externalarg: "#99b05f"
        shape_literal: "#949fb4"
        shape_operator: "#e18245"
        shape_signature: "#99b05f"
        shape_string: "#99b05f"
        shape_string_interpolation: "#bfab36"
        shape_datetime: "#bfab36"
        shape_list: "#bfab36"
        shape_table: "#949fb4"
        shape_record: "#bfab36"
        shape_block: "#949fb4"
        shape_filepath: "#bfab36"
        shape_globpattern: "#bfab36"
        shape_variable: "#d261a5"
        shape_flag: "#949fb4"
        shape_custom: "#99b05f"
        shape_nothing: "#bfab36"
    }
}
