export def main [] {
    # extra desired values for the mono_cyan theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#00222b"
    # foreground: "#00ccff"
    # cursor: "#00ccff"

    {
        # color for nushell primitives
        separator: "#00ccff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00ccff"
        empty: "#00ccff"
        bool: "#00ccff"
        int: "#00ccff"
        filesize: "#00ccff"
        duration: "#00ccff"
        date: "#00ccff"
        range: "#00ccff"
        float: "#00ccff"
        string: "#00ccff"
        nothing: "#00ccff"
        binary: "#00ccff"
        cellpath: "#00ccff"
        row_index: "#00ccff"
        record: "#00ccff"
        list: "#00ccff"
        block: "#00ccff"
        hints: "#00ccff"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#00ccff"
        shape_bool: "#00ccff"
        shape_int: "#00ccff"
        shape_float: "#00ccff"
        shape_range: "#00ccff"
        shape_internalcall: "#00ccff"
        shape_external: "#00ccff"
        shape_externalarg: "#00ccff"
        shape_literal: "#00ccff"
        shape_operator: "#00ccff"
        shape_signature: "#00ccff"
        shape_string: "#00ccff"
        shape_string_interpolation: "#00ccff"
        shape_datetime: "#00ccff"
        shape_list: "#00ccff"
        shape_table: "#00ccff"
        shape_record: "#00ccff"
        shape_block: "#00ccff"
        shape_filepath: "#00ccff"
        shape_globpattern: "#00ccff"
        shape_variable: "#00ccff"
        shape_flag: "#00ccff"
        shape_custom: "#00ccff"
        shape_nothing: "#00ccff"
    }
}
