export def main [] {
    # extra desired values for the porple theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#292c36"
    # foreground: "#d8d8d8"
    # cursor: "#d8d8d8"

    {
        # color for nushell primitives
        separator: "#f8f8f8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#95c76f"
        empty: "#8485ce"
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
        row_index: "#95c76f"
        record: "#f8f8f8"
        list: "#f8f8f8"
        block: "#f8f8f8"
        hints: "#65568a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b74989"
        shape_bool: "#64878f"
        shape_int: "#b74989"
        shape_float: "#b74989"
        shape_range: "#efa16b"
        shape_internalcall: "#64878f"
        shape_external: "#64878f"
        shape_externalarg: "#95c76f"
        shape_literal: "#8485ce"
        shape_operator: "#efa16b"
        shape_signature: "#95c76f"
        shape_string: "#95c76f"
        shape_string_interpolation: "#64878f"
        shape_datetime: "#64878f"
        shape_list: "#64878f"
        shape_table: "#8485ce"
        shape_record: "#64878f"
        shape_block: "#8485ce"
        shape_filepath: "#64878f"
        shape_globpattern: "#64878f"
        shape_variable: "#b74989"
        shape_flag: "#8485ce"
        shape_custom: "#95c76f"
        shape_nothing: "#64878f"
    }
}
