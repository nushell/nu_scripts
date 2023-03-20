export def main [] {
    # extra desired values for the kimber theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222222"
    # foreground: "#dedee7"
    # cursor: "#dedee7"

    {
        # color for nushell primitives
        separator: "#ffffe6"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#99c899"
        empty: "#537c9c"
        bool: "#ffffe6"
        int: "#ffffe6"
        filesize: "#ffffe6"
        duration: "#ffffe6"
        date: "#ffffe6"
        range: "#ffffe6"
        float: "#ffffe6"
        string: "#ffffe6"
        nothing: "#ffffe6"
        binary: "#ffffe6"
        cellpath: "#ffffe6"
        row_index: "#99c899"
        record: "#ffffe6"
        list: "#ffffe6"
        block: "#ffffe6"
        hints: "#644646"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#86cacd"
        shape_bool: "#78b4b4"
        shape_int: "#86cacd"
        shape_float: "#86cacd"
        shape_range: "#d8b56d"
        shape_internalcall: "#78b4b4"
        shape_external: "#78b4b4"
        shape_externalarg: "#99c899"
        shape_literal: "#537c9c"
        shape_operator: "#d8b56d"
        shape_signature: "#99c899"
        shape_string: "#99c899"
        shape_string_interpolation: "#78b4b4"
        shape_datetime: "#78b4b4"
        shape_list: "#78b4b4"
        shape_table: "#537c9c"
        shape_record: "#78b4b4"
        shape_block: "#537c9c"
        shape_filepath: "#78b4b4"
        shape_globpattern: "#78b4b4"
        shape_variable: "#86cacd"
        shape_flag: "#537c9c"
        shape_custom: "#99c899"
        shape_nothing: "#78b4b4"
    }
}
