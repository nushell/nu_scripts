export def main [] {
    # extra desired values for the borland theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0000a4"
    # foreground: "#ffff4e"
    # cursor: "#ffff4e"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ceffac"
        empty: "#96cbfe"
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
        row_index: "#ceffac"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#7c7c7c"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff9cfe"
        shape_bool: "#dfdffe"
        shape_int: "#ff9cfe"
        shape_float: "#ff9cfe"
        shape_range: "#ffffcc"
        shape_internalcall: "#dfdffe"
        shape_external: "#c6c5fe"
        shape_externalarg: "#ceffac"
        shape_literal: "#96cbfe"
        shape_operator: "#ffffb6"
        shape_signature: "#ceffac"
        shape_string: "#a8ff60"
        shape_string_interpolation: "#dfdffe"
        shape_datetime: "#dfdffe"
        shape_list: "#dfdffe"
        shape_table: "#b5dcff"
        shape_record: "#dfdffe"
        shape_block: "#b5dcff"
        shape_filepath: "#c6c5fe"
        shape_globpattern: "#dfdffe"
        shape_variable: "#ff73fd"
        shape_flag: "#b5dcff"
        shape_custom: "#a8ff60"
        shape_nothing: "#dfdffe"
    }
}
