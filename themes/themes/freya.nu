export def main [] {
    # extra desired values for the freya theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#252e32"
    # foreground: "#94a3a5"
    # cursor: "#839496"

    {
        # color for nushell primitives
        separator: "#6c71c4"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#859900"
        empty: "#268bd2"
        bool: "#6c71c4"
        int: "#6c71c4"
        filesize: "#6c71c4"
        duration: "#6c71c4"
        date: "#6c71c4"
        range: "#6c71c4"
        float: "#6c71c4"
        string: "#6c71c4"
        nothing: "#6c71c4"
        binary: "#6c71c4"
        cellpath: "#6c71c4"
        row_index: "#859900"
        record: "#6c71c4"
        list: "#6c71c4"
        block: "#6c71c4"
        hints: "#586e75"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d33682"
        shape_bool: "#2aa198"
        shape_int: "#d33682"
        shape_float: "#d33682"
        shape_range: "#b58900"
        shape_internalcall: "#2aa198"
        shape_external: "#2aa198"
        shape_externalarg: "#859900"
        shape_literal: "#268bd2"
        shape_operator: "#b58900"
        shape_signature: "#859900"
        shape_string: "#859900"
        shape_string_interpolation: "#2aa198"
        shape_datetime: "#2aa198"
        shape_list: "#2aa198"
        shape_table: "#268bd2"
        shape_record: "#2aa198"
        shape_block: "#268bd2"
        shape_filepath: "#2aa198"
        shape_globpattern: "#2aa198"
        shape_variable: "#ec0048"
        shape_flag: "#268bd2"
        shape_custom: "#859900"
        shape_nothing: "#2aa198"
    }
}
