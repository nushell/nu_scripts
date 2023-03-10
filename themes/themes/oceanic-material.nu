export def main [] {
    # extra desired values for the oceanic_material theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c262b"
    # foreground: "#c1c8d6"
    # cursor: "#b2b8c3"

    {
        # color for nushell primitives
        separator: "#fffefe"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#70be71"
        empty: "#1d80ef"
        bool: "#fffefe"
        int: "#fffefe"
        filesize: "#fffefe"
        duration: "#fffefe"
        date: "#fffefe"
        range: "#fffefe"
        float: "#fffefe"
        string: "#fffefe"
        nothing: "#fffefe"
        binary: "#fffefe"
        cellpath: "#fffefe"
        row_index: "#70be71"
        record: "#fffefe"
        list: "#fffefe"
        block: "#fffefe"
        hints: "#767676"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a94dbb"
        shape_bool: "#42c6d9"
        shape_int: "#a94dbb"
        shape_float: "#a94dbb"
        shape_range: "#fef063"
        shape_internalcall: "#42c6d9"
        shape_external: "#16aec9"
        shape_externalarg: "#70be71"
        shape_literal: "#1d80ef"
        shape_operator: "#fee92e"
        shape_signature: "#70be71"
        shape_string: "#3fa33f"
        shape_string_interpolation: "#42c6d9"
        shape_datetime: "#42c6d9"
        shape_list: "#42c6d9"
        shape_table: "#53a4f3"
        shape_record: "#42c6d9"
        shape_block: "#53a4f3"
        shape_filepath: "#16aec9"
        shape_globpattern: "#42c6d9"
        shape_variable: "#8800a0"
        shape_flag: "#53a4f3"
        shape_custom: "#3fa33f"
        shape_nothing: "#42c6d9"
    }
}
