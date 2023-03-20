export def main [] {
    # extra desired values for the papercolor_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c1c1c"
    # foreground: "#808080"
    # cursor: "#808080"

    {
        # color for nushell primitives
        separator: "#d0d0d0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#af87d7"
        empty: "#ff5faf"
        bool: "#d0d0d0"
        int: "#d0d0d0"
        filesize: "#d0d0d0"
        duration: "#d0d0d0"
        date: "#d0d0d0"
        range: "#d0d0d0"
        float: "#d0d0d0"
        string: "#d0d0d0"
        nothing: "#d0d0d0"
        binary: "#d0d0d0"
        cellpath: "#d0d0d0"
        row_index: "#af87d7"
        record: "#d0d0d0"
        list: "#d0d0d0"
        block: "#d0d0d0"
        hints: "#d7af5f"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#00afaf"
        shape_bool: "#ffaf00"
        shape_int: "#00afaf"
        shape_float: "#00afaf"
        shape_range: "#afd700"
        shape_internalcall: "#ffaf00"
        shape_external: "#ffaf00"
        shape_externalarg: "#af87d7"
        shape_literal: "#ff5faf"
        shape_operator: "#afd700"
        shape_signature: "#af87d7"
        shape_string: "#af87d7"
        shape_string_interpolation: "#ffaf00"
        shape_datetime: "#ffaf00"
        shape_list: "#ffaf00"
        shape_table: "#ff5faf"
        shape_record: "#ffaf00"
        shape_block: "#ff5faf"
        shape_filepath: "#ffaf00"
        shape_globpattern: "#ffaf00"
        shape_variable: "#00afaf"
        shape_flag: "#ff5faf"
        shape_custom: "#af87d7"
        shape_nothing: "#ffaf00"
    }
}
