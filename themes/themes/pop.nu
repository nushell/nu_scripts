export def main [] {
    # extra desired values for the pop theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#d0d0d0"
    # cursor: "#d0d0d0"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#37b349"
        empty: "#0e5a94"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#37b349"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#505050"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b31e8d"
        shape_bool: "#00aabb"
        shape_int: "#b31e8d"
        shape_float: "#b31e8d"
        shape_range: "#f8ca12"
        shape_internalcall: "#00aabb"
        shape_external: "#00aabb"
        shape_externalarg: "#37b349"
        shape_literal: "#0e5a94"
        shape_operator: "#f8ca12"
        shape_signature: "#37b349"
        shape_string: "#37b349"
        shape_string_interpolation: "#00aabb"
        shape_datetime: "#00aabb"
        shape_list: "#00aabb"
        shape_table: "#0e5a94"
        shape_record: "#00aabb"
        shape_block: "#0e5a94"
        shape_filepath: "#00aabb"
        shape_globpattern: "#00aabb"
        shape_variable: "#b31e8d"
        shape_flag: "#0e5a94"
        shape_custom: "#37b349"
        shape_nothing: "#00aabb"
    }
}
