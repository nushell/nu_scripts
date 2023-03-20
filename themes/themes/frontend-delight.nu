export def main [] {
    # extra desired values for the frontend_delight theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1b1c1d"
    # foreground: "#adadad"
    # cursor: "#adadad"

    {
        # color for nushell primitives
        separator: "#8c735b"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#74ec4c"
        empty: "#2c70b7"
        bool: "#8c735b"
        int: "#8c735b"
        filesize: "#8c735b"
        duration: "#8c735b"
        date: "#8c735b"
        range: "#8c735b"
        float: "#8c735b"
        string: "#8c735b"
        nothing: "#8c735b"
        binary: "#8c735b"
        cellpath: "#8c735b"
        row_index: "#74ec4c"
        record: "#8c735b"
        list: "#8c735b"
        block: "#8c735b"
        hints: "#5fac6d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#e75e4f"
        shape_bool: "#4fbce6"
        shape_int: "#e75e4f"
        shape_float: "#e75e4f"
        shape_range: "#fdc325"
        shape_internalcall: "#4fbce6"
        shape_external: "#3ca1a6"
        shape_externalarg: "#74ec4c"
        shape_literal: "#2c70b7"
        shape_operator: "#fa771d"
        shape_signature: "#74ec4c"
        shape_string: "#565747"
        shape_string_interpolation: "#4fbce6"
        shape_datetime: "#4fbce6"
        shape_list: "#4fbce6"
        shape_table: "#3393ca"
        shape_record: "#4fbce6"
        shape_block: "#3393ca"
        shape_filepath: "#3ca1a6"
        shape_globpattern: "#4fbce6"
        shape_variable: "#f02e4f"
        shape_flag: "#3393ca"
        shape_custom: "#565747"
        shape_nothing: "#4fbce6"
    }
}
