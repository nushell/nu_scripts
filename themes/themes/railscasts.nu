export def main [] {
    # extra desired values for the railscasts theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2b2b2b"
    # foreground: "#e6e1dc"
    # cursor: "#e6e1dc"

    {
        # color for nushell primitives
        separator: "#f9f7f3"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a5c261"
        empty: "#6d9cbe"
        bool: "#f9f7f3"
        int: "#f9f7f3"
        filesize: "#f9f7f3"
        duration: "#f9f7f3"
        date: "#f9f7f3"
        range: "#f9f7f3"
        float: "#f9f7f3"
        string: "#f9f7f3"
        nothing: "#f9f7f3"
        binary: "#f9f7f3"
        cellpath: "#f9f7f3"
        row_index: "#a5c261"
        record: "#f9f7f3"
        list: "#f9f7f3"
        block: "#f9f7f3"
        hints: "#5a647e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b6b3eb"
        shape_bool: "#519f50"
        shape_int: "#b6b3eb"
        shape_float: "#b6b3eb"
        shape_range: "#ffc66d"
        shape_internalcall: "#519f50"
        shape_external: "#519f50"
        shape_externalarg: "#a5c261"
        shape_literal: "#6d9cbe"
        shape_operator: "#ffc66d"
        shape_signature: "#a5c261"
        shape_string: "#a5c261"
        shape_string_interpolation: "#519f50"
        shape_datetime: "#519f50"
        shape_list: "#519f50"
        shape_table: "#6d9cbe"
        shape_record: "#519f50"
        shape_block: "#6d9cbe"
        shape_filepath: "#519f50"
        shape_globpattern: "#519f50"
        shape_variable: "#b6b3eb"
        shape_flag: "#6d9cbe"
        shape_custom: "#a5c261"
        shape_nothing: "#519f50"
    }
}
