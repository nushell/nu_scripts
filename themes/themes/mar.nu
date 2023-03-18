export def main [] {
    # extra desired values for the mar theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#23476a"
    # cursor: "#23476a"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a0cd73"
        empty: "#407bb5"
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
        row_index: "#a0cd73"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#737373"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a073cd"
        shape_bool: "#73cda0"
        shape_int: "#a073cd"
        shape_float: "#a073cd"
        shape_range: "#cda073"
        shape_internalcall: "#73cda0"
        shape_external: "#40b57b"
        shape_externalarg: "#a0cd73"
        shape_literal: "#407bb5"
        shape_operator: "#b57b40"
        shape_signature: "#a0cd73"
        shape_string: "#7bb540"
        shape_string_interpolation: "#73cda0"
        shape_datetime: "#73cda0"
        shape_list: "#73cda0"
        shape_table: "#73a0cd"
        shape_record: "#73cda0"
        shape_block: "#73a0cd"
        shape_filepath: "#40b57b"
        shape_globpattern: "#73cda0"
        shape_variable: "#7b40b5"
        shape_flag: "#73a0cd"
        shape_custom: "#7bb540"
        shape_nothing: "#73cda0"
    }
}
