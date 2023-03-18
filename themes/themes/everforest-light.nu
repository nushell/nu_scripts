export def main [] {
    # extra desired values for the everforest_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f8f0dc"
    # foreground: "#5c6a72"
    # cursor: "#5c6a72"

    {
        # color for nushell primitives
        separator: "#dfddc8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8da101"
        empty: "#3a94c5"
        bool: "#dfddc8"
        int: "#dfddc8"
        filesize: "#dfddc8"
        duration: "#dfddc8"
        date: "#dfddc8"
        range: "#dfddc8"
        float: "#dfddc8"
        string: "#dfddc8"
        nothing: "#dfddc8"
        binary: "#dfddc8"
        cellpath: "#dfddc8"
        row_index: "#8da101"
        record: "#dfddc8"
        list: "#dfddc8"
        block: "#dfddc8"
        hints: "#5c6a72"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#df69ba"
        shape_bool: "#35a77c"
        shape_int: "#df69ba"
        shape_float: "#df69ba"
        shape_range: "#dfa000"
        shape_internalcall: "#35a77c"
        shape_external: "#35a77c"
        shape_externalarg: "#8da101"
        shape_literal: "#3a94c5"
        shape_operator: "#dfa000"
        shape_signature: "#8da101"
        shape_string: "#8da101"
        shape_string_interpolation: "#35a77c"
        shape_datetime: "#35a77c"
        shape_list: "#35a77c"
        shape_table: "#3a94c5"
        shape_record: "#35a77c"
        shape_block: "#3a94c5"
        shape_filepath: "#35a77c"
        shape_globpattern: "#35a77c"
        shape_variable: "#df69ba"
        shape_flag: "#3a94c5"
        shape_custom: "#8da101"
        shape_nothing: "#35a77c"
    }
}
