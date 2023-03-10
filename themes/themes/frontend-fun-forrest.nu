export def main [] {
    # extra desired values for the frontend_fun-forrest theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#251200"
    # foreground: "#dec165"
    # cursor: "#dec165"

    {
        # color for nushell primitives
        separator: "#ffeaa3"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#bfc65a"
        empty: "#4699a3"
        bool: "#ffeaa3"
        int: "#ffeaa3"
        filesize: "#ffeaa3"
        duration: "#ffeaa3"
        date: "#ffeaa3"
        range: "#ffeaa3"
        float: "#ffeaa3"
        string: "#ffeaa3"
        nothing: "#ffeaa3"
        binary: "#ffeaa3"
        cellpath: "#ffeaa3"
        row_index: "#bfc65a"
        record: "#ffeaa3"
        list: "#ffeaa3"
        block: "#ffeaa3"
        hints: "#7f6a55"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d26349"
        shape_bool: "#e6a96b"
        shape_int: "#d26349"
        shape_float: "#d26349"
        shape_range: "#ffcb1b"
        shape_internalcall: "#e6a96b"
        shape_external: "#da8213"
        shape_externalarg: "#bfc65a"
        shape_literal: "#4699a3"
        shape_operator: "#be8a13"
        shape_signature: "#bfc65a"
        shape_string: "#919c00"
        shape_string_interpolation: "#e6a96b"
        shape_datetime: "#e6a96b"
        shape_list: "#e6a96b"
        shape_table: "#7cc9cf"
        shape_record: "#e6a96b"
        shape_block: "#7cc9cf"
        shape_filepath: "#da8213"
        shape_globpattern: "#e6a96b"
        shape_variable: "#8d4331"
        shape_flag: "#7cc9cf"
        shape_custom: "#919c00"
        shape_nothing: "#e6a96b"
    }
}
