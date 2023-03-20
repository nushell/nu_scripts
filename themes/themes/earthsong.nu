export def main [] {
    # extra desired values for the earthsong theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#292520"
    # foreground: "#e5c7a9"
    # cursor: "#e5c7a9"

    {
        # color for nushell primitives
        separator: "#f6f7ec"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#98e036"
        empty: "#1398b9"
        bool: "#f6f7ec"
        int: "#f6f7ec"
        filesize: "#f6f7ec"
        duration: "#f6f7ec"
        date: "#f6f7ec"
        range: "#f6f7ec"
        float: "#f6f7ec"
        string: "#f6f7ec"
        nothing: "#f6f7ec"
        binary: "#f6f7ec"
        cellpath: "#f6f7ec"
        row_index: "#98e036"
        record: "#f6f7ec"
        list: "#f6f7ec"
        block: "#f6f7ec"
        hints: "#675f54"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff9269"
        shape_bool: "#84f088"
        shape_int: "#ff9269"
        shape_float: "#ff9269"
        shape_range: "#e0d561"
        shape_internalcall: "#84f088"
        shape_external: "#509552"
        shape_externalarg: "#98e036"
        shape_literal: "#1398b9"
        shape_operator: "#f5ae2e"
        shape_signature: "#98e036"
        shape_string: "#85c54c"
        shape_string_interpolation: "#84f088"
        shape_datetime: "#84f088"
        shape_list: "#84f088"
        shape_table: "#5fdaff"
        shape_record: "#84f088"
        shape_block: "#5fdaff"
        shape_filepath: "#509552"
        shape_globpattern: "#84f088"
        shape_variable: "#d0633d"
        shape_flag: "#5fdaff"
        shape_custom: "#85c54c"
        shape_nothing: "#84f088"
    }
}
