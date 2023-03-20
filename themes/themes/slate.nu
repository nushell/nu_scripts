export def main [] {
    # extra desired values for the slate theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222222"
    # foreground: "#35b1d2"
    # cursor: "#35b1d2"

    {
        # color for nushell primitives
        separator: "#e0e0e0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#beffa8"
        empty: "#264b49"
        bool: "#e0e0e0"
        int: "#e0e0e0"
        filesize: "#e0e0e0"
        duration: "#e0e0e0"
        date: "#e0e0e0"
        range: "#e0e0e0"
        float: "#e0e0e0"
        string: "#e0e0e0"
        nothing: "#e0e0e0"
        binary: "#e0e0e0"
        cellpath: "#e0e0e0"
        row_index: "#beffa8"
        record: "#e0e0e0"
        list: "#e0e0e0"
        block: "#e0e0e0"
        hints: "#ffffff"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c5a7d9"
        shape_bool: "#8cdfe0"
        shape_int: "#c5a7d9"
        shape_float: "#c5a7d9"
        shape_range: "#d0ccca"
        shape_internalcall: "#8cdfe0"
        shape_external: "#15ab9c"
        shape_externalarg: "#beffa8"
        shape_literal: "#264b49"
        shape_operator: "#c4c9c0"
        shape_signature: "#beffa8"
        shape_string: "#81d778"
        shape_string_interpolation: "#8cdfe0"
        shape_datetime: "#8cdfe0"
        shape_list: "#8cdfe0"
        shape_table: "#7ab0d2"
        shape_record: "#8cdfe0"
        shape_block: "#7ab0d2"
        shape_filepath: "#15ab9c"
        shape_globpattern: "#8cdfe0"
        shape_variable: "#a481d3"
        shape_flag: "#7ab0d2"
        shape_custom: "#81d778"
        shape_nothing: "#8cdfe0"
    }
}
